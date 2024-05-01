# Banco-de-dados-
Banco de dados, de uma Escola Livraria


  Breve descrição:

  Fiz um banco de dados de uma escola livraria, onde temos os dados de todos os cursos, alunos, livros, emprestimos e mais algumas informações, que estão contidas dentro da ESCOLA LIVRARIA, onde criei tabelas para organizar, inserir, atualizar e deletar os dados. Também fiz um modelo relacional fisico.


MODELO RELACIONAL FISICO

![modelo_Relacional1](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/9b5ab3ae-7a47-44ab-ab5d-50e7f6fe1e50)



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

4 Quantos empréstimos foram devolvidos após a data de devolução?

SELECT COUNT(*) as emprestimos_atrasados
FROM Emprestimo
WHERE data_devolvida > data_devolucao;

5 Quantos alunos têm uma nota média acima de 7?

SELECT Curso.nome_do_curso, COUNT(Aluno.id_aluno) AS qnt_alunos_com_bonus_acima_media
FROM Curso
JOIN Aluno ON Curso.id_curso = Aluno.id_curso
JOIN Bonus ON Aluno.id_aluno = Bonus.id_aluno
WHERE Bonus.pontos_bonus > (SELECT AVG(pontos_bonus) FROM Bonus)
GROUP BY Curso.nome_do_curso;

6 Quantos alunos não atingiram a média 7?

SELECT COUNT(*) AS 'Número de alunos com média abaixo de 7'
FROM Avaliacao
WHERE nota < 7;





