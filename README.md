# Drone Planner

## Overview
The **Drone Planner** project focuses on planning and coordinating autonomous drones for environmental and meteorological monitoring. The mission is inspired by NOAA's drone-based monitoring strategies and aims to optimize energy consumption while ensuring full data collection in extreme weather conditions.

Drones operate within a **grid-based environment** (either 4x4 or 3x3) and are equipped with specialized sensors to collect **temperature, humidity, and pollution data**. Collaboration is essential since each drone carries only one type of sensor. Additionally, a **support drone** is introduced to recharge other drones, minimizing unnecessary movements and improving mission efficiency.

The project is implemented using **PDDL** for automated planning and **Situation Calculus with Indigolog** for reasoning tasks.

---

## **PDDL-based Planning**
### **Domain & Problem Definition**
The mission consists of drones navigating a grid while optimizing energy use and adapting to dynamic obstacles. The environment is subject to blocked areas, which may become accessible as the mission progresses.

Key features:
- **Drones start from two base stations** and must collect data from prioritized areas.
- **Energy constraints** require recharging at base stations or through a support drone.
- **Dynamic obstacles** can block paths initially, requiring strategic movement adjustments.
- **Priority areas** require more urgent data collection.

### **Problem Instances**
1. **Basic Scenario**: Two drones collect data in a 4x4 grid with no energy constraints or obstacles.
2. **Intermediate Scenario**: Three drones, including a support drone, collect data in a 3x3 grid with energy management and priority zones.
3. **Advanced Scenario**: Complex constraints, including energy limitations, dynamic obstacles, and high-priority zones requiring strategic navigation.

### **Planners & Heuristics**
The project evaluates different planners:
1. **ENHSP** (for numerical planning) using A* and Greedy Best First Search with Hadd, Hmax, and Hmrp heuristics.
2. **Fast Downward** (non-numerical) using A* with the Lmcut heuristic.
3. **FF Planner**, using Greedy Best First Search with the Hff heuristic.

---

## **Indigolog-based Reasoning**
The project integrates Indigolog to provide reasoning capabilities beyond standard planning.

### **Controllers Available**
- **Basic**: A deterministic algorithm to reach the goal.
- **Search**: A non-deterministic search algorithm.
- **Search Reactive**: Extends the search algorithm to handle exogenous events.

### **Running the System**
To execute the reasoning tasks, clone this repository inside the Indigolog folder and run:
```
swipl config.pl drone-planner/indigolog/main.pl
```
Then, use the following commands:
- `main.`: Displays available controllers and allows selection.
- `legality.`: Solves the legality task defined in `task.pl`.
- `projection.`: Solves the projection task.
---

## **Conclusion**
This project explores the integration of **AI planning and logical reasoning** for autonomous drone missions, addressing challenges like energy optimization, collaborative data collection, and adaptability to dynamic obstacles. By leveraging **PDDL for planning** and **Indigolog for reasoning**, we provide a robust system for real-world environmental monitoring tasks.

