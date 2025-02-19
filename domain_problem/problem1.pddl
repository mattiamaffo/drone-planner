(define (problem drone_mission_1)
  (:domain drone_mission)

  ;; Objects in the problem
  (:objects
    drone1 drone2 - drone
    area1 area2 area3 area4 area5 area6 area7 area8
    area9 area10 area11 area12 area13 area14 area15 area16 - area
    temp hum - sensor
  )

  ;; Initial state
  (:init
    ;; Drone initial positions
    (At drone1 area3)
    (At drone2 area13)
    (= (EnergyLevel drone1) 10)
    (= (EnergyLevel drone2) 10)

    ;; Adjacencies (4x4 grid)
    (Adj area1 area2) (Adj area2 area3) (Adj area3 area4)
    (Adj area5 area6) (Adj area6 area7) (Adj area7 area8)
    (Adj area9 area10) (Adj area10 area11) (Adj area11 area12)
    (Adj area13 area14) (Adj area14 area15) (Adj area15 area16)
    (Adj area1 area5) (Adj area2 area6) (Adj area3 area7) (Adj area4 area8)
    (Adj area5 area9) (Adj area6 area10) (Adj area7 area11) (Adj area8 area12)
    (Adj area9 area13) (Adj area10 area14) (Adj area11 area15) (Adj area12 area16)
    
    ;; Bidirectional adjacencies
    (Adj area2 area1) (Adj area3 area2) (Adj area4 area3)
    (Adj area6 area5) (Adj area7 area6) (Adj area8 area7)
    (Adj area10 area9) (Adj area11 area10) (Adj area12 area11)
    (Adj area14 area13) (Adj area15 area14) (Adj area16 area15)
    (Adj area5 area1) (Adj area6 area2) (Adj area7 area3) (Adj area8 area4)
    (Adj area9 area5) (Adj area10 area6) (Adj area11 area7) (Adj area12 area8)
    (Adj area13 area9) (Adj area14 area10) (Adj area15 area11) (Adj area16 area12)

    ;; Occupancy
    (Occupied area3)
    (Occupied area13)

    ;; Sensor capabilities
    (HasSensor drone1 temp)
    (HasSensor drone2 hum)

    ;; Priority levels
    (= (Priority area1) 1)
    (= (Priority area2) 1)

    ;; total-cost
    (= (total-cost) 0)
  )

  ;; Goals
  (:goal
    (and
      (DataCollected area1 temp)
      (DataCollected area1 hum)
      (DataCollected area2 temp)
      (DataCollected area2 hum)
    )
  )

  ;; Optimization metric
  (:metric minimize (total-cost))
)
