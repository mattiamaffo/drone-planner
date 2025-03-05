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

max_charge(10).

width(3).
height(3).

drone(d1).
drone(d2).

supp_drone(d3).

max_charge(10).

% fluents

fun_fluent(pos_x(D)) :- drone(D) ; supp_drone(D).
causes_val(left(D), pos_x(D), N, N is pos_x(D)-1).
causes_val(right(D), pos_x(D), N, N is pos_x(D)+1).

fun_fluent(pos_y(D)) :- drone(D) ; supp_drone(D).
causes_val(down(D), pos_y(D), N, N is pos_y(D)-1).
causes_val(up(D), pos_y(D), N, N is pos_y(D)+1).

fun_fluent(has_charge(D)) :- drone(D).
causes_val(charge(D), has_charge(D), N, N = MAX) :- max_charge(MAX).
causes_val(up(D), has_charge(D), N, N is has_charge(D)-1).
causes_val(down(D), has_charge(D), N, N is has_charge(D)-1).
causes_val(left(D), has_charge(D), N, N is has_charge(D)-1).
causes_val(right(D), has_charge(D), N, N is has_charge(D)-1).

% actions

prim_action(down(D)).
poss(down(D), and(drone(D), and(neg(has_charge(D) = 0), neg(pos_y(D) = 0)))).

prim_action(up(D)).
poss(up(D), and(drone(D), and(neg(has_charge(D) = 0), neg(pos_y(D) = H)))) :- height(H).

prim_action(left(D)).
poss(left(D), and(drone(D), and(neg(has_charge(D) = 0), neg(pos_x(D) = 0)))).

prim_action(right(D)).
poss(right(D), and(drone(D), and(neg(has_charge(D) = 0), neg(pos_x(D) = W)))) :- height(W).


initially(pos_x(d1), 0).
initially(has_charge(d1), MAX) :- max_charge(MAX).

proc(go_to_X(D, X),
    while(neg(pos_x(D) = X),
        ndet(right(D), left(D))
    )
) :- drone(D).

proc(control(dumb),
   go_to_X(d1, 2) ).

proc(go_to_Y, [up(d1)]).