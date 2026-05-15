SET NAMES 'utf8mb4';
SET CHARACTER SET utf8mb4;
SET COLLATION_CONNECTION = 'utf8mb4_unicode_ci';

-- Create Alunos table
CREATE TABLE Alunos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    MATRICULA VARCHAR(50),
    Nome VARCHAR(100),
    Idade INT,
    Genero VARCHAR(10),
    Bairro VARCHAR(100),
    Endereco VARCHAR(255),
    DataCriacao DATETIME
);

-- Create Materias table
CREATE TABLE Materias (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Descricao VARCHAR(255),
    Professor VARCHAR(100),
    DataCriacao DATETIME
);

-- Create Notas table
CREATE TABLE Notas (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    ALUNOID INT,
    MATERIAID INT,
    Nota DECIMAL(5, 2),
    DataCriacao DATETIME,
    FOREIGN KEY (ALUNOID) REFERENCES Alunos(ID),
    FOREIGN KEY (MATERIAID) REFERENCES Materias(ID)
);

-- Insert sample data into Alunos table
-- Insert sample data into Alunos table
INSERT INTO Alunos (MATRICULA, Nome, Idade, Genero, Bairro, Endereco, DataCriacao) VALUES
('001', 'João Silva', 25, 'Masculino', 'Centro', 'Rua A', NOW()),
('002', 'Maria Santos', 22, 'Feminino', 'Vila Nova', 'Rua B', NOW()),
('003', 'Pedro Oliveira', 24, 'Masculino', 'Jardim Primavera', 'Rua C', NOW()),
('004', 'Ana Pereira', 23, 'Feminino', 'Bairro Novo', 'Rua D', NOW()),
('005', 'Lucas Almeida', 26, 'Masculino', 'Cidade Alta', 'Rua E', NOW()),
('006', 'Mariana Costa', 21, 'Feminino', 'Vila Velha', 'Rua F', NOW()),
('007', 'Gustavo Rodrigues', 24, 'Masculino', 'Centro', 'Rua G', NOW()),
('008', 'Camila Ferreira', 23, 'Feminino', 'Vila Nova', 'Rua H', NOW()),
('009', 'Rafael Souza', 22, 'Masculino', 'Jardim Primavera', 'Rua I', NOW()),
('010', 'Larissa Santos', 25, 'Feminino', 'Bairro Novo', 'Rua J', NOW()),
('011', 'Guilherme Lima', 26, 'Masculino', 'Cidade Alta', 'Rua K', NOW()),
('012', 'Isabela Gomes', 21, 'Feminino', 'Vila Velha', 'Rua L', NOW()),
('013', 'Enzo Martins', 24, 'Masculino', 'Centro', 'Rua M', NOW()),
('014', 'Laura Oliveira', 23, 'Feminino', 'Vila Nova', 'Rua N', NOW()),
('015', 'Felipe Costa', 22, 'Masculino', 'Jardim Primavera', 'Rua O', NOW()),
('016', 'Manuela Pereira', 25, 'Feminino', 'Bairro Novo', 'Rua P', NOW()),
('017', 'Arthur Almeida', 21, 'Masculino', 'Cidade Alta', 'Rua Q', NOW()),
('018', 'Sophia Rodrigues', 24, 'Feminino', 'Vila Velha', 'Rua R', NOW()),
('019', 'Bernardo Ferreira', 23, 'Masculino', 'Centro', 'Rua S', NOW()),
('020', 'Valentina Souza', 22, 'Feminino', 'Vila Nova', 'Rua T', NOW()),
('021', 'Davi Santos', 25, 'Masculino', 'Jardim Primavera', 'Rua U', NOW()),
('022', 'Helena Lima', 21, 'Feminino', 'Bairro Novo', 'Rua V', NOW()),
('023', 'Gabriel Gomes', 24, 'Masculino', 'Cidade Alta', 'Rua W', NOW()),
('024', 'Lorena Oliveira', 23, 'Feminino', 'Vila Velha', 'Rua X', NOW()),
('025', 'Samuel Costa', 22, 'Masculino', 'Centro', 'Rua Y', NOW()),
('026', 'Isabella Martins', 25, 'Feminino', 'Vila Nova', 'Rua Z', NOW()),
('027', 'Matheus Ferreira', 21, 'Masculino', 'Jardim Primavera', 'Rua 1', NOW()),
('028', 'Giovanna Souza', 24, 'Feminino', 'Bairro Novo', 'Rua 2', NOW()),
('029', 'Bernardo Lima', 23, 'Masculino', 'Cidade Alta', 'Rua 3', NOW()),
('030', 'Luiza Gomes', 22, 'Feminino', 'Vila Velha', 'Rua 4', NOW()),
('031', 'Enzo Oliveira', 25, 'Masculino', 'Centro', 'Rua 5', NOW()),
('032', 'Beatriz Costa', 21, 'Feminino', 'Vila Nova', 'Rua 6', NOW()),
('033', 'Pedro Martins', 24, 'Masculino', 'Jardim Primavera', 'Rua 7', NOW()),
('034', 'Lara Ferreira', 23, 'Feminino', 'Bairro Novo', 'Rua 8', NOW()),
('035', 'Miguel Souza', 22, 'Masculino', 'Cidade Alta', 'Rua 9', NOW()),
('036', 'Heloísa Lima', 25, 'Feminino', 'Vila Velha', 'Rua 10', NOW()),
('037', 'Heitor Gomes', 21, 'Masculino', 'Centro', 'Rua 11', NOW()),
('038', 'Lívia Oliveira', 24, 'Feminino', 'Vila Nova', 'Rua 12', NOW()),
('039', 'Gustavo Costa', 23, 'Masculino', 'Jardim Primavera', 'Rua 13', NOW()),
('040', 'Larissa Martins', 22, 'Feminino', 'Bairro Novo', 'Rua 14', NOW()),
('041', 'Pedro Ferreira', 25, 'Masculino', 'Cidade Alta', 'Rua 15', NOW()),
('042', 'Isabela Souza', 21, 'Feminino', 'Vila Velha', 'Rua 16', NOW()),
('043', 'Enzo Lima', 24, 'Masculino', 'Centro', 'Rua 17', NOW()),
('044', 'Laura Gomes', 23, 'Feminino', 'Vila Nova', 'Rua 18', NOW()),
('045', 'Arthur Oliveira', 22, 'Masculino', 'Jardim Primavera', 'Rua 19', NOW()),
('046', 'Sophia Ferreira', 25, 'Feminino', 'Bairro Novo', 'Rua 20', NOW()),
('047', 'Bernardo Souza', 21, 'Masculino', 'Cidade Alta', 'Rua 21', NOW()),
('048', 'Valentina Lima', 24, 'Feminino', 'Vila Velha', 'Rua 22', NOW()),
('049', 'Davi Gomes', 23, 'Masculino', 'Centro', 'Rua 23', NOW()),
('050', 'Helena Oliveira', 22, 'Feminino', 'Vila Nova', 'Rua 24', NOW());


-- Insert sample data into Materias table
INSERT INTO Materias (Nome, Descricao, Professor, DataCriacao) VALUES
('Matemática', 'Introdução à Álgebra', 'Prof. Silva', NOW()),
('Física', 'Fundamentos da Mecânica', 'Prof. Santos', NOW()),
('Química', 'Conceitos Básicos', 'Prof. Oliveira', NOW()),
('Inglês', 'Gramática e Escrita', 'Prof. Costa', NOW()),
('História', 'História Mundial', 'Prof. Rodrigues', NOW()),
('Geografia', 'Geografia Geral', 'Prof. Ferreira', NOW()),
('Biologia', 'Introdução à Biologia', 'Prof. Souza', NOW()),
('Artes', 'Artes Visuais', 'Prof. Lima', NOW()),
('Educação Física', 'Atividades Esportivas', 'Prof. Gomes', NOW()),
('Filosofia', 'Introdução à Filosofia', 'Prof. Martins', NOW());

-- Insert sample data into Notas table
INSERT INTO Notas (ALUNOID, MATERIAID, Nota, DataCriacao) 
SELECT a.ID as ALUNOID, m.ID as MATERIAID, ROUND(RAND() * 10, 2) as Nota, NOW() as DataCriacao
FROM Alunos a
CROSS JOIN Materias m
WHERE a.ID <= 50;


INSERT INTO Notas (ALUNOID, MATERIAID, Nota, DataCriacao) 
SELECT a.ID as ALUNOID, m.ID as MATERIAID, ROUND(RAND() * 10, 2) as Nota, DATE_ADD(NOW(), INTERVAL 3 MONTH) as DataCriacao
FROM Alunos a
CROSS JOIN Materias m
WHERE a.ID <= 50;

INSERT INTO Notas (ALUNOID, MATERIAID, Nota, DataCriacao) 
SELECT a.ID as ALUNOID, m.ID as MATERIAID, ROUND(RAND() * 10, 2) as Nota, DATE_ADD(NOW(), INTERVAL 6 MONTH) as DataCriacao
FROM Alunos a
CROSS JOIN Materias m
WHERE a.ID <= 50;


INSERT INTO Notas (ALUNOID, MATERIAID, Nota, DataCriacao) 
SELECT a.ID as ALUNOID, m.ID as MATERIAID, ROUND(RAND() * 10, 2) as Nota, DATE_ADD(NOW(), INTERVAL 9 MONTH) as DataCriacao
FROM Alunos a
CROSS JOIN Materias m
WHERE a.ID <= 50;


