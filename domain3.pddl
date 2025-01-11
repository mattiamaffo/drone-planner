(define (domain drone_mission_time)

  ;; Specify required features
  (:requirements :strips :typing :equality :fluents)

  ;; Define types
  (:types
    drone area station sensor - object
  )

  ;; Predicates
  (:predicates
    ;; Drone state and position
    (At ?d - drone ?p - area)
    (AtStation ?s - station ?p - area)
    (HasSensor ?d - drone ?s - sensor)

    ;; Area state
    (DataCollected ?a - area ?s - sensor)

    ;; Operational constraints
    (Blocked ?from - area ?to - area) ; Indicates that a path between two areas is blocked
    (Occupied ?p - area) ; Indicates if an area is occupied by a drone
    (Adj ?from - area ?to - area) ; Indicates if two areas are adjacent
  )

  ;; Functions
  (:functions
    (EnergyLevel ?d - drone) ; Specifies the energy level of a drone
    (total-cost) ; Tracks the cumulative cost for optimization
    (TotalTime) ; Tracks the cumulative time for all actions
  )

  ;; Action: Move
  (:action Move
    :parameters (?d - drone ?from - area ?to - area)
    :precondition (and
      (At ?d ?from)
      (Adj ?from ?to)
      (not (Blocked ?from ?to))
      (not (Occupied ?to))
      (> (EnergyLevel ?d) 0)
    )
    :effect (and
      (not (At ?d ?from))
      (At ?d ?to)
      (not (Occupied ?from))
      (Occupied ?to)
      (decrease (EnergyLevel ?d) 1)
      (increase (total-cost) 1) ; Increment total-cost for optimization
      (increase (TotalTime) 2) ; Increment TotalTime for any action
    )
  )

  ;; Action: Collect data
  (:action CollectData
    :parameters (?d - drone ?a - area ?s - sensor)
    :precondition (and
      (At ?d ?a)
      (HasSensor ?d ?s)
      (not (DataCollected ?a ?s))
    )
    :effect (and
      (DataCollected ?a ?s)
      (increase (TotalTime) 2) ; Increment TotalTime for any action
    )
  )

  ;; Action: Recharge
  (:action Recharge
    :parameters (?d - drone ?s - station ?p - area)
    :precondition (and
      (At ?d ?p)
      (AtStation ?s ?p)
    )
    :effect (and
      (increase (EnergyLevel ?d) 8) ; Recharge the drone
      (increase (TotalTime) 2) ; Increment TotalTime by 2 for recharge
    )
  )
)
