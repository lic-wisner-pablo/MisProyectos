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

