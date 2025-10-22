-- 1. Ver todos los usuarios
SELECT * FROM USUARIOS;

-- 2. Categorías con su creador
SELECT 
    c.id_categoria,
    c.Nombre AS Categoria,
    c.Color,
    c.Descripcion,
    CONCAT(u.Nombre, ' ', u.Apellido) AS Creador
FROM CATEGORIA c
INNER JOIN USUARIOS u ON c.id_usuario = u.id_usuario
ORDER BY c.id_categoria;

-- 3. Tareas con su categoría
SELECT 
    t.id_tarea,
    t.Titulo,
    t.Prioridad,
    t.Estado,
    c.Nombre AS Categoria,
    c.Color
FROM TAREAS t
INNER JOIN CATEGORIA c ON t.id_categoria = c.id_categoria
ORDER BY t.id_tarea;

-- 4. Listar la información de todos los usuarios cuya cuenta no ha sido desactivada.
SELECT
    id_usuario,
    Nombre,
    Apellido,
    Email
FROM
    USUARIOS
WHERE
    Activo = TRUE;
-- 5. Listar un número del total de tareas que tienen el estado de 'pendiente'.
SELECT
    COUNT(*) AS Total_Tareas_Pendientes
FROM
    TAREAS
WHERE
    Estado = 'pendiente';

-- 6. Listar usuarios asignados a cada tarea
SELECT 
    t.id_tarea,
    t.Titulo AS Tarea,
    CONCAT(u.Nombre, ' ', u.Apellido) AS Usuario,
    ut.tipo_relacion AS Rol,
    ut.fecha_asignacion
FROM USUARIO_TAREA ut
INNER JOIN USUARIOS u ON ut.id_usuario = u.id_usuario
INNER JOIN TAREAS t ON ut.id_tarea = t.id_tarea
ORDER BY t.id_tarea, ut.tipo_relacion;


-- 7. Tareas pendientes ordenadas por vencimiento
SELECT 
    t.Titulo,
    c.Nombre AS Categoria,
    t.Prioridad,
    t.Fecha_vencimiento
FROM TAREAS t
INNER JOIN CATEGORIA c ON t.id_categoria = c.id_categoria
WHERE t.Estado = 'pendiente'
ORDER BY t.Fecha_vencimiento ASC;

-- 8. Tareas completadas y responsables
SELECT 
    t.Titulo,
    c.Nombre AS Categoria,
    GROUP_CONCAT(CONCAT(u.Nombre, ' ', u.Apellido) SEPARATOR ', ') AS Responsables,
    t.Fecha_completada
FROM TAREAS t
INNER JOIN CATEGORIA c ON t.id_categoria = c.id_categoria
INNER JOIN USUARIO_TAREA ut ON t.id_tarea = ut.id_tarea
INNER JOIN USUARIOS u ON ut.id_usuario = u.id_usuario
WHERE t.Completada = TRUE
GROUP BY t.id_tarea;
