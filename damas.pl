casa("1A",1,1,0).
casa("1B",1,1,0).
casa("1C",1,1,0).
casa("1D",1,1,0).
casa("1E",1,1,0).
casa("1F",1,1,0).
casa("1G",1,1,0).
casa("1H",1,1,0).

casa("2A",1,1,0).
casa("2B",1,1,0).
casa("2C",1,1,0).
casa("2D",1,1,0).
casa("2E",1,1,0).
casa("2F",1,1,0).
casa("2G",1,1,0).
casa("2H",1,1,0).

casa("3A",1,1,0).
casa("3B",1,1,0).
casa("3C",1,1,0).
casa("3D",1,1,0).
casa("3E",1,1,0).
casa("3F",1,1,0).
casa("3G",1,1,0).
casa("3H",1,1,0).

casa("4A",1,1,0).
casa("4B",1,1,0).
casa("4C",1,1,0).
casa("4D",1,1,0).
casa("4E",1,1,0).
casa("4F",1,1,0).
casa("4G",1,1,0).
casa("4H",1,1,0).

casa("5A",1,1,0).
casa("5B",1,1,0).
casa("5C",1,1,0).
casa("5D",1,1,0).
casa("5E",1,1,0).
casa("5F",1,1,0).
casa("5G",1,1,0).
casa("5H",1,1,0).

casa("6A",1,1,0).
casa("6B",1,1,0).
casa("6C",1,1,0).
casa("6D",1,1,0).
casa("6E",1,1,0).
casa("6F",1,1,0).
casa("6G",1,1,0).
casa("6H",1,1,0).

casa("7A",1,1,0).
casa("7B",1,1,0).
casa("7C",1,1,0).
casa("7D",1,1,0).
casa("7E",1,1,0).
casa("7F",1,1,0).
casa("7G",1,1,0).
casa("7H",1,1,0).

casa("8A",1,1,0).
casa("8B",1,1,0).
casa("8C",1,1,0).
casa("8D",1,1,0).
casa("8E",1,1,0).
casa("8F",1,1,0).
casa("8G",1,1,0).
casa("8H",1,1,0).

imprimir( [ ], I, J ).
imprimir( [ X | Y ], I, J ) :-	I is 1, J is 1, write('    1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 '), nl, write(I), write(' - '),write(X), F is I+1, G is J+1, imprimir( Y, F, G );
								I\=1 , J is 1, write(I), write(' - '), write(X), F is I+1, G is J+1, imprimir( Y, F, G );
								I\=1, J\=1, write(' | '), write(X), F is I+1, G is J+1, imprimir( Y, F, G ).

imprimirMat( [ ] , I, J).
imprimirMat( [ X | Y ], I, J ) :- imprimir( X, I, J),nl, F is I+1 ,imprimirMat(Y, F, J	).


matriz([["_","B","_","B","_","B","_","B"],["B","_","B","_","B","_","B","_"],	["_","B","_","B","_","B","_","B"],["1","_","1","_","1","_","1","_"],["_","1","_","1","_","1","_","1"],["P","_","P","_","P","_","P","_"],["_","P","_","P","_","P","_","P"],["P","_","P","_","P","_","P","_"]]).

%writeColuna(M, L, C):- write(M).

writeLinha(M):-imprimir(M).

criarMatrizInicial(M):- writeLinha(M).

verificarMovimento(M, I, J, X, Y):- write('Deu certo').
%verificarMovimento(M, I, J, X, Y):- verificarij(M, I, J), verificarxy(M, X, Y), K is X-I, L is Y-J, not(k,1), not(L,1), moverPeca(M, )

turnodojogador(M, I, J, X, Y):-write('Jogo Atual ') ,nl, imprimirMat(M, 1, 1), nl,
								write('Digite a linha onde esta'), nl, read(I), 
								write('Digite a coluna onde esta'), nl, read(J),
								write('Digite a linha onde vai'), nl, read(X),
								write('Digite a coluna onde vai'), nl, read(Y),
								verificarMovimento(M, I, J, X, Y).
								

mod2(T, NumeroDoTurno):- NumeroDoTurno is mod(T,2).

turnar(M,T):- mod2(T, NumeroDoTurno), NumeroDoTurno is 0, turnodojogador(M, I, J, X, Y).
%turnar(M,T):- mod2(T, NumeroDoTurno), Y is 0, turnodojogador(M, I, J, X, Y); mod2(T, Y), Y is 1, turnodocomputador(M).

vencedor(M, V, T):- turnar(M, T).

printarVencedor(V):- printe(v,"Jogador") ; printe(V, "computador").

damas(M):- vencedor(M, V, 0), printarvencedor(T).

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
	

