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

![Captura de tela 2024-06-09 222329](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/3ba6e241-0a12-42c6-9af5-d630fe1a9e36)

3 Quantas inscrições cada curso tem?

![Captura de tela 2024-06-09 222349](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/5fee0164-1753-47d6-882a-65d503fc9f1c)

4 Quantos empréstimos foram devolvidos após a data de devolução?

![Captura de tela 2024-06-09 222132](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/8cd52fcf-6b62-4a46-aefc-2ab820b4ee76)

5 Quantos alunos têm uma nota média acima de 7?

![Captura de tela 2024-06-09 222132](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/43256867-07d7-4577-b5d3-7c83b6e11d82)

6 Quantos alunos não atingiram a média 7?

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/e6b67ca9-0aff-4983-99e1-773bbe7fa03e)

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


CRIAÇÃO DE NOVOS TRIGGRS:

1°) Trigger para atualizar os pontos de bônus de um aluno:



2°) Trigger para atualizar o estoque de livros após um empréstimo:

![Captura de tela 2024-06-09 225219](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/5e3fdb68-6ff9-44ee-ada4-32858e2680ca)

3°) Trigger para verificar a disponibilidade de livros antes de emprestar:


4°) Trigger para registrar a data e hora de uma avaliação: 



5°) Trigger que atualiza a nota média de um curso com base nas avaliações do curso:



6°) Trigger que insere um bônus para o aluno se a nota da avaliação for maior que 8:



7°) Trigger que atualiza o status de um monitor para ‘Ativo’:



8°) Trigger para calculaw a multa com base na diferença entre a data de devolução e a data em que o livro foi realmente devolvido:
