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

%imprimir( [ ], I, J ).
%imprimir( [ X | Y ], I, J ) :-	I=0, J=0, L is X, write(X),G is F+1, imprimir( Y, F, G, L ).


%imprimirMat( [ ] , I, J).
%imprimirMat( [ X | Y ], I, J, L ) :- imprimir( X, I, J, L), nl, F is I+1 ,imprimirMat(Y, F, J, L).




matriz([["_","B","_","B","_","B","_","B"],["B","_","B","_","B","_","B","_"],	["_","B","_","B","_","B","_","B"],["1","_","1","_","1","_","1","_"],["_","1","_","1","_","1","_","1"],["P","_","P","_","P","_","P","_"],["_","P","_","P","_","P","_","P"],["P","_","P","_","P","_","P","_"]]).

%writeColuna(M, L, C):- write(M).

writeLinha(M):-imprimir(M).

criarMatrizInicial(M):- writeLinha(M).

concatena([], L, L).
concatena([HD | L1], L2, [HD | L3]):- concatena(L1, L2, L3).

%comerPeça(M, I, J, X, Y):- .

%inserirNaUltimaPosicao():-.

%nth0(1, L, a1, [a,b])
	%posicao, lista que vai receber, elemento, e a lista que eh inserida;


insereInicio(H, L, [H|L]):- !.

removeporindice(0,[_|T],T):- !.
removeporindice(I,[H|T],R):- X is I - 1, removeporindice(X, T, Y), insereInicio(H, Y, R).

substituirPecaEmColuna(Linha,  ListaAuxiliar,  J, Peca):- L is J-1, removeporindice(L, Linha, Lista), nth0(L,ListaAuxiliar, ["_"], Lista).							

substituirPeca([HD|HT], M, I, J, Peca):- !.
substituirPeca([HD|HT], M, I, J, Cont, Peca, Lista):- I==1, substituirPecaEmColuna(HD, Linha, J, Peca), concatena(Linha, HT, Nova), concatena(ListaAuxiliar, Nova,M);
										F is I-1,  nth0(Cont, ListaAuxiliar, HD, M), U is Cont+1, substituirPeca(HT, M, F, J, Cont, Peca, ListaAuxiliar).


%substituirPecaEmColuna([], K, J, Peca).
%substituirPecaEmColuna([HD | HT], K,  J, Peca):-  	F is J-1, substituirPecaEmColuna(HT, K, F, Peca), concatena(K, HD, K),J==1, concatena(Peca, HT, K).
																

	
%J == 1 , concatena(HD,  )concatena(Peca, HT, Nova), con , F is J-1, concatena(HD, )).

											  
%substituirPeca([], M, I, J, Peca).
%substituirPeca([HD | HT], M, I, J, Peca):- I==1, substituirPecaEmColuna(HD, M, J, Peca), concatena(, HT, Nova);, F is I-1, substituirPeca(HT,M, F, J, Peca), concatena(HD, , Nova)).

										 
descobrirPosicao(J, Y, P):- ((J = 2, Y = 1) -> P is J;
						  (J = 7, Y = 8) -> P is J;
						   J < Y -> F is Y+1, P is F;
						   J < Y -> K is Y-1, P is K;
						   L is Y-1, P is L).

						   
verificaY([], Y, C).
verificaY([HD | HT], Y, C):- Y=1, HD==C, P is HD ; Y=1, HD\=C,  P is HD; F is Y-1, verificaY(HT, F, C).

verificarXY([], X, Y, C).
%verificarXY([HD | HT], X, Y):-(X=0 -> verificaY(HD, Y); F is X-1, verificarXY(T, F, Y)).
verificarXY([HD | HT], X, Y, P) :- X=1, C = ["P"], verificaY(HD, Y, C);
									F is X-1, C = ["P"], verificarXY(HT, F, Y, P).

moverPeca(M, I, J, X, Y):- verificarXY(M, X, Y, P), P== ["P"], F is X+1, substituirPeca(M, M2, I, J, ["1"]), substituirPeca(M2, M3, X, Y, ["1"]), descobrirPosicao(J, Y, P), substituirPeca(M3, M4, F, P, ["B"]);
							substituirPeca(M, M2, I, J, ["1"]), substituirPeca(M2, M3, X, Y, ["B"]).
%moverPeca(M, I, J, X, Y):- verificarXY(M, X, Y, C, P), C=["P"], ; .

moverPecaComp(M, PosicaoIJ, PosicaoXY).
%moverPecaComp(M, [I | J], [X | Y]):-.


%verificarMovimento(M, I, J, X, Y):- write('Deu certo').
verificarMovimento(M, I, J, X, Y):- moverPeca(M, I, J, X, Y).

verificaSeTemPecaNaLinha([], Peca, I, J).
verificaSeTemPecaNaLinha([HD | HT], Peca, I, J):- (HD="B" -> concatena(concatena(I,J), []); F is J+1, verificaSeTemPecaNaLinha(HT, Peca, I, F)).

verificaSeTemPecaLinhaAdjacente([], Peca, I, J, []).
verificaSeTemPecaLinhaAdjacente([HD | HT], Peca, I, J, [Head | Tail]):- K is J+1, F is J-1, ((HT=F, HD="P") -> concatena(concatena(I,J),[]), concatena(Head, Tail);
																		(HT=K, HD="P") -> concatena(concatena(I,J),[]), concatena(Head, Tail);
																		verificaSeTemPecaLinhaAdjacente(HT, Peca, I, K, concatena(Head, Tail))).

																		
%verificaSeTemPecaNaLinha():-.

%verificaPecaMaisFrenteRetornaXY():-.

%verificaPecaMaisFrenteRetornaIJ():-.

verificaParaCapturar([], Lista, I).
verificaParaCapturar([HD | HT], Lista, I):- (I>7, verificaSeTemPecaLinhaAdjacente(HT, "P", I, 1, verificaSeTemPecaNaLinha(HD, "B", I, 1))=([],[]) ->  
											 F is I+1, verificaParaCapturar(HT, Lista, F); 
											 verificaSeTemPecaLinhaAdjacente(HT, "P", I, 1), verificaSeTemPecaNaLinha(HD,"P", I, 1)).

											 
turnodocomputador(M):- (verificaParaCapturar(M, [], 1)=([],[]) -> verificaPecaMaisFrenteRetornaIJ(M, [], 1), verificaParaCapturar(M, [], 1)); ((verificaParaCapturar(M, [], 1)=([],[]) -> verificaPecaMaisFrenteRetornaXY(M, [], 1)), verificaParaCapturar(M, [], 1)).
					   

						
turnodojogador(M, I, J, X, Y):- nl,
								write('Digite a linha onde esta'), nl, read(I), 
								write('Digite a coluna onde esta'), nl, read(J),
								write('Digite a linha onde vai'), nl, read(X),
								write('Digite a coluna onde vai'), nl, read(Y),
								verificarMovimento(M, I, J, X, Y).
								

mod2(T, NumeroDoTurno):- (NumeroDoTurno is mod(T,2)).

%turnar(M,T):- mod2(T, NumeroDoTurno), NumeroDoTurno is 0, turnodojogador(M, I, J, X, Y).
%turnar(M,T):-  mod2(T, NumeroDoTurno), NumeroDoTurno is 0, turnodojogador(M, I, J, X, Y).
turnar(M,T):-  write("Jogo Atual: "), nl, imprimirMat(M, 1,1), mod2(T, NumeroDoTurno), turnodojogador(M, I, J, X, Y), S is T+1, turnar(M, S);
			  write("Jogo Atual: "), nl, imprimirMat(M, 1,1), mod2(T, NumeroDoTurno), turnodojogador(M, I, J, X, Y), S is T+1, turnar(M, S).

				vencedor(M, V, T):- turnar(M, T).

printarVencedor(V):- printe(V,"Jogador") ; printe(V, "computador").

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
	

