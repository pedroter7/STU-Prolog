:- style_check(-singleton). % remove singleton variable warning

/*
 * PERGUNTAS
*/

pergunta(limpeza) :-
    write('Sera necessaria uma troca de curativo? (y/n) '),
    read(Resposta_limpeza),
    ((Resposta_limpeza==y -> procedimento(limpeza)) ; write('')).

pergunta(desbridamento) :-
    write('A ulcera apresenta necrose ou esfacelos? (y/n) '),
    read(Resposta_desbridamento),
    ((Resposta_desbridamento==y -> procedimento(desbridamento)) ; write('')).

pergunta(cuidados_pele) :-
    write('A pele ao redor da ulcera esta seca ou escamosa? (y/n) '),
    read(Resposta_pele),
    ((Resposta_pele==y -> procedimento(cuidados_pele)) ; write('')).

pergunta(coberturas) :-
    write('A ulcera apresenta exsudacao? (y/n) '),
    read(Resposta_exsudacao),
    ((Resposta_exsudacao==y -> procedimento(exsudacao)) ; write('')).

pergunta(alta, Paciente, Idade, Sexo) :-
    write('A ulcera esta epitelizada? (y/n) '),
    read(Resposta_alta),
    ( (Resposta_alta==y -> procedimento(alta, Paciente, Idade, Sexo)) ;
    write('O paciente so deve receber alta quando a ulcera estiver epitelizada.')).

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

procedimento(alta, Paciente, Idade, Sexo) :-
    nl,
    write('O seguinte paciente pode receber alta:'),
    nl, nl,
    write('Nome: '), write(Paciente), nl,
    write('Idade: '), write(Idade), nl,
    write('Sexo: '), write(Sexo).

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
    (nl,
    write('Insira o nivel de ITB do paciente: '),
    read(Resposta_ITB0),
    (Resposta_ITB0>=0.8 -> tratamento(baixa_exsudacao_itb))) ;
    (nl,
    write('O nivel de ITB esta ok.'),
    nl,
    write('Para uma ulcera com baixa exsudacao, sem infeccao nem dor:'),
    nl, nl,
    write('Aplique hidrocoloide'),
    nl, nl).

tratamento(baixa_exsudacao_dor) :-
    nl,
    write('Para uma ulcera com baixa exsudacao, sem infeccao mas com dor:'),
    nl, nl,
    write('Aplique hidrocoloide'),
    nl, nl.

tratamento(baixa_exsudacao_itb) :-
    nl,
    write('Para uma ulcera com itb maior ou igual a 0,8, com baixa exsudacao e sem infeccao, realize um dos procedimentos:'),
    nl, nl,
    write('evalevar o MMII por meia hora e usar hidrocoloide e bota de unna;'),
    nl, nl,
    write('Elevar MMII por meia hora e usar hidrocoloide e bandagem de compressao graduada elastica.'),
    nl, nl.

tratamento(mod_gde_dor) :-
    nl,
    write('Para uma ulcera dolorosa de moderada a grande exsudacao: '),
    nl, nl,
    write('Utilize espuma de poliuretano.'),
    nl, nl.

tratamento(mod_exsudacao) :-
    (nl,
    write('Insira o nivel de ITB do paciente: '),
    read(Resposta_ITB1),
    (Resposta_ITB1>=0.8 -> tratamento(moderada_exsudacao_itb))) ;
    (nl,
    write('O nivel de ITB esta ok.'),
    nl,
    write('Para uma ulcera com moderada exsudacao e sem infeccao, realize um dos procedimentos:'),
    nl, nl,
    write('Aplique alginato de calcio;'),
    nl, nl,
    write('Aplique hidrofibra.'),
    nl, nl).

tratamento(mod_exsudacao_infec) :-
    nl,
    write('Para uma ulcera com moderada exsudacao e presenca de infeccao, realize um dos procedimentos:'),
    nl, nl,
    write('Aplique alginato de calcio com prata;'),
    nl, nl,
    write('Aplique hidrofibra com prata.'),
    nl, nl.

tratamento(moderada_exsudacao_itb) :-
    nl,
    write('Para uma ulcera com itb maior ou igual a 0,8, com moderada exsudacao e sem infeccao, realize um dos procedimentos:'),
    nl, nl,
    write('Elevar MMII por meia hora e usar alginato de calcio ou hidrofibra e bota de unna;'),
    nl, nl,
    write('Elevar MMII por meia hora e usar alginato de calcio ou fibra e bandagem de compressao graduada elastica.'),
    nl, nl.

tratamento(gde_exsudacao) :-
    (nl,
    write('Insira o nivel de ITB do paciente: '),
    read(Resposta_ITB2),
    (Resposta_ITB2>=0.8 -> tratamento(grande_exsudacao_itb)) ) ;
    (nl,
    write('O nivel de ITB esta ok.'),
    nl,
    write('Para uma ulcera com grande exsudacao e sem infeccao, realize um dos procedimentos:'),
    nl, nl,
    write('Use espuma de poliuretano'),
    nl, nl,
    write('Use espuma hidrocelular'),
    nl, nl).

tratamento(gde_exsudacao_infec) :-
    nl,
    write('Para uma ulcera com grande exsudacao e presenca de infeccao:'),
    nl, nl,
    write('Use espuma de poliuretano com prata.'),
    nl, nl.

tratamento(grande_exsudacao_itb) :-
    nl,
    write('Para uma ulcera com itb maior ou igual a 0,8, com grande exsudacao e sem infeccao, realize um dos procedimentos:'),
    nl, nl,
    write('Elevar o MMII por meia hora e usar esuma de poliuretano ou espuma hidrocelular e bota de unna;'),
    nl, nl,
    write('Elevar MMII por meia hora e usar espuma de poliuretano ou espuma de hidrocelular e bandagem de compressao graduada.'),
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

recomecar :-
    nl, nl,
    write('Digite uma opcao: 0-Novo paciente ; 1-Reiniciar a consulta com o mesmo paciente ?  '),
    read(Resposta_recomecar),
    ( (Resposta_recomecar==0 -> (dados_paciente(Paciente, Idade, Sexo), coletar_dados(Paciente, Idade, Sexo))) ; (Resposta_recomecar==1 -> coletar_dados(Paciente, Idade, Sexo)) ; recomecar ).

coletar_dados(Paciente, Idade, Sexo) :-
    nl,
    (pergunta(limpeza),
    pergunta(desbridamento),
    pergunta(cuidados_pele),
    pergunta(coberturas),
    pergunta(alta, Paciente, Idade, Sexo)),
    nl, nl,
    write('Deseja realizar (ou repetir) uma nova coleta de dados? (y/n) '),
    read(Resposta_comecar),
    ( (Resposta_comecar==y -> recomecar) ; write('Encerrando o atendimento. Obrigado por utilizar o programa!')).


dados_paciente(Paciente, Idade, Sexo) :-
    write("Nome do paciente (entre aspas simples): "),
    read(Paciente),
    write("Idade do paciente: "),
    read(Idade),
    write("Sexo do paciente ('M'/'F'): "),
    read(Sexo),
    write("O sistema agora ira coletar dados sobre o quadro clinico do paciente "),
    write(Paciente), write('.'),
    nl.


comecar :-
    apresentacao,
    nl,
    dados_paciente(Paciente, Idade, Sexo),
    coletar_dados(Paciente, Idade, Sexo).
