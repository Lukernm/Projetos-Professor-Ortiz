create database bdClinica;

use bdClinica;

create table convenios(
codigo_CONVENIO int auto_increment not null primary key,
nome_CONVENIO varchar(30) not null,
telefone_CONVENIO varchar(13) not null
);

create table pacientes(
cpf_PACIENTE varchar(11) not null primary key,
rg_PACIENTE VARCHAR(9) nOT nUlL,
numeroCartao_PACIENTE varchar(30) not null,
nome_PACIENTE varchar(120) not null,
dataNascimento_PACIENTE date not null,
tipoSanguineo_PACIENTE varchar(2),
endereco_PACIENTE varchar(120) not null,
bairro_PACIENTE varchar(60) not null,
cidade_PACIENTE varchar(60) not null,
estado_PACIENTE varchar(2) not null,
telefone_PACIENTE varchar(11) not null,
email_PACIENTE varchar(120)
);

create table salas(
codigo_SALA varchar(4) not null primary key,
bloco_SALA varchar(1) not null,
andar_SALA int not null,
numero_SALA int not null
);

create table especialidades(
  codigo_ESPECIALIDADE int auto_increment not null primary key,
  nome_ESPECIALIDADE varchar(30) not null
);


create table medicos(
crm_MEDICO varchar(7) not null primary key,
cpf_MEDICO varchar(11) not null,
rg_MEDICO VARCHAR(9) nOT nUlL,
nome_MEDICO varchar(120) not null,
dataNascimento_MEDICO date not null,
endereco_MEDICO varchar(120) not null,
bairro_MEDICO varchar(60) not null,
cidade_MEDICO varchar(60) not null,
estado_MEDICO varchar(2) not null,
telefone_MEDICO varchar(11) not null,
email_MEDICO varchar(120),
codigoEspecialidade_MEDICO int not null,
FOREIGN KEY (codigoEspecialidade_MEDICO) REFERENCES especialidades(codigo_ESPECIALIDADE)
);

create table planos(

	codigoConvenio_PLANO int not null,

	cpfPaciente_PLANO varchar(11) not null,

	numeroCartaoPaciente_PLANO varchar(30) not null,

	descricao_PLANO varchar(100) not null,

	PRIMARY KEY(codigoConvenio_PLANO,cpfPaciente_PLANO)

);

create table tipossalas(
codigo_TIPOSALA int auto_increment not null primary key,
descricao_TIPOSALA varchar(100) not null
);

create table laboratorios(
	codigo_LABORATORIO int auto_increment not null primary key,
	nome_LABORATORIO varchar(60) not null	
);


create table medicamentos(
	codigo_MEDICAMENTO int auto_increment not null primary key,
	nome_MEDICAMENTO varchar(60) not null,
	descricao_MEDICAMENTO varchar(120)
);

create table LOTES(
	codigoMedicamento_LOTE int not null,
	codigoLaboratorio_LOTE int not null,
	dataValidade_LOTE date not null,
	PRIMARY KEY(codigoMedicamento_LOTE, codigoLaboratorio_LOTE)
);


create table tiposexames(
	codigo_TIPOEXAME int auto_increment not null primary key,
	nome_TIPOEXAME varchar(100) not null
);



create table materiais(
	codigo_MATERIAL int auto_increment not null primary key,
	nome_MATERIAL varchar(100) not null,
	descricao_MATERIAL varchar (120) not null,
	quantidade_MATERIAL int not null
); 



create table cargos(
	codigo_CARGO int auto_increment not null primary key,
	nome_CARGO varchar(100) not null
);

create table departamentos(
	codigo_DEPARTAMENTO int auto_increment not null primary key,
	nome_DEPARTAMENTO varchar(100) not null
);

create table funcionarios(
	registro_FUNCIONARIO varchar(7) not null primary key,
	cpf_FUNCIONARIO varchar(11) not null,
	rg_FUNCIONARIO VARCHAR(9) nOT nUlL,
	nome_FUNCIONARIO varchar(120) not null,
	dataNascimento_FUNCIONARIO date not null,
	endereco_FUNCIONARIO varchar(120) not null,
	bairro_FUNCIONARIO varchar(60) not null,
	cidade_FUNCIONARIO varchar(60) not null,
	estado_FUNCIONARIO varchar(2) not null,
	telefone_FUNCIONARIO varchar(11) not null,
	email_FUNCIONARIO varchar(120)
);




create table exames(
	codigo_EXAME int not null auto_INCREMENT primary key,
	cpfPaciente_EXAME varchar(11) not null,
	codigoTipo_EXAME int not null,
	crmMedico_EXAME varchar(7) not null,
	codigoSala_EXAME varchar(4) not null,
	data_EXAME datetime not null,

	FOREIGN KEY(cpfPaciente_EXAME) REFERENCES pacientes(cpf_PACIENTE),
	FOREIGN KEY(codigoTIPO_EXAME) REFERENCES tiposexames(codigo_TIPOEXAME),
	FOREIGN KEY(crmMedico_EXAME) REFERENCES medicos(crm_MEDICO),
	FOREIGN KEY(codigoSala_EXAME) REFERENCES salas(codigo_SALA)
	
);

create table visitantes(
	cpf_VISITANTE varchar(11) not null primary key,
	rg_VISITANTE VARCHAR(9) nOT nUlL,
	numeroCartao_VISITANTE varchar(30) not null,
	nome_VISITANTE varchar(120) not null,
	endereco_VISITANTE varchar(120) not null,
	bairro_VISITANTE varchar(60) not null,
	cidade_VISITANTE varchar(60) not null,
	estado_VISITANTE varchar(2) not null,
	telefone_VISITANTE varchar(11) not null,
	cpfPaciente_VISITANTE varchar(11) not null,

FOREIGN KEY (cpfPaciente_VISITANTE) REFERENCES pacientes(cpf_PACIENTE)

);


create table visitas(
	codigo_VISITA int auto_increment not null primary key,
	cpfVisitante_VISITA varchar(11) not null,
	cpfPaciente_VISITA varchar(11) not null,
	data_VISITA datetime not null
);

create table equipes(
	registroCirurgia_EQUIPE int not null,
	crmMedico_EQUIPE varchar(7) not null,
	funcao_EQUIPE varchar(50) not null,
	PRIMARY KEY(registroCirurgia_EQUIPE, crmMedico_EQUIPE)
);


create table agenda(
	codigo_AGENDA int auto_increment not null primary key,
	codigoInternacao_AGENDA int not null,
	registro_AGENDA varchar(100) not null,
	dataRegistro_AGENDA datetime not null
);



create table acompanhantes(
	cpf_ACOMPANHANTE varchar(11) not null primary key,
	rg_ACOMPANHANTE VARCHAR(9) nOT nUlL,
	numeroCartao_ACOMPANHANTE varchar(30) not null,
	nome_ACOMPANHANTE varchar(120) not null,
	endereco_ACOMPANHANTE varchar(120) not null,
	bairro_ACOMPANHANTE varchar(60) not null,
	cidade_ACOMPANHANTE varchar(60) not null,
	estado_ACOMPANHANTE varchar(2) not null,
	telefone_ACOMPANHANTE varchar(11) not null,
	cpfPaciente_ACOMPANHANTE varchar(11) not null,

FOREIGN KEY (cpfPaciente_ACOMPANHANTE) REFERENCES pacientes(cpf_PACIENTE)

);

create table consultas(
	registro_CONSULTA int auto_increment not null primary key,
	data_CONSULTA date not null,
	hora_CONSULTA date not null,
	diagnostico_CONSULTA text not null, 
	cpfPaciente_CONSULTA varchar(11) not null,
	crmMedico_CONSULTA varchar(7) not null,
	codigoSala_CONSULTA varchar(4) not null,

	FOREIGN KEY (cpfPaciente_CONSULTA) references pacientes(cpf_PACIENTE),
	FOREIGN KEY (crmMedico_CONSULTA) references medicos(crm_MEDICO),
	FOREIGN KEY (codigoSala_CONSULTA) references salas(codigo_SALA)

);


create table medicacoes(
	cpfPaciente_MEDICACAO varchar(11) not null,
	codigoMedicamento_MEDICACAO int not null,
	registroConsulta_MEDICACAO int not null, 
	codigoSala_MEDICACAO varchar(4) not null,
	data_MEDICACAO datetime not null,

	PRIMARY KEY(cpfPaciente_MEDICACAO,codigoMedicamento_MEDICACAO),
	FOREIGN KEY(registroConsulta_MEDICACAO) REFERENCES consultas(registro_CONSULTA),
	FOREIGN KEY(codigoSala_MEDICACAO) REFERENCES salas(codigo_SALA)
	
);

create table internacoes(
	registro_INTERNACAO int auto_increment not null primary key,
	data_INTERNACAO datetime not null,
	cpfPaciente_INTERNACAO varchar(11) not null,
	crmMedico_INTERNACAO varchar(7) not null,
	codigoSala_INTERNACAO varchar(4) not null,

	FOREIGN KEY (cpfPaciente_INTERNACAO) references pacientes(cpf_PACIENTE),
	FOREIGN KEY (crmMedico_INTERNACAO) references medicos(crm_MEDICO),
	FOREIGN KEY (codigoSala_INTERNACAO) references salas(codigo_SALA)

);

create table cirurgias(
	registro_CIRURGIA int auto_increment not null primary key,
	data_CIRURGIA datetime not null,	
	procedimento_CIRURGIA text not null, 
	observacoes_CIRURGIA text not null, 
	cpfPaciente_CIRURGIA varchar(11) not null,
	crmMedico_CIRURGIA varchar(7) not null,
	codigoSala_CIRURGIA varchar(4) not null,

	FOREIGN KEY (cpfPaciente_CIRURGIA) references pacientes(cpf_PACIENTE),
	FOREIGN KEY (codigoSala_CIRURGIA) references salas(codigo_SALA)

);

create table obitos(
	registro_OBITO int auto_increment not null primary key,
	data_OBITO date not null,
	hora_OBITO date not null,
	causa_OBITO text not null, 
	cpfPaciente_OBITO varchar(11) not null,
	crmMedico_OBITO varchar(7) not null,

	FOREIGN KEY (cpfPaciente_OBITO) references pacientes(cpf_PACIENTE),
	FOREIGN KEY (crmMedico_OBITO) references medicos(crm_MEDICO)

);

create table receitas(
	codigo_RECEITA int auto_INCREMENT not null primary key,
	prescricao_RECEITA text not null,
	registroConsulta_RECEITA int not null,

	FOREIGN KEY(registroConsulta_RECEITA) REFERENCES consultas(registro_CONSULTA)

);
