CREATE DATABASE DBCATBOOK;

USE DBCATBOOK;

CREATE TABLE USUARIO (
    IdUser INT PRIMARY KEY NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Sobrenome VARCHAR(50) NOT NULL,
    DtNasc DATE NOT NULL,
    CPF VARCHAR(20) NOT NULL UNIQUE,
    Email VARCHAR(50) NOT NULL,
    Login VARCHAR(20) NOT NULL,
    Senha VARCHAR(20) NOT NULL
);

ALTER TABLE USUARIO ADD (Sexo VARCHAR(1) CHECK(Sexo IN ('F','M')));

SELECT * FROM USUARIO;

INSERT INTO USUARIO(IdUser, Nome, Sobrenome, DtNasc, CPF, Email, Login, Senha) VALUES (1, 'Luisa', 'Andrade',to_date('17/02/2000','dd/mm/yyyy'),12345678900, 'luisa@gmail.com', 'luu_and', '01020304','F');

DELETE FROM USUARIO WHERE IdUser = '1';

DROP TABLE USUARIO;

CREATE TABLE ENDERECO (
    CEP INT PRIMARY KEY NOT NULL,
    Rua VARCHAR(50) NOT NULL,
    Num INT NOT NULL,
    Bairro VARCHAR(50) NOT NULL,
    Complemento VARCHAR(100),
    Cidade VARCHAR(50) NOT NULL,
    Estado VARCHAR(50) NOT NULL,
    Pais VARCHAR(50) NOT NULL,
    IdUser INT,
    FOREIGN KEY (IdUser)
        REFERENCES USUARIO (IdUser)
);

SELECT * FROM ENDERECO;

INSERT INTO ENDERECO(CEP, Rua, Num, Bairro, Complemento, Cidade, Estado, Pais, IdUser) VALUES ('01525000', 'Rua Vergueiro', '235', 'Bairro da Liberdade', '?', 'São Paulo', 'São Paulo', 'Brasil', 1);

DELETE FROM ENDERECO WHERE IdUser = '1';

DROP TABLE ENDERECO;

CREATE TABLE LOGIN (
    IdLog INT PRIMARY KEY NOT NULL,
    Login VARCHAR(20) NOT NULL,
    Senha VARCHAR(20) NOT NULL,
    IdUser INT,
    FOREIGN KEY (IdUser)
        REFERENCES USUARIO (IdUser)
);

INSERT INTO LOGIN(IdLog, Login, Senha, IdUser) VALUES (1, 'luu_and', '01020304', 1);

SELECT * FROM LOGIN WHERE Login = ? AND Senha = ?;

SELECT Login, Senha FROM LOGIN;

DROP TABLE LOGIN; 

CREATE TABLE CARTAO (
    IdCart INT PRIMARY KEY NOT NULL,
    Numero INT NOT NULL,
    Nome VARCHAR(70) NOT NULL,
    DataValidade DATE,
    CVV INT NOT NULL,
    IdUser INT,
    FOREIGN KEY (IdUser)
        REFERENCES USUARIO (IdUser)
);

SELECT * FROM CARTAO;

DROP TABLE CARTAO;

CREATE TABLE GENERO (
    IdGen INT PRIMARY KEY NOT NULL,
    Descricao VARCHAR(20)
);

INSERT INTO GENERO(IdGen, Descricao) VALUES (1, 'Romance');
INSERT INTO GENERO(IdGen, Descricao) VALUES (2, 'Ficção Científica');
INSERT INTO GENERO(IdGen, Descricao) VALUES (3, 'Suspense');
INSERT INTO GENERO(IdGen, Descricao) VALUES (4, 'Erótico');
INSERT INTO GENERO(IdGen, Descricao) VALUES (5, 'Ação e Aventra');

SELECT * FROM GENERO; 

DROP TABLE GENERO;

 CREATE TABLE BOOKS (
    IdBook INT PRIMARY KEY NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    Autora VARCHAR(50) NOT NULL,
    IdGen INT,
    FOREIGN KEY (IdGen)
        REFERENCES GENERO (IdGen),
    DataDeP VARCHAR(50) NOT NULL,
    Sinopse VARCHAR(5000) NOT NULL,
    Preco DOUBLE(7,2),
    Editora VARCHAR(100),
    img VARCHAR(200)
);

ALTER TABLE BOOKS
CHANGE Nome Nome varchar(500); 

-- NÃO É NECESSARIO ESSA TABELA, É OPICIONAL --
CREATE TABLE EDITORA (
    IdEdt INT PRIMARY KEY NOT NULL,
    Editora VARCHAR(100),
    IdBook INT,
    FOREIGN KEY (IdBook)
        REFERENCES BOOKS (IdBook)
);

INSERT INTO EDITORA() VALUES ();
INSERT INTO EDITORA() VALUES ();
INSERT INTO EDITORA() VALUES ();
INSERT INTO EDITORA() VALUES ();
INSERT INTO EDITORA() VALUES ();

SELECT * FROM EDITORA;

DROP TABLE EDITORA;

-- ROMANCE
INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (1, 'ASSIM QUE ACABA', 'Collen Hoover', 1, '18 de Janeiro de 2018',
'Em É assim que acaba, Colleen Hoover nos apresenta Lily, uma jovem que se mudou de uma cidadezinha do Maine para Boston, se formou em marketing e abriu a própria floricultura. 
E é em um dos terraços de Boston que ela conhece Ryle, um neurocirurgião confiante, teimoso e talvez até um pouco arrogante, com uma grande aversão a relacionamentos, mas que se sente muito atraído por ela.', 39.89);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (2, 'A cinco passos de você', 'Rachael Lippincott', 1, '25 de Fevereiro de 2019', 
'Stella Grant gosta de estar no controle. Ela parece ser uma adolescente típica, mas em sua rotina há listas de tarefas e inúmeros remédios que ela deve tomar para controlar a fibrose cística, 
uma doença crônica que impede que seus pulmões funcionem como deveriam. Suas prioridades são manter seus pais felizes e conseguir um transplante – e uma coisa não existe sem a outra.', 33.89);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (3, 'Amor & Gelato', 'Jenna Evans Welch', 1, '21 de Julho de 2017', 
'Depois da morte da mãe, Lina fica com a missão de realizar um último pedido: ir até a Itália para conhecer o pai. Do dia para a noite, ela se vê na famosa paisagem da Toscana, 
morando em uma casa localizada no mesmo terreno de um cemitério memorial de soldados americanos da Segunda Guerra Mundial, com um homem que nunca tinha ouvido falar.', 36.36);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (4, 'Textos cruéis demais para serem lidos rapidamente', 'Igor Pires', 1, '10 de Novembro de 2017', 
'Indo contra a tendência dos textos curtos e superficiais que são postados nas redes sociais, o coletivo literário Textos cruéis demais para serem lidos rapidamente (TCD) passou a produzir e compartilhar um conteúdo extenso, profundo e extremamente poético em suas páginas no Facebook e no Instagram. 
Com seus escritos e ilustrações, eles acabaram atingindo um público muito maior do que o esperado, nos mostrando como, apesar da crescente agilidade que nossa comunicação exige, ainda precisamos de tempo para digerir e entender nossas complexas relações humanas.', 25.00);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (5, 'Teto Para Dois', 'Beth O’Leary', 1, '9 de Setembro de 2019', 
'Eles dividem um apartamento com uma cama só. Ele dorme de dia, ela, à noite. Os dois nunca se encontraram, mas estão prestes a descobrir que, para se sentir em casa, às vezes é preciso jogar as regras pela janela.', 44.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (6, 'Tarde demais', 'Collen Hoover', 1, '4 de Junho de 2018', 
'Para proteger o irmão, Sloan foi ao inferno e fez dele seu lar. Ela está presa em um relacionamento com Asa Jackson, um perigoso traficante, e quanto mais os dias passam, mais parece impossível enxergar uma saída. 
Imersa em uma casa incontrolável que mais parece um quartel general, rodeada por homens que ela teme e sem um minuto de silêncio, também parece impossível encontrar qualquer motivo para se sentir bem. Até Carter surgir em sua vida.', 33.25);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (7, 'Todas as suas (im)perfeições', 'Collen Hoover', 1, '24 de Julho de 2019', 
'Todas as suas imperfeições narra a história de Quinn e Graham. Eles se conhecem no pior dia de suas vidas; ela chega mais cedo de uma viagem para surpreender o noivo, ele testemunha a traição da namorada. 
E é assim que ambos acabam no corredor de um prédio, trocando confidências, biscoitos da sorte e palavras de conforto.', 27.88);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (8, 'Me Chame Pelo Seu Nome', 'André Aciman', 1, '5 de Janeiro de 2018', 
'A casa onde Elio passa os verões é um verdadeiro paraíso na costa italiana, parada certa de amigos, vizinhos, artistas e intelectuais de todos os lugares. Filho de um importante professor universitário, o jovem está bastante acostumado à rotina de, 
a cada verão, hospedar por seis semanas na villa da família um novo escritor que, em troca da boa acolhida, ajuda seu pai com correspondências e papeladas. Uma cobiçada residência literária que já atraiu muitos nomes, mas nenhum deles como Oliver.', 28.89);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (9, 'Uma Casa No Fundo De Um Lago', 'Josh Malerman', 1, '25 de Julho de 2018', 
'James e Amelia têm dezessete anos. Em comum, além da idade, têm o fato de estarem um a fim do outro e de serem tomados pelo nervosismo quando James chama Amelia para sair. 
Mas tudo parece perfeito para um primeiro encontro: um passeio de canoa pelos lagos, levando um cooler cheio de sanduíches e cervejas.', 19.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (10, 'A pequena livraria dos sonhos: Onde os finais são sempre felizes', 'Jenny Colgan', 1, '29 de Abril de 2019', 
'Nina Redmond é uma bibliotecária que passa os dias unindo alegremente livros e pessoas – ela sempre sabe as histórias ideais para cada leitor. Mas, quando a biblioteca pública em que trabalha fecha as portas, Nina não tem ideia do que fazer.
Então um anúncio de classificados chama sua atenção: uma van que ela pode transformar em uma livraria volante, para dirigir pela Escócia e, com o poder da literatura, transformar vidas em cada lugar por onde passar.', 28.88);

-- FICÇÃO CIENTÍFICA
INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (11, 'Fogo & Sangue – Volume 1', 'George R. R. Martin', 2, '20 de Novembro de 2018', 
'Séculos antes dos eventos de A guerra dos tronos, a Casa Targaryen – única família de senhores dos dragões a sobreviver à Destruição de Valíria – tomou residência em Pedra do Dragão. 
A história de Fogo e sangue começa com o lendário Aegon, o Conquistador, criador do Trono de Ferro, e segue narrando as gerações de Targaryen que lutaram para manter o assento, até a guerra civil que quase destruiu sua dinastia.', 72.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (12, 'A Guerra dos Tronos : As Crônicas de Gelo e Fogo, volume 1', 'George R. R. Martin', 2, '25 de Março de 2019', 
'A guerra dos tronos é o primeiro livro da série best-seller internacional As Crônicas de Gelo e Fogo, que deu origem à adaptação de sucesso da HBO, Game of Thrones. O verão pode durar décadas. O inverno, toda uma vida. 
E a guerra dos tronos começou. Como Guardião do Norte, lorde Eddard Stark não fica feliz quando o rei Robert o proclama a nova Mão do Rei. Sua honra o obriga a aceitar o cargo e deixar seu posto em Winterfell para rumar para a corte, 
onde os homens fazem o que lhes convém, não o que devem... e onde um inimigo morto é algo a ser admirado.', 66.99);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (13, 'A fúria dos reis: As Crônicas de Gelo e Fogo, volume 2', 'George R. R. Martin', 2, '20 de Setembro de 2019', 
'Em A fúria dos reis, seis facções disputam o controle de uma terra dividida e o direito de ocupar o Trono de Ferro de Westeros – e estão dispostos a encarar tempestades, levantes e guerras para isso.
Nesta história, irmão trama contra irmão e os mortos se levantam para caminhar pela noite. Aqui, uma princesa se disfarça de menino órfão, um cavaleiro se prepara para encarar uma pérfida feiticeira e bárbaros descem das Montanhas da Lua para saquear os campos.', 70.29);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (14, 'A tormenta de espadas: As Crônicas de Gelo e Fogo, volume 3', 'George R. R. Martin', 2, '20 de Setembro de 2019', 
'O futuro de Westeros está em jogo, e ninguém descansará até que os Sete Reinos tenham explodido em uma verdadeira tormenta de espadas. Dos cinco pretendentes ao trono, um está morto e outro caiu em desgraça, e ainda assim a guerra continua em toda sua fúria, enquanto alianças são feitas e desfeitas. 
Joffrey, da Casa Lannister, ocupa o Trono de Ferro, como o instável governante dos Sete Reinos, ao passo que seu rival mais amargo, lorde Stannis, jaz derrotado e enfeitiçado pelas promessas da Mulher Vermelha.', 67.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (15, 'O Silmarillion', 'J.R.R. Tolkien', 2, '19 de Março de 2019', 
'O Silmarillion é o relato dos Dias Antigos da Primeira Era do mundo criado por J.R.R. Tolkien. É a história longínqua para a qual os personagens de O Senhor dos Anéis e O Hobbit olham para trás, e em cujos eventos alguns deles, como Elrond e Galadriel, tomaram parte. ', 45.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (16, 'Box Trilogia O Senhor dos Anéis', 'J.R.R. Tolkien', 2, '25 de Novembro de 2019', 
'Apesar de ter sido publicado em três volumes – a sociedade do anel, as duas torres e o retorno do rei – desde os anos 1950, o senhor dos anéis não é exatamente uma trilogia, mas um único grande romance que só pode ser compreendido em seu conjunto, segundo a concepção de seu autor, j.r.r. Tolkien. 
Com design cuidadosamente pensado para refletir a unidade da obra e os desenhos originais feitos por tolkien para as capas de cada volume, este box reúne os três livros da saga do anel e oferece aos leitores uma nova oportunidade de mergulhar no notável mundo da terra-média.', 129.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (17, 'O Hobbit', 'J.R.R. Tolkien', 2, '15 de Julho de 2019', 
'Bilbo Bolseiro era um dos mais respeitáveis hobbits de todo o Condado até que, um dia, o mago Gandalf bate à sua porta. A partir de então, toda sua vida pacata e campestre soprando anéis de fumaça com seu belo cachimbo começa a mudar. 
Ele é convocado a participar de uma aventura por ninguém menos do que Thorin Escudo-de-Carvalho, um príncipe do poderoso povo dos Anãos.', 33.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (18, 'Carmilla - A vampira de Karnstein', 'Le Fanu J. Sheridan', 2, '13 de Setembro de 2021', 
'Carmilla é uma obra precursora da temática de vampiros, considerada por muitos críticos como a melhor do século XIX, pela maneira como trabalha o suspense e o erotismo. Foi a partir dela que Drácula, de Bram Stoker, recebeu suas principais características.', 19.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (19,'A Queda de Númenor: e outros contos da Segunda Era da Terra-média', 'J.R.R. Tolkien', 2, '10 de Novembro de 2021', 
'Uma visão ainda maior da Segunda Era seria revelada em publicações subsequentes, primeiro em Contos Inacabados de Númenor e da Terra-média, depois expandida nos impressionantes 12 livros de A História da Terra-média (recém-lançado em português com O Livro dos Contos Perdidos 1 e 2), 
nos quais Christopher Tolkien apresentou e discutiu a riqueza de outros escritos inéditos de seu pai, muitos em forma de rascunho.', 69.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (20, 'O príncipe cruel (Vol. 1 O Povo do Ar)', 'Holly Black', 2, '10 de Setembro de 2018', 
'Jude tinha apenas sete anos quando seus pais foram brutalmente assasinados e ela e as irmãs levadas para viver no traiçoeiro Reino das Fadas. Dez anos depois, tudo o que Jude quer é se encaixar, mesmo sendo uma garota mortal. 
Mas todos os feéricos parecem desprezar os humanos... Especialmente o príncipe Cardan, o mais jovem e mais perverso dos filhos do Grande Rei de Elfhame.', 41.88);

-- SUSPENSE
INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (21, 'Verity', ' Colleen Hoover', 3, '9 de Março de 2020', 
'Verity Crawford é a autora best-seller por trás de uma série de sucesso. Ela está no auge de sua carreira, aclamada pela crítica e pelo público, no entanto, um súbito e terrível acidente acaba interrompendo suas atividades, deixando-a sem condições de concluir a história... 
E é nessa complexa circunstância que surge Lowen Ashleigh, uma escritora à beira da falência convidada a escrever, sob um pseudônimo, os três livros restantes da já consolidada série.', 35.81);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (22, 'E não sobrou nenhum', 'Agatha Christie', 3, '1 de Junho de 2014', 
'Uma ilha misteriosa, um poema infantil, dez soldadinhos de porcelana e muito suspense são os ingredientes com que Agatha Christie constrói seu romance mais importante. 
Na ilha do Soldado, antiga propriedade de um milionário norte-americano, dez pessoas sem nenhuma ligação aparente são confrontadas por uma voz misteriosa com fatos marcantes de seus passados.', 30.69);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (23, 'A paciente silenciosa', 'Alex Michaelides', 3, '20 de Maio de 2019', 
'Alicia Berenson tinha uma vida perfeita. Ela era uma pintora famosa casada com um fotógrafo bem-sucedido e morava numa área nobre de Londres que dá para o parque de Hampstead Heath. 
Certa noite, Gabriel, seu marido, voltou tarde para casa depois de um ensaio para a Vogue, e de repente a vida de Alicia mudou completamente...', 36.58);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (24, 'O Homem de Giz', 'C. J. Tudor', 3, '15 de Março de 2018', 
'Em 1986, Eddie e os amigos passam a maior parte dos dias andando de bicicleta pela pacata vizinhança em busca de aventuras. Os desenhos a giz são seu código secreto: homenzinhos rabiscados no asfalto; mensagens que só eles entendem. 
Mas um desenho misterioso leva o grupo de crianças até um corpo desmembrado e espalhado em um bosque. Depois disso, nada mais é como antes.', 39.10);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (25, 'Precisamos Falar Sobre o Kevin', 'Lionel Shriver', 3, '16 de Outubro de 2007', 
'Lionel Shriver realiza uma espécie de genealogia do assassínio ao criar na ficção uma chacina similar a tantas provocadas por jovens em escolas americanas. Aos 15 anos, o personagem Kevin mata 11 pessoas, entre colegas no colégio e familiares. 
Enquanto ele cumpre pena, a mãe Eva amarga a monstruosidade do filho. Entre culpa e solidão, ela apenas sobrevive. A vida normal se esvai no escândalo, no pagamento dos advogados, nos olhares sociais tortos.', 40.98);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (26, 'O iluminado', 'Stephen King', 3, '22 de Agosto de 2017', 
'O romance, magistralmente levado ao cinema por Stanley Kubrick, continua apaixonando (e aterrorizando) novas gerações de leitores. A luta assustadora entre dois mundos. Um menino e o desejo assassino de poderosas forças malignas. 
Uma família refém do mal. Nesta guerra sem testemunhas, vencerá o mais forte. Danny Torrance não é um menino comum.', 71.92);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (27, 'Misery: Louca obsessão', 'Stephen King', 3, '22 de Abril de 2014', 
'Paul Sheldon é um escritor famoso, reconhecido por uma série de best-sellers protagonizados pela mesma personagem: Misery Chastain. Annie Wilkes é uma enfermeira aposentada, leitora voraz e obcecada pela história de Misery. 
Quando Paul sofre um acidente de carro em uma nevasca, ele é resgatado justamente por Annie, e esse encontro entre fã e autor é o ponto de partida de uma das tramas mais aterrorizantes de Stephen King.', 29.79);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (28, 'It: A coisa', 'Stephen King', 3, '24 de Julho de 2014', 
'Durante as férias de 1958, em uma pacata cidadezinha chamada Derry, um grupo de sete amigos começa a ver coisas estranhas. Um conta que viu um palhaço, outro que viu uma múmia. 
Finalmente, acabam descobrindo que estavam todos vendo a mesma coisa: um ser sobrenatural e maligno que pode assumir várias formas. É assim que Bill, Beverly, Eddie, Ben, Richie, Mike e Stan enfrentam a Coisa pela primeira vez.', 64.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (29, 'Doutor sono', 'Stephen King', 3, '23 de Outubro de 2014', 
'Mais de trinta anos depois, Stephen King revela a seus leitores o que aconteceu a Danny Torrance, o garoto no centro de O iluminado, depois de sua terrível experiência no Overlook Hotel. 
Em Doutor Sono, King dá continuidade a essa história, contando a vida de Dan, agora um homem de meia-idade, e Abra Stone, uma menina de doze anos com um grande poder.', 48.17);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (30, 'Carrie', 'Stephen King', 3, '23 de Fevereiro de 2022', 
'Carrie White é uma adolescente tímida, solitária e oprimida pela mãe, cristã ferrenha que vê pecado em tudo. A rotina na escola não alivia o dia a dia em casa. 
Para os colegas e professores, ela é estranha, não se encaixa e, por consequência, é alvo constante de bullying.', 49.96);

-- ERÓTICO
INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (31, 'Amante Sombrio ( Irmandade da Adaga Negra)', 'J R Ward', 4, '6 de Setembro de 2005', 
'Em Caldwell – Nova Iorque, sem que o restante da humanidade saiba, desenrola-se uma sórdida e cruel guerra, entre vampiros e seus caçadores.', 15.60);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (32, 'Cinquenta Tons de Cinza', 'E. L. James', 4, '25 de Maio de 2011', 
'Quando Anastasia Steele entrevista o jovem empresário Christian Grey, descobre nele um homem atraente, brilhante e profundamente dominador. Ingênua e inocente, Ana se surpreende ao perceber que, a despeito da enigmática reserva de Grey, está desesperadamente atraída por ele.', 34.99);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (33, 'Ele: Quando Ryan conheceu James', 'Bowen, Sarina; Kennedy, Elle', 4, '28 de Julho de 2015', 
'O maior arrependimento de Ryan Wesley é ter convencido seu amigo extremamente hétero a participar de uma aposta que testou os limites da amizade deles.', 20.00);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (34, 'Entre o Agora e o Nunca', 'J. A. Redmerski', 4, '13 de Novembro de 2012', 
'Camryn Bennett é uma jovem de 20 anos que desistiu do amor desde que Ian, seu namorado, morreu num acidente de carro há um ano.', 36.00);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (35, 'Juliette Society', 'Sasha Grey', 4, '9 de Maio de 2013', 
'Se eu te contasse que existe um clube secreto, cujos membros pertencem à classe mais poderosa da sociedade – banqueiros, milionários, magnatas da mídia, CEOs, advogados, autoridades, traficantes de armas, militares condecorados, políticos, oficiais do governo', 36.00);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (36, 'Os Desejos da Bela Adormecida', 'Anne Rice', 4, '1 de Março de 1983', 
'primeiro da trilogia erótica, a princesa condenada a dormir por cem anos depois de furar o dedo em uma roca de fiar enfeitiçada se torna vítima de um segundo feitiço: seu coração e seu corpo estão sob controle do príncipe que a despertou.', 16.00);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (37, 'Peça-me o Que Quiser', 'Megan Maxwell', 4, '8 de Novembro de 2012', 
'Conciliando sexo e romantismo na medida exata, a trilogia Peça-me o que quiser revela uma história de amor cheia de encontros e desencontros, na qual os jogos eróticos, o voyeurismo e o desejo de ultrapassar todos os limites do prazer são os grandesprotagonistas.', 12.00);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (38, 'Toda Sua', 'Sylvia Day', 4, '3 de Abril de 2012', 
'Eva Tramell tem 24 anos e acaba de conseguir um emprego em uma das maiores agências de publicidade dos Estados Unidos. Tudo parece correr de acordo com o plano, até que ela conhece o jovem bilionário Gideon Cross, 
o homem mais sexy que ela - e provavelmente qualquer outra pessoa - já viu.', 26.00);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (39, 'Um sedutor sem coração', 'Kleypas, Lisa', 4, '5 de Fevereiro de 2018', 
'Devon Ravenel, o libertino mais maliciosamente charmoso de Londres, acabou de herdar um condado. Só que a nova posição de poder traz muitas responsabilidades indesejadas – e algumas surpresas', 10.00);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (40, 'Fascinante Vilã eBook Kindle', 'Karine Vidal', 4, '6 de Agosto de 2021', 
'Morta e sozinha no Rio das Almas. Afinal, vilãs sempre perdem. Então, a garota elaborou um plano para se salvar. Pretendia tomar o lugar da princesa e roubar o coração de Titan.', 7.90);

-- AÇÃO E AVENTURA
INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (41, 'Frankenstein', 'Mary Shelley', 5, '1 de Janeiro de 1818', 
'O romance relata a história de Victor Frankenstein, um estudante de ciências naturais que constrói um monstro em seu laboratório.', 36.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (42, 'Androides Sonham com Ovelhas Elétricas?', 'Philip K. Dick', 5, '9 de Janeiro de 1968', 
'Rick Deckard é um caçador de recompensas. Seu trabalho: eliminar androides que vivem ilegalmente na Terra. Seu sonho de consumo: substituir sua ovelha de estimação elétrica por um animal de verdade.', 58.55);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (43, 'Solaris', 'Stanislaw Lem', 5, '27 de Novembro de 2002', 
'Um psicólogo ainda perturbado com a morte da mulher é chamado a investigar estranhas ocorrências a bordo de uma estação espacial, que se encontra perto do planeta Solaris.', 71.91);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (44, '2001: Uma Odisséia no Espaço', 'Arthur C. Clarke', 5, '29 de Abril de 1968', 
'Uma estrutura imponente preta fornece uma conexão entre o passado e o futuro nesta adaptação enigmática de um conto reverenciado de ficção científica do autor Arthur C. Clarke.', 35.04);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (45, 'A Guerra dos Mundos', 'H. G. Wells', 5, '4 de Abril de 1898', 
'Ray Ferrier é um estivador divorciado, afastado de seus filhos, que vivem com a mãe. Quando sua ex-esposa deixa as crianças para ele cuidar durante alguns dias, o planeta é atacado por alienígenas que surgem do chão conduzindo tripods e destruindo tudo que encontram pelo caminho.', 32.80);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (46, 'Nós', 'Iêvgueni Zamiátin', 5, '14 de Abril de 1924', 
'Nós é um romance distópico escrito entre 1920 e 1921 pelo escritor russo Yevgeny Zamyatin. A história narra as impressões de um cientista sobre o mundo em que vive, uma sociedade aparentemente perfeita mas opressora, 
e seus conflitos ao perceber as imperfeições dele, ao travar contato com um grupo opositor que luta contra o "Benfeitor"', 56.24);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (47, 'A Mão Esquerda da Escuridão', 'Ursula K. Le Guin', 5, '8 de Janeiro de 1969', 
'Enviado em uma missão intergaláctica, Genly Ai, um humano, tem como missão persuadir os governantes do planeta Gethen a se unirem a uma comunidade universal. Entretanto, Genly, mesmo depois de anos de estudo, percebe-se despreparado para a situação que lhe aguardava.', 39.55);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (48, 'Neuromancer', 'William Gibson', 5, '1 de Julho de 1984', 
'Considerada a obra precursora do movimento cyberpunk e um clássico da ficção científica moderna, Neuromancer conta a história de Case, um cowboy do ciberespaço e hacker da matrix.', 29.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (49, 'O Guia Definitivo do Mochileiro das Galáxias', 'Douglas Adams', 5, '12 de Outubro de 1979', 
'Arthur Dent tem sua casa e seu planeta (sim, a Terra) destruídos em um mesmo dia, e sai pela galáxia afora com seu amigo Ford, que acaba de revelar que, na verdade, nasceu em um pequeno planeta perto de Betelgeuse.', 60.90);

INSERT INTO BOOKS (IdBook, Nome, Autora, IdGen, DataDeP, Sinopse, Preco) VALUES (50, 'Eu, Robô', 'Isaac Asimov', 5, '2 de Dezembro de 1950', 
'Eu, Robô é um conjunto de nove contos que relatam a evolução dos autômatos através do tempo. É neste livro que são apresentadas as célebres Três Leis da Robótica: os princípios que regem o comportamento dos robôs e que mudaram definitivamente a percepção que se tem sobre eles na própria ciência.', 27.89);

SELECT * FROM BOOKS WHERE Nome = ? AND Preco = ?;

SELECT * FROM BOOKS;

DROP TABLE BOOKS;

COMMIT;