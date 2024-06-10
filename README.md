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

![imagem_2024-06-09_233440479](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/2779a303-3dad-4da3-a1ac-b2217db6b410)

2°) Trigger para atualizar o estoque de livros após um empréstimo:

![imagem_2024-06-09_233605563](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/8246af3f-d385-47f4-a904-1e9deda13307)

3°) Trigger para verificar a disponibilidade dos livros antes de emprestar:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/ccb2388e-9f68-4a4f-a94f-a96a84a90297)

4°) Trigger para registrar a data e hora de uma avaliação: 

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/6fb46369-7033-4aa7-a6b0-42ede2943e04)

5°) Trigger que atualiza a nota média de um curso com base nas avaliações:

![imagem_2024-06-10_001111013](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/78058cb0-c762-44ca-bb15-eb2535cf2dc1)

6°) Trigger que insere um bônus para o aluno se a nota da avaliação for maior que 8:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/713f442f-c684-4c54-8b1e-7e95a4cc6e8b)

7°) Trigger que atualiza o status de um monitor para ‘Ativo’:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/fb7ada6f-3380-4e9a-a3ed-4ae5f0909291)

8°) Trigger para calcular a multa com base na diferença entre a data de devolução e a data em que o livro foi realmente devolvido:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/35316c99-1154-4d7d-bdff-4593b285ab12)

CRIAÇÃO DE STORED PROCEDURE:

1°) Stored procedure para calcular a média das notas de um aluno:

![imagem_2024-06-09_233440479](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/2779a303-3dad-4da3-a1ac-b2217db6b410)

2°) Stored procedure para atualizar o saldo de um aluno após empréstimo:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/d802e3d7-edce-45eb-8c97-a9571fa1eb85)

3°) Stored procedure para registrar um novo livro no estoque:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/1297e2a5-6412-490a-a6de-2a2bd7468183)

4°) Stored procedure para calcular a media de notas em cada curso:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/375673ff-da21-429d-91df-b08bbf8e01cf)

5°) Stored procedure para verificar incrição dos alunos no curso:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/40bdfbee-afc8-4055-9a58-a2e2abf09e06)

6°) Stored procedure para registrar um novo trabalho enviado por aluno:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/785cdd4d-9328-4346-a1a5-39a711da6d01)


CRIAÇÃO DE VIEWS:

1°) View que mostra o número total de vendas por categoria de livro:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/e78f02ff-d8f8-441f-8a09-da1efa1feaa0)

2°) View que lista os alunos inscritos em um curso específico:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/974300b4-1048-4939-a3b5-9610df39ad77)

3°) View que exibe os detalhes de um trabalho específico:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/e516fe11-d394-4ab7-889d-257d7c271009)

4°) View de Livros Disponíveis para Empréstimo:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/332ad4e4-f9fa-436d-b4b2-677006e6c866)

5°) View de Estatísticas de Alunos:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/8af9e582-7f73-4c4e-92c7-808184cf19f7)

6°) View de Avaliações por Modalidade:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/fb14da26-01a9-4e79-8797-f8d14339a5c4)

CRIAÇÃO DE USUÁRIOS E CONCESSÃO E PERMISSÕES:

![image](https://github.com/LostRoses/Banco-de-dados-/assets/99661044/8fb75883-d3aa-472a-8b0b-3471593dc7ca)
