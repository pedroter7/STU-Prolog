/*
 * PERGUNTAS
*/

pergunta(limpeza) :-
    write('E necessario troca de curativo? (y/n) '),
    read(Resposta),
    (Resposta==y -> procedimento(limpeza)).

/*
 * PROCEDIMENTOS
*/

procedimento(limpeza) :-
    write('Limpe a ferida com SF 0,9%.'),
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
        pergunta(limpeza).


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
