CREATE DATABASE IF NOT EXISTS automacao_casa;
USE automacao_casa;

-- ========== SISTEMA 1: ILUMINAÇÃO ==========

CREATE TABLE IF NOT EXISTS iluminacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS iluminacao_backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL,
    backup_data DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_iluminacao_backup
AFTER INSERT ON iluminacao
FOR EACH ROW
BEGIN
    INSERT INTO iluminacao_backup (data_hora, acao)
    VALUES (NEW.data_hora, NEW.acao);
END;//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE inserir_iluminacao(IN data_ DATETIME, IN acao_ VARCHAR(100))
BEGIN
    INSERT INTO iluminacao (data_hora, acao) VALUES (data_, acao_);
END;//
DELIMITER ;

-- ========== SISTEMA 2: AR-CONDICIONADO ==========

CREATE TABLE IF NOT EXISTS ar_condicionado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS ar_condicionado_backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL,
    backup_data DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_ar_condicionado_backup
AFTER INSERT ON ar_condicionado
FOR EACH ROW
BEGIN
    INSERT INTO ar_condicionado_backup (data_hora, acao)
    VALUES (NEW.data_hora, NEW.acao);
END;//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE inserir_ar_condicionado(IN data_ DATETIME, IN acao_ VARCHAR(100))
BEGIN
    INSERT INTO ar_condicionado (data_hora, acao) VALUES (data_, acao_);
END;//
DELIMITER ;

-- ========== SISTEMA 3: MÁQUINA DE LAVAR ==========

CREATE TABLE IF NOT EXISTS maquina_lavar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS maquina_lavar_backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL,
    backup_data DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_maquina_lavar_backup
AFTER INSERT ON maquina_lavar
FOR EACH ROW
BEGIN
    INSERT INTO maquina_lavar_backup (data_hora, acao)
    VALUES (NEW.data_hora, NEW.acao);
END;//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE inserir_maquina_lavar(IN data_ DATETIME, IN acao_ VARCHAR(100))
BEGIN
    INSERT INTO maquina_lavar (data_hora, acao) VALUES (data_, acao_);
END;//
DELIMITER ;

-- ========== SISTEMA 4: PORTAS E JANELAS ==========

CREATE TABLE IF NOT EXISTS portas_janelas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS portas_janelas_backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL,
    backup_data DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_portas_janelas_backup
AFTER INSERT ON portas_janelas
FOR EACH ROW
BEGIN
    INSERT INTO portas_janelas_backup (data_hora, acao)
    VALUES (NEW.data_hora, NEW.acao);
END;//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE inserir_portas_janelas(IN data_ DATETIME, IN acao_ VARCHAR(100))
BEGIN
    INSERT INTO portas_janelas (data_hora, acao) VALUES (data_, acao_);
END;//
DELIMITER ;

-- ========== SISTEMA 5: CORTINAS ==========

CREATE TABLE IF NOT EXISTS cortinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS cortinas_backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL,
    backup_data DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_cortinas_backup
AFTER INSERT ON cortinas
FOR EACH ROW
BEGIN
    INSERT INTO cortinas_backup (data_hora, acao)
    VALUES (NEW.data_hora, NEW.acao);
END;//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE inserir_cortinas(IN data_ DATETIME, IN acao_ VARCHAR(100))
BEGIN
    INSERT INTO cortinas (data_hora, acao) VALUES (data_, acao_);
END;//
DELIMITER ;

-- ========== SISTEMA 6: PORTÃO ELETRÔNICO ==========

CREATE TABLE IF NOT EXISTS portao_eletronico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS portao_eletronico_backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL,
    backup_data DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_portao_eletronico_backup
AFTER INSERT ON portao_eletronico
FOR EACH ROW
BEGIN
    INSERT INTO portao_eletronico_backup (data_hora, acao)
    VALUES (NEW.data_hora, NEW.acao);
END;//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE inserir_portao_eletronico(IN data_ DATETIME, IN acao_ VARCHAR(100))
BEGIN
    INSERT INTO portao_eletronico (data_hora, acao) VALUES (data_, acao_);
END;//
DELIMITER ;

-- ========== SISTEMA 7: SISTEMA DE CÂMERAS ==========

CREATE TABLE IF NOT EXISTS sistema_cameras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS sistema_cameras_backup (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    acao VARCHAR(100) NOT NULL,
    backup_data DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER trg_sistema_cameras_backup
AFTER INSERT ON sistema_cameras
FOR EACH ROW
BEGIN
    INSERT INTO sistema_cameras_backup (data_hora, acao)
    VALUES (NEW.data_hora, NEW.acao);
END;//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE inserir_sistema_cameras(IN data_ DATETIME, IN acao_ VARCHAR(100))
BEGIN
    INSERT INTO sistema_cameras (data_hora, acao) VALUES (data_, acao_);
END;//
DELIMITER ;
