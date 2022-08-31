create database varejo;


create table produtos(
       produto_id       integer not null,
       descricao        varchar(200) not null,
       preco            numeric(8,2),
       tipo             varchar(50),
       tamanho          integer,
       unidade          varchar(10),
       quantidade_estoque integer not null,   
       constraint pk_produtos primary key (produto_id)
);

create table operacao(
       operacao_id integer not null,
       data_operacao date not null,
       operacao_tipo varchar(30),
       constraint pk_operacao primary key (operacao_id)
);


create table produto_operacao(
       produto_id integer not null,
       operacao_id integer not null,
       quantidade_operacao integer not null,
       constraint pk_produto_operacao primary key (produto_id, operacao_id),

       constraint fk_produto_operacao_produtos foreign key (produto_id) references produtos(produto_id),
       
       constraint fk_produto_operacao_operacao foreign key  (operacao_id) references operacao(operacao_id)
);


insert into produtos(produto_id, descricao, preco, tipo, tamanho, unidade, quantidade_estoque) 
values
       (1, 'cerveja brahma lata', 4.00, 'bebida', 350, 'ml', 50),
       (2, 'cerveja heineken lata', 4.50, 'bebida', 350, 'ml', 50),
       (3, 'cerveja skol lata', 4.00, 'bebida', 350, 'ml', 50),
       (4, 'cerveja amstel lata', 4.00, 'bebida', 350, 'ml', 50),
       (5, 'refrigerante coca cola lata', 4.00, 'bebida', 350, 'ml', 100),
       (6, 'refrigerante guarana lata', 4.00, 'bebida', 350, 'ml', 100),
       (7, 'refrigerante pepsi lata', 4.00, 'bebida', 350, 'ml', 100),
       (8, 'chocolate trento avelã', 2.00, 'comida', 40, 'g', 30),
       (9, 'chocolate trento duo', 2.00, 'comida', 40, 'g', 30),
       (10, 'agua sem  gas', 3.00, 'bebida', 500, 'ml', 100),
       (11, 'agua com  gas', 3.00, 'bebida', 500, 'ml', 100);


insert into operacao(operacao_id, data_operacao, operacao_tipo) 
values
       (1, '10/01/2022', 'entrada'),
       (2, '11/01/2022', 'entrada'),
       (3, '12/01/2022', 'entrada'),
       (4, '13/01/2022', 'entrada'),
       (5, '04/02/2022', 'saída'),
       (6, '05/02/2022', 'saída'),
       (7, '10/02/2022', 'saída'),
       (8, '11/02/2022', 'saída'),
       (9, '16/02/2022', 'saída'),
       (10, '28/02/2022', 'entrada');

insert into produto_operacao(produto_id, operacao_id, quantidade_operacao)
values
       (4, 10, 100),
       (6, 1, 200),
       (8, 5, 50),
       (3, 8, 30),
       (7, 4, 100),
       (9, 2, 250),
       (2, 6, 180),
       (8, 9, 250),
       (5, 7, 20),
       (11, 3, 40);