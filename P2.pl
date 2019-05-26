ancestor(P,C):-parent(P,C).
ancestor(P,C):-parent(X,C),ancestor(P,X).

lac(A,B):-A=:=B,write(A),nl.
lac(A,B):-ancestor(A,B),write(A),nl.
lac(A,B):-parent(X,A),lac(X,B).

handle_out(N,_):- N =:= 0,!.
handle_out(N,Str):-
	read(Str,X),
	read(Str,Y),
	lac(X,Y),
	N1 is N-1,
	handle_out(N1,Str).

create_tree(N,_):- N =:= 1,!.
create_tree(N,Str):-
	read(Str,X),
	read(Str,Y),
	assert(parent(X,Y)),
	N1 is N-1,
	create_tree(N1,Str).

main:-
	open('P2_nodes.txt',read,Str),read(Str,N),create_tree(N,Str),
	read(Str,S),handle_out(S,Str),halt.
	

:- initialization(main).
