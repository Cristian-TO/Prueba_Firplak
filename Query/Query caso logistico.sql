-- Todas las entregas con detalles de pedidios y clientes --
SELECT *
FROM lineaspedido
JOIN Pedidos ON lineaspedido.id_Pedido = lineaspedido.id_Pedido
JOIN guiastransporte ON guiastransporte.id_Cliente = guiastransporte.id_Cliente;

-- Documentos de entrega pendientes --
SELECT *
FROM guiastransporte
WHERE Estadoguia = 'Pendiente';

-- Prueba de entrega con observaciones --
SELECT *
FROM PruebasEntrega
WHERE Observaciones IS NOT NULL;

DELIMITER //
CREATE PROCEDURE InsertarEntrega(
 IN p_ID_Pedido INT,
 IN p_ID_Documento INT,
 IN p_ID_GuiaTransporte INT,
 IN p_FechaDespacho DATE,
 IN p_FechaEntrega DATE,
 IN p_Cliente VARCHAR(50),
 IN p_Ubicacion VARCHAR(50),
 IN p_EstadoEntrega VARCHAR(20)
)
BEGIN
 INSERT INTO Entregas (ID_Pedido, ID_Documento, ID_GuiaTransporte, FechaDespacho,
FechaEntrega, Cliente, Ubicacion, EstadoEntrega)
 VALUES (p_ID_Pedido, p_ID_Documento, p_ID_GuiaTransporte, p_FechaDespacho,
p_FechaEntrega, p_Cliente, p_Ubicacion, p_EstadoEntrega);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ActualizarEstadoEntrega(
 IN p_ID_Entrega INT,
 IN p_NuevoEstado VARCHAR(20)
)
BEGIN
 UPDATE Entregas
 SET EstadoEntrega = p_NuevoEstado
 WHERE ID_Entrega = p_ID_Entrega;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE EliminarEntrega(
 IN p_ID_Entrega INT
)
BEGIN
 DELETE FROM Entregas
 WHERE ID_Entrega = p_ID_Entrega;
END //
DELIMITER ;