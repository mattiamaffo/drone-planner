(define (domain drone_mission)

  ;; Specify required features
  (:requirements :strips :typing :equality :universal-preconditions :fluents)

  ;; Define types
  (:types
    drone area station sensor - object
  )

  ;; Predicates
  (:predicates
    ;; Drone state and position
    (At ?d - drone ?p - area)
    (HasSensor ?d - drone ?s - sensor)

    ;; Area state
    (DataCollected ?a - area ?s - sensor)
    (SatelliteDataAvailable ?a - area) ; If satellite data is available
    (RequestedSatelliteData ?a - area) ; If satellite data was requested
    (Occupied ?p - area) ; Indicates if an area is occupied by a drone

    ;; Operational constraints
    (Blocked ?from - area ?to - area) ; Indicates a blocked path
    (DynamicBlocked ?from - area ?to - area) ; Path blocked due to weather
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
      (not (Blocked ?from ?to))
      (not (DynamicBlocked ?from ?to))
      (not (Occupied ?to))
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
      (> (EnergyLevel ?support) 3) ; Il support drone deve avere abbastanza energia
    )
    :effect (and
      (decrease (EnergyLevel ?support) 3)
      (increase (EnergyLevel ?receiver) 3)
    )
  )

  ;; Action: Request satellite data
  (:action RequestSatelliteData
    :parameters (?d - drone ?a - area)
    :precondition (and
      (At ?d ?a)
      (SatelliteDataAvailable ?a)
      (not (RequestedSatelliteData ?a))
    )
    :effect (and (RequestedSatelliteData ?a) (increase (total-cost) 1))
  )
)