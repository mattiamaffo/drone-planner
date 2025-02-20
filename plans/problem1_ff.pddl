(define (problem drone_mission_2)
  (:domain drone_mission)

  ;; Objects in the problem
  (:objects
    drone1 drone2 - drone
    drone_support - support-drone
    area1 area2 area3 area4 area5 area6 area7 area8 area9 - area
    temp hum - sensor
  )

  ;; Initial state
  (:init
    ;; Drone initial positions
    (At drone1 area3)
    (At drone2 area9)
    (At drone_support area5)
    (HasEnergyHigh drone1)
    (HasEnergyHigh drone2)
    (HasEnergyHigh drone_support)

    (Adj area1 area2)
    (Adj area2 area3)
    (Adj area4 area5)
    (Adj area5 area6)
    (Adj area7 area8)
    (Adj area8 area9)
    (Adj area1 area4)
    (Adj area2 area5)
    (Adj area3 area6)
    (Adj area4 area7)
    (Adj area5 area8)
    (Adj area6 area9)

    ;; Bidirectional adjacencies
    (Adj area2 area1)
    (Adj area3 area2)
    (Adj area5 area4)
    (Adj area6 area5)
    (Adj area8 area7)
    (Adj area9 area8)
    (Adj area4 area1)
    (Adj area5 area2)
    (Adj area6 area3)
    (Adj area7 area4)
    (Adj area8 area5)
    (Adj area9 area6)

    ;; Sensor capabilities
    (HasSensor drone1 temp)
    (HasSensor drone2 hum)

    ;; Priority levels
    (PriorityHigh area1)
    (PriorityHigh area2)
    (PriorityMedium area3)
  )

  ;; Goals
  (:goal
    (and
      (DataCollected area1 temp)
      (DataCollected area1 hum)
      (DataCollected area2 temp)
      (DataCollected area2 hum)
      (DataCollected area3 temp)
      (DataCollected area3 hum)
    )
  )
)
