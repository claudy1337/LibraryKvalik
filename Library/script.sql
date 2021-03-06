USE [Library]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 06.07.2022 11:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Author] [nvarchar](100) NOT NULL,
	[YearPublishing] [int] NOT NULL,
	[Pulbisher] [nvarchar](100) NOT NULL,
	[ThemeId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[IsRestrictions] [bit] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06.07.2022 11:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](30) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[Patronymic] [nvarchar](30) NULL,
	[Birthday] [date] NOT NULL,
	[PositionId] [int] NOT NULL,
	[Login] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 06.07.2022 11:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReaderCard]    Script Date: 06.07.2022 11:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReaderCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](30) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[Patronymic] [nvarchar](30) NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[IsBlock] [bit] NULL,
 CONSTRAINT [PK_ReaderCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Theme]    Script Date: 06.07.2022 11:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Theme](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Theme] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TurnOver]    Script Date: 06.07.2022 11:54:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TurnOver](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReaderCardId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[DateIssue] [datetime] NULL,
	[DateReturn] [datetime] NULL,
 CONSTRAINT [PK_TurnOver] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [Title], [Author], [YearPublishing], [Pulbisher], [ThemeId], [Count], [IsRestrictions]) VALUES (1, N'Корпорация', N'Сергей Сергеевич Тармашёв', 2008, N'Аванта + ', 4, 14, 0)
INSERT [dbo].[Book] ([Id], [Title], [Author], [YearPublishing], [Pulbisher], [ThemeId], [Count], [IsRestrictions]) VALUES (2, N'Отцы и дети', N'И. С. Тургенева', 1860, N'Азбука ', 25, 9, 1)
INSERT [dbo].[Book] ([Id], [Title], [Author], [YearPublishing], [Pulbisher], [ThemeId], [Count], [IsRestrictions]) VALUES (3, N'Сладкозвучный серебряный блюз', N'Глен Кук', 2010, N'АКВИЛЕГИЯ-М', 7, 18, 0)
INSERT [dbo].[Book] ([Id], [Title], [Author], [YearPublishing], [Pulbisher], [ThemeId], [Count], [IsRestrictions]) VALUES (4, N'Ночная музыка', N'Джоджо Мойес', 2015, N'Арка ', 26, 8, 1)
INSERT [dbo].[Book] ([Id], [Title], [Author], [YearPublishing], [Pulbisher], [ThemeId], [Count], [IsRestrictions]) VALUES (5, N'Реквием', N'Анна Ахматова', 2011, N'АСТ ', 17, 12, 0)
INSERT [dbo].[Book] ([Id], [Title], [Author], [YearPublishing], [Pulbisher], [ThemeId], [Count], [IsRestrictions]) VALUES (6, N'Леди Елка', N'Яна Тройнич', 2009, N'АСТ-ПРЕСС', 13, 16, 0)
INSERT [dbo].[Book] ([Id], [Title], [Author], [YearPublishing], [Pulbisher], [ThemeId], [Count], [IsRestrictions]) VALUES (7, N'Дом на перекрестке', N'Милена Завойчинская', 2013, N'Б.С.Г.-Пресс ', 26, 3, 1)
INSERT [dbo].[Book] ([Id], [Title], [Author], [YearPublishing], [Pulbisher], [ThemeId], [Count], [IsRestrictions]) VALUES (8, N'Царь Федор. Орел расправляет крылья', N'Роман Злотников', 2010, N'Белый Город', 8, 20, 0)
INSERT [dbo].[Book] ([Id], [Title], [Author], [YearPublishing], [Pulbisher], [ThemeId], [Count], [IsRestrictions]) VALUES (9, N'Издержки хорошего воспитания', N'Фрэнсис Скотт Фицджеральд', 1918, N'Время ', 27, 14, 0)
INSERT [dbo].[Book] ([Id], [Title], [Author], [YearPublishing], [Pulbisher], [ThemeId], [Count], [IsRestrictions]) VALUES (10, N'Выбор решает все', N'Ольга Воскресенская', 2011, N'Livebook', 7, 15, 0)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Surname], [FirstName], [Patronymic], [Birthday], [PositionId], [Login], [Password]) VALUES (1, N'Малинин', N'Алексей', N'Матвеевич', CAST(N'1983-12-18' AS Date), 3, N'1', N'1')
INSERT [dbo].[Employee] ([Id], [Surname], [FirstName], [Patronymic], [Birthday], [PositionId], [Login], [Password]) VALUES (2, N'Дмитриев', N'Фёдор', N'Русланович', CAST(N'1992-02-29' AS Date), 1, N'2', N'2')
INSERT [dbo].[Employee] ([Id], [Surname], [FirstName], [Patronymic], [Birthday], [PositionId], [Login], [Password]) VALUES (3, N'Иванов', N'Даниэль', N'Григорьевич', CAST(N'1984-12-08' AS Date), 2, N'3', N'3')
INSERT [dbo].[Employee] ([Id], [Surname], [FirstName], [Patronymic], [Birthday], [PositionId], [Login], [Password]) VALUES (4, N'Воробьев', N'Тимофей', N'Сергеевич', CAST(N'1981-11-06' AS Date), 1, N'4', N'4')
INSERT [dbo].[Employee] ([Id], [Surname], [FirstName], [Patronymic], [Birthday], [PositionId], [Login], [Password]) VALUES (5, N'Лазарев', N'Фёдор', N'Львович', CAST(N'1988-04-05' AS Date), 1, N'5', N'5')
INSERT [dbo].[Employee] ([Id], [Surname], [FirstName], [Patronymic], [Birthday], [PositionId], [Login], [Password]) VALUES (6, N'Краснова', N'Александра', N'Михайловна', CAST(N'1997-01-27' AS Date), 1, N'6', N'6')
INSERT [dbo].[Employee] ([Id], [Surname], [FirstName], [Patronymic], [Birthday], [PositionId], [Login], [Password]) VALUES (7, N'Львова', N'Мария', N'Данииловна', CAST(N'1995-01-12' AS Date), 1, N'7', N'7')
INSERT [dbo].[Employee] ([Id], [Surname], [FirstName], [Patronymic], [Birthday], [PositionId], [Login], [Password]) VALUES (8, N'Румянцева', N'Валерия', N'Максимовна', CAST(N'1984-03-17' AS Date), 1, N'8', N'8')
INSERT [dbo].[Employee] ([Id], [Surname], [FirstName], [Patronymic], [Birthday], [PositionId], [Login], [Password]) VALUES (9, N'Гладков', N'Юрий', N'Дмитриевич', CAST(N'1990-11-23' AS Date), 1, N'9', N'9')
INSERT [dbo].[Employee] ([Id], [Surname], [FirstName], [Patronymic], [Birthday], [PositionId], [Login], [Password]) VALUES (10, N'Белов', N'Даниил', N'Давидович', CAST(N'1984-06-15' AS Date), 1, N'10', N'10')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([Id], [Title]) VALUES (1, N'Библиотекарь')
INSERT [dbo].[Position] ([Id], [Title]) VALUES (2, N'Заместитель заведующего')
INSERT [dbo].[Position] ([Id], [Title]) VALUES (3, N'Заведующий библиотекой')
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[ReaderCard] ON 

INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (1, N'Калашниковвв', N'Иван', N'Фёдорович', N'шоссе Космонавтов, 53', N'+7(906)264-18-57', 0)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (2, N'Фролов', N'Антон', N'Ильич', N'пер. Бухарестская, 02', N'+7(906)911-26-90', 0)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (3, N'Смирнов', N'Максим', N'Андреевич', N'пер. Ленина, 82', N'+7(906)610-29-39', 0)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (4, N'Белов', N'Даниил ', N'Давидовичfg', N'ул. Космонавтов, 86', N'+7(906)543-72-57', 0)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (5, N'Беляева', N'Арина', N'Михайловна', N'въезд Ладыгина, 28', N'+7(906)171-15-82', 0)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (6, N'Столярова', N'Антонина', N'Андреевна', N'спуск Косиора, 98', N'+7(906)824-37-93', 0)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (7, N'Елисеева', N' Ольга', N'Егоровна', N'наб. Косиора, 61', N'+7(906)541-33-56', 0)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (8, N'Баранова', N'Александра', N'Александровна', N'шоссе Гоголя, 53', N'+7(906)217-16-55', 0)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (9, N'Константинова', N'Яна', N'Платоновна', N'спуск Космонавтов, 44', N'+7(906)669-35-91', 0)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (10, N'Давыдов', N'Артём', N'Дмитриевич', N'ул. Сталина, 82', N'+7(906)124-05-49', 1)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (11, N'абоба', N'бобович', N'ласточкин', N'Бебрина 17', N'313131313', 1)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (12, N'Калашникова', N'Иван', N'Фёдорович', N'шоссе Космонавтов, 53', N'+7(906)264-18-57', 1)
INSERT [dbo].[ReaderCard] ([Id], [Surname], [FirstName], [Patronymic], [Address], [Phone], [IsBlock]) VALUES (13, N'asdasd', N'asdasda', N'asdasd', N'asdad', N'34434', 1)
SET IDENTITY_INSERT [dbo].[ReaderCard] OFF
GO
SET IDENTITY_INSERT [dbo].[Theme] ON 

INSERT [dbo].[Theme] ([Id], [Title]) VALUES (1, N'Бизнес-книги ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (2, N'Классическая литература ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (3, N'Зарубежная литература ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (4, N'Русская литература  ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (5, N'Детские книги ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (6, N'Детективы ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (7, N'Фэнтези')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (8, N'Фантастика ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (9, N'Современная проза ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (10, N'Приключения ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (11, N'Ужасы, мистика')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (12, N'Публицистическая литература ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (13, N'Любовные романы')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (14, N'Боевики, остросюжетная литература')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (15, N'Книги по психологии')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (16, N'Повести, рассказы')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (17, N'Поэзия')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (18, N'Трагедия')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (19, N'Наука и образование ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (20, N'Дом, семья, хобби и досуг ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (21, N'Комиксы, манга ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (22, N'Культура и искусство ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (23, N'Юмористическая литература ')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (24, N'Учебная литература')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (25, N'Роман')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (26, N'Современная литература')
INSERT [dbo].[Theme] ([Id], [Title]) VALUES (27, N'Классика')
SET IDENTITY_INSERT [dbo].[Theme] OFF
GO
SET IDENTITY_INSERT [dbo].[TurnOver] ON 

INSERT [dbo].[TurnOver] ([Id], [ReaderCardId], [BookId], [EmployeeId], [DateIssue], [DateReturn]) VALUES (1, 1, 2, 1, CAST(N'2021-12-01T00:00:00.000' AS DateTime), CAST(N'2021-12-03T11:00:00.000' AS DateTime))
INSERT [dbo].[TurnOver] ([Id], [ReaderCardId], [BookId], [EmployeeId], [DateIssue], [DateReturn]) VALUES (2, 9, 1, 1, CAST(N'2021-11-01T00:00:00.000' AS DateTime), CAST(N'2022-12-04T13:05:00.000' AS DateTime))
INSERT [dbo].[TurnOver] ([Id], [ReaderCardId], [BookId], [EmployeeId], [DateIssue], [DateReturn]) VALUES (3, 2, 5, 1, CAST(N'2021-12-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TurnOver] ([Id], [ReaderCardId], [BookId], [EmployeeId], [DateIssue], [DateReturn]) VALUES (4, 9, 3, 4, CAST(N'2021-12-04T00:00:00.000' AS DateTime), CAST(N'2021-12-04T13:36:00.000' AS DateTime))
INSERT [dbo].[TurnOver] ([Id], [ReaderCardId], [BookId], [EmployeeId], [DateIssue], [DateReturn]) VALUES (5, 9, 4, 4, CAST(N'2021-11-04T00:00:00.000' AS DateTime), CAST(N'2021-12-06T13:30:00.000' AS DateTime))
INSERT [dbo].[TurnOver] ([Id], [ReaderCardId], [BookId], [EmployeeId], [DateIssue], [DateReturn]) VALUES (6, 1, 4, 1, CAST(N'2021-12-05T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[TurnOver] ([Id], [ReaderCardId], [BookId], [EmployeeId], [DateIssue], [DateReturn]) VALUES (7, 2, 6, 4, CAST(N'2021-12-05T00:00:00.000' AS DateTime), CAST(N'2021-12-16T15:55:00.000' AS DateTime))
INSERT [dbo].[TurnOver] ([Id], [ReaderCardId], [BookId], [EmployeeId], [DateIssue], [DateReturn]) VALUES (8, 3, 9, 5, CAST(N'2021-12-05T00:00:00.000' AS DateTime), CAST(N'2021-12-14T10:45:00.000' AS DateTime))
INSERT [dbo].[TurnOver] ([Id], [ReaderCardId], [BookId], [EmployeeId], [DateIssue], [DateReturn]) VALUES (9, 2, 3, 5, CAST(N'2021-12-05T09:06:00.000' AS DateTime), CAST(N'2021-12-12T12:30:00.000' AS DateTime))
INSERT [dbo].[TurnOver] ([Id], [ReaderCardId], [BookId], [EmployeeId], [DateIssue], [DateReturn]) VALUES (10, 9, 5, 6, CAST(N'2021-10-06T12:30:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[TurnOver] OFF
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Theme] FOREIGN KEY([ThemeId])
REFERENCES [dbo].[Theme] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Theme]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position]
GO
ALTER TABLE [dbo].[TurnOver]  WITH CHECK ADD  CONSTRAINT [FK_TurnOver_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[TurnOver] CHECK CONSTRAINT [FK_TurnOver_Book]
GO
ALTER TABLE [dbo].[TurnOver]  WITH CHECK ADD  CONSTRAINT [FK_TurnOver_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[TurnOver] CHECK CONSTRAINT [FK_TurnOver_Employee]
GO
ALTER TABLE [dbo].[TurnOver]  WITH CHECK ADD  CONSTRAINT [FK_TurnOver_ReaderCard] FOREIGN KEY([ReaderCardId])
REFERENCES [dbo].[ReaderCard] ([Id])
GO
ALTER TABLE [dbo].[TurnOver] CHECK CONSTRAINT [FK_TurnOver_ReaderCard]
GO
