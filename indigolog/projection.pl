% set final condition to check:
proc(fcond, pos_x(d1)=1).

% set the sequence of actions perform:
proc(actions_seq, [left(d1)]).

projection :-
	indigolog([actions_seq, ?(fcond)]).