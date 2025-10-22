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

-- 4. Tareas con categoría y creador
SELECT 
    t.id_tarea,
    t.Titulo,
    t.Estado,
    c.Nombre AS Categoria,
    CONCAT(u.Nombre, ' ', u.Apellido) AS Creador_Categoria
FROM TAREAS t
INNER JOIN CATEGORIA c ON t.id_categoria = c.id_categoria
INNER JOIN USUARIOS u ON c.id_usuario = u.id_usuario;

-- 5. Usuarios asignados a cada tarea
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

-- 6. Resumen general de tareas
SELECT 
    t.id_tarea,
    t.Titulo,
    t.Estado,
    t.Prioridad,
    c.Nombre AS Categoria,
    CONCAT(u.Nombre, ' ', u.Apellido) AS Creador,
    GROUP_CONCAT(DISTINCT CONCAT(u2.Nombre, ' ', u2.Apellido, ' (', ut.tipo_relacion, ')') SEPARATOR ', ') AS Asignados
FROM TAREAS t
INNER JOIN CATEGORIA c ON t.id_categoria = c.id_categoria
INNER JOIN USUARIOS u ON c.id_usuario = u.id_usuario
LEFT JOIN USUARIO_TAREA ut ON t.id_tarea = ut.id_tarea
LEFT JOIN USUARIOS u2 ON ut.id_usuario = u2.id_usuario
GROUP BY t.id_tarea
ORDER BY t.id_tarea;

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
