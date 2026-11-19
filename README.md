RetailPro

RetailPro es un proyecto de base de datos construido sobre SQL Server para un negocio minorista de tecnología, accesorios y muebles de oficina. Centraliza la información de clientes, campañas comerciales, productos y ventas, y sirve de base para analizar el desempeño del negocio con consultas SQL.

Qué información almacena
Entidad	Contenido
Clientes	200 clientes con identificador (CLI-0001 a CLI-0200), nombre, email, país, ciudad, segmento y fecha de registro.
Campañas	6 campañas comerciales, incluida "Without campaign" para las ventas sin promoción.
Productos	Catálogo de 25 productos (PRD-001 a PRD-025) con nombre, categoría, subcategoría y precio.
Ventas	Registro de las transacciones que relacionan clientes, productos y campañas.
Clientes

Cada cliente se describe con los campos CustomerID, Nombre, Email, Pais, Ciudad, Segmento y FechaRegistro.

Países (8): Argentina (68 clientes), Brasil (41), Chile (22), México (18), Uruguay (16), Perú (14), Colombia (11) y Ecuador (10).
Segmentos (3): Estándar (112), Básico (54) y Premium (34).
Ciudades: 24 ciudades distintas, entre ellas Buenos Aires, Córdoba, Rosario, La Plata, Mendoza, São Paulo, Santiago y Ciudad de México.
Fechas de registro: desde el 3 de enero de 2023 hasta el 30 de noviembre de 2024.
Campañas
id_campaña	Campaña
1	Essential Picks
2	Limited Edition
3	Top Seller
4	Without campaign
5	Back to School
6	Winter Sale
Productos

El catálogo se divide en tres categorías:

Categoría	Subcategorías	Ejemplos
Tecnología	Computadoras, Periféricos, Monitores, Audio, Almacenamiento, Energía, Tablets	Laptop Pro 15'', Monitor 27'' 4K, Disco SSD 1TB
Accesorios	Video, Conectividad, Periféricos, Ergonomía, Organización, Energía, Protección, Mantenimiento	Webcam HD 1080p, Hub USB-C 7 puertos, Soporte Notebook
Muebles	Iluminación, Mobiliario	Silla Ergonómica Pro, Escritorio Ajustable, Lámpara LED Escritorio

Los precios van desde $999 (Kit Limpieza Electrónica) hasta $129.999 (Laptop Pro 15'').

Modelo de datos
Clientes ──< Ventas >── Productos
               │
               └──> Campañas

Cada venta referencia a un cliente, a un producto y a una campaña mediante claves foráneas, lo que permite cruzar la información entre las cuatro entidades.

Herramientas utilizadas
Microsoft SQL Server como motor de base de datos.
T-SQL como lenguaje para definir las tablas, cargar los datos y consultarlos.
Archivos de texto separados por tabulaciones (.txt) como fuente de los datos de clientes.
Scripts de SQL Server

El proyecto se apoya en tres tipos de scripts T-SQL:

Creación de la base y las tablas: define las tablas Clientes, Campañas, Productos y Ventas, con sus claves primarias y foráneas.
Carga de datos: inserta los registros de clientes, campañas, productos y ventas en sus tablas.
Consultas de análisis: responden preguntas de negocio sobre los datos cargados, por ejemplo:
Ventas y facturación por mes.
Productos y categorías más vendidos.
Desempeño de cada campaña, incluidas las ventas sin campaña.
Distribución de clientes por país, ciudad y segmento.
Cómo ejecutar los scripts
Abrí una conexión a tu instancia de SQL Server con un cliente como SQL Server Management Studio (SSMS) o Azure Data Studio.
Ejecutá el script de creación de la base y las tablas.
Ejecutá el script de carga de datos.
Ejecutá las consultas de análisis, una por una, para ver los resultados.

Las tablas deben crearse en este orden: Clientes, Campañas, Productos y, al final, Ventas, porque esta última depende de las otras tres.

Notas
Los datos son ficticios y se usan con fines educativos.
Los scripts están escritos en T-SQL; en otros motores pueden requerir adaptaciones.
