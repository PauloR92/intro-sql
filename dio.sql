-- criação de tabela com o campo 'nome' e 'nascimento'
CREATE TABLE pessoas (
    id INT NOT NULL PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(30) NOT NULL,
    nascimento DATE 

)

INSERT INTO pessoas (nome, nascimento) VALUES ('Paulo Ricardo', '1992/12/10')
INSERT INTO pessoas (nome, nascimento) VALUES ('Roberto', '1996/08/17')
INSERT INTO pessoas (nome, nascimento) VALUES ('Henrique', '1989/01/10')


-- (SELECT*FROM pessoas) ou (SELECT NOME E/OU NASCIMENTO pessoas) para definir o campo de visualização da consulta
SELECT*FROM pessoas
-- Para atualizar a tabela 'pessoa, indicar o campo, no caso 'nome'


--Cláusula DELETE
UPDATE pessoa SET nome= 'Paulo Ricardo Marques'
--‘set’ configurA a tabela 'nome' e ‘update’ atualiza o campo 'pessoas'
-- Todos os valores atualizaram para 'Paulo Ricardo Marques', porque não deu a clausula WHERE
--A cláusula WHERE você consegue fazer as manipulações de dados corretas, 
--serve inclusive, para entender melhor a importância da ‘PRIMARY KEY’, sem a primary key, dificilmente teria um indicador individual
UPDATE pessoa SET nome='Roberto' WHERE id=2
UPDATE pessoa SET nome='Henrique' WHERE id=3


--Cláusula DELETE (esse comando não pode ser desfeito)

--Para selecionar o dado correto para deletar, usei 'DELETE FROM', no caso, cadastro 'Roberto'

SELECT * FROM pessoa WHERE id=2; -- para visualizar o dado

DELETE FROM pessoa WHERE id=2;

--inseri novamente o 'Roberto' no banco de dados
INSERT INTO pessoa (nome, nascimento) VALUES('Roberto', '1996/08/17');
--O 'Roberto' estava com id=2, agora pulou para o campo 4, porque a primary key é um valor único.



--Ordenando dados

--O ‘ORDER BY’ vai ordenar a forma como as informações são exibidas, de forma crescente ou decrescente.
SELECT * FROM pessoa ORDER by nome;
--Esse comando trouxe os dados organizados de forma alfabética crescente.

--o 'ORDER BY DESC' trás os dados organizados de forma alfabética decrescente.
SELECT * FROM pessoa ORDER BY nome DESC;



--Agrupamento

--1 campo adicionado com o valor 'genero' VARCHAR(1) após 'nascimento'.
-- foi mostrado em tela a mensagem "ALTER TABLE `pessoa` ADD `genero` VARCHAR(1) NOT NULL AFTER `nascimento`;"
--O 'alter table' serve para qualquer alteração que pode ser feito na tabela, essas alterações geralmente são feitas por admins

--Para adicionar dados do valor 'genero' foi digitado o comando.
UPDATE pessoa SET genero='M' WHERE id = 1
--Adicionado valor em id 1 com sucesso.

UPDATE pessoa SET genero='M' WHERE id=3;
UPDATE pessoa SET genero='M' WHERE id=4;
--Adicionado gênero no restante dos id

SELECT * FROM pessoa;
SELECT COUNT(id),genero FROM pessoa GROUP BY genero;
--Após feito o comando, a cláusula 'count(quantidade)', fez a quantidade de ids diferentes tem dentro de cada gênero que foi agrupado.
--O 'group by' pegou os elementos que há no 'genero' igual.


