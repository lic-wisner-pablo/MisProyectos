1.- Generar el script de creación de tabla de Alquiler con sus restricciones

CREATE TABLE Alquiler (
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Patente INT NOT NULL
	legCliente INT NOT NULL
	FechaAlquiler DATETIME NOT NULL
	Importe VARCHAR(15) NOT NULL,
	CantDias VARCHAR(20) NOT NULL
	FOREIGN KEY(Patente) REFERENCES Vehiculo(Patente)
	FOREIGN KEY(legCliente) REFERENCES Cliente(Legajo)
);

2.- Generar el script para eliminar la tabla Vehículo.

DROP TABLE Vehiculo;


3.- Obtener los datos de todos los vehículos, ordenados por marca (descripción) y patente

SELECT *
FROM Vehiculo v JOIN marca m ON v.idMarca = m.idMarca
ORDER BY m.Descripcion, v.Patente;


4.- Para cada marca, informar la cantidad de vehículos total y máxima capacidad, únicamente para aquellos vehículos con más de 4 puertas.
	
SELECT COUNT (*), MAX (v.capacidad)
FROM Marca m JOIN Vehiculo v ON m.idMarca = v.idMarca
WHERE v.puertas > 4 AND v.marca = m.marca;


5.- Informar: Legajo, Nombre y apellido del cliente, patente, color del auto, fecha de alquiler, importe, impuestos (15% del importe del alquiler), de todos los alquileres registrados en el mes de febrero.

SELECT C.Legajo, C.Nombre, C.Apellido, V.Patente, V.Color, A.FechaAlquiler, A.Importe, 
COUNT (a.importe *0,15)
FROM Alquiler A JOIN Cliente C ON C.Legajo = A.LegCliente
  		JOIN Vehiculo V ON A.Patente = V.patente
WHERE A.FechaAlquiler = ‘%Febrero%’


6.- Generar el script para agregar el siguiente Auto: ABC234, Rojo, 2021, 5, 4, 7
	
INSERT INTO Vehiculo (Patente, Color, Año, Capacidad, Puertas, IdMarca) 
VALUES ('ABC234', 'ROJO', '2021', '5', '4', '7');

7.- Escribir la sentencia para modificar el color del auto FFF555 ya que el mismo es gris.

UPDATE Vehiculo
   	SET Color=FFF555
   	WHERE Color= FFF556;

8.- Listar la patente, importe total de alquiler, cantidad de alquiler por auto, únicamente para los vehículos que hayan sido alquilados más de una vez.

SELECT v.Patente, (COUNT (*) * a.Importe) AS ‘Importe total’ 
FROM Vehiculo v JOIN Alquiler a ON v.Patente = a.Patente
GROUP BY v.Patente
HAVING COUNT (*) > 1
