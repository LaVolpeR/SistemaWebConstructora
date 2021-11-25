/****** Object:  Database [SistemaWebProyecto]    Script Date: 03/10/2021 16:46:33 ******/
CREATE DATABASE [SistemaWebProyecto]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [SistemaWebProyecto] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [SistemaWebProyecto] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET ARITHABORT OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SistemaWebProyecto] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SistemaWebProyecto] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [SistemaWebProyecto] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SistemaWebProyecto] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SistemaWebProyecto] SET  MULTI_USER 
GO
ALTER DATABASE [SistemaWebProyecto] SET ENCRYPTION ON
GO
ALTER DATABASE [SistemaWebProyecto] SET QUERY_STORE = ON
GO
ALTER DATABASE [SistemaWebProyecto] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[ARCHIVO]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARCHIVO](
	[ARCHIVO_id] [int] IDENTITY(1,1) NOT NULL,
	[ARCHIVO_titulo] [varchar](50) NULL,
	[ARCHIVO_fecha] [smalldatetime] NULL,
	[ARCHIVO_data] [image] NULL,
	[ARCHIVO_descripcion] [varchar](50) NULL,
	[PROYECTO_id] [int] NULL,
	[TRABAJADOR_dni] [char](10) NULL,
 CONSTRAINT [PK_ARCHIVO] PRIMARY KEY CLUSTERED 
(
	[ARCHIVO_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[CATEGORIA_id] [char](10) NOT NULL,
	[CATEGORIA_descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED 
(
	[CATEGORIA_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COTIZACION]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COTIZACION](
	[COTIZACIONN_id] [char](10) NOT NULL,
	[COTIZACION_fecha] [smalldatetime] NULL,
	[COTIZACION_montoTotal] [money] NULL,
	[PROYECTO_id] [int] NULL,
 CONSTRAINT [PK_COTIZACION] PRIMARY KEY CLUSTERED 
(
	[COTIZACIONN_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CRONOGRAMA]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CRONOGRAMA](
	[CRONOGRAMA_id] [int] IDENTITY(1,1) NOT NULL,
	[CRONOGRAMA_titulo] [varchar](50) NOT NULL,
	[CRONOGRAMA_fechaInicio] [date] NULL,
	[CRONOGRAMA_fechaFin] [date] NULL,
	[CRONOGRAMA_horaInicio] [time](7) NULL,
	[CRONOGRAMA_horaFin] [time](7) NULL,
	[CRONOGRAMA_fechaCreacion] [smalldatetime] NULL,
	[CRONOGRAMA_fechaMod] [smalldatetime] NULL,
	[CRONOGRAMA_descripcion] [varchar](max) NULL,
	[ESTADO_id] [int] NULL,
	[TRABAJADOR_dni] [char](10) NULL,
	[PROYECTO_id] [int] NULL,
 CONSTRAINT [PK_CRONOGRAMA] PRIMARY KEY CLUSTERED 
(
	[CRONOGRAMA_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DESCRIPCION]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESCRIPCION](
	[DESCRIPCION_cantidad] [int] NULL,
	[COTIZACION_id] [char](10) NULL,
	[MATERIAL_id] [char](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADO](
	[ESTADO_id] [int] IDENTITY(1,1) NOT NULL,
	[ESTADO_descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED 
(
	[ESTADO_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INFORME]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INFORME](
	[INFORME_id] [int] IDENTITY(1,1) NOT NULL,
	[INFORME_titulo] [varchar](50) NULL,
	[INFORME_descripcion] [varchar](max) NULL,
	[INFORME_fecha] [smalldatetime] NULL,
	[INFORME_fechaSolucion] [smalldatetime] NULL,
	[INFORME_Solucion] [varchar](max) NULL,
	[ESTADO_id] [int] NULL,
	[TRABAJADOR_dni] [char](10) NULL,
	[PROYECTO_id] [int] NULL,
 CONSTRAINT [PK_INFORME] PRIMARY KEY CLUSTERED 
(
	[INFORME_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MATERIAL]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATERIAL](
	[MATERIAL_id] [char](10) NOT NULL,
	[MATERIAL_nombre] [varchar](50) NULL,
	[MATERIAL_precio] [money] NULL,
	[CATEGORIA_id] [char](10) NULL,
	[UNIDADES_id] [char](10) NULL,
 CONSTRAINT [PK_MATERIAL] PRIMARY KEY CLUSTERED 
(
	[MATERIAL_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MOVIMIENTO]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MOVIMIENTO](
	[MOVIMIENTO_id] [int] IDENTITY(1,1) NOT NULL,
	[MOVIMIENTO_titulo] [varchar](50) NULL,
	[MOVIMIENTO_descripcion] [varchar](max) NULL,
	[MOVIMIENTO_money] [money] NULL,
	[MOVIMIENTO_RUC] [char](11) NULL,
	[MOVIMIENTO_razonSocial] [varchar](max) NULL,
	[MOVIMIENTO_fecha] [smalldatetime] NULL,
	[PROYECTO_id] [int] NULL,
	[ARCHIVO_id] [int] NULL,
	[TIPO_id] [int] NULL,
 CONSTRAINT [PK_MOVIMIENTO] PRIMARY KEY CLUSTERED 
(
	[MOVIMIENTO_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PLANILLA]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLANILLA](
	[PLANILLA_fechaModificacion] [smalldatetime] NULL,
	[TRABAJADOR_dni] [char](10) NULL,
	[PROYECTO_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROYECTO]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROYECTO](
	[PROYECTO_id] [int] IDENTITY(1,1) NOT NULL,
	[PROYECTO_titulo] [varchar](50) NULL,
	[PROYECTO_fechaInicio] [date] NULL,
	[PROYECTO_fechaFin] [date] NULL,
	[PROYECTO_descripcion] [varchar](max) NULL,
	[PROYECTO_nombreCliente] [varchar](50) NULL,
	[PROYECTO_direccion] [varchar](max) NULL,
	[PROYECTO_fondos] [money] NULL,
	[TRABAJADOR_dni] [char](10) NOT NULL,
 CONSTRAINT [PK_PROYECTO] PRIMARY KEY CLUSTERED 
(
	[PROYECTO_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUESTO]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PUESTO](
	[PUESTO_id] [int] IDENTITY(1,1) NOT NULL,
	[PUESTO_nombre] [varchar](50) NULL,
 CONSTRAINT [PK_PUESTO] PRIMARY KEY CLUSTERED 
(
	[PUESTO_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIPO]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO](
	[TIPO_id] [int] IDENTITY(1,1) NOT NULL,
	[TIPO_name] [varchar](50) NULL,
 CONSTRAINT [PK_TIPO] PRIMARY KEY CLUSTERED 
(
	[TIPO_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRABAJADOR]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRABAJADOR](
	[TRABAJADOR_dni] [char](10) NOT NULL,
	[TRABAJADOR_nombre] [varchar](50) NULL,
	[TRABAJADOR_apellido] [varchar](50) NULL,
	[TRABAJADOR_telefono] [char](9) NULL,
	[TRABAJADOR_correo] [varchar](50) NULL,
	[TRABAJADOR_password] [varbinary](max) NULL,
	[PUESTO_id] [int] NULL,
 CONSTRAINT [PK_TRABAJADOR] PRIMARY KEY CLUSTERED 
(
	[TRABAJADOR_dni] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UNIDADES]    Script Date: 03/10/2021 16:46:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UNIDADES](
	[UNIDADES_id] [char](10) NOT NULL,
	[UNIDADES_descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_UNIDADES] PRIMARY KEY CLUSTERED 
(
	[UNIDADES_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CRONOGRAMA] ON 

INSERT [dbo].[CRONOGRAMA] ([CRONOGRAMA_id], [CRONOGRAMA_titulo], [CRONOGRAMA_fechaInicio], [CRONOGRAMA_fechaFin], [CRONOGRAMA_horaInicio], [CRONOGRAMA_horaFin], [CRONOGRAMA_fechaCreacion], [CRONOGRAMA_fechaMod], [CRONOGRAMA_descripcion], [ESTADO_id], [TRABAJADOR_dni], [PROYECTO_id]) VALUES (1, N'ACTIVIDAD02', CAST(N'2021-10-03' AS Date), CAST(N'2021-10-17' AS Date), CAST(N'17:35:00' AS Time), CAST(N'19:36:00' AS Time), CAST(N'2021-10-03T16:34:00' AS SmallDateTime), CAST(N'2021-10-03T21:35:00' AS SmallDateTime), N'sssssssss', 3, N'73412863  ', 1)
SET IDENTITY_INSERT [dbo].[CRONOGRAMA] OFF
GO
SET IDENTITY_INSERT [dbo].[ESTADO] ON 

INSERT [dbo].[ESTADO] ([ESTADO_id], [ESTADO_descripcion]) VALUES (1, N'En Proceso')
INSERT [dbo].[ESTADO] ([ESTADO_id], [ESTADO_descripcion]) VALUES (2, N'Completado')
INSERT [dbo].[ESTADO] ([ESTADO_id], [ESTADO_descripcion]) VALUES (3, N'Por Verificar')
SET IDENTITY_INSERT [dbo].[ESTADO] OFF
GO
SET IDENTITY_INSERT [dbo].[INFORME] ON 

INSERT [dbo].[INFORME] ([INFORME_id], [INFORME_titulo], [INFORME_descripcion], [INFORME_fecha], [INFORME_fechaSolucion], [INFORME_Solucion], [ESTADO_id], [TRABAJADOR_dni], [PROYECTO_id]) VALUES (1, N'asas', N'asasas', CAST(N'2021-10-03T16:41:00' AS SmallDateTime), CAST(N'2021-10-03T16:42:00' AS SmallDateTime), N'Se verifico el caso de los camioneros ', 2, N'73412863  ', 1)
SET IDENTITY_INSERT [dbo].[INFORME] OFF
GO
INSERT [dbo].[PLANILLA] ([PLANILLA_fechaModificacion], [TRABAJADOR_dni], [PROYECTO_id]) VALUES (CAST(N'2021-10-03T19:37:00' AS SmallDateTime), N'73412863  ', 1)
INSERT [dbo].[PLANILLA] ([PLANILLA_fechaModificacion], [TRABAJADOR_dni], [PROYECTO_id]) VALUES (CAST(N'2021-10-03T14:41:00' AS SmallDateTime), N'73412863  ', 2)
INSERT [dbo].[PLANILLA] ([PLANILLA_fechaModificacion], [TRABAJADOR_dni], [PROYECTO_id]) VALUES (CAST(N'2021-10-03T00:00:00' AS SmallDateTime), N'73412863  ', 2)
INSERT [dbo].[PLANILLA] ([PLANILLA_fechaModificacion], [TRABAJADOR_dni], [PROYECTO_id]) VALUES (CAST(N'2021-10-03T14:44:00' AS SmallDateTime), N'76572341  ', 2)
INSERT [dbo].[PLANILLA] ([PLANILLA_fechaModificacion], [TRABAJADOR_dni], [PROYECTO_id]) VALUES (CAST(N'2021-10-03T15:26:00' AS SmallDateTime), N'76572341  ', 2)
INSERT [dbo].[PLANILLA] ([PLANILLA_fechaModificacion], [TRABAJADOR_dni], [PROYECTO_id]) VALUES (CAST(N'2021-10-03T14:44:00' AS SmallDateTime), N'76572341  ', 1)
INSERT [dbo].[PLANILLA] ([PLANILLA_fechaModificacion], [TRABAJADOR_dni], [PROYECTO_id]) VALUES (CAST(N'2021-10-03T14:45:00' AS SmallDateTime), N'76572341  ', 1)
GO
SET IDENTITY_INSERT [dbo].[PROYECTO] ON 

INSERT [dbo].[PROYECTO] ([PROYECTO_id], [PROYECTO_titulo], [PROYECTO_fechaInicio], [PROYECTO_fechaFin], [PROYECTO_descripcion], [PROYECTO_nombreCliente], [PROYECTO_direccion], [PROYECTO_fondos], [TRABAJADOR_dni]) VALUES (1, N'ACTIVIDAD02', CAST(N'2019-06-10' AS Date), CAST(N'2021-11-18' AS Date), N'aaaaaaaa', N'LUIS CHALUCA', N'AV.LURIN', 0.0000, N'71258265  ')
INSERT [dbo].[PROYECTO] ([PROYECTO_id], [PROYECTO_titulo], [PROYECTO_fechaInicio], [PROYECTO_fechaFin], [PROYECTO_descripcion], [PROYECTO_nombreCliente], [PROYECTO_direccion], [PROYECTO_fondos], [TRABAJADOR_dni]) VALUES (2, N'Example', CAST(N'2021-10-02' AS Date), CAST(N'2021-10-09' AS Date), N'examample de Descripcion', N'Ramiro', N'Jr. Manco Capac', 0.0000, N'73252961  ')
SET IDENTITY_INSERT [dbo].[PROYECTO] OFF
GO
SET IDENTITY_INSERT [dbo].[PUESTO] ON 

INSERT [dbo].[PUESTO] ([PUESTO_id], [PUESTO_nombre]) VALUES (1, N'capataz')
INSERT [dbo].[PUESTO] ([PUESTO_id], [PUESTO_nombre]) VALUES (2, N'operario')
INSERT [dbo].[PUESTO] ([PUESTO_id], [PUESTO_nombre]) VALUES (3, N'oficial')
INSERT [dbo].[PUESTO] ([PUESTO_id], [PUESTO_nombre]) VALUES (4, N'peon')
INSERT [dbo].[PUESTO] ([PUESTO_id], [PUESTO_nombre]) VALUES (5, N'acomodador')
INSERT [dbo].[PUESTO] ([PUESTO_id], [PUESTO_nombre]) VALUES (6, N'operador equipo')
INSERT [dbo].[PUESTO] ([PUESTO_id], [PUESTO_nombre]) VALUES (7, N'operador equipo pesado')
INSERT [dbo].[PUESTO] ([PUESTO_id], [PUESTO_nombre]) VALUES (8, N'operador equipo mediano')
INSERT [dbo].[PUESTO] ([PUESTO_id], [PUESTO_nombre]) VALUES (9, N'operador electromecanico')
INSERT [dbo].[PUESTO] ([PUESTO_id], [PUESTO_nombre]) VALUES (10, N'topografo')
SET IDENTITY_INSERT [dbo].[PUESTO] OFF
GO
SET IDENTITY_INSERT [dbo].[TIPO] ON 

INSERT [dbo].[TIPO] ([TIPO_id], [TIPO_name]) VALUES (1, N'INGRESO')
INSERT [dbo].[TIPO] ([TIPO_id], [TIPO_name]) VALUES (2, N'Gasto')
SET IDENTITY_INSERT [dbo].[TIPO] OFF
GO
INSERT [dbo].[TRABAJADOR] ([TRABAJADOR_dni], [TRABAJADOR_nombre], [TRABAJADOR_apellido], [TRABAJADOR_telefono], [TRABAJADOR_correo], [TRABAJADOR_password], [PUESTO_id]) VALUES (N'71258265  ', N'Grethel', N'Valera', N'936774426', N'grethelvalera@hotmail.com', 0x02000000FA6BA83F03AB634C9C31D5757866198499672A04F7D1A532341FE4B49798F71E, 1)
INSERT [dbo].[TRABAJADOR] ([TRABAJADOR_dni], [TRABAJADOR_nombre], [TRABAJADOR_apellido], [TRABAJADOR_telefono], [TRABAJADOR_correo], [TRABAJADOR_password], [PUESTO_id]) VALUES (N'73252961  ', N'Ramiro Orlando', N'Chavez Arroyo', N'949882524', N'ramiro_732@outlook.com', 0x02000000B81EFB50FD51A84E418CC95CC6EA6198CCBB4678A360E5063404B78060F6595397EA6CDD60EC479D915D8C0C0FF63400, 1)
INSERT [dbo].[TRABAJADOR] ([TRABAJADOR_dni], [TRABAJADOR_nombre], [TRABAJADOR_apellido], [TRABAJADOR_telefono], [TRABAJADOR_correo], [TRABAJADOR_password], [PUESTO_id]) VALUES (N'73412863  ', N'Luis', N'Chemo', N'986735231', N'Luis@gmail.com', 0x02000000226238A3230EF440B2F570ED080E27C60D90C9CD6F4BF8EAB343E70EC07AB78D, 4)
INSERT [dbo].[TRABAJADOR] ([TRABAJADOR_dni], [TRABAJADOR_nombre], [TRABAJADOR_apellido], [TRABAJADOR_telefono], [TRABAJADOR_correo], [TRABAJADOR_password], [PUESTO_id]) VALUES (N'76572341  ', N'Mariano', N'Pendeivis Salomon', N'986772345', N'Mariano@gmail.com', 0x020000008BD2921CB456CCC96FEA57A2ACC26D0119607492C46D279A22C58CA5C032D66E46B71F54D74A2870D58308EF6DE14819, 5)
GO
ALTER TABLE [dbo].[ARCHIVO]  WITH CHECK ADD  CONSTRAINT [FK_ARCHIVO_PROYECTO] FOREIGN KEY([PROYECTO_id])
REFERENCES [dbo].[PROYECTO] ([PROYECTO_id])
GO
ALTER TABLE [dbo].[ARCHIVO] CHECK CONSTRAINT [FK_ARCHIVO_PROYECTO]
GO
ALTER TABLE [dbo].[ARCHIVO]  WITH CHECK ADD  CONSTRAINT [FK_ARCHIVO_TRABAJADOR] FOREIGN KEY([TRABAJADOR_dni])
REFERENCES [dbo].[TRABAJADOR] ([TRABAJADOR_dni])
GO
ALTER TABLE [dbo].[ARCHIVO] CHECK CONSTRAINT [FK_ARCHIVO_TRABAJADOR]
GO
ALTER TABLE [dbo].[COTIZACION]  WITH CHECK ADD  CONSTRAINT [FK_COTIZACION_PROYECTO] FOREIGN KEY([PROYECTO_id])
REFERENCES [dbo].[PROYECTO] ([PROYECTO_id])
GO
ALTER TABLE [dbo].[COTIZACION] CHECK CONSTRAINT [FK_COTIZACION_PROYECTO]
GO
ALTER TABLE [dbo].[CRONOGRAMA]  WITH CHECK ADD  CONSTRAINT [FK_CRONOGRAMA_ESTADO] FOREIGN KEY([ESTADO_id])
REFERENCES [dbo].[ESTADO] ([ESTADO_id])
GO
ALTER TABLE [dbo].[CRONOGRAMA] CHECK CONSTRAINT [FK_CRONOGRAMA_ESTADO]
GO
ALTER TABLE [dbo].[CRONOGRAMA]  WITH CHECK ADD  CONSTRAINT [FK_CRONOGRAMA_PROYECTO] FOREIGN KEY([PROYECTO_id])
REFERENCES [dbo].[PROYECTO] ([PROYECTO_id])
GO
ALTER TABLE [dbo].[CRONOGRAMA] CHECK CONSTRAINT [FK_CRONOGRAMA_PROYECTO]
GO
ALTER TABLE [dbo].[CRONOGRAMA]  WITH CHECK ADD  CONSTRAINT [FK_CRONOGRAMA_TRABAJADOR] FOREIGN KEY([TRABAJADOR_dni])
REFERENCES [dbo].[TRABAJADOR] ([TRABAJADOR_dni])
GO
ALTER TABLE [dbo].[CRONOGRAMA] CHECK CONSTRAINT [FK_CRONOGRAMA_TRABAJADOR]
GO
ALTER TABLE [dbo].[DESCRIPCION]  WITH CHECK ADD  CONSTRAINT [FK_DESCRIPCION_COTIZACION] FOREIGN KEY([COTIZACION_id])
REFERENCES [dbo].[COTIZACION] ([COTIZACIONN_id])
GO
ALTER TABLE [dbo].[DESCRIPCION] CHECK CONSTRAINT [FK_DESCRIPCION_COTIZACION]
GO
ALTER TABLE [dbo].[DESCRIPCION]  WITH CHECK ADD  CONSTRAINT [FK_DESCRIPCION_MATERIAL] FOREIGN KEY([MATERIAL_id])
REFERENCES [dbo].[MATERIAL] ([MATERIAL_id])
GO
ALTER TABLE [dbo].[DESCRIPCION] CHECK CONSTRAINT [FK_DESCRIPCION_MATERIAL]
GO
ALTER TABLE [dbo].[INFORME]  WITH CHECK ADD  CONSTRAINT [FK_INFORME_ESTADO] FOREIGN KEY([ESTADO_id])
REFERENCES [dbo].[ESTADO] ([ESTADO_id])
GO
ALTER TABLE [dbo].[INFORME] CHECK CONSTRAINT [FK_INFORME_ESTADO]
GO
ALTER TABLE [dbo].[INFORME]  WITH CHECK ADD  CONSTRAINT [FK_INFORME_PROYECTO] FOREIGN KEY([PROYECTO_id])
REFERENCES [dbo].[PROYECTO] ([PROYECTO_id])
GO
ALTER TABLE [dbo].[INFORME] CHECK CONSTRAINT [FK_INFORME_PROYECTO]
GO
ALTER TABLE [dbo].[INFORME]  WITH CHECK ADD  CONSTRAINT [FK_INFORME_TRABAJADOR] FOREIGN KEY([TRABAJADOR_dni])
REFERENCES [dbo].[TRABAJADOR] ([TRABAJADOR_dni])
GO
ALTER TABLE [dbo].[INFORME] CHECK CONSTRAINT [FK_INFORME_TRABAJADOR]
GO
ALTER TABLE [dbo].[MATERIAL]  WITH CHECK ADD  CONSTRAINT [FK_MATERIAL_CATEGORIA] FOREIGN KEY([CATEGORIA_id])
REFERENCES [dbo].[CATEGORIA] ([CATEGORIA_id])
GO
ALTER TABLE [dbo].[MATERIAL] CHECK CONSTRAINT [FK_MATERIAL_CATEGORIA]
GO
ALTER TABLE [dbo].[MATERIAL]  WITH CHECK ADD  CONSTRAINT [FK_MATERIAL_UNIDADES] FOREIGN KEY([UNIDADES_id])
REFERENCES [dbo].[UNIDADES] ([UNIDADES_id])
GO
ALTER TABLE [dbo].[MATERIAL] CHECK CONSTRAINT [FK_MATERIAL_UNIDADES]
GO
ALTER TABLE [dbo].[MOVIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_MOVIMIENTO_ARCHIVO] FOREIGN KEY([ARCHIVO_id])
REFERENCES [dbo].[ARCHIVO] ([ARCHIVO_id])
GO
ALTER TABLE [dbo].[MOVIMIENTO] CHECK CONSTRAINT [FK_MOVIMIENTO_ARCHIVO]
GO
ALTER TABLE [dbo].[MOVIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_MOVIMIENTO_PROYECTO] FOREIGN KEY([PROYECTO_id])
REFERENCES [dbo].[PROYECTO] ([PROYECTO_id])
GO
ALTER TABLE [dbo].[MOVIMIENTO] CHECK CONSTRAINT [FK_MOVIMIENTO_PROYECTO]
GO
ALTER TABLE [dbo].[MOVIMIENTO]  WITH CHECK ADD  CONSTRAINT [FK_MOVIMIENTO_TIPO] FOREIGN KEY([TIPO_id])
REFERENCES [dbo].[TIPO] ([TIPO_id])
GO
ALTER TABLE [dbo].[MOVIMIENTO] CHECK CONSTRAINT [FK_MOVIMIENTO_TIPO]
GO
ALTER TABLE [dbo].[PLANILLA]  WITH CHECK ADD  CONSTRAINT [FK_PLANILLA_PROYECTO] FOREIGN KEY([PROYECTO_id])
REFERENCES [dbo].[PROYECTO] ([PROYECTO_id])
GO
ALTER TABLE [dbo].[PLANILLA] CHECK CONSTRAINT [FK_PLANILLA_PROYECTO]
GO
ALTER TABLE [dbo].[PLANILLA]  WITH CHECK ADD  CONSTRAINT [FK_PLANILLA_TRABAJADOR] FOREIGN KEY([TRABAJADOR_dni])
REFERENCES [dbo].[TRABAJADOR] ([TRABAJADOR_dni])
GO
ALTER TABLE [dbo].[PLANILLA] CHECK CONSTRAINT [FK_PLANILLA_TRABAJADOR]
GO
ALTER TABLE [dbo].[PROYECTO]  WITH CHECK ADD  CONSTRAINT [FK_PROYECTO_TRABAJADOR] FOREIGN KEY([TRABAJADOR_dni])
REFERENCES [dbo].[TRABAJADOR] ([TRABAJADOR_dni])
GO
ALTER TABLE [dbo].[PROYECTO] CHECK CONSTRAINT [FK_PROYECTO_TRABAJADOR]
GO
ALTER TABLE [dbo].[TRABAJADOR]  WITH CHECK ADD  CONSTRAINT [FK_TRABAJADOR_PUESTO] FOREIGN KEY([PUESTO_id])
REFERENCES [dbo].[PUESTO] ([PUESTO_id])
GO
ALTER TABLE [dbo].[TRABAJADOR] CHECK CONSTRAINT [FK_TRABAJADOR_PUESTO]
GO
/****** Object:  StoredProcedure [dbo].[GenerarInForme]    Script Date: 03/10/2021 16:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GenerarInForme]
@Titulo varchar(50),
@Descripcion varchar(MAX),
@DNI char(10),
@IDProyecto int,
@date as smalldatetime
as
insert into INFORME values (@Titulo,@Descripcion,@date,'','',3,@DNI,@IDProyecto)
GO
/****** Object:  StoredProcedure [dbo].[IngresoGastoTotalProyecto]    Script Date: 03/10/2021 16:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[IngresoGastoTotalProyecto]
@IDProyecto as int
as
select sum(MOVIMIENTO_money) from MOVIMIENTO 
where PROYECTO_id =@IDProyecto
group by TIPO_id
GO
/****** Object:  StoredProcedure [dbo].[InsertarSolucion]    Script Date: 03/10/2021 16:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertarSolucion]
@Solucion as varchar(MAX),
@InformeId as int,
@fecha as smalldatetime
As
update INFORME set INFORME_Solucion = @Solucion, INFORME_fechaSolucion = @fecha,ESTADO_id =2 where INFORME_id = @InformeId
GO
/****** Object:  StoredProcedure [dbo].[ListarActividadTotal]    Script Date: 03/10/2021 16:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ListarActividadTotal]
@IDProyecto as int
as
select 
CRONOGRAMA_titulo,
CRONOGRAMA_descripcion,
CONCAT(CRONOGRAMA_fechaInicio, ' T: ', LEFT(CRONOGRAMA_horaInicio,8)),
CONCAT(CRONOGRAMA_fechaFin, ' T: ', LEFT(CRONOGRAMA_horaFin,8)),
CONCAT(TRABAJADOR_apellido,', ',TRABAJADOR_nombre),
ESTADO_id
from CRONOGRAMA, TRABAJADOR
where CRONOGRAMA.TRABAJADOR_dni = TRABAJADOR.TRABAJADOR_dni
and CRONOGRAMA.Proyecto_id = @IDProyecto
GO
/****** Object:  StoredProcedure [dbo].[ModCronograma]    Script Date: 03/10/2021 16:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[ModCronograma] 
@ID as int,
@Descripcion as varchar(max),
@Fecha as date,
@Time as time,
@date as smalldatetime
 as
update CRONOGRAMA set CRONOGRAMA_descripcion = @Descripcion,
CRONOGRAMA_fechaFin = @Fecha, CRONOGRAMA_fechaMod = @date,
ESTADO_id = 1, CRONOGRAMA_horaFin = @Time
where CRONOGRAMA_id = @ID
GO
/****** Object:  StoredProcedure [dbo].[sp_Clave]    Script Date: 03/10/2021 16:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Clave]
@Correo as varchar(50)
AS 
select libre = convert(Varchar(MAX),DECRYPTBYPASSPHRASE('key',TRABAJADOR_password)) 
from TRABAJADOR where TRABAJADOR_Correo = @Correo
GO
/****** Object:  StoredProcedure [dbo].[SP_CreacionUsuario]    Script Date: 03/10/2021 16:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CreacionUsuario]
  @DNI as char(10),
  @NOMBRE as varchar(50),
  @APELLIDO as varchar(50),
  @TELEFONO as char(9),
  @CORREO as varchar(50),
  @PASSWORD as varchar(50)
  as
  declare
  @pssb varbinary(MAX)
  begin
  set @pssb=(ENCRYPTBYPASSPHRASE('key',@PASSWORD));
  insert into TRABAJADOR values (@DNI,@NOMBRE,@APELLIDO,@TELEFONO,@CORREO,@pssb,5)
end;
GO
/****** Object:  StoredProcedure [dbo].[sp_GuardarArchivo]    Script Date: 03/10/2021 16:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_GuardarArchivo]
@titulo as varchar(50),
@data as image,
@descripcion as varchar(50),
@ProyectoID as int,
@DNI as char(10),
@fecha as smalldatetime
as
insert into ARCHIVO values (@titulo,@fecha ,@data,@descripcion,@ProyectoID,@DNI)
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarPlanilla]    Script Date: 03/10/2021 16:46:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_InsertarPlanilla]
@DNI as char(10),
@IdProyecto as int,
@fecha as smalldatetime
as
Insert into PLANILLA values(@fecha,@DNI,@IdProyecto)
GO
/****** Object:  StoredProcedure [dbo].[sp_insertCronograma]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_insertCronograma]
@Titulo as varchar(50),
@Descripcion as varchar(MAX),
@DNI as char(10),
@FechaInicio as date,
@HoraIncio as Time,
@FechaFin as date,
@HoraFin as Time,
@Proyecto as int,
@date as smalldatetime
AS
insert into CRONOGRAMA values (@Titulo,@FechaInicio,@FechaFin,@HoraIncio,@HoraFin,@date,@date,@Descripcion,1,@DNI,@Proyecto)
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarCronogramaXFecha]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_ListarCronogramaXFecha]
@DNI as char(10),
@Date as date 
AS
select * from CRONOGRAMA 
where TRABAJADOR_dni = @DNI and (@Date BETWEEN CRONOGRAMA_fechaInicio and CRONOGRAMA_fechaFin)
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarReporteActividadDia]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ListarReporteActividadDia]
@IDProyecto as int,
@date as smalldatetime 
as
select 
CRONOGRAMA_titulo,
CRONOGRAMA_descripcion,
CONCAT(CRONOGRAMA_fechaInicio, ' T: ', LEFT(CRONOGRAMA_horaInicio,8)),
CONCAT(CRONOGRAMA_fechaFin, ' T: ', LEFT(CRONOGRAMA_horaFin,8)),
CONCAT(TRABAJADOR_apellido,', ',TRABAJADOR_nombre),
ESTADO_id
from CRONOGRAMA, TRABAJADOR
where CRONOGRAMA.TRABAJADOR_dni = TRABAJADOR.TRABAJADOR_dni
and CRONOGRAMA.Proyecto_id = @IDProyecto
and (@date BETWEEN CRONOGRAMA_fechaInicio and CRONOGRAMA_fechaFin)
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarReporteActividadDiaXestado]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ListarReporteActividadDiaXestado]
@IDProyecto as int
as
select 
CRONOGRAMA_titulo,
CRONOGRAMA_descripcion,
CONCAT(CRONOGRAMA_fechaInicio, ' T: ', LEFT(CRONOGRAMA_horaInicio,8)),
CONCAT(CRONOGRAMA_fechaFin, ' T: ', LEFT(CRONOGRAMA_horaFin,8)),
CONCAT(TRABAJADOR_apellido,', ',TRABAJADOR_nombre),
CRONOGRAMA_fechaMod
from CRONOGRAMA, TRABAJADOR
where CRONOGRAMA.TRABAJADOR_dni = TRABAJADOR.TRABAJADOR_dni
and CRONOGRAMA.Proyecto_id = @IDProyecto
and CRONOGRAMA.ESTADO_id = 2
and cast(CRONOGRAMA_fechaMod as date) = cast(GETDATE() as date)
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarReporteActividadSemana]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ListarReporteActividadSemana]
@IDProyecto as int,
@fecha as date
as
select 
CRONOGRAMA_titulo,
CRONOGRAMA_descripcion,
CONCAT(CRONOGRAMA_fechaInicio, ' T: ', LEFT(CRONOGRAMA_horaInicio,8)),
CONCAT(CRONOGRAMA_fechaFin, ' T: ', LEFT(CRONOGRAMA_horaFin,8)),
CONCAT(TRABAJADOR_apellido,', ',TRABAJADOR_nombre)
from CRONOGRAMA, TRABAJADOR
where CRONOGRAMA.TRABAJADOR_dni = TRABAJADOR.TRABAJADOR_dni
and CRONOGRAMA.Proyecto_id = @IDProyecto
and (@fecha BETWEEN CRONOGRAMA_fechaInicio and CRONOGRAMA_fechaFin)
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarReporteActividadSemanaXEstado]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ListarReporteActividadSemanaXEstado]
@Estado as int,
@IDProyecto as int,
@fecha as date
as
select 
CRONOGRAMA_titulo,
CRONOGRAMA_descripcion,
CONCAT(CRONOGRAMA_fechaInicio, ' T: ', LEFT(CRONOGRAMA_horaInicio,8)),
CONCAT(CRONOGRAMA_fechaFin, ' T: ', LEFT(CRONOGRAMA_horaFin,8)),
CONCAT(TRABAJADOR_apellido,', ',TRABAJADOR_nombre),
CRONOGRAMA_fechaCreacion,CRONOGRAMA_fechaMod
from CRONOGRAMA, TRABAJADOR
where CRONOGRAMA.TRABAJADOR_dni = TRABAJADOR.TRABAJADOR_dni
and CRONOGRAMA.Proyecto_id = @IDProyecto
and ESTADO_id = @Estado
and cast(CRONOGRAMA_fechaMod as date) = @fecha
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarReporteActividadSemanaXEstadoXSemana]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ListarReporteActividadSemanaXEstadoXSemana]
@IDProyecto as int,
@fecha as date
as
select 
CRONOGRAMA_titulo,
CRONOGRAMA_descripcion,
CONCAT(CRONOGRAMA_fechaInicio, ' T: ', LEFT(CRONOGRAMA_horaInicio,8)),
CONCAT(CRONOGRAMA_fechaFin, ' T: ', LEFT(CRONOGRAMA_horaFin,8)),
CONCAT(TRABAJADOR_apellido,', ',TRABAJADOR_nombre),
CRONOGRAMA_fechaMod,ESTADO_id
from CRONOGRAMA, TRABAJADOR
where CRONOGRAMA.TRABAJADOR_dni = TRABAJADOR.TRABAJADOR_dni
and CRONOGRAMA.Proyecto_id = @IDProyecto
and (@fecha BETWEEN CRONOGRAMA_fechaInicio and CRONOGRAMA_fechaFin)
GO
/****** Object:  StoredProcedure [dbo].[sp_ListarReporteActividadSemanaXEstadoXSemanaCreada]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ListarReporteActividadSemanaXEstadoXSemanaCreada]
@IDProyecto as int,
@fecha as date
as
select 
CRONOGRAMA_titulo,
CRONOGRAMA_descripcion,
CONCAT(CRONOGRAMA_fechaInicio, ' T: ', LEFT(CRONOGRAMA_horaInicio,8)),
CONCAT(CRONOGRAMA_fechaFin, ' T: ', LEFT(CRONOGRAMA_horaFin,8)),
CONCAT(TRABAJADOR_apellido,', ',TRABAJADOR_nombre),
CRONOGRAMA_fechaCreacion
from CRONOGRAMA, TRABAJADOR
where CRONOGRAMA.TRABAJADOR_dni = TRABAJADOR.TRABAJADOR_dni
and CRONOGRAMA.Proyecto_id = @IDProyecto
and Cast(CRONOGRAMA_fechaCreacion as date) = @fecha
GO
/****** Object:  StoredProcedure [dbo].[sp_ListaTrabajadores]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ListaTrabajadores] 
@IdPuesto as int as
select TRABAJADOR.TRABAJADOR_dni,TRABAJADOR.TRABAJADOR_apellido +', ' +TRABAJADOR.TRABAJADOR_nombre,TRABAJADOR.TRABAJADOR_telefono,TRABAJADOR.TRABAJADOR_correo,PUESTO.Puesto_nombre from TRABAJADOR,PUESTO 
where PUESTO.PUESTO_id = TRABAJADOR.PUESTO_id and TRABAJADOR.PUESTO_id != @IdPuesto;
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarMovimiento]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_MostrarMovimiento]
@IDProyecto as int,
@FechaInicio as date,
@FechaFin as date
As
select 
TIPO_id,
MOVIMIENTO_titulo,
MOVIMIENTO_descripcion,
MOVIMIENTO_money,
MOVIMIENTO_RUC,
MOVIMIENTO_razonSocial,
MOVIMIENTO_fecha,
ARCHIVO_id from MOVIMIENTO where PROYECTO_id = @IDProyecto 
and (MOVIMIENTO_fecha BETWEEN @FechaInicio and @FechaFin)
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarMovimientoAnnio]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_MostrarMovimientoAnnio]
@IDProyecto as int,
@Mes as int,
@date as smalldatetime
As
select  
TIPO_id,
MOVIMIENTO_titulo,
MOVIMIENTO_descripcion,
MOVIMIENTO_money,
MOVIMIENTO_RUC,
MOVIMIENTO_razonSocial,
MOVIMIENTO_fecha,
ARCHIVO_id from MOVIMIENTO where PROYECTO_id = @IDProyecto
and datePArt(year,MOVIMIENTO_fecha) = datePArt(year,@date)
and datePArt(MONTH,MOVIMIENTO_fecha) = @Mes
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarMovimientoTotal]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_MostrarMovimientoTotal]
@IDProyecto as int
As
select  
TIPO_id,
MOVIMIENTO_titulo,
MOVIMIENTO_descripcion,
MOVIMIENTO_money,
MOVIMIENTO_RUC,
MOVIMIENTO_razonSocial,
MOVIMIENTO_fecha,
ARCHIVO_id from MOVIMIENTO where PROYECTO_id = @IDProyecto order by(MOVIMIENTO_fecha)
GO
/****** Object:  StoredProcedure [dbo].[sp_MoviemientoInsert]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_MoviemientoInsert]
@Titulo as varchar(50),
@Descripcion as varchar(max),
@Money as money,
@Ruc as char(11),
@RazonSocial as varchar(max),
@PROYECTO_id as int,
@ARCHIVO_id as int,
@TIPO_id as int,
@date as smalldatetime
AS
insert into MOVIMIENTO values(@Titulo,@Descripcion,@Money,@Ruc,@RazonSocial,@date,@PROYECTO_id,@ARCHIVO_id,@TIPO_id)
GO
/****** Object:  StoredProcedure [dbo].[sp_ProyectoCreado]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_ProyectoCreado]
@IDproyecto int,
@fecha smalldatetime
as select
CRONOGRAMA_titulo,
CRONOGRAMA_descripcion,
CONCAT(CRONOGRAMA_fechaInicio, ' T: ', LEFT(CRONOGRAMA_horaInicio,8)),
CONCAT(CRONOGRAMA_fechaFin, ' T: ', LEFT(CRONOGRAMA_horaFin,8)),
CONCAT(TRABAJADOR_apellido,', ',TRABAJADOR_nombre),
LEFT(CAST(CRONOGRAMA_fechaCreacion as time),8)
from CRONOGRAMA, TRABAJADOR
where CRONOGRAMA.TRABAJADOR_dni = TRABAJADOR.TRABAJADOR_dni 
and Proyecto_id = @IDproyecto
and CAST(CRONOGRAMA_fechaCreacion as date) = cast(@fecha as date)
GO
/****** Object:  StoredProcedure [dbo].[sp_sumDia]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_sumDia]
@Dia as int,
@Mes as int,
@Annio as int,
@Tipo as int,
@Proyecto as int 
AS
select Sum(MOVIMIENTO_money) from MOVIMIENTO
where DAY(MOVIMIENTO_fecha) = @Dia AND MONTH(MOVIMIENTO_fecha) = @Mes AND YEAR(MOVIMIENTO_fecha) = @Annio and TIPO_id = @Tipo and PROYECTO_id = @Proyecto;
GO
/****** Object:  StoredProcedure [dbo].[sp_SumDiaMesMovimiento]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SumDiaMesMovimiento]
@TIPO as int,
@Proyecto as int,
@Mes as int, 
@Dia as int
As
select Sum(MOVIMIENTO_money) Gasto 
FROM MOVIMIENTO 
where MONTH(MOVIMIENTO_fecha) = @Mes and TIPO_id = @TIPO and PROYECTO_id = @Proyecto and DAY(MOVIMIENTO_fecha)=@Dia
GO
/****** Object:  StoredProcedure [dbo].[sp_SumMesMovimiento]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_SumMesMovimiento]
@TIPO as int,
@Proyecto as int,
@Mes as int,
@date as smalldatetime
As
select Sum(MOVIMIENTO_money) Gasto 
FROM MOVIMIENTO 
where Year(MOVIMIENTO_fecha) = DATEPART(year,@date) and TIPO_id = @TIPO and PROYECTO_id = @Proyecto and MONTH(MOVIMIENTO_fecha) = @Mes
GO
/****** Object:  StoredProcedure [dbo].[sp_TituloId_Proyecto]    Script Date: 03/10/2021 16:46:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_TituloId_Proyecto]
@id as int
as
select concat('Proyecto N°',Proyecto.Proyecto_id, ' - ',Proyecto.PROYECTO_titulo ) from PROYECTO where Proyecto_id = @id
GO
ALTER DATABASE [SistemaWebProyecto] SET  READ_WRITE 
GO
