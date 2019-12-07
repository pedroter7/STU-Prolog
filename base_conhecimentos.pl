/*
 * PERGUNTAS
*/

pergunta(limpeza) :-
    write('Sera necessaria uma troca de curativo? (y/n) '),
    read(Resposta_limpeza),
    (Resposta_limpeza==y -> procedimento(limpeza)).

pergunta(desbridamento) :-
    write('A ulcera apresenta necrose ou esfacelos? (y/n) '),
    read(Resposta_desbridamento),
    (Resposta_desbridamento==y -> procedimento(desbridamento)).

/*
 * PROCEDIMENTOS
*/

procedimento(limpeza) :-
    write('Na troca de curativo eh necessario realizar limpeza da ulcera;'),
    nl,
    write('Limpe a ferida com SF 0,9%.'),
    nl.

procedimento(desbridamento) :-
    write('A ulcera apresenta necrose? (y/n) '),
    read(Resposta_necrose),
    ( (Resposta_necrose==y -> tratamento(necrose));
    (Resposta_necrose==n -> write('A ulcera apresenta esfacelos? (y/n) '),
                            read(Resposta_esfacelos),
                            (Resposta_esfacelos==y -> tratamento(esfacelos)))).

/*
 * TRATAMENTOS ESPECIFICOS
*/

tratamento(necrose) :-
    write('Para uma ulcera com necrose eh necessario realizar desbridamento. Os possiveis procedimentos sao:'),
    nl,
    write('Desbridamento autolitico com hidrogel ou hidrocoloide;'),
    nl,
    write('Desbridamento autolitico com hidrogel e filme transparente;'),
    nl,
    write('Desbridamento autolitico com hidrogel e gaze nao aderente;'),
    nl,
    write('Desbridamento autolitico com hidrogel e hidrocoloide combinado com desbridamento instrumental;'),
    nl,
    write('Desbridamento autolitico com hidrogel e filme transparente combinado com desbridamento instrumental;'),
    nl,
    write('Desbridamento autolitico com hidrogel e gaze nao aderente combinado com desbridamento instrumental;'),
    nl,
    write('Desbridamento enzimatico com papaina diluida 10%;'),
    nl,
    write('Desbridamento enzimatico com papaina gel 1%;'),
    nl,
    write('Desbridamento instrumental.'),
    nl.

tratamento(esfacelos) :-
    write('Para uma ulcera com esfacelos eh necessario realizar desbridamento. Os possiveis procedimentos sao:'),
    nl,
    write('Desbridamento autolitico com hidrogel e hidrocoloide;'),
    nl,
    write('Desbridamento autolitico com hidrogel e filme transparente;'),
    nl,
    write('Desbridamento autolitico com hidrogel e gaze nao aderente;'),
    nl,
    write('Desbridamento enzimatico com papaina gel 1%;'),
    nl,
    write('Desbridamento enzimatico com papaina diluida 10%;'),
    nl.


/*
 * RUNTIME
*/

apresentacao :-
    nl,
    write('************************************************************'),
    nl,
    write('Sistema especialista para auxiliar no tratamento de Ulceras'),
    nl,
    write('************************************************************'),
    nl,
    write("Este sistema tem como objetivo auxiliar enfermeiros nao especializados no tratamento de ulceras venosas."),
    nl,
    write("O programa recolhera alguns dados e indicara os possiveis procedimentos a serem tomados."),
    nl.


    coletar_dados :-
        pergunta(limpeza);
        pergunta(desbridamento).


dados_paciente(Paciente, Idade) :-
    write("Nome do paciente (entre aspas simples): "),
    read(Paciente),
    write("Idade do paciente: "),
    read(Idade),
    write("O sistema agora ira coletar dados sobre o quadro clinico do paciente "),
    write(Paciente), write('.'),
    nl.


comecar :-
    apresentacao,
    nl,
    dados_paciente(Paciente, Idade),
    coletar_dados.
