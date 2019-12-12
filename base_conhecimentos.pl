:- style_check(-singleton). % remove singleton variable warning

/*
 * FATOS
*/

autor('Pedro Tersetti Freidinger', 'Universidade Federal do ABC (UFABC)').
autor('Gabriela Ayumi Ueda', 'Universidade Federal do ABC (UFABC)').

info(necrose, 'Wikipedia: https://pt.wikipedia.org/wiki/Necrose').
info(necrose, 'UFMG: http://depto.icb.ufmg.br/dpat/old/necrose.htm').
info(necrose, 'ABCMed: https://www.abc.med.br/p/553812/necrose+definicao+causas+tipos+evolucao.htm').
info(itb, 'Revista SOCESP: http://socesp.org.br/revista/assets/upload/revista/7772841791526393452pdfpt%C3%8DNDICE%20TORNOZELO-BRAQUIAL%20FALSO%20NEGATIVO_SUPLEMENTO%20REVISTA%20SOCESP%20V27%20N1.pdf').
info(itb, 'Arquivos Brasileiros de Cardiologia: http://www.scielo.br/scielo.php?script=sci_arttext&pid=S0066-782X2012001100012').
info(ulceras, 'Wikipedia: https://pt.wikipedia.org/wiki/%C3%9Alcera#:~:targetText=%C3%9Alcera%20%C3%A9%20o%20nome%20gen%C3%A9rico,ou%20mucoso%2C%20popularmente%20denominadas%20feridas.').
info(ulceras, 'Portal PEBMED: https://pebmed.com.br/ulcera-venosa-abordagem-do-enfermeiro-no-cuidado-ao-paciente/#:~:targetText=A%20insufici%C3%AAncia%20venosa%20cr%C3%B4nica%20(IVC,%C3%A0%20obstru%C3%A7%C3%A3o%20do%20fluxo%20venoso.').
info(ulceras, 'UFMG: https://www.nescon.medicina.ufmg.br/biblioteca/imagem/ulceras-venosas-revisao-literatura.pdf').
info(esfacelos, 'Systagenix: http://www.systagenix.com.br/news/esfacelo-708').
info(esfacelos, 'UFTM: http://www2.ebserh.gov.br/documents/147715/395574/aula_mini_curso2_(Aula1).pdf').
info(esfacelos, 'SMS-SP: https://www.unasus.unifesp.br/biblioteca_virtual/esf/1/casos_complexos/Ilha_das_Flores/Feridas_MT1_v1.pdf').
info(exsudacao, 'Wikipedia: https://pt.wikipedia.org/wiki/Exsuda%C3%A7%C3%A3o').
info(exsudacao, 'VUELO Pharma: https://www.vuelopharma.com/exsudacao-oquee/#:~:targetText=Exsuda%C3%A7%C3%A3o%20%C3%A9%20o%20termo%20usado,processo%20de%20cicatriza%C3%A7%C3%A3o%20da%20pele.').
info(exsudacao, 'SUS - Campinas: http://www.saude.campinas.sp.gov.br/enfermagem/2016/Manual_de_Curativos_2016.pdf').
info(exsudacao, 'SMS-SP: http://www.pmf.sc.gov.br/arquivos/arquivos/pdf/26_10_2009_10.46.46.f3edcb3b301c541c121c7786c676685d.pdf').
info(infeccoes, 'SMS-SP: http://www.saude.sp.gov.br/resources/cve-centro-de-vigilancia-epidemiologica/areas-de-vigilancia/infeccao-hospitalar/doc/iras12_pub_geral.pdf').
info(infeccoes, 'Revista Brasileira de Enfermagem: http://www.scielo.br/scielo.php?script=sci_arttext&pid=S0034-71671974000400462').

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

pergunta(material_ajuda) :-
    nl,
    write('************************************************************'),
    nl,
    write('************************AJUDA*******************************'),
    nl,nl,
    write('Entre com uma opcao:'),
    nl,
    write('0-Sobre ulceras;'),
    nl,
    write('1-Sobre exsudacao;'),
    nl,
    write('2-Sobre necrose;'),
    nl,
    write('3-Sobre esfacelos;'),
    nl,
    write('4-Sobre infeccoes;'),
    nl,
    write('5-Sobre ITB;'),
    nl,
    write('6-Continuar execucao.'),
    nl,
    read(Resposta_ajuda),
    ( (Resposta_ajuda==0 -> info_ulceras);
    (Resposta_ajuda==1 -> info_exsudacao);
    (Resposta_ajuda==2 -> info_necrose);
    (Resposta_ajuda==3 -> info_esfacelos);
    (Resposta_ajuda==4 -> info_infeccoes);
    (Resposta_ajuda==5 -> info_ITB);
    (Resposta_ajuda==6 -> write('')) ; pergunta(material_ajuda) ).

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
 * SEÇÃO DE INFO
*/

info_necrose :-
    nl,
    write('Voce pode encontrar informacoes sobre necroses nos seguintes lugares:'),
    nl,
    forall(info(necrose,X), (write(X), nl)),
    pergunta(material_ajuda).

info_ulceras :-
    nl,
    write('Voce pode encontrar informacoes sobre ulceras nos seguintes lugares:'),
    nl,
    forall(info(ulceras,X), (write(X), nl)),
    pergunta(material_ajuda).

info_ITB :-
    nl,
    write('Voce pode encontrar informacoes sobre ITB (Indice Tornozelo-Braquial) nos seguintes lugares:'),
    nl,
    forall(info(itb,X), (write(X), nl)),
    pergunta(material_ajuda).

info_esfacelos :-
    nl,
    write('Voce pode encontrar informacoes sobre esfacelos nos seguintes lugares:'),
    nl,
    forall(info(esfacelos,X), (write(X), nl)),
    pergunta(material_ajuda).

info_exsudacao :-
    nl,
    write('Voce pode encontrar informacoes sobre exsudacao nos seguintes lugares:'),
    nl,
    forall(info(exsudacao, X), (write(X), nl)),
    pergunta(material_ajuda).

info_infeccoes :-
    nl,
    write('Voce pode encontrar informacoes sobre infeccoes nos seguintes lugares:'),
    nl,
    forall(info(infeccoes,X), (write(X), nl)),
    pergunta(material_ajuda).


/*
 * RUNTIME
*/

apresentacao :-
    nl,
    write('************************************************************'),
    nl,
    write('**************************STU*******************************'),
    nl,
    write('Sistema especialista para auxiliar no tratamento de Ulceras'),
    nl,
    write('************************************************************'),
    nl,
    write('Entre com uma opcao:'),
    nl,
    write('0/Enter-Comecar;'),
    nl,
    write('1-Sobre o programa;'),
    nl,
    write('2-Material de ajuda;'),
    nl,
    read(Resposta_apresentacao),
    ( (Resposta_apresentacao==0 -> write(''));
    (Resposta_apresentacao==1 -> sobre_programa);
    (Resposta_apresentacao==2 -> pergunta(material_ajuda)); write('')),
    nl.

sobre_programa :-
    nl,
    write('***DESCRICAO***'),
    nl,
    write('STU (Sistema de Tratamento de Ulceras) eh um sistema especialista baseado em logica desenvolvido para auxiliar enfermeiros nao especializados no tratamento de ulceras venosas.'),
    nl,
    write('Este sistema especialista no auxílio do tratamento de úlceras foi escrito a partir do trabalho realizado em 2013 por Danielle Sellmer, Carina Maris Gaspar Carvalho, Deborah Ribeiro Carvalho e Andreia Malucelli. O trabalho e a descrição do sistema original (PROTUV) podem ser encontrados em http://www.scielo.br/scielo.php?script=sci_arttext&pid=S1983-14472013000200020.'),
    nl,
    write('***FUNCIONAMENTO***'),
    nl,
    write('O sistema realiza a coleta de dados sobre o paciente e sobre o quadro clinico e indica as decisoes que podem ser tomadas para tratar do mesmo.'),
    nl,
    write('***INFO***'),
    nl,
    write('Autores:'),
    nl,
    forall(autor(X,Y),
          (write('Autor: '), write(X), write(', '), write(Y), nl) ),
    write('Repositorio (GitHub): https://github.com/PedroTersetti/STU-Prolog'),
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
    write('Deseja realizar uma nova coleta de dados (ou repetir a atual)? (y/n) '),
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
