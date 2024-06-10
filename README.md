# Banco-de-dados-
Banco de dados, de uma Escola Livraria


  Breve descrição:

  Fiz um banco de dados de uma escola livraria, onde temos os dados de todos os cursos, alunos, livros, emprestimos e mais algumas informações, que estão contidas dentro da ESCOLA LIVRARIA, onde criei tabelas para organizar, inserir, atualizar e deletar os dados. Também fiz um modelo relacional fisico.


MODELO RELACIONAL FISICO

![modelo_Relacional1](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/9b5ab3ae-7a47-44ab-ab5d-50e7f6fe1e50)



AS 5 PERGUNTAS SÃO:

1 Quantos empréstimos cada aluno fez?

![captura_tela](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/5ad17112-cc3e-4cf1-a2c0-1d960034faa2)



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


EASTER EGGS: 

1 - Bonificação para os alunos que utilizarem da proposta de emprestimo de forma adequada.

2 - Monitoria e acompanhamento para os alunos com nota abaixa da média.

3 - Oportunidade de publicar pesquisas e artigos na instituição, auxiliados pelos professores, para os alunos com notas iguais ou superiores a média.


NORMALIZAÇÃO: Terceira Forma Normal (3NF)

O esquema já atende aos critérios da 1NF, pois cada célula contém apenas um valor, há uma chave primária para identificação e não há duplicação de linhas ou colunas.

Na 2NF, abordamos dependências parciais.
Vamos focar na tabela Emprestimo:
Ela possui uma chave primária composta: (id_aluno, id_curso, id_livro).
Criaremos uma nova tabela para os detalhes do empréstimo (por exemplo, EmprestimoDetalhes) com as colunas id_emprestimo, data_emprestimo, data_devolucao, data_devolvida e multa.
A tabela original Emprestimo agora terá apenas as colunas da chave primária: (id_aluno, id_curso, id_livro).

Na 3NF, abordamos dependências transitivas.
Vamos considerar a tabela Avaliacao:
O atributo nome_aluno depende de id_aluno, o que é uma dependência transitiva.
Criaremos uma nova tabela para os nomes dos alunos (por exemplo, AlunoNomes) com as colunas id_aluno e nome_aluno.
A tabela original Avaliacao agora fará referência ao AlunoNomes usando id_aluno.

