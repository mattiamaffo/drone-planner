execute(A, SR) :- ask_execute(A, SR).
exog_occurs(_) :- fail.

max_charge(10).

widht(3).
height(3).

drone(d1).
drone(d2).

supp_drone(d3).

adj(X1, Y1, X2, Y2) :- 
    (X2 is X1 + 1, Y2 = Y1);  % Right neighbor
    (X2 is X1 - 1, Y2 = Y1);  % Left neighbor
    (Y2 is Y1 + 1, X2 = X1);  % Top neighbor
    (Y2 is Y1 - 1, X2 = X1).  % Bottom neighbor

% Define initially/2 based on initially/1
initially(F, true) :- initially(F).
initially(F, false) :- \+ initially(F).


% fluents

prim_fluent(at_loc(D, X, Y)).
initially(at_loc(d1, 0, 0)).
initially(at_loc(d2, 1, 0)).
initially(at_loc(d3, 0, 0)).

prim_fluent(empty(X, Y)).
initially(empty(X, Y)) :- % set all to empty except drones starting positions
    between(0, 3, X), 
    between(0, 3, Y), 
    not((X = 0, Y = 0) ; (X = 1, Y = 0)).

prim_fluent(has_charge(D, E)).
initially(has_charge(d1, MAX)) :- max_charge(MAX).
initially(has_charge(d2, MAX)) :- max_charge(MAX).

prim_fluent(has_priority(X, Y, P)).

% actions

prim_action(move(D, X1, Y1, X2, Y2)).
prim_action(measure(D, X, Y)).
prim_action(recharge(SD, D, X, Y)).

% action precondition axioms
poss(move(D, X1, Y1, X2, Y2),
    and(
        (drone(D); supp_drone(D)),
        and(
            at_loc(D, X1, Y1),
            and(
                adj(X1, Y1, X2, Y2),
                and(
                    empty(X2, Y2),
                    C > 0
                )
            )
        )
    )
) :- has_charge(D, C).

poss(measure(D, X, Y),
    and(
        drone(D),
        and(
            at_loc(D, X, Y),
            and(
                has_priority(X, Y, P),
                C >= P
            )
        )
    )
) :- has_charge(D, C).

poss(recharge(SD, D, X, Y),
    and(
        supp_drone(SD),
        and(
            drone(D),
            and(
                at_loc(SD, X, Y),
                at_loc(D, X, Y)
            )
        )
    )
).

% SSA

causes_val(move(D, X1, Y1, X2, Y2), at_loc(D, X2, Y2), true, true).
causes_val(move(D, X1, Y1, X2, Y2), at_loc(D, X1, Y1), false, true).
causes_val(move(D, X1, Y1, X2, Y2), empty(X1, Y1), true, true).
causes_val(move(D, X1, Y1, X2, Y2), empty(X2, Y2), false, true).
causes_val(move(D, X1, Y1, X2, Y2), has_charge(D, C_new), C_new, (has_charge(D, C), C_new is C - 1)).

causes_val(measure(D, X, Y), has_charge(D, CNew), CNew, (has_charge(D, C), has_priority(X, Y, P), CNew is C - P)).
causes_val(measure(D, X, Y), has_priority(X, Y, 0), 0, true).

causes_val(recharge(SD, D, X, Y), has_charge(D, CNew), CNew, (max_charge(MAX), CNew = MAX)).

% procedures

proc(move_to(D, XT, YT),
    if(at_loc(D, XT, YT),
        nil,  % Drone already at target, do nothing
        pi(X1, Y1, X2, Y2,
            (
                at_loc(D, X1, Y1),                 % Get current drone position
                adj(X1, Y1, X2, Y2),               % Find an adjacent position
                move(D, X1, Y1, X2, Y2),           % Move the drone
                move_to(D, XT, YT)                 % Recursively call procedure
            )
        )
    )
).

proc(control(basic), move_to(d1, 2, 0)).

at_loc1(d1,0,0).
proc(check_at_loc(D, X, Y),
    write('Drone is at ('), write(X), write(','), write(Y), write(')\n'),
    nl
).