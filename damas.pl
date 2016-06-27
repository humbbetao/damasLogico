imprimir( [ X | Y ], I, J ) :-	I==1, J==1, write('    1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 '), nl, write(I), write(' - '),write(X), F is I+1, G is J+1, imprimir( Y, F, G );
								I\=1 , J==1, write(I), write(' - '), write(X), F is I+1, G is J+1, imprimir( Y, F, G );
								I\=1, J\=1, write(' | '), write(X), F is I+1, G is J+1, imprimir( Y, F, G ).

imprimirMat( [ X | Y ], I, J ) :- imprimir( X, I, J),nl, F is I+1 ,imprimirMat(Y, F, J	).

writeLinha(M):-imprimir(M).

criarMatrizInicial(M):- writeLinha(M).

concatena([], L, L).
concatena([HD | L1], L2, [HD | L3]):- concatena(L1, L2, L3).

insereInicio(H, L, [H|L]):- !.

removeporindice(0,[_|T],T):- !.
removeporindice(I,[H|T],R):- X is I - 1, removeporindice(X, T, Y), insereInicio(H, Y, R).

substituirPecaEmColuna(Linha,  ListaAuxiliar,  J, Peca):- L is J-1, removeporindice(L, Linha, Lista), nth0(L,ListaAuxiliar, Peca, Lista).							

substituirPeca([HD|HT], M, I, J, Cont, Peca, Lista):-   I>1, F is I-1,  nth0(Cont, ListaAuxiliar, HD, Lista), U is Cont+1, substituirPeca(HT, M, F, J, U, Peca, ListaAuxiliar);
														I==1, substituirPecaEmColuna(HD, Linha, J, Peca), concatena([Linha], HT, Nova), concatena(Lista, Nova,M).
													 
										 
descobrirPosicao(X, J, Y, F, P):- 	J = 2, Y = 1, F is X+1, P is J;
									J = 7, Y = 8, F is X+1, P is J;
									J < Y, F is X+1, P is Y+1;
									J > Y, F is X+1, P is Y-1 .

						   
verificaY([HD | HT], Y, P):- Y=1, HD=="P", P is HD ;
							Y=1, HD\="P",  P is HD;
							F is Y-1, verificaY(HT, F, P).

verificarXY([HD | HT], X, Y, P) :- X=1, verificaY(HD, Y, P);
									F is X-1, verificarXY(HT, F, Y, P).

moverPeca(M, I, J, X, Y, M4):-  verificarXY(M, X, Y, P), P=="P", write("comer"), substituirPeca(M, M2, I, J, 0, "1", []), substituirPeca(M2, M3, X, Y, 0, "1", []),  F is X+1,descobrirPosicao(X, J, Y, F, P),  substituirPeca(M3, M4, F, P, 0, "B", []);
								verificarXY(M, X, Y, P), P\="P", write("mover"), substituirPeca(M, M2, I, J, 0, "1", []), substituirPeca(M2, M4, X, Y, 0, "B", []).	

verificarMovimento(M, I, J, X, Y, M4):- moverPeca(M, I, J, X, Y, M4).
										
verificaY(PosicaoIJ, [HD|HT], Cont, J, V, L,PosicaoXY):- 	HD\="P", Y is L+1, verificaY(PosicaoIJ, HT, Cont, J, V, Y,PosicaoXY);
															HD=="P", PosicaoXY is [V,L].



				
verificarXY(PosicaoIJ, [HD, HT], Cont, J, Novo, PosicaoXY):-Cont>Novo, V is Novo+1, verificarXY(PosicaoIJ, HT, Cont, J, V, PosicaoXY);
															Cont==Novo, V is Novo+1, verificaY(PosicaoIJ, HD, Cont, J,V, 1,PosicaoXY);
															Cont<Novo, V is Novo+1, verificaY(PosicaoIJ, HD, Cont, J,V, 1,PosicaoXY).															

verificarEmJ([HD, HT], M, Cont, J, PosicaoIJ, PosicaoXY):- 	Y is J+1, verificarEmJ(HT, M, Cont, Y, PosicaoIJ, PosicaoXY);
															HD=="B", PosicaoIJ is [Cont, J], verificarXY(PosicaoIJ, M, Cont, J, 1, PosicaoXY).
											

				
verificaParaCapturar([HD|HT], M2, Cont, PosicaoIJ, PosicaoXY):- F is Cont+1, verificaParaCapturar(HT, M2, F, PosicaoIJ, PosicaoXY),  verificarEmJ(HD, M2, Cont, 1, PosicaoIJ, PosicaoXY).
			

separarIJ([HD1, HD2, _], I, J):- I is HD1, J is HD2. 
				
turnodocomputador(M, I, J, X, Y, M4) :-  verificaParaCapturar(M, M, 1, PosicaoIJ, PosicaoXY), separarIJ(PosicaoIJ, I, J), separarIJ(PosicaoXY, X, Y), write("comer"), substituirPeca(M, M2, I, J, 0, "1", []), substituirPeca(M2, M3, X, Y, 0, "1", []), descobrirPosicao(X, J, Y, F, P),  substituirPeca(M3, M4, F, P, 0, "P", []);
										 verificaParaCapturar(M, M, 1, PosicaoIJ, PosicaoXY), separarIJ(PosicaoIJ, I, J), separarIJ(PosicaoXY, X, Y), write("mover"), substituirPeca(M, M2, I, J, 0, "1", []), substituirPeca(M2, M4, X, Y, 0, "P", []).
								
						
turnodojogador(M, I, J, X, Y, M4):- nl,
								write('Digite a linha onde esta'), nl, read(I), 
								write('Digite a coluna onde esta'), nl, read(J),
								write('Digite a linha onde vai'), nl, read(X),
								write('Digite a coluna onde vai'), nl, read(Y),
								verificarMovimento(M, I, J, X, Y, M4).
								

mod2(T, NumeroDoTurno):- (NumeroDoTurno is mod(T,2)).

turnar(M,T):-  write("Jogo Atual: "), nl, imprimirMat(M, 1,1), mod2(T, NumeroDoTurno), NumeroDoTurno=0, write("Turno do Jogador\n"), turnodojogador(M, I, J, X, Y, M4), S is T+1, turnar(M4, S);
			   write("Jogo Atual: "), nl, imprimirMat(M, 1,1), mod2(T, NumeroDoTurno), NumeroDoTurno=1, write("Turno do Computador\n"), turnodocomputador(M, I, J, X, Y, M4), S is T+1, turnar(M4, S).

vencedor(M, V, T):- turnar(M, T).

printarVencedor(V):- printe(V,"Jogador") ; printe(V, "computador").

damas(M):- vencedor(M, V, 0), printarvencedor(V).


%======================================================================
% INICIO DO PROGRAMA
% ROTINA DE INICIALIZAÇÃO DAS VARIAVEIS. CHAME iniciar. PARA EXECUTAR
iniciar :- 
	write('Implementação do jogo de Damas em Prolog\n'),
	write('Desenvolvido por Ana Frozza E Humberto Goncalves\n'),
	write('---------------------------------------------\n'),
	damas([["_","B","_","B","_","B","_","B"],["B","_","B","_","B","_","B","_"],	["_","B","_","B","_","B","_","B"],["1","_","1","_","1","_","1","_"],["_","1","_","1","_","1","_","1"],["P","_","P","_","P","_","P","_"],["_","P","_","P","_","P","_","P"],["P","_","P","_","P","_","P","_"]]),
	
	
	fail.
	

