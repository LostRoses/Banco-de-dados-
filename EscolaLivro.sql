-- Tabela Curso

CREATE TABLE Curso(
    id_curso INT PRIMARY KEY,
    nome_do_curso VARCHAR (255),
    qnt_cadeiras VARCHAR (255),
    preco_curso VARCHAR (255)
);

-- Tabela Aluno
CREATE TABLE Aluno(
    id_aluno INT PRIMARY KEY,
    id_curso INT,
    nome VARCHAR (255),
    email VARCHAR (255),
    data_nascimento DATE,
    endereco VARCHAR (255),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Livro (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    qnt_em_estoque INT
);

CREATE TABLE Emprestimo (
    id_emprestimo INT PRIMARY KEY,
    id_aluno INT,
    id_livro INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    data_devolvida DATE,
    multa VARCHAR (255),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro)
);

CREATE TABLE Cursos (
    id_cursos INT PRIMARY KEY,
    nome_dos_cursos VARCHAR(255)
);

CREATE TABLE Cadeira (
    id_cadeira INT PRIMARY KEY,
    id_curso INT,
    nome_cadeira VARCHAR (255),
    preco_cadeira VARCHAR (255),
    FOREIGN KEY (id_curso) REFERENCES Curso (id_curso)
);

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY,
    id_curso INT,
    nome VARCHAR(255),
    email VARCHAR(255),
    curso VARCHAR(255),
    salario VARCHAR (255),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Avaliacao (
    id_avaliacao INT PRIMARY KEY,
	nome_aluno VARCHAR (255),
    id_aluno INT,
    id_curso INT,
    id_professor INT,
    nota INT,
    id_bonus INT,
    nota_atualizada VARCHAR(255),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

CREATE TABLE Bonus (
    id_bonus INT PRIMARY KEY,
    id_aluno INT,
    id_avaliacao INT,
    id_emprestimo INT,
    pontos_bonus INT,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_avaliacao) REFERENCES Avaliacao(id_avaliacao),
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo)
);

CREATE TABLE Inscricoes (
    id_inscricoes INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_inscricao DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Tabela Curso

INSERT INTO Curso (id_curso, nome_do_curso, qnt_cadeiras, preco_curso) VALUES (1, 'Curso Ciência da Computação','3','R$: 700.00');
INSERT INTO Curso (id_curso, nome_do_curso, qnt_cadeiras, preco_curso) VALUES (2, 'Curso Letras','3', 'R$: 700.00');
INSERT INTO Curso (id_curso, nome_do_curso, qnt_cadeiras, preco_curso) VALUES (3, 'Curso História ','3', 'R$: 700.00');
INSERT INTO Curso (id_curso, nome_do_curso, qnt_cadeiras, preco_curso) VALUES (4, 'Curso Medicina 1','3', 'R$: 700.00');
INSERT INTO Curso (id_curso, nome_do_curso, qnt_cadeiras, preco_curso) VALUES (5, 'Curso Direito','3', 'R$: 700.00');

DELETE FROM Curso WHERE id_curso = 6;
DELETE FROM Curso WHERE id_curso = 7;
DELETE FROM Curso WHERE id_curso = 8;
DELETE FROM Curso WHERE id_curso = 9;

-- Tabela Aluno

INSERT INTO Aluno VALUES (1, 1, 'João Martins', 'joao.00000829607@unicap.br', '2002-03-04', 'Rua Subida do Perijucan, 171'); 
INSERT INTO Aluno VALUES (2, 5, 'Maria Santos', 'maria.santos@gmail.com', '1999-02-02', 'Avenida das Árvores, 456'); 
INSERT INTO Aluno VALUES (3, 2, 'Pedro Costa', 'pedro.costa@gmail.com', '2001-03-03', 'Travessa do Sol, 789'); 
INSERT INTO Aluno VALUES (4, 3, 'Ana Pereira', 'ana.pereira@gmail.com', '2002-04-04', 'Beco da Lua, 012'); 
INSERT INTO Aluno VALUES (5, 4, 'Luiz Oliveira', 'luiz.oliveira@gmail.com', '2003-05-05', 'Praça das Estrelas, 345'); 
UPDATE Aluno SET nome = 'Maria Santos', email = 'marisantos@gmail.com' WHERE id_aluno = 2;

-- Tabela Livro

INSERT INTO Livro VALUES (1, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 10); 
INSERT INTO Livro VALUES (2, 'Dom Quixote', 'Miguel de Cervantes', 5); 
INSERT INTO Livro VALUES (3, '1984', 'George Orwell', 8); 
INSERT INTO Livro VALUES (4, 'A Revolução dos Bichos', 'George Orwell', 12); 
INSERT INTO Livro VALUES (5, 'Cem Anos de Solidão', 'Gabriel García Márquez', 6);

UPDATE Livro SET id_livro = '2', titulo = 'As coisas que você só vê quando você desacelera', autor = 'Haemin Sunim', qnt_em_estoque = '19' WHERE id_livro = 2;

-- Tabela Cursos

INSERT INTO Cursos VALUES (1, 'Ciência da Computação');
INSERT INTO Cursos VALUES (2, 'Arquitetura');
INSERT INTO Cursos VALUES (3, 'Jornalismo ');
INSERT INTO Cursos VALUES (4, 'Medicina ');
INSERT INTO Cursos VALUES (5, 'Direito');

-- Tabela Cadeira

-- CIENCIA DA COMPUTAÇÃO
INSERT INTO Cadeira VALUES (1, 1, 'Introdução a Ciência da Computação','R$: 250,00');
INSERT INTO Cadeira VALUES (2, 1, 'Eletronica basica', 'R$: 200,00');
INSERT INTO Cadeira VALUES (3, 1, 'Gráfos', 'R$: 250,00');

-- LETRAS
INSERT INTO Cadeira VALUES (4, 1, 'Gramatica 1','R$: 250,00');
INSERT INTO Cadeira VALUES (5, 1, 'Argumentação e Disertação', 'R$: 200,00');
INSERT INTO Cadeira VALUES (6, 1, 'Oratoria', 'R$: 250,00');

--HISTORIA Geral
INSERT INTO Cadeira VALUES (7, 1, 'Introdução a História Geral','R$: 250,00');
INSERT INTO Cadeira VALUES (8, 1, 'Guerras', 'R$: 200,00');
INSERT INTO Cadeira VALUES (9, 1, 'História Hoje', 'R$: 250,00');


-- MEDICINA
INSERT INTO Cadeira VALUES (10, 1, 'Introdução ao Corpo Humano','R$: 250,00');
INSERT INTO Cadeira VALUES (11, 1, 'Sangue', 'R$: 200,00');
INSERT INTO Cadeira VALUES (12, 1, 'Fraturas', 'R$: 250,00');

-- DIREITO
INSERT INTO Cadeira VALUES (13, 1, 'Introdução a Direito','R$: 250,00');
INSERT INTO Cadeira VALUES (14, 1, 'Código Penal', 'R$: 200,00');
INSERT INTO Cadeira VALUES (15, 1, 'Direito do Consumidor', 'R$: 250,00');


--Tabela Professor

INSERT INTO Professor VALUES (1, 1, 'Liliane Fonseca', 'lilianefonseca@unicap.br', 'Curso História Geral', '10.000,00');
INSERT INTO Professor VALUES (2, 2, 'Sergio Murilo', 'sergiomurilo@unicap.br', ' Curso Direito', '10.000,00');
INSERT INTO Professor VALUES (3, 3, 'Marcus Esqueci', 'marcusfoimal@unicap.br','Curso Medicina', '15.000,00');
INSERT INTO Professor VALUES (4, 4, 'Rita Patricia', 'ritapraticia@unicap.br', 'Curso Letras', '2.000.000,00');
INSERT INTO Professor VALUES (5, 5, 'Lucas Rodolfo', 'lucasrodolfo@unicap.br', 'Curso Ciência da Computação', '2.000.000,00');

--Tabela Inscricoes

INSERT INTO Inscricoes VALUES (1, 1, 5, '2024-01-01');
INSERT INTO Inscricoes VALUES (2, 1, 4, '2024-01-01');
INSERT INTO Inscricoes VALUES (3, 2, 2, '2024-01-02');
INSERT INTO Inscricoes VALUES (4, 3, 1, '2024-01-01');
INSERT INTO Inscricoes VALUES (5, 4, 3, '2024-01-04');
INSERT INTO Inscricoes VALUES (6, 5, 5, '2024-01-03');

--Tabela Emprestimo

INSERT INTO Emprestimo VALUES (1,1,1, '2024-03-10', '2024-03-25','2024-03-20');
INSERT INTO Emprestimo VALUES (2,1,3, '2024-04-03', '2024-05-18','2024-05-18');
INSERT INTO Emprestimo VALUES (3,2,4, '2024-02-11','2024-02-26','2024-02-25');
INSERT INTO Emprestimo VALUES (4,3,5, '2024-03-07','2024-03-22','2024-03-25', ' R$: 15,00');
INSERT INTO Emprestimo VALUES (5,4,2, '2024-03-14','2024-03-29','2024-03-25');
INSERT INTO Emprestimo VALUES (6,5,1, '2024-04-08','2024-04-23','2024-04-25',' 10,00');

--Tabela Avaliacao

INSERT INTO Avaliacao VALUES (1,'João Martins', 1,1, 5,'10', 5, 1,'10');
INSERT INTO Avaliacao VALUES (2,'Maria Santos', 5,2, 2,'9', 2, 2,'10');
INSERT INTO Avaliacao VALUES (3,'Pedro Costa', 2,3, 3,'7', 3, 3,'8');
INSERT INTO Avaliacao VALUES (4,'Ana Pereira', 3,4,4 ,'6', 4, 4,'6,5');
INSERT INTO Avaliacao VALUES (5,'Luiz Oliveira', 4,5, 1,'7', 5, 5,'7,75');

--Tabela Bonus

INSERT INTO Bonus VALUES (1,1,1,1, '1000');
INSERT INTO Bonus VALUES (2,2,2,2, '1000');
INSERT INTO Bonus VALUES (3,3,3,3, '1000');
INSERT INTO Bonus VALUES (4,4,4,4, '500');
INSERT INTO Bonus VALUES (5,5,5,5, '750');

SELECT Aluno.nome, COUNT(Emprestimo.id_aluno) AS quantidade_emprestimos
FROM Aluno
JOIN Emprestimo ON Aluno.id_aluno = Emprestimo.id_aluno
GROUP BY Aluno.nome
ORDER BY quantidade_emprestimos DESC;

SELECT Curso.nome_do_curso, AVG(Avaliacao.nota) AS media_notas
FROM Curso
JOIN Avaliacao ON Curso.id_curso = Avaliacao.id_curso
GROUP BY Curso.nome_do_curso;

SELECT Curso.nome_do_curso, COUNT(Inscricoes.id_curso) AS quantidade_inscricoes
FROM Curso
JOIN Inscricoes ON Curso.id_curso = Inscricoes.id_curso
GROUP BY Curso.nome_do_curso
ORDER BY quantidade_inscricoes DESC;

SELECT Aluno.nome, SUM(Bonus.pontos_bonus) AS total_pontos_bonus
FROM Aluno
JOIN Bonus ON Aluno.id_aluno = Bonus.id_aluno
GROUP BY Aluno.nome
ORDER BY total_pontos_bonus DESC;

SELECT Curso.nome_curso, MAX(Avaliacao.nota) - MIN(Avaliacao.nota) AS diferenca_notas
FROM Curso
JOIN Avaliacao ON Curso.id_curso = Avaliacao.id_curso
GROUP BY Curso.nome_curso;

