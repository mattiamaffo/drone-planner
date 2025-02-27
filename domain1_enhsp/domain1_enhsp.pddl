(define (domain drone_mission)

  ;; Specify required features
  (:requirements :strips :typing :equality :universal-preconditions :fluents)

  ;; Define types
  (:types
    drone area sensor - object
  )

  ;; Predicates
  (:predicates
    ;; Drone state and position
    (At ?d - drone ?p - area)
    (LastAt ?d - drone ?p - area)
    (HasSensor ?d - drone ?s - sensor)

    ;; Area state
    (DataCollected ?a - area ?s - sensor)
    (Occupied ?p - area) ; Indicates if an area is occupied by a drone

    ;; Operational constraints
    (DynamicBlocked ?from - area ?to - area) ; Indicates a blocked path
    (Adj ?from - area ?to - area) ; Indicates adjacency
  )

  ;; Numeric functions
  (:functions
    (EnergyLevel ?d - drone) ; Energy level
    (Priority ?a - area) ; Priority level of the area
    (total-cost) ; Total cost of the plan
  )

  ;; Action: Move with energy consumption
  (:action Move
    :parameters (?d - drone ?from - area ?to - area)
    :precondition (and
      (At ?d ?from)
      (Adj ?from ?to)
      (not (DynamicBlocked ?from ?to))
      (not (Occupied ?to))
      (not (LastAt ?d ?to)) ;; Evita il ritorno immediato
      (> (EnergyLevel ?d) 1)
    )
    :effect (and
      (not (At ?d ?from))
      (At ?d ?to)
      (not (Occupied ?from))
      (Occupied ?to)
      (decrease (EnergyLevel ?d) 1)
      (increase (total-cost) 1)
    )
  )

  ;; Action: Collect data with energy consumption and priority
  (:action CollectData
    :parameters (?d - drone ?a - area ?s - sensor)
    :precondition (and
      (At ?d ?a)
      (HasSensor ?d ?s)
      (not (DataCollected ?a ?s))
      (> (EnergyLevel ?d) (+ 1 (Priority ?a)))
    )
    :effect (and
      (DataCollected ?a ?s)
      (decrease (EnergyLevel ?d) (+ 1 (Priority ?a)))
      (increase (total-cost) 1)
    )
  )

  ;; Action: Swap energy between drones
  (:action RechargeDrone
    :parameters (?support - drone ?receiver - drone ?area - area)
    :precondition (and
      (At ?support ?area)
      (At ?receiver ?area)
      (> (EnergyLevel ?support) 5) ;; Il drone di supporto deve avere abbastanza energia
      (< (EnergyLevel ?receiver) 6) ;; Il drone ricevente deve essere quasi scarico
    )
    :effect (and
      (decrease (EnergyLevel ?support) 3)
      (increase (EnergyLevel ?receiver) 3)
    )
  )

  ;; Action: Clear a blocked dynamic path
  (:action ClearPath
    :parameters (?d - drone ?a - area ?s - sensor ?from - area ?to - area)
    :precondition (and
      (At ?d ?a) ;; Il drone deve essere nell'area dove raccoglie i dati
      (DataCollected ?a ?s) ;; I dati devono essere già stati raccolti
      (HasSensor ?d ?s) ;; Il drone deve avere il sensore giusto
      (DynamicBlocked ?from ?to) ;; Il percorso deve essere bloccato
      (> (EnergyLevel ?d) 2) ;; Il drone deve avere abbastanza energia per sbloccare il passaggio
    )
    :effect (and
      (not (DynamicBlocked ?from ?to)) ;; Il passaggio viene sbloccato
      (not (DynamicBlocked ?to ?from)) ;; Il passaggio viene sbloccato anche in direzione opposta
      (decrease (EnergyLevel ?d) 2) ;; Il drone consuma energia per sbloccare
      (increase (total-cost) 1) ;; Il costo totale aumenta
    )
  )
)