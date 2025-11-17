# Metodología utilizada para el diseño de la base de datos TechGadgetsDB

## 1. Análisis del caso
Se revisó la operación principal de TechGadgets, una empresa de comercio electrónico, identificando los elementos clave de su negocio:
- Productos
- Clientes
- Empleados
- Pedidos y su detalle

Se definieron entidades, atributos, flujos y relaciones.

---

## 2. Diseño conceptual (Modelo Entidad–Relación)
Se identificaron las entidades principales:
- **Clientes**
- **Empleados**
- **Productos**
- **Pedidos**
- **DetallePedidos**

### Relaciones identificadas:
- Un cliente puede realizar muchos pedidos.
- Un pedido puede tener muchos productos (detalle).
- Un empleado puede gestionar múltiples pedidos.
- Un producto puede tener múltiples registros de venta.

---

## 3. Diseño lógico (Estructura de tablas)
Se convirtieron las entidades en tablas con:
- Llaves primarias (PK)
- Llaves foráneas (FK)
- Tipos de datos adecuados
- Restricciones de integridad

Se agregó una tabla adicional **DetallePedidos** para representar la multiplicidad entre pedidos y productos.

---

## 4. Implementación en SQL
Se desarrolló:
- Script completo para crear la base de datos (`CREATE DATABASE`)
- Scripts DDL para crear tablas y relaciones
- Inserción de datos de prueba
- Consultas para validación del modelo

---

## 5. Pruebas del modelo
Se realizaron pruebas:
- INSERT, UPDATE, DELETE
- Consultas con JOIN
- Consultas con agregaciones (GROUP BY, HAVING)
- Pruebas de integridad referencial
- Actualización automática de totales

---

## 6. Implementación de transacciones
Se identificaron operaciones críticas como:
- Registro de un pedido
- Modificación de stock
- Cálculo del total del pedido

Estas operaciones se encapsularon en transacciones ACID.

---

## 7. Gestión de concurrencia y locks
Se evaluó la necesidad de proteger operaciones sensibles y se implementaron:
- Locks explícitos (UPDLOCK)
- Niveles de aislamiento de transacciones

---

## 8. Documentación
Se elaboró documentación técnica:
- Explicación de DBMS
- Metodología del proyecto
- Explicación de transacciones y locks
- Script SQL completo

---

## 9. Validación final
La base fue probada con:
- 25 pedidos
- 60 líneas de detalle
- 20 productos
- 15 clientes
- 10 empleados

Con esto se validó su utilidad para análisis, reportes y pruebas más avanzadas.
