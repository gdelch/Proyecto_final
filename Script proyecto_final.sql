CREATE SCHEMA proyecto_final;
USE proyecto_final;

CREATE TABLE vendedores(
  id_vendedores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  razonsocial_vendedor VARCHAR(20) NOT NULL,
  cuit_vendedor CHAR(11) NOT NULL,
  rubro VARCHAR(20),
  direccion_vendedor VARCHAR(30) NOT NULL, 
  cp_vendedor CHAR(4) NOT NULL,
  telefono_vendedor VARCHAR(30), 
  email_vendedor VARCHAR(30), 
  reputacion VARCHAR(20));
  
  CREATE TABLE productos(
  id_productos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  descripcion VARCHAR(50) NOT NULL,
  cant INT NOT NULL,
  fecha_ingreso DATE,
  precio_venta DECIMAL(10,2) NOT NULL, 
  tamano_producto CHAR(4) NOT NULL,
  categoria_producto VARCHAR(20),
  vendedor_id INT,
  FOREIGN KEY (vendedor_id) REFERENCES vendedores(id_vendedores)
  ); 
  
CREATE TABLE clientes(
  id_clientes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombre_cliente VARCHAR(20) NOT NULL,
  apellido_cliente VARCHAR(30) NOT NULL,
  cuil_vendedor CHAR(11) NOT NULL,
  direccion_cliente VARCHAR(30) NOT NULL, 
  cp_cliente CHAR(4) NOT NULL,
  telefono_cliente VARCHAR(30), 
  email_cliente VARCHAR(30), 
  membresia boolean
  );
  
  CREATE TABLE transportes(
  id_transportes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  razonsocial_transporte VARCHAR(20) NOT NULL,
  cap_carga INT NOT NULL,
  direccion_transporte VARCHAR(30) NOT NULL, 
  cp_transporte CHAR(4) NOT NULL,
  telefono_transporte VARCHAR(30), 
  email_transporte VARCHAR(30)
  );
  
  CREATE TABLE zonas_entrega(
  id_zonas CHAR(4) NOT NULL PRIMARY KEY,
  detalle_zona CHAR(4) NOT NULL,
  ciudad_deliver VARCHAR(20) NOT NULL,
  provincia_deliver VARCHAR(20) NOT NULL,
  distancia_cd INT NOT NULL, 
  eta_deliver INT NOT NULL,
  tarifa_deliver DECIMAL(10,2), 
  transporte_id INT,
  FOREIGN KEY (transporte_id) REFERENCES transportes(id_transportes)
  );
  
  CREATE TABLE ordenes_entrega(
  id_ordenes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  direccion_deliver VARCHAR(30) NOT NULL,
  zona_id CHAR(4) NOT NULL,
  observaciones_deliver VARCHAR(50),
  FOREIGN KEY (zona_id) REFERENCES zonas_entrega(id_zonas),
  FOREIGN KEY (zona_id) REFERENCES clientes(cp_cliente)
  );
  
  CREATE TABLE exposiciones(
  id_exposiciones INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  categoria_exp VARCHAR(10) NOT NULL,
  comision_exp DECIMAL(10,2) NOT NULL
  );
  
  CREATE TABLE publicaciones(
  id_publicaciones INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  producto_id INT NOT NULL,
  descripcion_pub VARCHAR(50),
  precio_pub DECIMAL(10,2) NOT NULL, 
  exposicion_id INT NOT NULL,
  FOREIGN KEY (exposicion_id) REFERENCES exposiciones(id_exposiciones),
  FOREIGN KEY (producto_id) REFERENCES productos(id_productos)
  );
  
  CREATE TABLE facturas(
  id_factura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  publicacion_id INT NOT NULL,
  cant_venta INT NOT NULL, 
  cliente_id INT NOT NULL,
  orden_id INT NOT NULL,
  FOREIGN KEY (publicacion_id) REFERENCES publicaciones(id_publicaciones),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id_clientes),
  FOREIGN KEY (orden_id) REFERENCES ordenes_entrega(id_ordenes)
  );