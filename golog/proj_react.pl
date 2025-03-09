:- dynamic controller/1.
:- discontiguous
    fun_fluent/1,
    rel_fluent/1,
    proc/2,
    causes_true/3,
    causes_false/3.

% There is nothing to do caching on (required becase cache/1 is static)
cache(_) :- fail.

% predicates

max_charge(2).

width(3).
height(3).

drone(d1).
drone(d2).

supp_drone(d3).

reward(3, 2).

% fluents

fun_fluent(pos_x(D)) :- drone(D) ; supp_drone(D).
causes_val(left(D), pos_x(D), N, N is pos_x(D)-1).
causes_val(right(D), pos_x(D), N, N is pos_x(D)+1).

fun_fluent(pos_y(D)) :- drone(D) ; supp_drone(D).
causes_val(down(D), pos_y(D), N, N is pos_y(D)-1).
causes_val(up(D), pos_y(D), N, N is pos_y(D)+1).

fun_fluent(has_charge(D)) :- drone(D) ; supp_drone(D).
causes_val(charge(SD, D), has_charge(D), N, N = MAX) :- max_charge(MAX).
causes_val(up(D), has_charge(D), N, N is has_charge(D)-1).
causes_val(down(D), has_charge(D), N, N is has_charge(D)-1).
causes_val(left(D), has_charge(D), N, N is has_charge(D)-1).
causes_val(right(D), has_charge(D), N, N is has_charge(D)-1).

rel_fluent(picked_up).
causes_true(pick_up(d1, X, Y), picked_up, true).

% actions

prim_action(down(D)).
poss(down(D), and(or(drone(D), supp_drone(D)), and(neg(has_charge(D) = 0), neg(pos_y(D) = 0)))).

prim_action(up(D)).
poss(up(D), and(or(drone(D), supp_drone(D)), and(neg(has_charge(D) = 0), neg(pos_y(D) = H)))) :- height(H).

prim_action(left(D)).
poss(left(D), and(or(drone(D), supp_drone(D)), and(neg(has_charge(D) = 0), neg(pos_x(D) = 0)))).

prim_action(right(D)).
poss(right(D), and(or(drone(D), supp_drone(D)), and(neg(has_charge(D) = 0), neg(pos_x(D) = W)))) :- height(W).

prim_action(charge(SD, D)).
poss(charge(SD, D), and(drone(D), and(supp_drone(SD), and(pos_x(D) = pos_x(SD), pos_y(D) = pos_y(SD))))).

prim_action(pick_up(D, X, Y)).
poss(pick_up(D, X, Y), and(drone(D), and(pos_x(D) = X, pos_y(D) = Y))).

% initial conditions

initially(pos_x(d1), 3).
initially(pos_y(d1), 0).
initially(pos_x(d3), 0).
initially(pos_y(d3), 0).
initially(has_charge(d1), MAX) :- max_charge(MAX).
initially(has_charge(d3), 1000).
initially(picked_up, false).

initially(reward_f(1, 2), true).
initially(reward_f(2, 2), true).

% procedures

proc(go_to_X(D, X),
    if(pos_x(D) < X, right(D), left(D))
) :- drone(D); supp_drone(D).

proc(go_to_Y(D, Y),  
    if(pos_y(D) < Y, up(D), down(D))
) :- drone(D); supp_drone(D).

proc(request_support_drone(SD, D, X, Y),
    [
        while(or(neg(pos_x(SD) = X), neg(pos_y(SD) = Y)), [
            if(neg(pos_x(SD) = X), go_to_X(SD, X), go_to_Y(SD, Y))
        ]),
        charge(SD, D)
    ]
) :- supp_drone(SD), drone(D).

proc(go_to(D, X, Y),  
    while(or(neg(pos_x(D) = X), neg(pos_y(D) = Y)), [
        ndet(go_to_X(D, X), request_support_drone(d3, D, pos_x(D), pos_y(D))),
        ndet(go_to_Y(D, Y), request_support_drone(d3, D, pos_x(D), pos_y(D)))
    ])
) :- drone(D).

proc(actions, [
    ndet(
        ndet(
            ndet(up(d1), down(d1)),
            ndet(left(d1), right(d1))
        ),
        ndet(
            ndet(
                ndet(up(d3), down(d3)),
                ndet(left(d3), right(d3))
            ),
            ndet(charge(d3, d1), pick_up(d1, X, Y))
        )
    )
]) :- reward(X, Y).

proc(search_actions, [
        star(actions),
        ?(picked_up)
    ]
).

proc(solved, picked_up).

% controllers

proc(control(basic), [
    go_to(d1, X, Y),
    pick_up(d1, X, Y)
]) :- reward(X, Y).

proc(control(search_actions), search(search_actions)).