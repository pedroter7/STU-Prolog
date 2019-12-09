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

pergunta(cuidados_pele) :-
    write('A pele ao redor da ulcera esta seca ou escamosa? (y/n) '),
    read(Resposta_pele),
    (Resposta_pele==y -> procedimento(cuidados_pele)).

pergunta(coberturas) :-
    write('A ulcera apresenta exsudacao? (y/n) '),
    read(Resposta_exsudacao),
    (Resposta_exsudacao==y -> procedimento(exsudacao)).

/*
 * PROCEDIMENTOS
*/

procedimento(limpeza) :-
    nl,
    write('Na troca de curativo eh necessario realizar limpeza da ulcera:'),
    nl, nl,
    write('Limpe a ferida com SF 0,9%.'),
    nl, nl.

procedimento(desbridamento) :-
    nl,
    write('A ulcera apresenta necrose? (y/n) '),
    read(Resposta_necrose),
    ( (Resposta_necrose==y -> tratamento(necrose));
    (tratamento(esfacelos))).

procedimento(cuidados_pele) :-
    nl,
    write('Eh necessario aplicar alguns cuidados na pele ao redor da ulcera. Realize um dos procedimentos:'),
    nl, nl,
    write('Aplique AGE sobre a regiao afetada;'),
    nl, nl,
    write('Aplique um creme restaurador de pH da pele.'),
    nl, nl.

procedimento(exsudacao) :-
    nl,
    write('Qual o nivel de exsudacao? (0-baixo, 1-moderado, 2-grande) '),
    read(Resposta_nivel_exsudacao),
    ( (Resposta_nivel_exsudacao==0 -> procedimento(baixa_exsudacao)); (Resposta_nivel_exsudacao==1 -> procedimento(moderada_exsudacao)); (Resposta_nivel_exsudacao==2 -> procedimento(grande_exsudacao)) ).

procedimento(baixa_exsudacao) :-
    nl,
    write('O paciente sente dor na regiao da ulcera? (y/n) '),
    read(Resposta_baixa_dor),
    ( (Resposta_baixa_dor==y -> tratamento(baixa_exsudacao_dor)) ; tratamento(baixa_exsudacao) ).

procedimento(moderada_exsudacao) :-
    nl,
    write('O paciente sente dor na regiao da ulcera? (y/n) '),
    read(Resposta_mod_dor),
    ( (Resposta_mod_dor==y -> tratamento(mod_gde_dor)) ; nl,
    write('A ulcera apresenta sinais de infeccao? (y/n) '),
    read(Resposta_mod_infec),
    ( (Resposta_mod_infec==y -> tratamento(mod_exsudacao_infec)) ; tratamento(mod_exsudacao) )).

procedimento(grande_exsudacao) :-
    nl,
    write('O paciente sente dor na regiao da ulcera? (y/n) '),
    read(Resposta_gde_dor),
    ( (Resposta_gde_dor==y -> tratamento(mod_gde_dor)) ; nl,
    write('A ulcera apresenta sinais de infeccao? (y/n) '),
    read(Resposta_gde_infec),
    ( (Resposta_gde_infec==y -> tratamento(gde_exsudacao_infec)) ; tratamento(gde_exsudacao) )).

/*
 * TRATAMENTOS ESPECIFICOS
*/

tratamento(necrose) :-
    nl,
    write('Para uma ulcera com necrose eh necessario realizar desbridamento. Os possiveis procedimentos sao:'),
    nl, nl,
    write('Desbridamento autolitico com hidrogel ou hidrocoloide;'),
    nl, nl,
    write('Desbridamento autolitico com hidrogel e filme transparente;'),
    nl, nl,
    write('Desbridamento autolitico com hidrogel e gaze nao aderente;'),
    nl, nl,
    write('Desbridamento autolitico com hidrogel e hidrocoloide combinado com desbridamento instrumental;'),
    nl, nl,
    write('Desbridamento autolitico com hidrogel e filme transparente combinado com desbridamento instrumental;'),
    nl, nl,
    write('Desbridamento autolitico com hidrogel e gaze nao aderente combinado com desbridamento instrumental;'),
    nl, nl,
    write('Desbridamento enzimatico com papaina diluida 10%;'),
    nl, nl,
    write('Desbridamento enzimatico com papaina gel 1%;'),
    nl, nl,
    write('Desbridamento instrumental.'),
    nl, nl.

tratamento(esfacelos) :-
    nl,
    write('Para uma ulcera com esfacelos eh necessario realizar desbridamento. Os possiveis procedimentos sao:'),
    nl, nl,
    write('Desbridamento autolitico com hidrogel e hidrocoloide;'),
    nl, nl,
    write('Desbridamento autolitico com hidrogel e filme transparente;'),
    nl, nl,
    write('Desbridamento autolitico com hidrogel e gaze nao aderente;'),
    nl, nl,
    write('Desbridamento enzimatico com papaina gel 1%;'),
    nl, nl,
    write('Desbridamento enzimatico com papaina diluida 10%;'),
    nl, nl.

tratamento(baixa_exsudacao) :-
    nl,
    write('Para uma ulcera com baixa exsudacao, sem infeccao nem dor:'),
    nl, nl,
    write('Aplique hidrocoloide'),
    nl, nl.

tratamento(baixa_exsudacao_dor) :-
    nl,
    write('Para uma ulcera com baixa exsudacao, sem infeccao mas com dor:'),
    nl, nl,
    write('Aplique hidrocoloide'),
    nl, nl.

tratamento(mod_gde_dor) :-
    nl,
    write('Para uma ulcera dolorosa de moderada a grande exsudacao: '),
    nl, nl,
    write('Utilize espuma de poliuretano.'),
    nl, nl.

tratamento(mod_exsudacao) :-
    nl,
    write('Para uma ulcera com moderada exsudacao e sem infeccao, realize um dos procedimentos:'),
    nl, nl,
    write('Aplique alginato de calcio;'),
    nl, nl,
    write('Aplique hidrofibra.'),
    nl, nl.

tratamento(mod_exsudacao_infec) :-
    nl,
    write('Para uma ulcera com moderada exsudacao e presenca de infeccao, realize um dos procedimentos:'),
    nl, nl,
    write('Aplique alginato de calcio com prata;'),
    nl, nl,
    write('Aplique hidrofibra com prata.'),
    nl, nl.

tratamento(gde_exsudacao) :-
    nl,
    write('Para uma ulcera com grande exsudacao e sem infeccao, realize um dos procedimentos:'),
    nl, nl,
    write('Use espuma de poliuretano'),
    nl, nl,
    write('Use espuma hidrocelular'),
    nl, nl.

tratamento(gde_exsudacao_infec) :-
    nl,
    write('Para uma ulcera com grande exsudacao e presenca de infeccao:'),
    nl, nl,
    write('Use espuma de poliuretano com prata.'),
    nl, nl.    

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
        nl,
        pergunta(limpeza),
        pergunta(desbridamento),
        pergunta(cuidados_pele),
        pergunta(coberturas).


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
