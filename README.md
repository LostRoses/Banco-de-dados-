# Banco-de-dados-
Banco de dados, de uma Escola Livraria


  Breve descrição:

  Fiz um banco de dados de uma escola livraria, onde temos os dados de todos os cursos, alunos, livros, emprestimos e mais algumas informações, que estão contidas dentro da ESCOLA LIVRARIA, onde criei tabelas para organizar, inserir, atualizar e deletar os dados. Também fiz um modelo relacional fisico.


MODELO RELACIONAL FISICO
![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/16f0c5ac-22a4-4ecf-af20-a5b2885eb51b)


AS 5 PERGUNTAS SÃO:

1 Quantos empréstimos cada aluno fez?

SELECT Aluno.nome, COUNT(Emprestimo.id_aluno) AS quantidade_emprestimos
FROM Aluno
JOIN Emprestimo ON Aluno.id_aluno = Emprestimo.id_aluno
GROUP BY Aluno.nome
ORDER BY quantidade_emprestimos DESC;


2 Qual é a média das notas para cada curso?

SELECT Curso.nome_do_curso, AVG(Avaliacao.nota) AS media_notas
FROM Curso
JOIN Avaliacao ON Curso.id_curso = Avaliacao.id_curso
GROUP BY Curso.nome_do_curso;

3 Quantas inscrições cada curso tem?

SELECT Curso.nome_do_curso, COUNT(Inscricoes.id_curso) AS quantidade_inscricoes
FROM Curso
JOIN Inscricoes ON Curso.id_curso = Inscricoes.id_curso
GROUP BY Curso.nome_do_curso
ORDER BY quantidade_inscricoes DESC;

4 Qual é o total de pontos de bônus para cada aluno?

SELECT Aluno.nome, SUM(Bonus.pontos_bonus) AS total_pontos_bonus
FROM Aluno
JOIN Bonus ON Aluno.id_aluno = Bonus.id_aluno
GROUP BY Aluno.nome
ORDER BY total_pontos_bonus DESC;

5 Qual é a diferença entre a nota máxima e a nota mínima para cada curso?

SELECT Curso.nome_do_curso, MAX(Avaliacao.nota) - MIN(Avaliacao.nota) AS diferenca_notas
FROM Curso
JOIN Avaliacao ON Curso.id_curso = Avaliacao.id_curso
GROUP BY Curso.nome_do_curso;







