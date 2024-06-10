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

-- Tabela Livro

CREATE TABLE Livro (
    id_livro INT PRIMARY KEY,
    titulo VARCHAR(255),
    autor VARCHAR(255),
    qnt_em_estoque INT
);

-- Tabela Emprestimo

CREATE TABLE Emprestimo (
    id_emprestimo INT PRIMARY KEY,
    id_aluno INT,
	id_curso INT,
    id_livro INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    data_devolvida DATE,
    multa VARCHAR (255),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_livro) REFERENCES Livro(id_livro),
	FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Tabela Professor

CREATE TABLE Professor (
    id_professor INT PRIMARY KEY,
    id_curso INT,
    nome VARCHAR(255),
    email VARCHAR(255),
    curso VARCHAR(255),
    salario VARCHAR (255),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Tabela Avaliação

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

-- Tabela Bonus

CREATE TABLE Bonus (
    id_bonus INT PRIMARY KEY,
    id_aluno INT,
    id_avaliacao INT,
    id_emprestimo INT,
    pontos_bonus INT,
	status VARCHAR (255),
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_avaliacao) REFERENCES Avaliacao(id_avaliacao),
    FOREIGN KEY (id_emprestimo) REFERENCES Emprestimo(id_emprestimo)
);

-- Tabela Inscrições

CREATE TABLE Inscricoes (
    id_inscricoes INT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_inscricao DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);
-- Tabela Monitor

CREATE TABLE Monitor (
    id_monitor INT PRIMARY KEY,
    id_aluno INT,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno)
);

-- Tabela Trabalho

CREATE TABLE Trabalho (
    id_trabalho INT PRIMARY KEY,
    id_aluno INT,
    id_professor INT,
    titulo VARCHAR(255),
    data_publicacao DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor)
);

-- Tabela Acompanhamento

CREATE TABLE Acompanhamento (
    id_acompanhamento INT PRIMARY KEY,
    id_aluno INT,
    id_professor INT,
    id_monitor INT,
    data_acompanhamento DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id_aluno),
    FOREIGN KEY (id_professor) REFERENCES Professor(id_professor),
    FOREIGN KEY (id_monitor) REFERENCES Monitor(id_monitor)
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
INSERT INTO Aluno VALUES (2, 2, 'Maria Santos', 'maria.santos@gmail.com', '1999-02-02', 'Avenida das Árvores, 456'); 
INSERT INTO Aluno VALUES (3, 3, 'Pedro Costa', 'pedro.costa@gmail.com', '2001-03-03', 'Travessa do Sol, 789'); 
INSERT INTO Aluno VALUES (4, 4, 'Ana Pereira', 'ana.pereira@gmail.com', '2002-04-04', 'Beco da Lua, 012'); 
INSERT INTO Aluno VALUES (5, 5, 'Luiz Oliveira', 'luiz.oliveira@gmail.com', '2003-05-05', 'Praça das Estrelas, 345'); 
UPDATE Aluno SET nome = 'Maria Santos', email = 'marisantos@gmail.com' WHERE id_aluno = 2;

-- Tabela Livro

--História
INSERT INTO Livro VALUES (1, 'A Formação da Classe Operária Inglesa', 'E. P. Thompson', 10); 
INSERT INTO Livro VALUES (2, 'Casa-Grande & Senzala', 'Gilberto Freyr', 25); 
INSERT INTO Livro VALUES (3, 'História geral do Brasil', 'Ciro Flamarion Cardoso', 18); 

--Ciência da Computação
INSERT INTO Livro VALUES (4, 'Código Limpo', 'Robert Cecil Martin', 12); 
INSERT INTO Livro VALUES (5, 'Use A Cabeça Java', 'Kathy Sierra', 16);
INSERT INTO Livro VALUES (6, 'Data Science Do Zero', 'Joel Grus', 10); 

--Direito
INSERT INTO Livro VALUES (7, 'Teoria Pura do Direito', 'Hans Kelsen', 15); 
INSERT INTO Livro VALUES (8, 'Justiça - O que é fazer a coisa certa?', 'Michael J. Sandel', 18); 
INSERT INTO Livro VALUES (9, 'Introdução ao estudo do direito', 'Paulo Nader', 15); 

-- Medicina
INSERT INTO Livro VALUES (10, 'Moore-Anatomia Orientada Para a Clinica', ' Arthur F. Dalley II', 16);
INSERT INTO Livro VALUES (11, 'Microbiologia Médica e Imunologia', 'Ernest Jawetz e Warren E. Levinson', 13); 
INSERT INTO Livro VALUES (12, 'Langman Embriologia Médica', 'T. W. Sadler', 15); 

--letras
INSERT INTO Livro VALUES (13, 'Teoria da literatura: uma introdução', 'Terry Eagleton', 14); 
INSERT INTO Livro VALUES (14, 'Os gêneros do discurso ', 'Mikhail Bakhtin', 12); 
INSERT INTO Livro VALUES (15, 'Produção textual, análise de gêneros e compreensão', 'Luiz Antônio Marcuschi', 16);

UPDATE Livro SET id_livro = '2', titulo = 'Era do Capital', autor = 'Eric Hobsbawm', qnt_em_estoque = '19' WHERE id_livro = 2;


--Tabela Professor

INSERT INTO Professor VALUES (1, 1, 'Liliane Fonseca','lilianefonseca@unicap.br', 'Curso História Geral','        10.000,00');
INSERT INTO Professor VALUES (2, 2, 'Sergio Murilo'  ,'sergiomurilo@unicap.br'  , ' Curso Direito','              10.000,00');
INSERT INTO Professor VALUES (3, 3, 'Marcus Esqueci' ,'marcusfoimal@unicap.br'  , 'Curso Medicina','              15.000,00');
INSERT INTO Professor VALUES (4, 4, 'Rita Patricia'  ,'ritapraticia@unicap.br'  , 'Curso Letras','                2.000.000,00');
INSERT INTO Professor VALUES (5, 5, 'Lucas Rodolfo'  ,'lucasrodolfo@unicap.br'  , 'Curso Ciência da Computação',' 2.000.000,00');

--Tabela Inscricoes

INSERT INTO Inscricoes VALUES (1, 1, 5, '2024-01-01');
INSERT INTO Inscricoes VALUES (2, 1, 4, '2024-01-01');
INSERT INTO Inscricoes VALUES (3, 2, 2, '2024-01-02');
INSERT INTO Inscricoes VALUES (4, 3, 1, '2024-01-01');
INSERT INTO Inscricoes VALUES (5, 4, 3, '2024-01-04');
INSERT INTO Inscricoes VALUES (6, 5, 5, '2024-01-03');

--Tabela Emprestimo

-- id_emprestimo; id_curso,id_aluno, id_livro
INSERT INTO Emprestimo VALUES (1,1,1,4,  '2024-03-10', '2024-03-25','2024-03-20');
INSERT INTO Emprestimo VALUES (2,2,2,13, '2024-04-03', '2024-05-18','2024-05-18');
INSERT INTO Emprestimo VALUES (3,3,3,1,  '2024-02-11', '2024-02-26','2024-02-25');
INSERT INTO Emprestimo VALUES (4,4,4,11, '2024-03-07', '2024-03-22','2024-03-25', ' R$: 15,00');
INSERT INTO Emprestimo VALUES (5,5,5,7,  '2024-03-14', '2024-03-29','2024-03-25');

--Tabela Avaliacao

-- id_avaliacao,nome_aluno,id_aluno ,id_curso,id_professor ,nota,id_bonus ,nota_atualizada ,
INSERT INTO Avaliacao VALUES (1,'João Martins',  1,1, 5,'10', 1,'   10');
INSERT INTO Avaliacao VALUES (2,'Maria Santos',  5,2, 2,'9',  2,'   10');
INSERT INTO Avaliacao VALUES (3,'Pedro Costa',   2,3, 3,'7',  3,'    8');
INSERT INTO Avaliacao VALUES (4,'Ana Pereira',   3,4,4 ,'6',  4,'  6,5');
INSERT INTO Avaliacao VALUES (5,'Luiz Oliveira', 4,5, 1,'7',  5,' 7,75');

--Tabela Bonus

INSERT INTO Bonus VALUES (1,1,1,1,  '1000');
INSERT INTO Bonus VALUES (2,2,2,2,  '1000');
INSERT INTO Bonus VALUES (3,3,3,3,  '1000');
INSERT INTO Bonus VALUES (4,4,4,4,   '500');
INSERT INTO Bonus VALUES (5,5,5,5,   '750');

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

SELECT Curso.nome_do_curso, COUNT(Aluno.id_aluno) AS qnt_alunos_com_bonus_acima_media
FROM Curso
JOIN Aluno ON Curso.id_curso = Aluno.id_curso
JOIN Bonus ON Aluno.id_aluno = Bonus.id_aluno
WHERE Bonus.pontos_bonus > (SELECT AVG(pontos_bonus) FROM Bonus)
GROUP BY Curso.nome_do_curso;

SELECT AVG(num_emprestimos) as media_emprestimos
FROM (SELECT id_aluno, COUNT(*) as num_emprestimos
      FROM Emprestimo
      GROUP BY id_aluno) as subquery;
	  
SELECT COUNT(*) as emprestimos_atrasados
FROM Emprestimo
WHERE data_devolvida > data_devolucao;

SELECT COUNT(*) AS "número de alunos com média abaixo de 7"
FROM Avaliacao
WHERE nota < 7;

ALTER TABLE Aluno
ADD media_notas FLOAT;

ALTER TABLE Avaliacao
ADD status VARCHAR(255);

CREATE OR REPLACE FUNCTION update_bonus_points() RETURNS TRIGGER AS $$
BEGIN
    IF (NEW.id_livro BETWEEN (NEW.id_curso-1)*3+1 AND NEW.id_curso*3) THEN
        UPDATE Bonus SET pontos_bonus = pontos_bonus + 1000 WHERE id_aluno = NEW.id_aluno;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER bonus_points_after_insert
AFTER INSERT ON Emprestimo
FOR EACH ROW EXECUTE PROCEDURE update_bonus_points();

CREATE OR REPLACE FUNCTION verificar_disponibilidade_livro()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF (SELECT qnt_em_estoque FROM Livro WHERE id_livro = NEW.id_livro) <= 0 THEN
        RAISE EXCEPTION 'Livro não disponível para empréstimo';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER verificar_disponibilidade_livro_trigger
BEFORE INSERT ON Emprestimo
FOR EACH ROW
EXECUTE FUNCTION verificar_disponibilidade_livro();
 

-- Trigger para atualizar o estoque de livros após um empréstimo 
CREATE OR REPLACE FUNCTION atualiza_estoque_livro()
RETURNS TRIGGER AS
$$
BEGIN
    UPDATE Livro
    SET qnt_em_estoque = qnt_em_estoque - 1
    WHERE id_livro = NEW.id_livro;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criação do trigger
CREATE TRIGGER trig_atualiza_estoque
AFTER INSERT ON Emprestimo
FOR EACH ROW
EXECUTE FUNCTION atualiza_estoque_livro();

-- Trigger para verificar a disponibilidade de livros antes de emprestar:
CREATE OR REPLACE FUNCTION verificar_disponibilidade_livro()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF (SELECT qnt_em_estoque FROM Livro WHERE id_livro = NEW.id_livro) <= 0 THEN
        RAISE EXCEPTION 'Livro não disponível para empréstimo';
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER verificar_disponibilidade_livro_trigger
BEFORE INSERT ON Emprestimo
FOR EACH ROW
EXECUTE FUNCTION verificar_disponibilidade_livro();

-- Trigger para registrar a data e hora de uma avaliação 
CREATE OR REPLACE FUNCTION registra_data_avaliacao()
RETURNS TRIGGER AS
$$
BEGIN
    UPDATE Avaliacao
    SET data_avaliacao = NOW()
    WHERE id_avaliacao = NEW.id_avaliacao;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Criação do trigger
CREATE TRIGGER trig_registra_data_avaliacao
BEFORE INSERT ON Avaliacao
FOR EACH ROW
EXECUTE FUNCTION registra_data_avaliacao();

-- Trigger para atualizar a nota média de um curso com base nas avaliações
CREATE OR REPLACE FUNCTION atualizar_nota_media()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Curso
    SET nota_media = (SELECT AVG(nota) FROM Avaliacao WHERE id_curso = NEW.id_curso)
    WHERE id_curso = NEW.id_curso;
    RETURN NEW;
END;
$$;
-- Trigger que dar um bonus ao aluno, caso a nota dele seja maior que 8
CREATE TRIGGER atualizar_nota_media_trigger
AFTER INSERT ON AvaliacaoSS
FOR EACH ROW
EXECUTE FUNCTION atualizar_nota_media();

CREATE OR REPLACE FUNCTION registrar_bonus()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.nota > 8 THEN
        INSERT INTO Bonus (id_aluno, pontos_bonus, status)
        VALUES (NEW.id_aluno, 10, 'Ativo');
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER registrar_bonus_trigger
AFTER INSERT ON Avaliacao
FOR EACH ROW
EXECUTE FUNCTION registrar_bonus();

--Triggers para atualizar o status do monitor para Ativo, caso exista um monitor
CREATE OR REPLACE FUNCTION atualizar_status_monitor()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Monitor
    SET status = 'Ativo'
    WHERE id_monitor = NEW.id_monitor;
    RETURN NEW;
END;
$$;

CREATE TRIGGER atualizar_status_monitor_trigger
AFTER INSERT ON Acompanhamento
FOR EACH ROW
EXECUTE FUNCTION atualizar_status_monitor();

CREATE OR REPLACE FUNCTION atualizar_status_monitor()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Monitor
    SET status = 'Ativo'
    WHERE id_monitor = NEW.id_monitor;
    RETURN NEW;
END;
$$;
-- Trigger para calcular a multa, caso a devolução não seja feita no prazo
CREATE OR REPLACE FUNCTION calcular_multa()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.multa = (SELECT (NEW.data_devolvida - NEW.data_devolucao) * 5);
    RETURN NEW;
END;
$$;

CREATE TRIGGER calcular_multa_trigger
BEFORE UPDATE ON Emprestimo
FOR EACH ROW
EXECUTE FUNCTION calcular_multa();


-- Stored procedure 

-- Calcular a média das notas de um aluno 
CREATE OR REPLACE FUNCTION CalculaMediaNotasAluno(aluno_id INT)
RETURNS FLOAT AS
$$
DECLARE
    total_notas INT;
    soma_notas FLOAT;
    media FLOAT;
BEGIN
    SELECT COUNT(*), SUM(nota) INTO total_notas, soma_notas
    FROM Avaliacao
    WHERE id_aluno = aluno_id;
    
    IF total_notas > 0 THEN
        media := soma_notas / total_notas;
    ELSE
        media := 0;
    END IF;
    
    RETURN media;
END;
$$ LANGUAGE plpgsql;

SELECT CalculaMediaNotasAluno(1);

-- Atualizar o saldo de um aluno após empréstimo
CREATE OR REPLACE PROCEDURE atualizar_saldo_aluno(
    p_id_aluno INT,
    p_valor_emprestimo DECIMAL
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Aluno
    SET saldo = saldo - p_valor_emprestimo
    WHERE id_aluno = p_id_aluno;
END;
$$;

-- Registrar um novo livro no estoque
CREATE OR REPLACE PROCEDURE inserir_livro(
    p_titulo VARCHAR(255),
    p_autor VARCHAR(255),
    p_qnt_em_estoque INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Livro (titulo, autor, qnt_em_estoque)
    VALUES (p_titulo, p_autor, p_qnt_em_estoque);
END;
$$;

-- Calcular a media de notas em cada curso
CREATE OR REPLACE PROCEDURE calcular_media_notas_curso(
    p_id_curso INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_media DECIMAL;
BEGIN
    SELECT AVG(nota) INTO v_media
    FROM Avaliacao
    WHERE id_curso = p_id_curso;
    RAISE NOTICE 'Média das notas do curso: %', v_media;
END;
$$;

-- Verificar incrição dos alunos no curso
CREATE OR REPLACE PROCEDURE verificar_inscricao_aluno(
    p_id_aluno INT,
    p_id_curso INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM Inscricoes WHERE id_aluno = p_id_aluno AND id_curso = p_id_curso) THEN
        RAISE EXCEPTION 'Aluno já inscrito neste curso';
    END IF;
END;
$$;

-- Registrar um novo trabalho enviado por um aluno:
CREATE OR REPLACE PROCEDURE inserir_trabalho(
    p_id_aluno INT,
    p_id_professor INT,
    p_titulo VARCHAR(255),
    p_data_publicacao DATE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Trabalho (id_aluno, id_professor, titulo, data_publicacao)
    VALUES (p_id_aluno, p_id_professor, p_titulo, p_data_publicacao);
END;
$$;

-- View que mostra o número total de vendas por categoria de livro
CREATE OR REPLACE VIEW VendasPorCategoria AS
SELECT Livro.id_livro, Livro.titulo, Livro.autor, COUNT(Emprestimo.id_emprestimo) AS total_vendas
FROM Livro
LEFT JOIN Emprestimo ON Livro.id_livro = Emprestimo.id_livro
GROUP BY Livro.id_livro;

SELECT * FROM VendasPorCategoria;

-- View que lista os alunos inscritos em um curso específico 
CREATE OR REPLACE VIEW AlunosPorCurso AS
SELECT Aluno.id_aluno, Aluno.nome, Curso.nome_do_curso
FROM Aluno
JOIN Curso ON Aluno.id_curso = Curso.id_curso;

SELECT * FROM AlunosPorCurso WHERE nome_do_curso = 'Engenharia de Software';

-- View que exibe os detalhes de um trabalho específico
CREATE OR REPLACE VIEW DetalhesTrabalho AS
SELECT Trabalho.id_trabalho, Trabalho.titulo, Professor.nome AS nome_professor
FROM Trabalho
JOIN Professor ON Trabalho.id_professor = Professor.id_professor;

SELECT * FROM DetalhesTrabalho WHERE id_trabalho = 1;

-- View de Livros Disponíveis para Empréstimo
CREATE OR REPLACE VIEW Livros_Disponiveis AS
SELECT
    l.ID_Livro,
    l.Titulo,
    a.Nome AS Autor,
    e.Data_de_devolucao
FROM Livro l
JOIN Autor a ON l.ID_Autor = a.ID_Autor
WHERE l.Disponibilidade = 'Disponível';

-- Criação de usuários e concessão de permissões
CREATE USER aluno WITH PASSWORD 'senha_aluno';
GRANT CONNECT ON DATABASE educalivros TO aluno;

CREATE USER professor WITH PASSWORD 'senha_professor';
GRANT USAGE ON SCHEMA public TO professor;
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO professor;

CREATE USER admin WITH PASSWORD 'senha_admin';
GRANT ALL PRIVILEGES ON DATABASE educalivros TO admin;
