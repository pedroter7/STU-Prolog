%Interface com o usuario e runtime

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

dados_paciente(Paciente, Idade) :-
    write("Nome do paciente (entre aspas simples): "),
    read(Paciente),
    write("Idade do paciente: "),
    read(Idade),
    write("O sistema agora ira coletar dados sobre o quadro clinico do paciente."),
    nl.

comecar :-
    apresentacao,
    nl,
    dados_paciente(Paciente, Idade).
