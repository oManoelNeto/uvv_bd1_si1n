--Apagando os banco de dados, e usuários existentes com os nomes que usaremos.
DROP DATABASE IF EXISTS uvv
;
DROP USER IF EXISTS manoel_neto
;

--Criando o usuário manoel_neto e atribuindo permissões de criar um banco de dados e de criar roles e dando uma senha criptografada para ele.
CREATE USER manoel_neto  WITH
CREATEDB
CREATEROLE
ENCRYPTED PASSWORD 'manoel'
;

--Se conectando ao usuário criado.
\c 'postgresql://manoel_neto:manoel@localhost/postgres'
;

--Criando o Banco de Dados "uvv" e atribuindo suas propriedades. 
CREATE DATABASE uvv WITH
OWNER =             'manoel_neto'
TEMPLATE =           template0
ENCODING =           UTF8
LC_COLLATE =        "pt_BR.UTF-8"
LC_CTYPE =          "pt_BR.UTF-8"
ALLOW_CONNECTIONS =  true
;

--Conectando-se ao Banco de Dados "uvv".
\c uvv
;
--Adicionando comentário para o Banco de Dados.
COMMENT ON DATABASE uvv IS 'Banco de Dados com todas as informações das Lojas UVV.'
;

--Criação do schema "lojas" com a autorização do usuário que criamos.
CREATE SCHEMA lojas
AUTHORIZATION manoel_neto
;

--Definição do esquema "lojas" como padrão.
SET SEARCH_PATH TO lojas, "$USER", public
;

--Definição do esquema "lojas" como padrão de forma permanente.
ALTER USER manoel_neto
SET SEARCH_PATH TO lojas, "$USER", public   
;

--Criação da tabela "produtos"
CREATE TABLE produtos (
                produto_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                preco_unitario NUMERIC(10,2),
                detalhes BYTEA,
                imagem BYTEA,
                imagem_mime_type VARCHAR(512),
                imagem_arquivo VARCHAR(512),
                imagem_charset VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT pk_produtos PRIMARY KEY (produto_id)
);
--Adicionando os comentários na tabela "produtos" e em suas colunas.
COMMENT ON TABLE produtos IS 'Essa tabela mostrará todas as informações sobre os produtos presentes em cada loja.';
COMMENT ON COLUMN produtos.produto_id IS 'Essa coluna mostrará a identificação de cada produto presente nas lojas.';
COMMENT ON COLUMN produtos.nome IS 'Essa coluna mostrará o nome de cada produto presente nas lojas.';
COMMENT ON COLUMN produtos.preco_unitario IS 'Está coluna mostrará o preço unitário de cada produto pertencente as lojas.';
COMMENT ON COLUMN produtos.detalhes IS 'Essa coluna mostrará os detalhes de cada produto.';
COMMENT ON COLUMN produtos.imagem IS 'Essa coluna mostrará as imagens de cada produto.';
COMMENT ON COLUMN produtos.imagem_mime_type IS 'Coluna que mostrará  o id da mídia da imagem dos produtos.';
COMMENT ON COLUMN produtos.imagem_arquivo IS 'Coluna que mostrará o arquivo de cada imagem de cada produto.';
COMMENT ON COLUMN produtos.imagem_charset IS 'Coluna que mostrará o charset da imagem de cada produto.';
COMMENT ON COLUMN produtos.imagem_ultima_atualizacao IS 'Coluna que mostrará a última atualização de  cada imagem dos produtos.';

--Criação da tabela "lojas".
CREATE TABLE lojas (
                loja_id NUMERIC(38) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                endereco_web VARCHAR(100),
                endereco_fisico VARCHAR(512),
                latitude NUMERIC,
                longitude NUMERIC,
                logo BYTEA,
                logo_mime_type VARCHAR(512),
                logo_arquivo VARCHAR(512),
                logo_charset VARCHAR(512),
                logo_ultima_atualizacao DATE,
                CONSTRAINT pk_lojas PRIMARY KEY (loja_id)
);

--Adicionando os comentários na tabela "lojas" e em suas colunas.
COMMENT ON TABLE lojas IS 'Tabela que mostrará todas as informações sobre as lojas.';
COMMENT ON COLUMN lojas.loja_id IS 'Coluna que mostrará a identificação de cada loja UVV. É a chave primária da tabela "lojas".';
COMMENT ON COLUMN lojas.nome IS 'Coluna que mostrará o nome de cada Loja UVV.';
COMMENT ON COLUMN lojas.endereco_web IS 'Coluna que mostrará os endereços eletrônicos de cada loja caso exista.';
COMMENT ON COLUMN lojas.endereco_fisico IS 'Coluna que mostrará o endereço físico de cada loja caso exista.';
COMMENT ON COLUMN lojas.latitude IS 'Coluna que mostrará a latitude onde cada loja está localizada.';
COMMENT ON COLUMN lojas.longitude IS 'Coluna que mostrará a longitude onde cada loja está localizada.';
COMMENT ON COLUMN lojas.logo IS 'Essa coluna mostrará a logo de cada loja.';
COMMENT ON COLUMN lojas.logo_mime_type IS 'Coluna que mostrará  o id da mídia da logo das lojas.';
COMMENT ON COLUMN lojas.logo_arquivo IS 'Coluna que mostrará o arquivo da logo das lojas.';
COMMENT ON COLUMN lojas.logo_charset IS 'Coluna que mostrará o charset das logos das lojas.';
COMMENT ON COLUMN lojas.logo_ultima_atualizacao IS 'Essa coluna mostra a última atualização feita na logo da loja.';

--Criação da tabela "estoques".
CREATE TABLE estoques (
                estoque_id NUMERIC NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT pk_estoques PRIMARY KEY (estoque_id)
);

--Adicionando os comentários na tabela "estoques" e em suas colunas.
COMMENT ON TABLE estoques IS 'Essa Tabela mostrará o estoque de cada produto, junto com sua identificação, a identificação de cada loja, a identificação de cada produto e a sua quantidade.';
COMMENT ON COLUMN estoques.estoque_id IS 'Essa coluna mostrará a idenficação de cada estoque referente a cada loja.';
COMMENT ON COLUMN estoques.loja_id IS 'essa coluna mostrará a identificação de cada loja.';
COMMENT ON COLUMN estoques.produto_id IS 'Essa coluna mostrará a identificação de cada produto.';
COMMENT ON COLUMN estoques.quantidade IS 'Essa coluna mostrará a quantidade de cada produto presente nas lojas.';

--Criação da tabela "clientes".
CREATE TABLE clientes (
                cliente_id NUMERIC(38) NOT NULL,
                email VARCHAR(255) NOT NULL,
                nome VARCHAR(255) NOT NULL,
                telefone1 VARCHAR(20),
                telefone2 VARCHAR(20),
                telefone3 VARCHAR(20),
                CONSTRAINT pk_clientes PRIMARY KEY (cliente_id)
);

--Adicionando os comentários na tabela "clientes" e em suas colunas.
COMMENT ON TABLE clientes IS 'Tabela que mostrará a identificação, o email, o nome e os telefones de cada cliente.';
COMMENT ON COLUMN clientes.cliente_id IS 'Essa coluna mostra a identificação dos clientes. É a chave primária da tabela "clientes".';
COMMENT ON COLUMN clientes.email IS 'Coluna que mostrará os e-mails dos usuários.';
COMMENT ON COLUMN clientes.nome IS 'Coluna que mostrará os nomes dos usuários.';
COMMENT ON COLUMN clientes.telefone1 IS 'Coluna que mostrará o primeiro telefone dos clientes da loja.';
COMMENT ON COLUMN clientes.telefone2 IS 'Coluna que mostrará o segundo telefone cadastrado dos clientes.';
COMMENT ON COLUMN clientes.telefone3 IS 'Coluna que mostrará o terceiro telefone cadastrado dos clientes da loja.';

--Criação da tabela "envios".
CREATE TABLE envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT pk_envios PRIMARY KEY (envio_id)
);

--Adicionando os comentários na tabela "envios" e em suas colunas.
COMMENT ON TABLE envios IS 'Tabela que mostrará a identificação de cada envio,  a loja onde cada pedido foi feito, a identificação de cada cliente, o endereço para envio e o status do envio.';
COMMENT ON COLUMN envios.envio_id IS 'Coluna que mostrará a identificação de cada envio. É a chave primária da tabela "envios"';
COMMENT ON COLUMN envios.loja_id IS 'Coluna que mostrará a identificação de cada loja.';
COMMENT ON COLUMN envios.cliente_id IS 'Coluna que mostrará a identificação de cada cliente que tenha um envio.';
COMMENT ON COLUMN envios.endereco_entrega IS 'Coluna que mostrará o endereço para entrega de cada pedido feito na loja.';
COMMENT ON COLUMN envios.status IS 'Coluna que mostrará o status dos envios realizados pela loja.';

--Criação da tabela "pedidos".
CREATE TABLE pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pk_pedidos PRIMARY KEY (pedido_id)
);

--Adicionando os comentários na tabela "pedidos" e em suas colunas.
COMMENT ON TABLE pedidos IS 'Tabela que mostrará a identificação de cada pedido, a data e a hora que foram feitos cada pedido, a identificação de cada cliente que fez um pedido, o status do pedido e a identificação de loja em que foi feito o pedido.';
COMMENT ON COLUMN pedidos.pedido_id IS 'Coluna que mostrará a identificação dos pedidos feitos pelos clientes na loja. É a chave primária da tabela "pedidos".';
COMMENT ON COLUMN pedidos.data_hora IS 'coluna que mostrará a data e a hora em que cada pedido foi feito na loja.';
COMMENT ON COLUMN pedidos.cliente_id IS 'Coluna que mostrará a identificação de cada cliente que tenha realizado um pedido na loja.';
COMMENT ON COLUMN pedidos.status IS 'Coluna que mostra o status atual do pedido feito pelos clientes da loja.';
COMMENT ON COLUMN pedidos.loja_id IS 'Coluna que mostra a identificação de cada loja em que tenha sido realizado algum pedido.';

--Criação da tabela "pedidos_itens".
CREATE TABLE pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                CONSTRAINT pk_pedidos_itens PRIMARY KEY (pedido_id, produto_id)
);

--Adicionando os comentários na tabela "pedidos_itens" e em suas colunas.
COMMENT ON TABLE pedidos_itens IS 'Essa tabela mostrará todos os pedidos dos itens feitos na loja.';
COMMENT ON COLUMN pedidos_itens.pedido_id IS 'Esse coluna mostrará a identificação de cada pedido.';
COMMENT ON COLUMN pedidos_itens.produto_id IS 'Essa coluna mostrará a identificação de cada produto.';
COMMENT ON COLUMN pedidos_itens.numero_da_linha IS 'Essa coluna mostrará o número da linha de cada pedido feito.';
COMMENT ON COLUMN pedidos_itens.preco_unitario IS 'Essa coluna mostrará o preço unitário de cada pedido feito.';
COMMENT ON COLUMN pedidos_itens.quantidade IS 'Essa coluna mostrará a quantidade de cada pedido feito nas lojas.';
COMMENT ON COLUMN pedidos_itens.envio_id IS 'Essa coluna mostrará a identificação de cada envio feito nas lojas.';

--Adição da FK "produto_id" da tabela "produtos" à tabela "estoques", criando um relacionamento não identificado.
ALTER TABLE estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "produto_id" da tabela "produtos" à tabela "pedidos_itens", criando um relacionamentoidentificado.
ALTER TABLE pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "loja_id" da tabela "lojas" à tabela "pedidos", criando um relacionamento não
--identificado.
ALTER TABLE pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "loja_id" da tabela "lojas" à tabela "envios", criando um relacionamento não
--identificado.
ALTER TABLE envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "loja_id" da tabela "lojas" à tabela "estoques", criando um relacionamento não
--identificado.
ALTER TABLE estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "cliente_id" da tabela "clientes" à tabela "pedidos", criando um relacionamento não identificado.
ALTER TABLE pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "cliente_id" da tabela "clientes" à tabela "envios", criando um relacionamento não
--identificado.
ALTER TABLE envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "envio_id" da tabela "envios" à tabela "pedidos_itens", criando um relacionamento não identificado.
ALTER TABLE pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Adição da FK "pedido_id" da tabela "pedidos" à tabela "pedidos_itens", criando um relacionamento
--identificao.
ALTER TABLE pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

--Criando as restrições.
--Restrição para os status dos pedidos.
ALTER TABLE pedidos
ADD CONSTRAINT cc_pedidos_status
CHECK(status in ('CANCELADO','COMPLETO','ABERTO','PAGO','REEMBOLSADO','ENVIADO'))
;

--Restrição para os status dos envios.
ALTER TABLE envios
ADD CONSTRAINT cc_envios_status
CHECK(status in ('CRIADO','ENVIADO','TRANSITO','ENTREGUE'))
;

--Restrição para que não seja aceito um valor negativo no preço unitário dos produtos.
ALTER TABLE produtos
ADD CONSTRAINT cc_produtos_preco_unitario
CHECK(preco_unitario >= 0)
;

--Restrição para que não seja aceito um valor negativo no preço unitário dos pedidos dos itens.
ALTER TABLE pedidos_itens
ADD CONSTRAINT cc_pedidos_itens_preco_unitario
CHECK(preco_unitario >=0)
;

--Restrição para que não seja aceito uma quantidade negativa de estoques.
ALTER TABLE estoques
ADD CONSTRAINT cc_estoques_quantidade
CHECK(quantidade >=0)
;

--Restrição para que não seja aceito uma quantidade negativa de pedidos dos itens.
ALTER TABLE pedidos_itens
ADD CONSTRAINT cc_pedidos_itens_quantidade
CHECK(quantidade >=0)
;

--Restrição para que pelo menos um dos endereços tenham que ser preenchidos obrigatoriamente.
ALTER TABLE lojas
ADD CONSTRAINT cc_lojas_endereco_fisico
CHECK ((endereco_web IS NOT NULL) OR (endereco_fisico IS NOT NULL))
;

