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

/* Seção de ajuda */

% Nomes dos procedimentos
nome('Troca de curativo -> <nome_do_procedimento>: troca_curativo, sem <opcoes>.').
nome('Ulcera com necrose -> <nome_do_procedimento>: necrose, sem <opcoes>.').
nome('Ulcera com esfacelos -> <nome_do_procedimento>: esfacelos, sem <opcoes>.').
nome('Pele ao redor da ulcera seca -> <nome_do_procedimento>: pele_seca, sem <opcoes>.').
nome('Pele ao redor da ulcera escamosa -> <nome_do_procedimento>: pele_escamosa, sem <opcoes>.').

% Regras de ajuda
ajuda :- write('Execute: procedimento(<nome_do_procedimento>, <opcoes se for o caso>, <variavel de retorno>)'), nl, write('Execute: ajuda(procedimentos) para visualizar as possibilidades.'), nl.
ajuda(procedimentos) :- write('Listando todos os nomes de procedimentos:'), nl, nl, forall(nome(NOME), (write(NOME), nl)).
