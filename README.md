# Drone Planner
## Indigolog
With this implementation it is possible to use the controllers:

 - Basic: a deterministic algorithm to reach the goal
 - Search: non deterministic search to reach the goal
 - Search Reactive: extended Search to handle exogenous events

And solve projection and legality tasks.

To everything it is necessary to clone this repository inside the indigolog folder and run:

    swipl config.pl drone-planner/indigolog/main.pl

Then, you can use the following commands:

 - `main.`: show the available controllers and choose one;
 - `legality.`: solve the specified legality task;
 - `projection.`: solve the specified projection task.

It is possible to specify both a legality and a projection task at the end of the `task.pl` file.