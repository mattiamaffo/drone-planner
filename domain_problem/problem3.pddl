;; PROBLEM 3: Drone mission with blocked path, energy levels (initial value = 8), and sensors, 1 blocked area.
;; The goal: collect temperature and humidity data from areas 2, 7, by minimizing time and total cost (more weight on time).

;; PLANNER USED:
;; HEURISTICS USED:

(define (problem drone_mission_3)
  (:domain drone_mission_time)

  ;; Objects in the problem
  (:objects
    drone1 drone2 - drone
    station1 station2 - station
    area1 area2 area3 area4 area5 area6 area7 area8
    area9 area10 area11 area12 area13 area14 area15 area16 - area
    temp hum - sensor
  )

  ;; Initial state
  (:init
    ;; Drone initial positions
    (At drone1 area3)
    (At drone2 area13)

    ;; Initial energy levels
    (= (EnergyLevel drone1) 8)
    (= (EnergyLevel drone2) 8)

    ;; Initialize total cost and total time
    (= (total-cost) 0)
    (= (TotalTime) 0)

    ;; Stations
    (AtStation station1 area1)
    (AtStation station2 area16)

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

    ;; Blocked path between areas
    (Blocked area10 area11)
    (Blocked area11 area10)

    ;; Occupancy
    (Occupied area3)
    (Occupied area13)

    ;; Sensor capabilities
    (HasSensor drone1 temp)
    (HasSensor drone2 hum)
  )

  ;; Goals
  (:goal
  (and
    (DataCollected area2 temp)
    (DataCollected area2 hum)
    (DataCollected area4 temp)
    (DataCollected area4 hum)
    (DataCollected area7 temp)
    (DataCollected area7 hum)
  ))

  ;; Metric to minimize time first, then total cost
  (:metric minimize (+ (* 1000 (TotalTime)) (total-cost)))
)
