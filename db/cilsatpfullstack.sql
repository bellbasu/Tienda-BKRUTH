-- TRABAJO GRUPAL -> Belkis Basualdo, Facundo Peña, Ruth Gomez, Gabriel Cano, Alejandro Pacheco
-- Creacion y uso de la tabla

create database cilsatpfullstack;
use cilsatpfullstack;

-- TABLA USUARIOS
CREATE TABLE USUARIOS (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40) NOT NULL,
    Apellido VARCHAR(40) NOT NULL,
    Email VARCHAR(64) UNIQUE NOT NULL,
    Password VARCHAR(128) NOT NULL,
    Fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    Activo BOOLEAN DEFAULT TRUE
);

-- TABLA CATEGORÍA
CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(40) NOT NULL,
    Color VARCHAR(20),
    Descripcion TEXT,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario)
);

-- TABLA TAREAS
CREATE TABLE TAREAS (
    id_tarea INT PRIMARY KEY AUTO_INCREMENT,
    id_categoria INT NOT NULL,
    Titulo VARCHAR(100) NOT NULL,
    Descripcion TEXT,
    Fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    Fecha_vencimiento DATETIME,
    Prioridad ENUM('baja', 'media', 'alta') DEFAULT 'media',
    Estado ENUM('pendiente', 'en_curso', 'completada', 'cancelada') DEFAULT 'pendiente',
    Completada BOOLEAN DEFAULT FALSE,
    Fecha_completada DATETIME NULL,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

-- TABLA INTERMEDIA: USUARIO_TAREA (ID unico para la tabla, id multiple usuarios, id multiples tareas)
CREATE TABLE USUARIO_TAREA (
    id_usuario_tarea INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_tarea INT NOT NULL,
    tipo_relacion ENUM('responsable', 'colaborador', 'supervisor') DEFAULT 'responsable',
    fecha_asignacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id_usuario),
    FOREIGN KEY (id_tarea) REFERENCES TAREAS(id_tarea),
    UNIQUE KEY unique_usuario_tarea (id_usuario, id_tarea)
);
  

