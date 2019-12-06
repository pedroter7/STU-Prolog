/* Procedimentos */

% LIMPEZA
procedimento(troca_curativo, 'Limpar ferida com SF 0,9%').

%Sintomas
sintoma(Paciente,necrose) :-
pergunta(Paciente,', esta com necrose (y/n)? ').
sintoma(Paciente,esfacelos) :-
      pergunta(Paciente,', esta com esfacelos (y/n)? ').
sintoma(Paciente,pele_seca) :-
      pergunta(Paciente,', esta com a pele seca (y/n)? ').
sintoma(Paciente,pele_escamosa) :-
      pergunta(Paciente,', esta com a pele escamosa  (y/n)? ').
sintoma(Paciente,infecçao) :-
      pergunta(Paciente,', esta com infecçao (y/n)? ').
sintoma(Paciente,baixa_exs) :-
      pergunta(Paciente,', esta com esxudaçao baixa (y/n)? ').
sintoma(Paciente,moderada_exs) :-
      pergunta(Paciente,', esta com esxudaçao moderada (y/n)? ').
sintoma(Paciente,grande_esx) :-
      pergunta(Paciente,', esta com esxudaçao grande (y/n)? ').
sintoma(Paciente,alta_ITB) :-
      pergunta(paciente,', esta com ITB alta (y/n)? ').
sintoma(Paciente,moderada_ITB) :-
      pergunta(Paciente,', esta com ITB moderada (y/n)? ').
sintoma(Paciente,baixa_ITB) :-
      pergunta(Paciente,', esta com ITB baixa (y/n)? ').
sintoma(Paciente,com_dor) :-
      pergunta(Paciente,', esta com dor (y/n)? ').



% Desbridamento
procedimento(Paciente, 'Desbridamento autolitico com hidrogel'):-
     sintoma(Paciente, necrose).
procedimento(Paciente, 'Desbridamento autolitico com hidrocoloide'):-
     sintoma(Paciente, necrose).
procedimento(Paciente, 'Desbridamento autolitico com hidrogel e filme transparente'):-
     sintoma(Paciente, necrose).
procedimento(Paciente, 'Desbridamento autolitico com hidrogel e gaze nao aderente'):-
     sintoma(Paciente, necrose).
procedimento(Paciente, 'Desbridamento autolitico com hidrogel e hidrocoloide combinado com desbridamento instrumental'):-
     sintoma(Paciente, necrose).
procedimento(Paciente, 'Desbridamento autolitico com hidrogel e filme transparente combinado com desbridamento instrumental'):-
     sintoma(Paciente, necrose).
procedimento(Paciente, 'Desbridamento autolitico com hidrogel e gase nao aderente combinado com desbridamento instrumental'):-
     sintoma(Paciente, necrose).
procedimento(Paciente, 'Desbridamento enzimatico com papaina diluida 10%'):-
     sintoma(Paciente, necrose).
procedimento(Paciente, 'Desbridamento enzimatico com papaina gel 1%'):-
     sintoma(Paciente, necrose).
procedimento(Paciente, 'Desbridamento instrumental'):-
     sintoma(Paciente, necrose).
procedimento(Paciente, 'Desbridamento autolitico com hidrogel e hidrocoloide'):-
    sintoma(Paciente, esfacelos).
procedimento(Paciente, 'Desbridamento autolitico com hidrogel e filme transparente'):-
    sintoma(Paciente, esfacelos).
procedimento(Paciente, 'Desbridamento autolitico com hidrogel e gaze nao aderente'):-
    sintoma(Paciente, esfacelos).
procedimento(Paciente, 'Desbridamento enzimatico com papaina gel 1%'):-
    sintoma(Paciente, esfacelos).
procedimento(Paciente, 'Desbridamento enzimatico com papaina diluida 10%'):-
    sintoma(Paciente, esfacelos).

% Cuidados com a pele ao redor da ulcera
procedimento(Paciente, 'Usar AGE'):-
      sintoma(Paciente, pele_seca).
procedimento(Paciente, 'Usar creme restaurador de pH da pele'):-
      sintoma(Paciente, pele_seca).
procedimento(Paciente, 'Usar AGE'):-
      sintoma(Paciente, pele_escamosa).
procedimento(Paciente, 'Usar creme restaurador de pH da pele'):-
      sintoma(Paciente, pele_escamosa).

% Coberturas
procedimento(
 sintoma(Paciente,baixa_exs),
 sintoma(Paciente, sem_infec),
 sintoma(Paciente, sem_dor),
 'Usar hidrocoloide'):-
 
procedimento(
 sintoma(Paciente,moderada_exs)
 sintoma(Paciente, sem_infec),
 sintoma(Paciente, sem_dor),
 'Usar alginato de calcio').
procedimento(
 sintoma(Paciente,moderada_exs),
 sintoma(Paciente, sem_infec),
 sintoma(Paciente, sem_dor),
 'Usar hidrofibra').
procedimento(
 sintoma(Paciente,moderada_exs),
 sintoma(Paciente, com_infec),
 sintoma(Paciente, sem_dor),
 'Usar alginato de calcio com prata').
procedimento(moderada_exs, com_infec, sem_dor, 'Usar hidrofibra com prata').
procedimento(grande_exs, sem_infec, sem_dor, 'Usar espuma de poliuretano').
procedimento(grande_exs, sem_infec, sem_dor, 'Usar espuma hidrocelular').
procedimento(grande_exs, com_infec, sem_dor, 'Usar espuma de poliuretano com prata').
procedimento(baixa_exs, sem_infec, com_dor, 'Usar hidrocoloide').
procedimento(moderada_exs, sem_infec, com_dor, 'Usar espuma de poliuretano').
procedimento(grande_exs, sem_infec, com_dor, 'Usar espuma de poliuretano').

% Compressão
procedimento(Paciente,'Elevar MMII por meia hora e usar hidrocoloide e bota de unna'):-
      sintoma(Paciente, baixa_exs),
      sintoma(Paciente, sem_infec), 
      sintoma(Paciente, alta_ITB).

procedimento(Paciente, 'Elevar MMII por meia hora usar hidrocoloide e bota de unna'):-
      sintoma(Paciente, baixa_exs),
      sintoma(Paciente,sem_infec),
      sintoma(Paciente, moderada_ITB).
procedimento(Paciente, 'Elevar MMII por meia hora e usar hidrocoloide e bandagem de compressão graduada elástica'):-
     sintoma(Paciente,baixa_exs),
     sintoma(Paciente, sem_infec),
     sintoma(Paciente, alta_ITB),
 
procedimento(Paciente, 'Elevar MMII por meia hora e usar hidrocoloide e bandagem de compressão graduada elástica'):-
     sintoma(Paciente, baixa_exs),
     sintoma(Paciente, sem_infec),
     sintoma(Paciente, moderada_ITB).
 
procedimento(Paciente,'Elevar MMII por meia hora e usar alginato de calcio'):-
     sintoma(Paciente, moderada_exs),
     sintoma(Paciente, sem_infec),
     sintoma(Paciente, alta_ITB),
 
procedimento(Paciente,'Elevar MMII por meia hora e usar alginato de calcio'):-
     sintoma(Paciente, moderada_exs),
     sintoma(Paciente, sem_infec),
     sintoma(Paciente, moderada_ITB),

procedimento(Paciente, 'Elevar MMII por meia hora e usar hidrofibra e bota de unna'):-
    sintoma(Paciente, moderada_exs),
    sintoma(Paciente, sem_infec),
    sintoma(Paciente, alta_ITB).

procedimento(Paciente, 'Elevar MMII por meia hora eusar alginato de cálcio ou hidrofibra e bandagem de compressão graduada elástica'):-
    sintoma(Paciente, moderada_exs),
    sintoma(Paciente, sem_infec),
    sintoma(Paciente, moderada_ITB).

procedimento(Paciente,  'Elevar MMII por meia hora e usar espuma de poliuretano'):-
    sintoma(Paciente, grande_exs),
    sintoma(Paciente, sem_infec),
    sintoma(Paciente, moderada_ITB).
 
procedimento(Paciente,'Elevar MMII por meia hora e usar espuma hidrocelular e bota unna'):-
sintoma(Paciente, grande_exs),
sintoma(Paciente, sem_infec),
sintoma(Paciente, moderada_ITB).

procedimento(Paciente, 'Elevar MMII por meia hora e usar espuma de poliuretano'):-
sintoma(Paciente, grande_exs),
sintoma(Paciente, sem_infec),
sintoma(Paciente, moderada_ITB),

procedimento(Paciente, 'Elevar MMII por meia hora e usar espuma hidrocelular e bandagem de compressao graduada'):-
sintoma(Paciente, grande_exs),
sintoma(Paciente, sem_infec),
sintoma(Paciente, moderada_ITB).
 

% Alta
:- discontiguous procedimento/2.
procedimento(epitelizada, 'O paciente pode receber alta').

/*Descricao do procedimetno*/
escreverproedimento(Procedimento):-
                nl,
		write('o precedimento a se seguir é '),
		write(Procedimento),
		write('.').


/* Regras */


/* Seção de ajuda */

% Nomes dos procedimentos
nome('Troca de curativo -> <nome_do_procedimento>: troca_curativo, sem <opcoes>.').
nome('Ulcera com necrose -> <nome_do_procedimento>: necrose, sem <opcoes>.').
nome('Ulcera com esfacelos -> <nome_do_procedimento>: esfacelos, sem <opcoes>.').
nome('Pele ao redor da ulcera seca -> <nome_do_procedimento>: pele_seca, sem <opcoes>.').
nome('Pele ao redor da ulcera escamosa -> <nome_do_procedimento>: pele_escamosa, sem <opcoes>.').
nome('Ulcera com baixa exsudacao (baseada em dor) -> <nome_do_procedimento>: baixa_exs, <opcao>: sem_infec (sem infeccao)/com_infec (com infeccao), <opcao>: com_dor/sem_dor.').
nome('Ulcera com moderada exsudacao (baseada em dor) -> <nome_do_procedimento>: moderada_exs, <opcao>: sem_infec (sem infeccao)/com_infec (com infeccao), <opcao>: com_dor/sem_dor.').
nome('Ulcera com grande exsudacao (baseada em dor) -> <nome_do_procedimento>: grande_exs, <opcao>: sem_infec (sem infeccao)/com_infec (com infeccao), <opcao>: com_dor/sem_dor.').
nome('Ulcera com baixa exsudacao (baseada em ITB) -> <nome_do_procedimento>: baixa_exs, <opcao>: sem_infec (sem infeccao)/com_infec (com infeccao), <opcao>: moderada_ITB/alta_ITB (igual a 0,8/maior que 0,8).').
nome('Ulcera com moderada exsudacao (baseada em ITB) -> <nome_do_procedimento>: moderada_exs, <opcao>: sem_infec (sem infeccao)/com_infec (com infeccao), <opcao>: moderada_ITB/alta_ITB (igual a 0,8/maior que 0,8).').
nome('Ulcera com grande exsudacao (baseada em ITB) -> <nome_do_procedimento>: grande_exs, <opcao>: sem_infec (sem infeccao)/com_infec (com infeccao), <opcao>: moderada_ITB/alta_ITB (igual a 0,8/maior que 0,8).').
nome('Ulcera epitelizada -> <nome_do_procedimento>: epitelizada, sem <opcoes>.').

% Regras de ajuda
ajuda :- write('Execute: procedimento(<nome_do_procedimento>, <opcoes se for o caso>, <variavel de retorno>)'), nl, write('Execute: ajuda(procedimentos) para visualizar as possibilidades.'), nl.
ajuda(procedimentos) :- write('Listando todos os nomes de procedimentos e opcoes possiveis:'), nl, nl, forall(nome(NOME), (write(NOME), nl)).

		
/*Regras para as perguntas*/
dados_paciente(Paciente, Idade, Sexo) :-
        write('Qual seu nome? '),
        read(Paciente),
			
pergunta(Paciente, Valor) :-
        ask(Paciente, Valor).
		
ask(Paciente, Valor) :-
        known(Paciente, Valor, true),
		!.
		
ask(Paciente, Valor) :-
        known(Paciente, Valor, false),
		!, 
		fail.
		
ask(Paciente, Valor) :-
		write(Paciente),
		write(Valor),  
		read(Resposta), 
		!,
		((Resposta=y, assert(known(Paciente, Valor, true)),!);(assert(known(Paciente, Valor, false)),fail)).	
		
write('Deseja fazer o diagnostico de outro paciente ? (y/n)'),
	    read(Resp),
	    \+ Resp=y,
	    nl,