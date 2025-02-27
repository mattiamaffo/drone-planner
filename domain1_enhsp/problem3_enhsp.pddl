(define (problem drone_mission_2)
  (:domain drone_mission)

  ;; Objects in the problem
  (:objects
    drone1 drone2 drone_support - drone
    area1 area2 area3 area4 area5 area6 area7 area8 area9 - area
    temp hum - sensor
  )

  ;; Initial state
  (:init
    ;; Drone initial positions
    (At drone1 area1)
    (At drone2 area3)
    (At drone_support area5)

    (= (EnergyLevel drone1) 7)
    (= (EnergyLevel drone2) 10)
    (= (EnergyLevel drone_support) 50)
    (= (total-cost) 0)

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

    ;biderctional
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

    ;; Occupancy
    (Occupied area1)
    (Occupied area3)

    ;; **Blocked Path
    (DynamicBlocked area3 area6)
    (DynamicBlocked area6 area3)
    (DynamicBlocked area9 area6)
    (DynamicBlocked area6 area9)

    ;; Sensor capabilities
    (HasSensor drone1 temp)
    (HasSensor drone2 hum)

    ;; Priority levels
    (= (Priority area1) 1)
    (= (Priority area2) 2)
    (= (Priority area6) 3)
    (= (Priority area8) 1)
  )

  ;; Goals
  (:goal
    (and
      (DataCollected area1 temp)
      (DataCollected area1 hum)
      (DataCollected area2 temp)
      (DataCollected area2 hum)
      (DataCollected area6 temp)
      (DataCollected area6 hum)
      (DataCollected area8 temp)
      (DataCollected area8 hum)
    )
  )

  ;; Optimization metric
  (:metric minimize
    (total-cost)
  )
)