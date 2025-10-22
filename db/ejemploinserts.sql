-- TRABAJO GRUPAL -> Belkis Basualdo, Facundo Peña, Ruth Gomez, Gabriel Cano, Alejandro Pacheco
-- Creacion y uso de la tabla

create database cilsatpfullstack;
use cilsatpfullstack;

-- Inserts para USUARIOS
INSERT INTO USUARIOS (Nombre, Apellido, Email, Password) VALUES
('Juan', 'Pérez', 'juan.perez@email.com', 'password1'),
('María', 'Gómez', 'maria.gomez@email.com', 'password2'),
('Carlos', 'López', 'carlos.lopez@email.com', 'password3'),
('Ana', 'Martínez', 'ana.martinez@email.com', 'password4'),
('Luis', 'Rodríguez', 'luis.rodriguez@email.com', 'password5');

-- Inserts para CATEGORIA
INSERT INTO CATEGORIA (Nombre, Color, Descripcion, id_usuario) VALUES
('Trabajo', 'Azul', 'Tareas relacionadas con el trabajo', 1),
('Personal', 'Verde', 'Tareas personales', 2),
('Estudio', 'Rojo', 'Tareas de estudio', 3),
('Hogar', 'Amarillo', 'Tareas del hogar', 4),
('Salud', 'Naranja', 'Tareas relacionadas con la salud', 5);

-- Inserts para TAREAS
INSERT INTO TAREAS (id_categoria, Titulo, Descripcion, Fecha_vencimiento, Prioridad, Estado, Completada) VALUES
(1, 'Reunión semanal', 'Reunión con el equipo de trabajo', '2024-06-15 10:00:00', 'alta', 'pendiente', FALSE),
(2, 'Ir al supermercado', 'Comprar víveres para la semana', '2024-06-10 18:00:00', 'media', 'pendiente', FALSE),
(3, 'Estudiar para el examen', 'Repasar temas del capítulo 4', '2024-06-20 14:00:00', 'alta', 'en_curso', FALSE),
(4, 'Limpieza del garaje', 'Organizar y limpiar el garaje', '2024-06-12 09:00:00', 'baja', 'pendiente', FALSE),
(5, 'Cita con el médico', 'Control anual', '2024-06-08 11:30:00', 'alta', 'completada', TRUE);

-- Inserts para USUARIO_TAREA
INSERT INTO USUARIO_TAREA (id_usuario, id_tarea, tipo_relacion) VALUES
(1, 1, 'responsable'),
(2, 1, 'colaborador'),
(2, 2, 'responsable'),
(3, 2, 'colaborador'),
(3, 3, 'responsable'),
(4, 3, 'colaborador'),
(4, 4, 'responsable'),
(5, 4, 'colaborador'),
(5, 5, 'responsable'),
(1, 5, 'colaborador');
