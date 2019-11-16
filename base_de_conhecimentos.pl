/* Procedimentos */

% Limpeza
procedimento(troca_curativo, 'Limpar ferida com SF 0,9%').

% Desbridamento
procedimento(necrose, 'Desbridamento autolitico com hidrogel').
procedimento(necrose, 'Desbridamento autolitico com hidrocoloide').
procedimento(necrose, 'Desbridamento autolitico com hidrogel e filme transparente').
procedimento(necrose, 'Desbridamento autolitico com hidrogel e gaze nao aderente').
procedimento(necrose, 'Desbridamento autolitico com hidrogel e hidrocoloide combinado com desbridamento instrumental').
procedimento(necrose, 'Desbridamento autolitico com hidrogel e filme transparente combinado com desbridamento instrumental').
procedimento(necrose, 'Desbridamento autolitico com hidrogel e gase nao aderente combinado com desbridamento instrumental').
procedimento(necrose, 'Desbridamento enzimatico com papaina diluida 10%').
procedimento(necrose, 'Desbridamento enzimatico com papaina gel 1%').
procedimento(necrose, 'Desbridamento instrumental').
procedimento(esfacelos, 'Desbridamento autolitico com hidrogel e hidrocoloide').
procedimento(esfacelos, 'Desbridamento autolitico com hidrogel e filme transparente').
procedimento(esfacelos, 'Desbridamento autolitico com hidrogel e gaze nao aderente').
procedimento(esfacelos, 'Desbridamento enzimatico com papaina gel 1%').
procedimento(esfacelos, 'Desbridamento enzimatico com papaina diluida 10%').

% Cuiados com a pele ao redor da ulcera
procedimento(pele_seca, 'Usar AGE').
procedimento(pele_seca, 'Usar creme restaurador de pH da pele').
procedimento(pele_escamosa, 'Usar AGE').
procedimento(pele_escamosa, 'Usar creme restaurador de pH da pele').

% Coberturas
procedimento(baixa_exs, sem_infec, sem_dor, 'Usar hidrocoloide').
procedimento(moderada_exs, sem_infec, sem_dor, 'Usar alginato de calcio').
procedimento(moderada_exs, sem_infec, sem_dor, 'Usar hidrofibra').
procedimento(moderada_exs, com_infec, sem_dor, 'Usar alginato de calcio com prata').
procedimento(moderada_exs, com_infec, sem_dor, 'Usar hidrofibra com prata').
procedimento(grande_exs, sem_infec, sem_dor, 'Usar espuma de poliuretano').
procedimento(grande_exs, sem_infec, sem_dor, 'Usar espuma hidrocelular').
procedimento(grande_exs, com_infec, sem_dor, 'Usar espuma de poliuretano com prata').
procedimento(baixa_exs, sem_infec, com_dor, 'Usar hidrocoloide').
procedimento(moderada_exs, sem_infec, com_dor, 'Usar espuma de poliuretano').
procedimento(grande_exs, sem_infec, com_dor, 'Usar espuma de poliuretano').

% Compressão
procedimento(baixa_exs, sem_infec, alta_ITB, 'elevar MMII por meia hora E')
procedimento(baixa_exs, sem_infec, moderada_ITB, 'elevar MMII por meia hora E')
procedimento(baixa_exs, sem_infec, alta_ITB, 'usar hidrocoloide e bota de unna OU')
procedimento(baixa_exs, sem_infec, moderada_ITB, 'usar hidrocoloide e bota de unna OU')
procedimento(baixa_exs, sem_infec, alta_ITB, 'usar hidrocoloide e bandagem de compressão graduada elástica')
procedimento(baixa_exs, sem_infec, moderada_ITB, 'usar hidrocoloide e bandagem de compressão graduada elástica')
procedimento(moderada_exs, sem_infec, alta_ITB, 'elevar MMII por meia hora e usar alginatode calcio OU')
procedimento(moderada_exs, sem_infec, moderada_ITB,'elevar MMII por meia hora e usar alginatode calcio OU')
procedimento(moderada_exs, sem_infec, alta_ITB,'hidrofibra e bota de unna OU'
procedimento(moderada_exs, sem_infec, moderada_ITB,'elevar MMII por meia hora eusar alginato de cálcio ou hidrofibra e bandagem de compressão graduada elástica') 
procedimento(grande_exs, sem_infec, moderada_ITB, 'elevar MMII por meia hora e usar espuma de poliuretano OU')
procedimento(grande_exs, sem_infec, moderada_ITB, 'espuma hidrocelular e bota unna OU')
procedimento(grande_exs, sem_infec, moderada_ITB, 'elevar MMII por meia hora e usar espuma de poliuretano ou espuma hidrocelular e bandagem de compressao graduada')


% Alta
:- discontiguous procedimento/2.
procedimento(epitelizada, 'O paciente pode receber alta').

/* Regras */


/* Seção de ajuda */

% Nomes dos procedimentos
nome('Troca de curativo -> <nome_do_procedimento>: troca_curativo, sem <opcoes>.').
nome('Ulcera com necrose -> <nome_do_procedimento>: necrose, sem <opcoes>.').
nome('Ulcera com esfacelos -> <nome_do_procedimento>: esfacelos, sem <opcoes>.').
nome('Pele ao redor da ulcera seca -> <nome_do_procedimento>: pele_seca, sem <opcoes>.').
nome('Pele ao redor da ulcera escamosa -> <nome_do_procedimento>: pele_escamosa, sem <opcoes>.').
nome('Ulcera com baixa exsudacao -> <nome_do_procedimento>: baixa_exs, <opcao>: sem_infec (sem infeccao)/com_infec (com infeccao), <opcao>: com_dor/sem_dor.').
nome('Ulcera com moderada exsudacao -> <nome_do_procedimento>: moderada_exs, <opcao>: sem_infec (sem infeccao)/com_infec (com infeccao), <opcao>: com_dor/sem_dor.').
nome('Ulcera com grande exsudacao -> <nome_do_procedimento>: grande_exs, <opcao>: sem_infec (sem infeccao)/com_infec (com infeccao), <opcao>: com_dor/sem_dor.').
nome('Ulcera epitelizada -> <nome_do_procedimento>: epitelizada, sem <opcoes>.').

% Regras de ajuda
ajuda :- write('Execute: procedimento(<nome_do_procedimento>, <opcoes se for o caso>, <variavel de retorno>)'), nl, write('Execute: ajuda(procedimentos) para visualizar as possibilidades.'), nl.
ajuda(procedimentos) :- write('Listando todos os nomes de procedimentos:'), nl, nl, forall(nome(NOME), (write(NOME), nl)).
