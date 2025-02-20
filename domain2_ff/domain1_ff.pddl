(define (domain drone_mission)

  ;; Specify required features
  (:requirements :strips :typing :equality :universal-preconditions)

  ;; Define types
  (:types
    drone support-drone area station sensor - object
  )

  ;; Predicates
  (:predicates
    ;; Drone state and position
    (At ?d - drone ?p - area)
    (LastAt ?d - drone ?p - area)
    (HasSensor ?d - drone ?s - sensor)

    (HasEnergyHigh ?d - drone) ;; Indica se il drone ha energia alta
    (HasEnergyLow ?d - drone) ;; Indica se il drone ha energia bassa

    ;; Area state
    (DataCollected ?a - area ?s - sensor)
    (PriorityHigh ?a - area) ;; Indica se l'area ha priorita' alta
    (PriorityMedium ?a - area) ;; Indica se l'area ha priorita' media
    (PriorityLow ?a - area) ;; Indica se l'area ha priorita' bassa

    (SatelliteDataAvailable ?a - area)
    (RequestedSatelliteData ?a - area)

    ;; Operational constraints
    (Blocked ?from - area ?to - area)
    (DynamicBlocked ?from - area ?to - area)
    (Adj ?from - area ?to - area)
  )

  ;; Action: Move with gradual energy consumption

  (:action MoveHighEnergy
    :parameters (?d - drone ?from - area ?to - area)
    :precondition (and
      (At ?d ?from)
      (Adj ?from ?to)
      (not (Blocked ?from ?to))
      (not (DynamicBlocked ?from ?to))
      (not (LastAt ?d ?to))
      (HasEnergyHigh ?d) ;; Manca questa precondizione
    )
    :effect (and
      (not (At ?d ?from))
      (At ?d ?to)
      (not (HasEnergyHigh ?d))
      (HasEnergyLow ?d) ;; Ora il drone ha energia bassa
    )
  )

  (:action MoveLowEnergy
    :parameters (?d - drone ?from - area ?to - area)
    :precondition (and
      (At ?d ?from)
      (Adj ?from ?to)
      (not (Blocked ?from ?to))
      (not (DynamicBlocked ?from ?to))
      (not (LastAt ?d ?to))
      (HasEnergyLow ?d) ;; Solo se il drone ha energia bassa
    )
    :effect (and
      (not (At ?d ?from))
      (At ?d ?to)
      (not (HasEnergyLow ?d)) ;; Dopo il movimento, il drone è scarico
    )
  )

  ;; Action: Collect data with priority constraints
  (:action CollectData
    :parameters (?d - drone ?a - area ?s - sensor)
    :precondition (and
      (At ?d ?a)
      (HasSensor ?d ?s)
      (not (DataCollected ?a ?s))
      (or (PriorityHigh ?a) (PriorityMedium ?a) (PriorityLow ?a))
    )
    :effect (and
      (DataCollected ?a ?s)
    )
  )

  ;; Action: Swap energy between drones with condition
  (:action RechargeDrone
    :parameters (?support - support-drone ?receiver - drone ?area - area)
    :precondition (and
      (At ?support ?area)
      (At ?receiver ?area)
      (not (HasEnergyHigh ?receiver)) ;; Il drone deve avere energia bassa o scarica
    )
    :effect (and
      (HasEnergyHigh ?receiver) ;; Il drone riceve energia alta
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
    :effect (RequestedSatelliteData ?a)
  )

  ;; Action: Move support drone directly to the drone in need
  (:action MoveSupportDrone
    :parameters (?support - support-drone ?to - area)
    :precondition (and
      (exists
        (?receiver - drone)
        (and (At ?receiver ?to) (HasEnergyLow ?receiver))) ;; Si muove solo se un drone ha energia bassa
    )
    :effect (and
      (not (At ?support ?from))
      (At ?support ?to)
    )
  )
)