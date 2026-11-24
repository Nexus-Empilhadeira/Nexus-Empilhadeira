-- ==========================================
-- NEXUS EMPILHADEIRA
-- CRIAÇÃO E CONFIGURAÇÃO DO BANCO
-- ==========================================

CREATE DATABASE IF NOT EXISTS empilhadeira
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE empilhadeira;

-- TABELA PRINCIPAL
CREATE TABLE IF NOT EXISTS status_equipamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL DEFAULT 'Empilhadeira em miniatura',
    status VARCHAR(20) NOT NULL DEFAULT 'Ligado',
    bateria INT NOT NULL DEFAULT 69,
    elevacao INT NOT NULL DEFAULT 0,
    tempo_operacao VARCHAR(50) NOT NULL DEFAULT '01h 25min',
    autonomia_max INT NOT NULL DEFAULT 48,
    capacidade_max INT NOT NULL DEFAULT 500,
    tempo_acumulado_seg INT NOT NULL DEFAULT 0,
    ligado_desde DATETIME NULL,
    velocidade INT NOT NULL DEFAULT 0,
    temperatura FLOAT NULL,
    umidade FLOAT NULL,
    distancia FLOAT NULL
);

-- TABELA DE COMPONENTES
CREATE TABLE IF NOT EXISTS componentes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    componente VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    detalhes VARCHAR(255) NOT NULL,
    link VARCHAR(500) NOT NULL
);

-- TABELA DE HISTÓRICO
CREATE TABLE IF NOT EXISTS historico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    horario VARCHAR(20) NOT NULL,
    registro VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    valor VARCHAR(50) NOT NULL,
    origem VARCHAR(50) NOT NULL
);

-- TABELA DE CICLOS DA BATERIA
CREATE TABLE IF NOT EXISTS ciclos_bateria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(20) NOT NULL,
    inicio DATETIME NOT NULL,
    fim DATETIME NULL,
    nivel_inicio FLOAT NOT NULL,
    nivel_fim FLOAT NULL,
    duracao_seg INT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'Em andamento'
);

-- REGISTRO INICIAL DA EMPILHADEIRA
INSERT INTO status_equipamento
(id, nome, status, bateria, elevacao, tempo_operacao, autonomia_max, capacidade_max)
VALUES
(1, 'Empilhadeira em miniatura', 'Ligado', 69, 320, '01h 25min', 48, 500)
ON DUPLICATE KEY UPDATE id = id;

-- COMPONENTES ANTIGOS
INSERT INTO componentes (componente, modelo, detalhes, link)
SELECT 'Microcontrolador', 'ARDUINO NANO V3',
'Plataforma de controle principal',
'https://lista.mercadolivre.com.br/arduino-nano-v3'
WHERE NOT EXISTS (
    SELECT 1 FROM componentes WHERE componente = 'Microcontrolador'
);

INSERT INTO componentes (componente, modelo, detalhes, link)
SELECT 'Módulo de comunicação', 'BLUETOOTH HC 05/06',
'Comunicação sem fio com o painel',
'https://lista.mercadolivre.com.br/modulo-bluetooth-hc-05'
WHERE NOT EXISTS (
    SELECT 1 FROM componentes WHERE componente = 'Módulo de comunicação'
);

INSERT INTO componentes (componente, modelo, detalhes, link)
SELECT 'Motorização', '2 MOTORES DC V6 (3V-6V)',
'Conjunto de tração com caixa de redução',
'https://lista.mercadolivre.com.br/motor-dc-caixa-reducao-amarelo-3v-6v'
WHERE NOT EXISTS (
    SELECT 1 FROM componentes WHERE componente = 'Motorização'
);

INSERT INTO componentes (componente, modelo, detalhes, link)
SELECT 'Servo', 'MG90D 360°',
'Atuador de elevação dos garfos',
'https://lista.mercadolivre.com.br/servo-mg90d-360'
WHERE NOT EXISTS (
    SELECT 1 FROM componentes WHERE componente = 'Servo'
);

-- NOVOS COMPONENTES
INSERT INTO componentes (componente, modelo, detalhes, link)
SELECT 'Controlador', 'ESP32',
'Unidade de controle do projeto', ''
WHERE NOT EXISTS (
    SELECT 1 FROM componentes WHERE componente = 'Controlador'
);

INSERT INTO componentes (componente, modelo, detalhes, link)
SELECT 'Sensor de distância', 'HC-SR04',
'Medição de distância até obstáculos', ''
WHERE NOT EXISTS (
    SELECT 1 FROM componentes WHERE componente = 'Sensor de distância'
);

INSERT INTO componentes (componente, modelo, detalhes, link)
SELECT 'Sensor ambiental', 'DHT22',
'Medição de temperatura e umidade', ''
WHERE NOT EXISTS (
    SELECT 1 FROM componentes WHERE componente = 'Sensor ambiental'
);

-- HISTÓRICO INICIAL
INSERT INTO historico
(horario, registro, categoria, valor, origem)
SELECT '10:00:00', 'Estado do sistema', 'Sistema', 'Ligado', 'DEMONSTRAÇÃO'
WHERE NOT EXISTS (SELECT 1 FROM historico);

INSERT INTO historico VALUES
(NULL, '10:00:00', 'Carga da bateria', 'Bateria', '85%', 'SENSOR'),
(NULL, '10:00:00', 'Carga em elevação', 'Elevação', '0 g', 'SENSOR'),
(NULL, '10:10:00', 'Carga da bateria', 'Bateria', '81%', 'SENSOR'),
(NULL, '10:10:00', 'Carga em elevação', 'Elevação', '150 g', 'SENSOR'),
(NULL, '10:20:00', 'Carga da bateria', 'Bateria', '77%', 'SENSOR'),
(NULL, '10:20:00', 'Carga em elevação', 'Elevação', '280 g', 'SENSOR'),
(NULL, '10:30:00', 'Carga da bateria', 'Bateria', '73%', 'SENSOR'),
(NULL, '10:30:00', 'Carga em elevação', 'Elevação', '450 g', 'SENSOR'),
(NULL, '10:40:00', 'Carga da bateria', 'Bateria', '69%', 'SENSOR'),
(NULL, '10:40:00', 'Carga em elevação', 'Elevação', '320 g', 'SENSOR');

-- CONFERIR AS TABELAS
SHOW TABLES;

-- CONFERIR OS DADOS
SELECT * FROM status_equipamento;
SELECT * FROM componentes;
SELECT * FROM historico;
SELECT * FROM ciclos_bateria;