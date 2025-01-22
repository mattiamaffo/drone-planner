(define (domain drone_mission)

  ;; Specify required features
  (:requirements :strips :typing :equality :universal-preconditions)

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

  ;; Action: Move
  (:action Move
    :parameters (?d - drone ?from - area ?to - area)
    :precondition (and
      (At ?d ?from)
      (Adj ?from ?to)
      (not (Blocked ?from ?to))
      (not (Occupied ?to))
    )
    :effect (and
      (not (At ?d ?from))
      (At ?d ?to)
      (not (Occupied ?from))
      (Occupied ?to)
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
    )
  )

  ;; Action: Recharge (not needed for now, drones do not consume energy)
)