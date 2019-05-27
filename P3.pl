path(X,Y,_):-edge(X,Y).
path(X,Y,V):-
	edge(X,Z),
	not(member(Z,V)),
	path(Z,Y,[X|V]).

read_path(P,_):-P =:=0.
read_path(P,Str):-
	read(Str,X),
	read(Str,Y),
	assert(edge(X,Y)),
	assert(edge(Y,X)),
	P1 is P-1,
	read_path(P1,Str).

check_path(X,Y):-path(X,Y,[]),write('Yes'),nl.
check_path(_,_):-write('No'),nl.

find_path(M,_):-M=:=0.
find_path(M,Str):-
	read(Str,X),
	read(Str,Y),
	check_path(X,Y),
	M1 is M-1,
	find_path(M1,Str).


main:-
	open('P3_path.txt',read,Str),read(Str,_),read(Str,P),read_path(P,Str),read(Str,M),find_path(M,Str),halt.

:-initialization(main).
