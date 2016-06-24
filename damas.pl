comerPeca("9C", "8D", "E0").
row(M, N, Row) :-
    nth1(N, M, Row).

column(M, N, Col) :-
    transpose(M, MT),
    row(MT, N, Col).

symmetrical(M) :-
    transpose(M, M).

transpose([[]|_], []) :- !.
transpose([[I|Is]|Rs], [Col|MT]) :-
    first_column([[I|Is]|Rs], Col, [Is|NRs]),
    transpose([Is|NRs], MT).

first_column([], [], []).
first_column([[]|_], [], []).
first_column([[I|Is]|Rs], [I|Col], [Is|Rest]) :-
    first_column(Rs, Col, Rest).


imprimir( [ ] ).
imprimir( [ X | Y ] ) :- nl, write(X), imprimir( Y ).



imprimirMat( [ ] ).
imprimirMat( [ X | Y ] ) :- imprimirMat( X ), nl, write(X), imprimirMat(Y).



matriz([["_","B","_","B","_","B","_","B"],["B","_","B","_","B","_","B","_"],	["_","B","_","B","_","B","_","B"],["1","_","1","_","1","_","1","_"],["_","1","_","1","_","1","_","1"],["P","_","P","_","P","_","P","_"],["_","P","_","P","_","P","_","P"],["P","_","P","_","P","_","P","_"]]).

%writeColuna(M, L, C):- write(M).

writeLinha(M):-imprimir(M).

criarMatrizInicial(M):- writeLinha(M).

vencedor(M, V, T):- turnar(M, T)

printarVencedor(V):- printe(v,"Jogador") ; printe(V, "computador").

damas(M):- vencedor(M, V, 0), printarVencedor(T).

%turnar(M, turno)







%======================================================================
% INICIO DO PROGRAMA
% ROTINA DE INICIALIZAÇÃO DAS VARIAVEIS. CHAME iniciar. PARA EXECUTAR
iniciar :- 
	write('Implementação do jogo de Damas em Prolog\n'),
	write('Desenvolvido por Ana Frozza E Humberto Goncalves\n'),
	write('---------------------------------------------\n'),
	damas([["_","B","_","B","_","B","_","B"],["B","_","B","_","B","_","B","_"],	["_","B","_","B","_","B","_","B"],["1","_","1","_","1","_","1","_"],["_","1","_","1","_","1","_","1"],["P","_","P","_","P","_","P","_"],["_","P","_","P","_","P","_","P"],["P","_","P","_","P","_","P","_"]]),
	
	
	fail.
	

