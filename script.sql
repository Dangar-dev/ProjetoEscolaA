-- CRIANDO O BANCO DE DADOS

create database bdescola;

-- USANDO O BANCO DE DADOS 

use bdEscola;

-- Criando as tabelas do Banco

create table Aluno
(
CodAluno int primary key auto_increment,
NomeAluno varchar(50) not null,
Idade int not null
);

create table Responsavel
(
CodResp int primary key auto_increment,
CodAluno int,
NomeResp varchar(40) not null,
foreign key(CodAluno) references Aluno(CodAluno)
);

create  table Funcionario(
CodFuncionario int primary key auto_increment,
NomeFuncionario varchar(40),
Telefone varchar(20)
);

-- Inserindo dados na tabela

insert into Aluno(NomeAluno, Idade) values
('Huguinho',15),
('Zezinho',15),
('Luizinho',17),
('Marcinho',19);

insert into Responsavel(CodAluno,NomeResp)values
(1,'Marinha'),
(2,'Joao'),
(3,'Juliana'),
(4,'Marcos');



-- Consultando as tabelas do banco

select * from Aluno;
select * from Responsavel;
select * from Funcionario;

-- Selecione todos os responsaveis com o nome do aluno

select r.CodResp , r.NomeResp as Nome_Responsavel,a.NomeAluno as Nome_Aluno
from Responsavel r
inner join Aluno a on r.CodAluno = a.CodAluno;


-- CADASTRANDO O FUNCIONARIO COM PROCEDURE

Delimiter $$
	create procedure AdicionarFuncionario(
		IN nomeFuncionario varchar(40),
		IN telefone varchar(20)
    )
	begin
		insert into Funcionario(NomeFuncionario,Telefone) 
        values (nomeFuncionario,telefone);
        
    end $$

Delimiter ;

call AdicionarFuncionario ('Cidade','(11)12345-6789');
call AdicionarFuncionario ('Folginho','(11)12344-6789');
call AdicionarFuncionario ('Pedrin','(11)12346-6789');
call AdicionarFuncionario ('inhonho','(11)12347-6789');
call AdicionarFuncionario ('Daniel','(11)4002-8922');


-- Consultar todos os funcionarios
Delimiter $$
	create  procedure BuscarFuncionario()
    Begin 
		select Telefone 
        from Funcionario;
    End $$
Delimiter ;

-- Executando a procedures

call BuscarFuncionario;

-- Consultar quantos funcionario existem

Delimiter $$ 
	create procedure TotalFuncionarios(OUT Total int)
    begin 
		select count(*) into Total
        from Funcionario;
    end $$
Delimiter ;

call TotalFuncionarios(@Total_Funcionarios);
select @Total_Funcionarios;


-- verifica se uma tabela ja existe 

Delimiter $$
 create procedure VerificarTabele()
 begin
 If not exists (select 1 from information_schema.tables where table_schema = database() and table_name = 'Funcionario') then
		create table Funcionario(
        CodFuncionario int primary key auto_increment,
		NomeFuncionario varchar(40),
		Telefone varchar(20)
        );
        select 'Tabela Funcionario criada com sucesso' AS Mensagem;
        Else
        select 'Tabela funcionario ja existe' As Mensagem;
        end if;
 end $$
Delimiter ; 

call VerificarTabele;
 
-- Consulta todas as procedures criadas;
show procedure status;