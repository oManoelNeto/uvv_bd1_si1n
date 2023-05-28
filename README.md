# Banco de Dados, Pset-1
* **Nome do Aluno:** Manoel Furtado Gomes Neto
* **Nome do Professor:** Abrantes Araújo Silva Filho
* **Nome da Monitora:** Suellen Miranda

> Atividade Avaliativa Realizada na disciplina de Design e Desenvolvimento de Banco de Dados 1 pelo curso de Sistemas de Informação na Universidade Vila Velha.

## PSET
Um Problem Set (PSET) é um conjunto de tarefas difíceis que o forçam a estudar e realmente compreender a matéria. O PSET realizado consiste em recriar um projeto lógico utilizando o SQL Power Architect, e a partir dele, implementar um banco de dados no PostgreSQL.

### Informações
* Software utilizado para criação do projeto lógico: SQL Power Architect
* Software utilizado para codificação e criação do Banco de Dados: EMACs
* SGBD = PostgreSQL
* Banco de Dados = uvv
* Esquema Lógico = Lojas

## Implementação do Projeto Lógico
Para recriar o projeto lógico que nos foi passado, utilizei o **SQL Power Architect**, e a partir dele, recriei todas as tabelas, colunas e seus atributos, adicionando comentários, de modo a facilitar o entendimento de cada tabela e coluna, também foi criado chaves primárias, chaves estrangeiras, chaves compostas, cardinalidades e relacionamentos. Com isso, foram gerados os seguintes arquivos:

* **[arquivo.architect](https://github.com/oManoelNeto/uvv_bd1_si1n/blob/main/pset1/si1n_202306103_postgresql.architect)** -> código do diagrama gerado pelo SQL Power Architect.
* **[arquivo.pdf](https://github.com/oManoelNeto/uvv_bd1_si1n/blob/main/pset1/si1n_202307958_postgresql.pdf)** -> imagem do diagrama gerado pelo SQL Power Architect.

## Implementação do Banco de Dados
 Para a implementação do Banco de Dados, eu transferi o código gerado pelo **SQL Power Architect** para o **EMACs**, em seguida, adicionei códigos SQL para a criação e implementação   do Banco de Dados, adicionando comentários em cada um deles, de modo à facilitar o entendimento do procedimento realizado para a criação do Banco de Dados para qualquer pessoa. Com isso foi gerado o seguinte arquivo:
 * **[arquivo.sql](https://github.com/oManoelNeto/uvv_bd1_si1n/blob/main/pset1/si1n_202306103_postgresql.sql)** -> script sql
 
 
 Todos os códigos usados para a criação do banco de dados estão na tabela abaixo.
 
 ### Comandos Utilizados 
 
 
 | Sintaxe                | Função                     |
|---------------------    |----------------------------|
| DROP DATABASE IF EXISTS | Apagar Banco de Dados existente |
| DROP USER IF EXISTS     | Apagar Usuário existente   |
| DROP SCHEMA IF EXISTS   | Apagar Esquema existente   |
| CREATE DATABASE         | Criar Banco de Dados       |
| CREATE USER             | Criar Usuário              |
| SET ROLE                | Define o Usuário Corrente  |
| SET SEARCH_PATH         | Alterar o Esquema Padrão   |
| CREATE TABLE            | Criar Tabela               |
| CREATE SCHEMA           | Criar Esquema Lógico       |
| ALTER TABLE             | Alterar tabela             |
| ADD CONSTRAINT          | Adicionar Restrição        |
| COMMENT ON COLUMN       | Comando de Checagem        |
| COMMENT ON DATABASE     | Comentar Banco de Dados    |
| COMMENT ON TABLE        | Comentar Tabela            |
| COMMENT ON COLUMN       | Comentar Coluna            |

* Caso queira testar o script no seu terminal linux, é só digitar o seguinte comando

```
psql -U postgres < si1n_202307958_postgresql
```

 ## Finalização da PSET
 
 Após corrigir e testar o script diversas vezes para ter certeza de que não haveria nenhum erro em sua execução, foi estudado sobre **Git/GitHub** com o intuito de aprender melhor sobre Sistemas de Controle de Versões e sobre a plataforma de hospedagem para projetos git, o GitHub. Após aprender sobre o conteúdo estudado e enviar os arquivos da atividade pro GitHub, por fim, estudei sobre **Flavored Markdown** para aprender a documentar tudo o que eu fiz nessa atividade.
 
