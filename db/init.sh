#!/bin/bash
echo "Esperando a que SQL Server responda..."
sleep 5
echo "Ejecutando script DDL de innovacion curricular..."
/opt/mssql-tools18/bin/sqlcmd -S db -U sa -P 'TuPasswordSegura123!' -C -i /db/innovacion_curricular.sql
echo "Base de datos inicializada correctamente."