checkDivided(_,Y):-
	Y =:= 1.
checkDivided(X,Y):-
	not(0 is X mod Y),
	Y1 is Y-1,
	checkDivided(X,Y1).

isPrime(2).
isPrime(N):-
	checkDivided(N,N-1).

findPrimes(X,M):-
	isPrime(M),
	X1 is X - M,
	isPrime(X1),
	write('Output: '),
	write(M),write(' '),
	write(X1),nl.	
findPrimes(X,M):-
	M1 is M +1,
	findPrimes(X,M1).
main:-
	write('Input:'),read(N),findPrimes(N,2),halt.
:-initialization(main).
