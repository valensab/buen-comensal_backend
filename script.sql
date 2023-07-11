/****** Object:  Database [BuenComensal]    Script Date: 10/07/2023 8:17:46 p. m. ******/
CREATE DATABASE [BuenComensal]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [BuenComensal] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [BuenComensal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BuenComensal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BuenComensal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BuenComensal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BuenComensal] SET ARITHABORT OFF 
GO
ALTER DATABASE [BuenComensal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BuenComensal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BuenComensal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BuenComensal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BuenComensal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BuenComensal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BuenComensal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BuenComensal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BuenComensal] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [BuenComensal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BuenComensal] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BuenComensal] SET  MULTI_USER 
GO
ALTER DATABASE [BuenComensal] SET ENCRYPTION ON
GO
ALTER DATABASE [BuenComensal] SET QUERY_STORE = ON
GO
ALTER DATABASE [BuenComensal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[admin_interface_theme]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin_interface_theme](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[active] [bit] NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[title_visible] [bit] NOT NULL,
	[logo] [nvarchar](100) NOT NULL,
	[logo_visible] [bit] NOT NULL,
	[css_header_background_color] [nvarchar](10) NOT NULL,
	[title_color] [nvarchar](10) NOT NULL,
	[css_header_text_color] [nvarchar](10) NOT NULL,
	[css_header_link_color] [nvarchar](10) NOT NULL,
	[css_header_link_hover_color] [nvarchar](10) NOT NULL,
	[css_module_background_color] [nvarchar](10) NOT NULL,
	[css_module_text_color] [nvarchar](10) NOT NULL,
	[css_module_link_color] [nvarchar](10) NOT NULL,
	[css_module_link_hover_color] [nvarchar](10) NOT NULL,
	[css_module_rounded_corners] [bit] NOT NULL,
	[css_generic_link_color] [nvarchar](10) NOT NULL,
	[css_generic_link_hover_color] [nvarchar](10) NOT NULL,
	[css_save_button_background_color] [nvarchar](10) NOT NULL,
	[css_save_button_background_hover_color] [nvarchar](10) NOT NULL,
	[css_save_button_text_color] [nvarchar](10) NOT NULL,
	[css_delete_button_background_color] [nvarchar](10) NOT NULL,
	[css_delete_button_background_hover_color] [nvarchar](10) NOT NULL,
	[css_delete_button_text_color] [nvarchar](10) NOT NULL,
	[list_filter_dropdown] [bit] NOT NULL,
	[related_modal_active] [bit] NOT NULL,
	[related_modal_background_color] [nvarchar](10) NOT NULL,
	[related_modal_rounded_corners] [bit] NOT NULL,
	[logo_color] [nvarchar](10) NOT NULL,
	[recent_actions_visible] [bit] NOT NULL,
	[favicon] [nvarchar](100) NOT NULL,
	[related_modal_background_opacity] [nvarchar](5) NOT NULL,
	[env_name] [nvarchar](50) NOT NULL,
	[env_visible_in_header] [bit] NOT NULL,
	[env_color] [nvarchar](10) NOT NULL,
	[env_visible_in_favicon] [bit] NOT NULL,
	[related_modal_close_button_visible] [bit] NOT NULL,
	[language_chooser_active] [bit] NOT NULL,
	[language_chooser_display] [nvarchar](10) NOT NULL,
	[list_filter_sticky] [bit] NOT NULL,
	[form_pagination_sticky] [bit] NOT NULL,
	[form_submit_sticky] [bit] NOT NULL,
	[css_module_background_selected_color] [nvarchar](10) NOT NULL,
	[css_module_link_selected_color] [nvarchar](10) NOT NULL,
	[logo_max_height] [smallint] NOT NULL,
	[logo_max_width] [smallint] NOT NULL,
	[foldable_apps] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[authtoken_token]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[authtoken_token](
	[key] [nvarchar](40) NOT NULL,
	[created] [datetime2](7) NOT NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetime2](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurants_galleryrestaurant]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurants_galleryrestaurant](
	[id_imagen] [int] IDENTITY(1,1) NOT NULL,
	[imagen] [nvarchar](100) NULL,
	[restaurant_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_imagen] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurants_restaurant]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurants_restaurant](
	[id_restaurant] [int] IDENTITY(1,1) NOT NULL,
	[name_representative] [nvarchar](50) NULL,
	[last_name_representative] [nvarchar](50) NULL,
	[phone_number] [nvarchar](10) NULL,
	[phone_number_representative] [nvarchar](10) NULL,
	[address] [nvarchar](100) NULL,
	[neighborhood] [nvarchar](100) NULL,
	[description] [nvarchar](254) NULL,
	[menu] [nvarchar](100) NULL,
	[prices] [numeric](10, 3) NULL,
	[schedule] [nvarchar](254) NULL,
	[active] [bit] NOT NULL,
	[type_food] [nvarchar](255) NULL,
	[user_id] [bigint] NOT NULL,
	[environment] [nvarchar](254) NULL,
	[vegetarian] [bit] NOT NULL,
	[new] [bit] NOT NULL,
	[punctuation] [int] NULL,
	[date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_restaurant] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[restaurants_tagsrestaurant]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[restaurants_tagsrestaurant](
	[id_tags] [int] IDENTITY(1,1) NOT NULL,
	[tags] [nvarchar](254) NULL,
	[restaurant_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_tags] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suggestions_comments]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suggestions_comments](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[comment] [nvarchar](max) NOT NULL,
	[id_restaurant_id] [int] NOT NULL,
	[id_user_id] [bigint] NOT NULL,
	[date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suggestions_favorites]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suggestions_favorites](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[favorite] [bit] NOT NULL,
	[date] [date] NOT NULL,
	[id_restaurant_id] [int] NOT NULL,
	[id_user_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suggestions_score]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suggestions_score](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[punctuation] [int] NULL,
	[id_restaurant_id] [int] NOT NULL,
	[id_user_id] [bigint] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[date] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taggit_tag]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taggit_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[slug] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[taggit_taggeditem]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taggit_taggeditem](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[object_id] [int] NOT NULL,
	[content_type_id] [int] NOT NULL,
	[tag_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_commensal]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_commensal](
	[id_commensal] [int] IDENTITY(1,1) NOT NULL,
	[phone_number] [nvarchar](10) NULL,
	[new] [bit] NOT NULL,
	[age] [int] NULL,
	[user_id] [bigint] NOT NULL,
	[environment] [nvarchar](254) NULL,
	[interest] [nvarchar](254) NULL,
	[vegetarian] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_commensal] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_user]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetime2](7) NULL,
	[email] [nvarchar](254) NOT NULL,
	[name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[is_active] [bit] NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_restaurant] [bit] NOT NULL,
	[is_commensal] [bit] NOT NULL,
	[is_superuser] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_user_groups]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_user_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_user_user_permissions]    Script Date: 10/07/2023 8:17:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_user_user_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin_interface_theme] ON 

INSERT [dbo].[admin_interface_theme] ([id], [name], [active], [title], [title_visible], [logo], [logo_visible], [css_header_background_color], [title_color], [css_header_text_color], [css_header_link_color], [css_header_link_hover_color], [css_module_background_color], [css_module_text_color], [css_module_link_color], [css_module_link_hover_color], [css_module_rounded_corners], [css_generic_link_color], [css_generic_link_hover_color], [css_save_button_background_color], [css_save_button_background_hover_color], [css_save_button_text_color], [css_delete_button_background_color], [css_delete_button_background_hover_color], [css_delete_button_text_color], [list_filter_dropdown], [related_modal_active], [related_modal_background_color], [related_modal_rounded_corners], [logo_color], [recent_actions_visible], [favicon], [related_modal_background_opacity], [env_name], [env_visible_in_header], [env_color], [env_visible_in_favicon], [related_modal_close_button_visible], [language_chooser_active], [language_chooser_display], [list_filter_sticky], [form_pagination_sticky], [form_submit_sticky], [css_module_background_selected_color], [css_module_link_selected_color], [logo_max_height], [logo_max_width], [foldable_apps]) VALUES (1, N'Django', 0, N'Django administration', 1, N'', 1, N'#0C4B33', N'#F5DD5D', N'#44B78B', N'#FFFFFF', N'#C9F0DD', N'#44B78B', N'#FFFFFF', N'#FFFFFF', N'#C9F0DD', 1, N'#0C3C26', N'#156641', N'#0C4B33', N'#0C3C26', N'#FFFFFF', N'#BA2121', N'#A41515', N'#FFFFFF', 1, 1, N'#000000', 1, N'#FFFFFF', 1, N'', N'0.3', N'', 1, N'#E74C3C', 1, 1, 1, N'code', 1, 0, 0, N'#FFFFCC', N'#FFFFFF', 100, 400, 1)
INSERT [dbo].[admin_interface_theme] ([id], [name], [active], [title], [title_visible], [logo], [logo_visible], [css_header_background_color], [title_color], [css_header_text_color], [css_header_link_color], [css_header_link_hover_color], [css_module_background_color], [css_module_text_color], [css_module_link_color], [css_module_link_hover_color], [css_module_rounded_corners], [css_generic_link_color], [css_generic_link_hover_color], [css_save_button_background_color], [css_save_button_background_hover_color], [css_save_button_text_color], [css_delete_button_background_color], [css_delete_button_background_hover_color], [css_delete_button_text_color], [list_filter_dropdown], [related_modal_active], [related_modal_background_color], [related_modal_rounded_corners], [logo_color], [recent_actions_visible], [favicon], [related_modal_background_opacity], [env_name], [env_visible_in_header], [env_color], [env_visible_in_favicon], [related_modal_close_button_visible], [language_chooser_active], [language_chooser_display], [list_filter_sticky], [form_pagination_sticky], [form_submit_sticky], [css_module_background_selected_color], [css_module_link_selected_color], [logo_max_height], [logo_max_width], [foldable_apps]) VALUES (2, N'El Buen Comensal', 1, N'Administración del Buen Comesal', 1, N'admin-interface/logo/logo_white.png', 1, N'#EAB354', N'#F6F0E7', N'#343434', N'#FFFFFF', N'#3CBBBE', N'#343434', N'#EAB354', N'#FFFFFF', N'#3CBBBE', 1, N'#3CBBBE', N'#A78042', N'#A78042', N'#3CBBBE', N'#FFFFFF', N'#BA2121', N'#A41515', N'#FFFFFF', 1, 1, N'#000000', 1, N'#FFFFFF', 1, N'admin-interface/favicon/logo_white.png', N'0.3', N'El Buen Comensal', 1, N'#A1DA16', 1, 1, 1, N'code', 1, 0, 0, N'#EAEAE8', N'#FFFFFF', 50, 120, 1)
SET IDENTITY_INSERT [dbo].[admin_interface_theme] OFF
GO
SET IDENTITY_INSERT [dbo].[auth_permission] ON 

INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add Theme', 1, N'add_theme')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change Theme', 1, N'change_theme')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete Theme', 1, N'delete_theme')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can view Theme', 1, N'view_theme')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can add log entry', 2, N'add_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can change log entry', 2, N'change_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can delete log entry', 2, N'delete_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can view log entry', 2, N'view_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can add permission', 3, N'add_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can change permission', 3, N'change_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can delete permission', 3, N'delete_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can view permission', 3, N'view_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add group', 4, N'add_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change group', 4, N'change_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete group', 4, N'delete_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can view group', 4, N'view_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can add content type', 5, N'add_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can change content type', 5, N'change_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (19, N'Can delete content type', 5, N'delete_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (20, N'Can view content type', 5, N'view_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (21, N'Can add session', 6, N'add_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (22, N'Can change session', 6, N'change_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (23, N'Can delete session', 6, N'delete_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (24, N'Can view session', 6, N'view_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (25, N'Can add Token', 7, N'add_token')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (26, N'Can change Token', 7, N'change_token')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (27, N'Can delete Token', 7, N'delete_token')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (28, N'Can view Token', 7, N'view_token')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (29, N'Can add token', 8, N'add_tokenproxy')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (30, N'Can change token', 8, N'change_tokenproxy')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (31, N'Can delete token', 8, N'delete_tokenproxy')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (32, N'Can view token', 8, N'view_tokenproxy')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (33, N'Can add tag', 9, N'add_tag')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (34, N'Can change tag', 9, N'change_tag')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (35, N'Can delete tag', 9, N'delete_tag')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (36, N'Can view tag', 9, N'view_tag')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (37, N'Can add tagged item', 10, N'add_taggeditem')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (38, N'Can change tagged item', 10, N'change_taggeditem')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (39, N'Can delete tagged item', 10, N'delete_taggeditem')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (40, N'Can view tagged item', 10, N'view_taggeditem')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (41, N'Can add Usuario', 11, N'add_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (42, N'Can change Usuario', 11, N'change_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (43, N'Can delete Usuario', 11, N'delete_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (44, N'Can view Usuario', 11, N'view_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (45, N'Can add Comensal', 12, N'add_commensal')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (46, N'Can change Comensal', 12, N'change_commensal')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (47, N'Can delete Comensal', 12, N'delete_commensal')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (48, N'Can view Comensal', 12, N'view_commensal')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (49, N'Can add Restaurante', 13, N'add_restaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (50, N'Can change Restaurante', 13, N'change_restaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (51, N'Can delete Restaurante', 13, N'delete_restaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (52, N'Can view Restaurante', 13, N'view_restaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (53, N'Can add Etiqueta', 14, N'add_tagsrestaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (54, N'Can change Etiqueta', 14, N'change_tagsrestaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (55, N'Can delete Etiqueta', 14, N'delete_tagsrestaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (56, N'Can view Etiqueta', 14, N'view_tagsrestaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (57, N'Can add Galería', 15, N'add_galleryrestaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (58, N'Can change Galería', 15, N'change_galleryrestaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (59, N'Can delete Galería', 15, N'delete_galleryrestaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (60, N'Can view Galería', 15, N'view_galleryrestaurant')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (61, N'Can add score', 16, N'add_score')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (62, N'Can change score', 16, N'change_score')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (63, N'Can delete score', 16, N'delete_score')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (64, N'Can view score', 16, N'view_score')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (65, N'Can add score', 17, N'add_score')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (66, N'Can change score', 17, N'change_score')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (67, N'Can delete score', 17, N'delete_score')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (68, N'Can view score', 17, N'view_score')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (69, N'Can add comments', 18, N'add_comments')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (70, N'Can change comments', 18, N'change_comments')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (71, N'Can delete comments', 18, N'delete_comments')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (72, N'Can view comments', 18, N'view_comments')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (73, N'Can add Favorito', 19, N'add_favorites')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (74, N'Can change Favorito', 19, N'change_favorites')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (75, N'Can delete Favorito', 19, N'delete_favorites')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (76, N'Can view Favorito', 19, N'view_favorites')
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
GO
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'1d2d7aaccab9e9b92d029874091395fdfb167fd8', CAST(N'2022-11-15T18:28:05.5419500' AS DateTime2), 176)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'2e5f1595d84ff97d0c4301efc7b6d8d8583d1295', CAST(N'2022-11-28T20:12:46.6193870' AS DateTime2), 183)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'342bc6a37bf39b8fea00bcd9a3fad2a56f200695', CAST(N'2022-10-12T19:34:37.8208570' AS DateTime2), 24)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'36517b6ac3efb94f408b6db8ec72725be3baac1e', CAST(N'2022-10-12T19:23:05.5278720' AS DateTime2), 20)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'4b8f63981db7527f6f782129f102d5a6ab47c8cc', CAST(N'2023-03-27T11:31:25.7163420' AS DateTime2), 170)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'67d4a704aae4000d1a246d7d213f54499bb11463', CAST(N'2022-10-12T19:37:04.8159340' AS DateTime2), 25)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'6de1469faa8128944b5d207c2fdd57e95813a37e', CAST(N'2022-10-12T19:16:27.7205170' AS DateTime2), 17)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'6f5d61f40161d5eb8395a1196e1f00b86b9941bc', CAST(N'2022-10-12T19:24:35.8326850' AS DateTime2), 21)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'7184774d6b6b56bce18cad2377af26c99f1c982a', CAST(N'2022-11-15T18:43:56.5655570' AS DateTime2), 172)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'75364174356f33587434bd9f5b7b2de7bc70f1f8', CAST(N'2022-11-09T13:44:05.5376080' AS DateTime2), 181)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'78d242c208e4ec0c85316b7846b94e3116967960', CAST(N'2022-11-28T20:30:25.9354800' AS DateTime2), 184)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'79abb217ccf444a66cb9b979aa490010f6df0757', CAST(N'2022-11-28T19:26:44.6333540' AS DateTime2), 16)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'8d1152ec7b63972990455df307320e744887525f', CAST(N'2022-11-15T18:47:10.9045380' AS DateTime2), 171)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'9a1041425cc65198dd197dfc8ad04d7d952ca343', CAST(N'2022-10-12T19:21:37.5870550' AS DateTime2), 19)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'a98f0754e07df0ca594485482c87197b3a520086', CAST(N'2022-10-12T19:32:47.6153030' AS DateTime2), 23)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'c0b870da02560520025c8599a8e64a975c0e5b21', CAST(N'2022-06-24T18:56:46.8808530' AS DateTime2), 8)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'c58b83d9e4c9b3d7a9402b53c4ff56b907941655', CAST(N'2022-10-12T19:29:18.5166480' AS DateTime2), 22)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'c6368616c24a196e6fb93d4edc1507c8d3499a7e', CAST(N'2022-10-12T19:19:48.7899550' AS DateTime2), 18)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'cd121fa8d78f747d57e6f5ca9a46d5931ea7fcf1', CAST(N'2022-11-15T18:41:48.4476340' AS DateTime2), 175)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'd25289a5c4c1d6426a93e5d5eb9b71ab9d136906', CAST(N'2022-11-15T18:43:13.7400390' AS DateTime2), 173)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'e29d7735013cc1baf4d3c22e9471c0d8e21c17e6', CAST(N'2022-11-08T13:07:24.0655500' AS DateTime2), 2)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'e8d2c388fcc9b91b2276d08ebf4b771011219471', CAST(N'2022-11-06T12:55:20.7176870' AS DateTime2), 177)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'f0bd082bd4b59f957c4df40f2481c17bb94703d1', CAST(N'2022-06-24T18:43:09.7192710' AS DateTime2), 7)
INSERT [dbo].[authtoken_token] ([key], [created], [user_id]) VALUES (N'f6de34bff1afede409130a32a7784daac9a1c336', CAST(N'2022-11-08T16:52:48.9930220' AS DateTime2), 182)
GO
SET IDENTITY_INSERT [dbo].[django_admin_log] ON 

INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (1, CAST(N'2022-06-18T12:26:22.3532780' AS DateTime2), N'1', N'Commensal object (1)', 2, N'[{"changed": {"fields": ["Vegetariano", "Inter\u00e9s", "Ambiente"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (2, CAST(N'2022-06-18T12:30:03.9881430' AS DateTime2), N'1', N'Commensal object (1)', 2, N'[{"changed": {"fields": ["Vegetariano", "Inter\u00e9s", "Ambiente"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (3, CAST(N'2022-06-18T12:35:35.0292300' AS DateTime2), N'1', N'Commensal object (1)', 2, N'[{"changed": {"fields": ["Nuevo", "Vegetariano", "Inter\u00e9s", "Ambiente"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (4, CAST(N'2022-06-18T12:50:00.2543900' AS DateTime2), N'1', N'Commensal object (1)', 2, N'[{"changed": {"fields": ["Nuevo", "Vegetariano", "Inter\u00e9s", "Ambiente"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (5, CAST(N'2022-06-18T12:54:31.5180840' AS DateTime2), N'1', N'Commensal object (1)', 2, N'[{"changed": {"fields": ["Nuevo", "Vegetariano", "Inter\u00e9s", "Ambiente"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (6, CAST(N'2022-06-18T12:56:30.2291940' AS DateTime2), N'1', N'Commensal object (1)', 2, N'[]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (7, CAST(N'2022-06-21T19:32:25.5890070' AS DateTime2), N'1', N'Commensal object (1)', 2, N'[{"changed": {"fields": ["Nuevo", "Inter\u00e9s", "Ambiente"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (8, CAST(N'2022-06-21T19:38:49.4788450' AS DateTime2), N'1', N'Restaurant object (1)', 2, N'[{"deleted": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (None)"}}, {"deleted": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (None)"}}, {"deleted": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (None)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (9, CAST(N'2022-06-21T19:53:07.5212320' AS DateTime2), N'6', N'GalleryRestaurant object (6)', 3, N'', 15, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (10, CAST(N'2022-06-21T19:53:07.7833570' AS DateTime2), N'5', N'GalleryRestaurant object (5)', 3, N'', 15, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (11, CAST(N'2022-06-21T19:53:08.0278670' AS DateTime2), N'4', N'GalleryRestaurant object (4)', 3, N'', 15, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (12, CAST(N'2022-06-23T18:35:50.8004640' AS DateTime2), N'1', N'Restaurant object (1)', 2, N'[{"changed": {"fields": ["Tipo de comida", "Ambiente"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (13, CAST(N'2022-06-23T18:35:54.7682180' AS DateTime2), N'1', N'Restaurant object (1)', 2, N'[]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (14, CAST(N'2022-06-23T18:56:50.6435160' AS DateTime2), N'3', N'Restaurant object (3)', 2, N'[{"changed": {"fields": ["Nuevo"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (15, CAST(N'2022-06-23T18:57:28.9017970' AS DateTime2), N'3', N'Restaurant object (3)', 2, N'[{"changed": {"fields": ["Nuevo"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (16, CAST(N'2022-10-12T18:35:31.9091760' AS DateTime2), N'12', N'Restaurante Daniel ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (17, CAST(N'2022-10-12T18:36:55.8764160' AS DateTime2), N'13', N'Restaurante Daniel ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (18, CAST(N'2022-10-12T18:39:25.8619430' AS DateTime2), N'10', N'Restaurant object (10)', 3, N'', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (19, CAST(N'2022-10-12T18:40:02.7961880' AS DateTime2), N'14', N'Restaurante Daniel ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (20, CAST(N'2022-10-12T18:47:47.4568170' AS DateTime2), N'15', N'Restaurante Daniel ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (21, CAST(N'2022-10-12T21:15:19.3574390' AS DateTime2), N'29', N'Pescadería ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (22, CAST(N'2022-10-12T21:15:19.6091490' AS DateTime2), N'28', N'Pescadería ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (23, CAST(N'2022-10-12T21:15:19.8799050' AS DateTime2), N'27', N'Pescadería ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (24, CAST(N'2022-10-12T21:15:20.1300760' AS DateTime2), N'26', N'Pescadería ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (25, CAST(N'2022-10-12T21:32:12.4556950' AS DateTime2), N'32', N'Pescadería ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (26, CAST(N'2022-10-12T21:32:12.7297090' AS DateTime2), N'31', N'Pescadería ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (27, CAST(N'2022-10-12T21:32:12.9793630' AS DateTime2), N'30', N'Pescadería ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (28, CAST(N'2022-10-12T22:39:20.2147770' AS DateTime2), N'11', N'Pescadería ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (29, CAST(N'2022-10-12T22:39:20.4601190' AS DateTime2), N'10', N'Arepas ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (30, CAST(N'2022-10-12T22:39:20.7110220' AS DateTime2), N'9', N'Melissa ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (31, CAST(N'2022-10-12T22:39:20.9736840' AS DateTime2), N'6', N'Nieto ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (32, CAST(N'2022-10-12T22:39:21.2212700' AS DateTime2), N'5', N'Melissa ', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (33, CAST(N'2022-10-12T22:39:21.4650690' AS DateTime2), N'4', N'Paula Sabogal', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (34, CAST(N'2022-10-12T22:39:21.7130420' AS DateTime2), N'3', N'Pepito perez', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (35, CAST(N'2022-10-14T18:45:59.2630350' AS DateTime2), N'21', N'Restaurant object (21)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (36, CAST(N'2022-10-14T18:46:24.8210620' AS DateTime2), N'20', N'Restaurant object (20)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (37, CAST(N'2022-10-14T18:47:20.5145240' AS DateTime2), N'19', N'Restaurant object (19)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (38, CAST(N'2022-10-14T18:47:38.8542230' AS DateTime2), N'18', N'Restaurant object (18)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (39, CAST(N'2022-10-14T18:47:45.5602640' AS DateTime2), N'19', N'Restaurant object (19)', 2, N'[]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (40, CAST(N'2022-10-14T18:48:14.9849480' AS DateTime2), N'17', N'Restaurant object (17)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (41, CAST(N'2022-10-14T18:48:22.1748790' AS DateTime2), N'16', N'Restaurant object (16)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (42, CAST(N'2022-10-14T18:48:38.8148900' AS DateTime2), N'14', N'Restaurant object (14)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (43, CAST(N'2022-10-14T18:48:44.7191860' AS DateTime2), N'15', N'Restaurant object (15)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (44, CAST(N'2022-10-14T18:49:06.3507030' AS DateTime2), N'12', N'Restaurant object (12)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (45, CAST(N'2022-10-14T18:49:13.5002320' AS DateTime2), N'13', N'Restaurant object (13)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (46, CAST(N'2022-10-20T11:29:50.6268120' AS DateTime2), N'2', N'Kevin Rodríguez', 2, N'[{"changed": {"fields": ["Nombre"]}}]', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (47, CAST(N'2022-10-20T19:39:57.4374290' AS DateTime2), N'1', N'Score object (1)', 2, N'[{"changed": {"fields": ["Comensal"]}}]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (48, CAST(N'2022-10-20T19:39:59.3863280' AS DateTime2), N'1', N'Score object (1)', 2, N'[]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (49, CAST(N'2022-10-20T19:40:44.3352830' AS DateTime2), N'2', N'Score object (2)', 2, N'[{"changed": {"fields": ["Comensal"]}}]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (50, CAST(N'2022-10-25T19:56:15.7144400' AS DateTime2), N'7', N'Commensal object (7)', 2, N'[{"changed": {"fields": ["Vegetariano", "Inter\u00e9s", "Ambiente"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (51, CAST(N'2022-10-25T19:56:57.5757710' AS DateTime2), N'7', N'Commensal object (7)', 2, N'[{"changed": {"fields": ["Nuevo"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (52, CAST(N'2022-10-25T22:10:57.2976660' AS DateTime2), N'35', N'Rosmery Poe', 2, N'[{"changed": {"fields": ["Correo Electr\u00f3nico", "Nombre", "Apellido", "Comensal"]}}]', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (53, CAST(N'2022-10-25T22:12:56.3948030' AS DateTime2), N'9', N'Commensal object (9)', 1, N'[{"added": {}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (54, CAST(N'2022-10-25T22:25:00.5703550' AS DateTime2), N'2', N'Score object (2)', 2, N'[{"changed": {"fields": ["Comensal"]}}]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (55, CAST(N'2022-10-26T12:45:52.3028610' AS DateTime2), N'2', N'El Buen Comensal', 1, N'[{"added": {}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (56, CAST(N'2022-10-26T12:47:56.7732420' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Background color", "Text color", "Link hover color", "Background color", "Background selected color", "Background hover color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (57, CAST(N'2022-10-26T12:50:12.7539440' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Background selected color", "Text color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (58, CAST(N'2022-10-26T12:50:36.0732310' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Max width", "Max height"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (59, CAST(N'2022-10-26T12:52:03.5105100' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Background color", "Background selected color", "Text color", "Background hover color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (60, CAST(N'2022-10-26T12:54:26.9811100' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Max width", "Max height"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (61, CAST(N'2022-10-26T12:55:24.4512500' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Max width", "Max height"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (62, CAST(N'2022-10-26T12:55:46.6512800' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Max width"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (63, CAST(N'2022-10-26T12:56:57.7742270' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Max width", "Max height", "Link color", "Background hover color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (64, CAST(N'2022-10-26T13:03:17.4944760' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Link color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (65, CAST(N'2022-10-26T13:05:29.1568890' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Link hover color", "Background color", "Background hover color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (66, CAST(N'2022-10-26T13:06:11.2874290' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Background hover color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (67, CAST(N'2022-10-26T13:07:02.3685160' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Link color", "Background color", "Background hover color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (68, CAST(N'2022-10-26T13:10:11.1517640' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Link color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (69, CAST(N'2022-10-26T13:12:44.9897030' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Link hover color", "Link hover color", "Link color", "Link hover color", "Background color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (70, CAST(N'2022-10-26T13:13:10.6579460' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Background hover color"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (71, CAST(N'2022-10-26T13:24:18.9513450' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Visible in header (marker and name)"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (72, CAST(N'2022-10-26T13:24:41.6960690' AS DateTime2), N'2', N'El Buen Comensal', 2, N'[{"changed": {"fields": ["Visible in header (marker and name)"]}}]', 1, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (73, CAST(N'2022-10-31T21:33:42.6182600' AS DateTime2), N'4', N'Comments object (4)', 1, N'[{"added": {}}]', 18, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (74, CAST(N'2022-10-31T21:35:11.9822540' AS DateTime2), N'5', N'Comments object (5)', 1, N'[{"added": {}}]', 18, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (75, CAST(N'2022-10-31T21:39:07.4367210' AS DateTime2), N'6', N'Comments object (6)', 1, N'[{"added": {}}]', 18, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (76, CAST(N'2022-10-31T21:39:37.8652010' AS DateTime2), N'6', N'Comments object (6)', 3, N'', 18, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (77, CAST(N'2022-10-31T21:40:27.5239880' AS DateTime2), N'3', N'Score object (3)', 2, N'[{"changed": {"fields": ["Comentarios"]}}]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (78, CAST(N'2022-10-31T21:41:04.5530110' AS DateTime2), N'2', N'Score object (2)', 2, N'[{"changed": {"fields": ["Comentarios"]}}]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (79, CAST(N'2022-10-31T21:41:51.7677370' AS DateTime2), N'5', N'Score object (5)', 1, N'[{"added": {}}]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (80, CAST(N'2022-10-31T21:42:34.4775910' AS DateTime2), N'5', N'Score object (5)', 2, N'[{"changed": {"fields": ["Restaurante"]}}]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (81, CAST(N'2022-10-31T21:43:36.1281250' AS DateTime2), N'2', N'Score object (2)', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (82, CAST(N'2022-10-31T23:31:49.9038580' AS DateTime2), N'7', N'Commensal object (7)', 2, N'[{"changed": {"fields": ["Inter\u00e9s", "Ambiente"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (83, CAST(N'2022-10-31T23:32:59.4386350' AS DateTime2), N'1', N'Commensal object (1)', 2, N'[{"changed": {"fields": ["Inter\u00e9s", "Ambiente"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (84, CAST(N'2022-10-31T23:38:20.0520320' AS DateTime2), N'1', N'Score object (1)', 2, N'[{"changed": {"fields": ["Restaurante", "Comentarios"]}}]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (85, CAST(N'2022-10-31T23:39:27.8555470' AS DateTime2), N'38', N'Camila Martinez', 3, N'', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (86, CAST(N'2022-10-31T23:40:24.4403990' AS DateTime2), N'4', N'Comments object (4)', 2, N'[{"changed": {"fields": ["Restaurante", "Comensal", "Sugerencias"]}}]', 18, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (87, CAST(N'2022-10-31T23:43:36.4187790' AS DateTime2), N'9', N'Commensal object (9)', 2, N'[{"changed": {"fields": ["Inter\u00e9s", "Ambiente"]}}]', 12, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (88, CAST(N'2022-11-01T12:10:47.8448170' AS DateTime2), N'3', N'Super Delicia ', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (89, CAST(N'2022-11-01T20:24:25.7997560' AS DateTime2), N'3', N'Super Delicia ', 2, N'[{"changed": {"fields": ["Horario de atenci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (90, CAST(N'2022-11-01T22:45:25.0869020' AS DateTime2), N'4', N'Kevin Restaurante ', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (91, CAST(N'2022-11-02T20:21:49.1439190' AS DateTime2), N'28', N'La Brasserie ', 2, N'[{"changed": {"fields": ["Tipo de comida", "Ambiente"]}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (63)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (64)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (92, CAST(N'2022-11-02T20:25:24.0287850' AS DateTime2), N'28', N'La Brasserie ', 2, N'[{"changed": {"fields": ["Precios"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (93, CAST(N'2022-11-02T20:26:24.5290470' AS DateTime2), N'28', N'La Brasserie ', 2, N'[{"changed": {"fields": ["Precios"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (94, CAST(N'2022-11-02T20:32:57.1769890' AS DateTime2), N'29', N'La Fabbrica ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (65)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (66)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (95, CAST(N'2022-11-02T20:35:40.7254800' AS DateTime2), N'29', N'La Fabbrica ', 2, N'[]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (96, CAST(N'2022-11-02T21:28:51.4718250' AS DateTime2), N'143', N'7 Cabras None', 2, N'[{"changed": {"fields": ["Password", "Nombre"]}}]', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (97, CAST(N'2022-11-02T21:32:52.0384900' AS DateTime2), N'143', N'7 Cabras Restaurante Bar', 2, N'[{"changed": {"fields": ["Apellido"]}}]', 11, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (98, CAST(N'2022-11-02T21:34:20.0278550' AS DateTime2), N'30', N'7 Cabras Restaurante Bar', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (67)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (68)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (99, CAST(N'2022-11-02T21:43:35.7840500' AS DateTime2), N'28', N'La Brasserie ', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
GO
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (100, CAST(N'2022-11-02T21:46:14.6674100' AS DateTime2), N'29', N'La Fabbrica ', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (101, CAST(N'2022-11-02T21:47:40.5689850' AS DateTime2), N'30', N'7 Cabras Restaurante Bar', 2, N'[{"changed": {"fields": ["Puntuaci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (102, CAST(N'2022-11-02T21:57:58.1431520' AS DateTime2), N'31', N'La Romana Restaurante ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (69)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (70)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (103, CAST(N'2022-11-02T22:02:49.6963200' AS DateTime2), N'32', N'Mini Mal ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (71)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (72)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (104, CAST(N'2022-11-02T22:12:20.2008670' AS DateTime2), N'33', N'Restaurante 69 Gauchos ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (73)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (74)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (105, CAST(N'2022-11-02T22:17:47.6354970' AS DateTime2), N'34', N'Cantina y Punto ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (75)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (76)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (106, CAST(N'2022-11-02T22:26:42.3867120' AS DateTime2), N'35', N'Mesa Franca ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (77)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (78)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (107, CAST(N'2022-11-03T19:14:06.8942700' AS DateTime2), N'1', N'Comments object (1)', 2, N'[{"changed": {"fields": ["Comensal"]}}]', 18, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (108, CAST(N'2022-11-03T21:35:52.6985090' AS DateTime2), N'35', N'Mesa Franca ', 2, N'[{"changed": {"fields": ["Ambiente"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (109, CAST(N'2022-11-03T21:38:37.0977260' AS DateTime2), N'36', N'OAK Ahumado y Brebajes ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (79)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (80)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (110, CAST(N'2022-11-03T21:44:10.4477880' AS DateTime2), N'37', N'MUY Chapinero ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (81)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (82)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (111, CAST(N'2022-11-03T21:44:39.7941610' AS DateTime2), N'37', N'MUY Chapinero ', 2, N'[{"changed": {"fields": ["Tipo de comida"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (112, CAST(N'2022-11-03T21:49:06.1154770' AS DateTime2), N'38', N'The Market Bogotá ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (83)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (84)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (113, CAST(N'2022-11-03T21:52:39.3908700' AS DateTime2), N'39', N'La Ventana ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (85)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (86)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (114, CAST(N'2022-11-03T21:54:38.5338890' AS DateTime2), N'39', N'La Ventana ', 2, N'[{"changed": {"fields": ["Men\u00fa"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (115, CAST(N'2022-11-03T22:01:27.4530090' AS DateTime2), N'40', N'Dilucca To Go Chapinero ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (87)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (88)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (116, CAST(N'2022-11-03T22:08:49.4307550' AS DateTime2), N'41', N'La Diva Bogota ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (89)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (90)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (117, CAST(N'2022-11-03T22:13:18.1962030' AS DateTime2), N'42', N'Casa Bar Bistro ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (91)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (92)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (118, CAST(N'2022-11-03T22:23:09.9183910' AS DateTime2), N'43', N'Donde Pele Chapinero ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (93)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (94)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (119, CAST(N'2022-11-03T22:26:28.7563260' AS DateTime2), N'44', N'Bhips Hamburguesas ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (95)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (96)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (120, CAST(N'2022-11-03T22:28:48.7115350' AS DateTime2), N'44', N'Bhips Hamburguesas ', 2, N'[{"changed": {"fields": ["Descripci\u00f3n"]}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (121, CAST(N'2022-11-03T22:33:48.4774610' AS DateTime2), N'45', N'Gato Negro ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (97)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (98)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (122, CAST(N'2022-11-03T22:49:21.6143810' AS DateTime2), N'46', N'Humo Negro ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (99)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (100)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (123, CAST(N'2022-11-03T22:53:44.8798920' AS DateTime2), N'47', N'Restaurante La Herencia ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (101)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (102)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (124, CAST(N'2022-11-03T22:57:41.6755330' AS DateTime2), N'48', N'Sakura Enjoy ', 2, N'[{"changed": {"fields": ["Vegetariano"]}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (103)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (104)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (125, CAST(N'2022-11-03T23:05:28.1331160' AS DateTime2), N'50', N'Chef Burger Parque 93 ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (105)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (106)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (126, CAST(N'2022-11-03T23:07:09.4719170' AS DateTime2), N'49', N'KONG Restaurante ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (107)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (108)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (127, CAST(N'2022-11-03T23:16:03.9665330' AS DateTime2), N'52', N'Restaurante Nazca ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (109)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (110)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (128, CAST(N'2022-11-03T23:16:44.6580540' AS DateTime2), N'51', N'Itanos ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (111)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (112)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (129, CAST(N'2022-11-03T23:24:44.0837100' AS DateTime2), N'55', N'La Revolución de la Cuchara ', 1, N'[{"added": {}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (113)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (114)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (130, CAST(N'2022-11-03T23:26:38.7127440' AS DateTime2), N'53', N'Marrakesh Comida Marroquí Chapinero ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (115)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (116)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (131, CAST(N'2022-11-03T23:30:55.3605570' AS DateTime2), N'56', N'Restaurante Chambaku ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (117)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (118)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (132, CAST(N'2022-11-04T00:57:54.6826850' AS DateTime2), N'57', N'Restaurante El Cielo ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (119)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (120)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (133, CAST(N'2022-11-04T01:01:09.1169960' AS DateTime2), N'58', N'El Árabe ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (121)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (122)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (134, CAST(N'2022-11-04T13:37:28.1257910' AS DateTime2), N'63', N'Un Toro Y Siete Vacas ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (123)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (124)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (135, CAST(N'2022-11-04T13:39:22.1368970' AS DateTime2), N'62', N'Criterión ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (125)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (126)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (136, CAST(N'2022-11-04T13:41:10.0151590' AS DateTime2), N'61', N'Capo Di Capi ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (127)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (128)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (137, CAST(N'2022-11-04T13:43:17.4866730' AS DateTime2), N'60', N'Takuma Cocina Show ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (129)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (130)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (138, CAST(N'2022-11-04T13:44:49.7403250' AS DateTime2), N'59', N'Harry Sasson ', 2, N'[{"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (131)"}}, {"added": {"name": "Galer\u00eda", "object": "GalleryRestaurant object (132)"}}]', 13, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (139, CAST(N'2022-11-06T14:20:38.7189140' AS DateTime2), N'16', N'Favorites object (16)', 3, N'', 19, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (140, CAST(N'2022-11-06T14:21:10.0631940' AS DateTime2), N'18', N'Favorites object (18)', 3, N'', 19, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (141, CAST(N'2022-11-06T14:21:10.3167740' AS DateTime2), N'17', N'Favorites object (17)', 3, N'', 19, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (142, CAST(N'2022-11-28T18:53:09.8679810' AS DateTime2), N'163', N'Score object (163)', 1, N'[{"added": {}}]', 17, 1)
INSERT [dbo].[django_admin_log] ([id], [action_time], [object_id], [object_repr], [action_flag], [change_message], [content_type_id], [user_id]) VALUES (143, CAST(N'2022-11-28T19:20:03.5081400' AS DateTime2), N'183', N'Restaurante Alitas de luis None', 2, N'[{"changed": {"fields": ["Password"]}}]', 11, 1)
SET IDENTITY_INSERT [dbo].[django_admin_log] OFF
GO
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'admin', N'logentry')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'admin_interface', N'theme')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'group')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'permission')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (7, N'authtoken', N'token')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (8, N'authtoken', N'tokenproxy')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (16, N'qualifications', N'score')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (15, N'restaurants', N'galleryrestaurant')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (13, N'restaurants', N'restaurant')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (14, N'restaurants', N'tagsrestaurant')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (18, N'suggestions', N'comments')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (19, N'suggestions', N'favorites')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (17, N'suggestions', N'score')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (9, N'taggit', N'tag')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (10, N'taggit', N'taggeditem')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (12, N'users', N'commensal')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (11, N'users', N'user')
SET IDENTITY_INSERT [dbo].[django_content_type] OFF
GO
SET IDENTITY_INSERT [dbo].[django_migrations] ON 

INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', CAST(N'2022-05-20T15:46:54.0573290' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'contenttypes', N'0002_remove_content_type_name', CAST(N'2022-05-20T15:48:59.4421700' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'auth', N'0001_initial', CAST(N'2022-05-20T15:49:02.2882070' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'auth', N'0002_alter_permission_name_max_length', CAST(N'2022-05-20T15:49:02.9035250' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'auth', N'0003_alter_user_email_max_length', CAST(N'2022-05-20T15:49:03.8672700' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'auth', N'0004_alter_user_username_opts', CAST(N'2022-05-20T15:49:04.8305930' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0005_alter_user_last_login_null', CAST(N'2022-05-20T15:49:05.8071490' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0006_require_contenttypes_0002', CAST(N'2022-05-20T15:49:06.7728780' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0007_alter_validators_add_error_messages', CAST(N'2022-05-20T15:49:07.7908970' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0008_alter_user_username_max_length', CAST(N'2022-05-20T15:49:08.7575350' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0009_alter_user_last_name_max_length', CAST(N'2022-05-20T15:49:09.7723260' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0010_alter_group_name_max_length', CAST(N'2022-05-20T15:49:20.0305210' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'auth', N'0011_update_proxy_permissions', CAST(N'2022-05-20T15:49:20.9964000' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'auth', N'0012_alter_user_first_name_max_length', CAST(N'2022-05-20T15:49:22.0175700' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'users', N'0001_initial', CAST(N'2022-05-20T15:49:25.2858330' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'admin', N'0001_initial', CAST(N'2022-05-20T15:49:27.0407650' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'admin', N'0002_logentry_remove_auto_add', CAST(N'2022-05-20T15:49:27.5314260' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (18, N'admin', N'0003_logentry_add_action_flag_choices', CAST(N'2022-05-20T15:49:28.5546130' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (19, N'admin_interface', N'0001_initial', CAST(N'2022-05-20T15:49:29.6448880' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (20, N'admin_interface', N'0002_add_related_modal', CAST(N'2022-05-20T15:49:32.7689950' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (21, N'admin_interface', N'0003_add_logo_color', CAST(N'2022-05-20T15:49:34.2092740' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (22, N'admin_interface', N'0004_rename_title_color', CAST(N'2022-05-20T15:49:43.6319540' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (23, N'admin_interface', N'0005_add_recent_actions_visible', CAST(N'2022-05-20T15:49:45.3154230' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (24, N'admin_interface', N'0006_bytes_to_str', CAST(N'2022-05-20T15:49:46.3705190' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (25, N'admin_interface', N'0007_add_favicon', CAST(N'2022-05-20T15:49:47.7711520' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (26, N'admin_interface', N'0008_change_related_modal_background_opacity_type', CAST(N'2022-05-20T15:49:49.8513590' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (27, N'admin_interface', N'0009_add_enviroment', CAST(N'2022-05-20T15:49:51.8957710' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (28, N'admin_interface', N'0010_add_localization', CAST(N'2022-05-20T15:49:53.0606110' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (29, N'admin_interface', N'0011_add_environment_options', CAST(N'2022-05-20T15:49:56.8736940' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (30, N'admin_interface', N'0012_update_verbose_names', CAST(N'2022-05-20T15:49:57.8415160' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (31, N'admin_interface', N'0013_add_related_modal_close_button', CAST(N'2022-05-20T15:49:59.8397190' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (32, N'admin_interface', N'0014_name_unique', CAST(N'2022-05-20T15:50:00.9466200' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (33, N'admin_interface', N'0015_add_language_chooser_active', CAST(N'2022-05-20T15:50:02.8680200' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (34, N'admin_interface', N'0016_add_language_chooser_display', CAST(N'2022-05-20T15:50:04.6577630' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (35, N'admin_interface', N'0017_change_list_filter_dropdown', CAST(N'2022-05-20T15:50:05.6627160' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (36, N'admin_interface', N'0018_theme_list_filter_sticky', CAST(N'2022-05-20T15:50:07.5809980' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (37, N'admin_interface', N'0019_add_form_sticky', CAST(N'2022-05-20T15:50:10.0221690' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (38, N'admin_interface', N'0020_module_selected_colors', CAST(N'2022-05-20T15:50:13.0931270' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (39, N'admin_interface', N'0021_file_extension_validator', CAST(N'2022-05-20T15:50:14.0888280' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (40, N'admin_interface', N'0022_add_logo_max_width_and_height', CAST(N'2022-05-20T15:50:17.1212280' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (41, N'admin_interface', N'0023_theme_foldable_apps', CAST(N'2022-05-20T15:50:19.0528020' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (42, N'admin_interface', N'0024_remove_theme_css', CAST(N'2022-05-20T15:50:20.6784390' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (43, N'authtoken', N'0001_initial', CAST(N'2022-05-20T15:50:22.3862200' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (44, N'authtoken', N'0002_auto_20160226_1747', CAST(N'2022-05-20T15:50:22.9214940' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (45, N'authtoken', N'0003_tokenproxy', CAST(N'2022-05-20T15:50:23.9601600' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (46, N'restaurants', N'0001_initial', CAST(N'2022-05-20T15:50:26.4918090' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (47, N'sessions', N'0001_initial', CAST(N'2022-05-20T15:50:27.7301110' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (48, N'taggit', N'0001_initial', CAST(N'2022-05-20T15:50:29.5894580' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (49, N'taggit', N'0002_auto_20150616_2121', CAST(N'2022-05-20T15:50:30.2183410' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (50, N'taggit', N'0003_taggeditem_add_unique_index', CAST(N'2022-05-20T15:50:31.3397300' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (51, N'taggit', N'0004_alter_taggeditem_content_type_alter_taggeditem_tag', CAST(N'2022-05-20T15:50:32.3655380' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (52, N'users', N'0002_commensal_environment_commensal_interest_and_more', CAST(N'2022-06-18T12:04:14.9446150' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (53, N'restaurants', N'0002_restaurant_environment_restaurant_vegetarian', CAST(N'2022-06-21T18:47:02.0551920' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (54, N'restaurants', N'0003_alter_restaurant_schedule', CAST(N'2022-06-21T19:36:57.2708250' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (55, N'restaurants', N'0004_restaurant_new', CAST(N'2022-06-23T18:39:16.1467900' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (56, N'restaurants', N'0005_restaurant_punctuation', CAST(N'2022-06-29T19:45:23.5240110' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (57, N'restaurants', N'0006_restaurant_date', CAST(N'2022-06-29T20:03:19.9826530' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (58, N'restaurants', N'0007_alter_restaurant_date', CAST(N'2022-06-29T20:05:07.5655360' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (59, N'restaurants', N'0008_alter_restaurant_date', CAST(N'2022-10-19T18:49:20.8337070' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (60, N'qualifications', N'0001_initial', CAST(N'2022-10-19T18:49:22.9993300' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (61, N'qualifications', N'0002_rename_restaurant_score_id_restaurant_and_more', CAST(N'2022-10-19T18:53:16.4591420' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (62, N'suggestions', N'0001_initial', CAST(N'2022-10-19T19:43:10.4336370' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (63, N'suggestions', N'0002_comments', CAST(N'2022-10-19T19:51:52.2290950' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (64, N'suggestions', N'0003_alter_comments_id_user_alter_score_id_user', CAST(N'2022-10-19T19:56:58.5976650' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (65, N'suggestions', N'0004_alter_comments_options_alter_score_options', CAST(N'2022-10-19T20:03:36.7743220' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (66, N'suggestions', N'0005_alter_score_id_restaurant_alter_score_id_user', CAST(N'2022-10-20T10:55:53.0415610' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (67, N'suggestions', N'0006_alter_comments_comment_alter_comments_id_restaurant_and_more', CAST(N'2022-10-20T11:39:54.0230860' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (68, N'suggestions', N'0007_score_comment', CAST(N'2022-10-20T19:19:57.6882980' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (69, N'suggestions', N'0008_alter_comments_id_restaurant_alter_comments_id_user_and_more', CAST(N'2022-10-20T19:36:47.2243430' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (70, N'suggestions', N'0009_score_date', CAST(N'2022-10-25T22:23:02.0107210' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (71, N'suggestions', N'0010_comments_date_alter_score_date', CAST(N'2022-10-25T22:23:03.4323940' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (72, N'restaurants', N'0009_alter_restaurant_user', CAST(N'2022-10-25T22:30:52.2481480' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (73, N'restaurants', N'0010_alter_restaurant_id_restaurant_alter_restaurant_user', CAST(N'2022-10-25T22:33:09.6420800' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (74, N'restaurants', N'0011_alter_galleryrestaurant_id_imagen_and_more', CAST(N'2022-10-25T22:34:58.9639350' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (75, N'restaurants', N'0012_alter_galleryrestaurant_restaurant', CAST(N'2022-10-25T22:36:27.2896000' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (76, N'restaurants', N'0013_alter_galleryrestaurant_restaurant', CAST(N'2022-10-25T22:42:30.7221910' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (77, N'restaurants', N'0014_alter_galleryrestaurant_restaurant', CAST(N'2022-10-25T22:48:23.1664290' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (78, N'restaurants', N'0015_alter_galleryrestaurant_restaurant', CAST(N'2022-10-25T22:59:26.2313960' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (79, N'restaurants', N'0016_alter_galleryrestaurant_restaurant', CAST(N'2022-10-26T09:26:38.5906540' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (80, N'restaurants', N'0017_alter_tagsrestaurant_id_tags_and_more', CAST(N'2022-10-26T11:41:04.7864630' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (81, N'suggestions', N'0011_favorites', CAST(N'2022-10-31T20:49:12.6303240' AS DateTime2))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (82, N'restaurants', N'0018_alter_restaurant_punctuation', CAST(N'2022-11-05T19:16:14.6343650' AS DateTime2))
SET IDENTITY_INSERT [dbo].[django_migrations] OFF
GO
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'017ivv4d1ifi7n2cyi37h1q5hcv1h99j', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1osWK3:4aI849rsmlWpg8ZNWVb1BQCqcwuffRJo2Fna6z9oQOc', CAST(N'2022-11-22T16:39:55.3280220' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'3d9u2t3xiqjawc8fggvd58gi2efx39xb', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1onU8g:QmuH6eI3fw6Cvvp7haQ3OTsHrm9dcGf3I32bh2Eu9ag', CAST(N'2022-11-08T19:19:22.2489180' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'5a8f1bxd8f3wgqujeb9grb9yyetzw27v', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1ov4Ju:76Jn8pQ1MbmIoMyRBn8mfuoHfvrepV4woFVv8B-TVC4', CAST(N'2022-11-29T17:22:18.9472110' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'5tg91mvx3kjjc4a859zenxktn3nnxdqe', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1omgon:95FM9BAfmhuWx3Tl1H-zLq5cdpCzQlZ6teAalNdW1ys', CAST(N'2022-11-06T14:39:33.3120780' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'9vsfe3qmqcjisa5z4pn4g1y8femgl5ux', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1orWga:St1V89_1oRHkBqYJN-H21jOW2lvnveCBwQvajKoMEFM', CAST(N'2022-11-19T22:51:04.7650860' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'bmzzol0maoc8ud3xumz47yztj42txvic', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1onUgM:qKDMM2aGkomu9x-qJtSHEV8R0mlPsYY3ZHOJtqgI67Q', CAST(N'2022-11-08T19:54:10.5924440' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'evdtoi5glhpipj4ufuge77ictpijpy2y', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1pgFQH:AvOEA9HOagekdAF-WSdeWm_u26CLBAsWazZCjcVoTYY', CAST(N'2023-04-08T20:43:53.1449190' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'ex8t91h78f3rd4dlpu8rloujl1pxe443', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1o2bc9:CCyFg1EUWXpv0EhIvRcGlz_qMrL0fsVw-sX-HRwsniY', CAST(N'2022-07-02T11:48:01.7120740' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'ffeuqjysl1x0ysjw7z0d1crg8n73lqiy', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1oo92I:RAeHFhxxcZbHGFX6sNDK3ajaaa49HYB1_hMERCaXliI', CAST(N'2022-11-10T14:59:30.2769080' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'j0hhyidej4d5oy2lwknme7mhrlbefx95', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1ohv2l:OKumihr5UpsAcL3jWIgJ48frjA3Za5GDxpklcOqsm_4', CAST(N'2022-10-24T10:50:15.9596640' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'kmfuqja2gsdwu1jwxsxo0znuzlwv6lxf', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1olfpe:X9PUvU2ySfm7fahK8CF-pfHix8YcPaQITD4hYbqdqZM', CAST(N'2022-11-03T19:24:14.3804930' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'l4f605l9nf0tjykk8nc2u7p6wmdvpcxq', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1oxw0n:aI8zmHEppE6zXNv2I16Q81h7VsrzYy2Cbxrwqjj4pqA', CAST(N'2022-12-07T15:06:25.6413960' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'ueg0uckytq418pswisz60ls03im3zi3y', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1ov5DL:nMADM57EFTE3qJg81vzvobirfrEYZIUHa607j2qIMZQ', CAST(N'2022-11-29T18:19:35.0765210' AS DateTime2))
INSERT [dbo].[django_session] ([session_key], [session_data], [expire_date]) VALUES (N'wqfy2a21l1a3c92mm8amr4zkgm82zb2f', N'.eJxVjEEOwiAQRe_C2pAwlAFcuvcMZGBAqgaS0q6Md9cmXej2v_f-SwTa1hq2kZcwszgLJU6_W6T0yG0HfKd26zL1ti5zlLsiDzrktXN-Xg7376DSqN_akjIKwRc1JWTQxVtkSzg5E4txZCJpXUC7xJCIy-S9xowA4Hy0msX7A9FZN4g:1pgpKl:omeKxJGAtOV0mRx5eKh7bevpWTvL2C6i3IGTZjEivdM', CAST(N'2023-04-10T11:04:35.6005240' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[restaurants_galleryrestaurant] ON 

INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (36, N'gallery/13/hector1.jpg', 13)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (37, N'gallery/13/hector2.jpg', 13)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (38, N'gallery/13/hector3.jpg', 13)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (39, N'gallery/14/sofia1.jpg', 14)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (40, N'gallery/14/sofia2.jpg', 14)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (41, N'gallery/14/sofia3.jfif', 14)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (42, N'gallery/15/juan1.jpg', 15)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (43, N'gallery/15/juan2.jfif', 15)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (44, N'gallery/15/juan3.jfif', 15)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (45, N'gallery/16/karen1.jpg', 16)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (46, N'gallery/16/karen2.jfif', 16)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (47, N'gallery/16/karen3.jfif', 16)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (48, N'gallery/17/omar1.jpg', 17)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (49, N'gallery/17/omar2.jpg', 17)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (50, N'gallery/17/omar3.jpg', 17)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (51, N'gallery/18/paula1.jpg', 18)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (52, N'gallery/18/paula2.jpg', 18)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (53, N'gallery/18/paula3.jpeg', 18)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (54, N'gallery/19/esteban1.jpg', 19)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (55, N'gallery/19/esteban2.jpg', 19)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (56, N'gallery/19/esteban3.jpg', 19)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (57, N'gallery/20/sara1.jpg', 20)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (58, N'gallery/20/sara2.jpg', 20)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (59, N'gallery/20/sara3.jpg', 20)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (60, N'gallery/21/kevin1.jpg', 21)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (61, N'gallery/21/kevin2.jpg', 21)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (62, N'gallery/21/kevin3.jpeg', 21)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (63, N'gallery/28/barbecue-1239434_1920.jpg', 28)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (64, N'gallery/28/asparagus-2169305_1920.jpg', 28)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (65, N'gallery/29/bar-1713610_1920.jpg', 29)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (66, N'gallery/29/meat-123668_1920.jpg', 29)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (67, N'gallery/30/lasagna-5994612_1920.jpg', 30)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (68, N'gallery/30/cocktails-731898_1920.jpg', 30)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (69, N'gallery/31/pizza-5275191_1920.jpg', 31)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (70, N'gallery/31/happy-birthday-3955616_1920.jpg', 31)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (71, N'gallery/32/mexican-food-5078491_1920.jpg', 32)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (72, N'gallery/32/food-1050813_1920.jpg', 32)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (73, N'gallery/33/food-3824648_1920.jpg', 33)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (74, N'gallery/33/salad-1672505_1920.jpg', 33)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (75, N'gallery/34/indian-food-3856050_1920.jpg', 34)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (76, N'gallery/34/bar-1713610_1920.jpg', 34)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (77, N'gallery/35/food-712665_1920.jpg', 35)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (78, N'gallery/35/bowl-1842294_1920.jpg', 35)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (79, N'gallery/36/barbecue-1239434_1920.jpg', 36)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (80, N'gallery/36/meat-123668_1920.jpg', 36)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (81, N'gallery/37/images.jfif', 37)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (82, N'gallery/37/5f56a458a3f178ac330003e1.webp', 37)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (83, N'gallery/38/beef-20678_1920.jpg', 38)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (84, N'gallery/38/descarga.jfif', 38)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (85, N'gallery/39/happy-birthday-3955616_1920.jpg', 39)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (86, N'gallery/39/lasagna-5994612_1920.jpg', 39)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (87, N'gallery/40/dinner-939434_1920.jpg', 40)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (88, N'gallery/40/hors-doeuvre-2175326_1920.jpg', 40)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (89, N'gallery/41/pizza-6478478_1920.jpg', 41)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (90, N'gallery/41/plate-2802332_1920.jpg', 41)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (91, N'gallery/42/burger-4953465_1920.jpg', 42)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (92, N'gallery/42/bowl-1842294_1920.jpg', 42)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (93, N'gallery/43/hamburger-1238246_1920.jpg', 43)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (94, N'gallery/43/sandwich-1238615_1920.jpg', 43)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (95, N'gallery/44/sandwich-1238615_1920.jpg', 44)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (96, N'gallery/44/burger-4953465_1920.jpg', 44)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (97, N'gallery/45/salmon-g410fa6c5b_1920.jpg', 45)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (98, N'gallery/45/salmon-1485014_1920.jpg', 45)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (99, N'gallery/46/shish-kebab-417994_1920.jpg', 46)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (100, N'gallery/46/tacos-5932653_1920.jpg', 46)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (101, N'gallery/47/sushi-1494195_1920.jpg', 47)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (102, N'gallery/47/dinner-939434_1920.jpg', 47)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (103, N'gallery/48/food-1050813_1920.jpg', 48)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (104, N'gallery/48/food-3581341_1920.jpg', 48)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (105, N'gallery/50/bowl-1842294_1920.jpg', 50)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (106, N'gallery/50/mexican-food-5078491_1920.jpg', 50)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (107, N'gallery/49/pasta-794464_1920.jpg', 49)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (108, N'gallery/49/food-3824648_1920.jpg', 49)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (109, N'gallery/52/images.jfif', 52)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (110, N'gallery/52/salad-1672505_1920.jpg', 52)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (111, N'gallery/51/pizza-6478478_1920.jpg', 51)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (112, N'gallery/51/pizza-5275191_1920.jpg', 51)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (113, N'gallery/55/food-3824648_1920.jpg', 55)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (114, N'gallery/55/tacos-5932653_1920.jpg', 55)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (115, N'gallery/53/food-1351287_1920.jpg', 53)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (116, N'gallery/53/table-setting-2107600_960_720.jpg', 53)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (117, N'gallery/56/salmon-1485014_1920.jpg', 56)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (118, N'gallery/56/food-3581341_1920.jpg', 56)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (119, N'gallery/57/bar-1713610_1920.jpg', 57)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (120, N'gallery/57/lasagna-5994612_1920.jpg', 57)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (121, N'gallery/58/dinner-939434_1920.jpg', 58)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (122, N'gallery/58/sandwich-1238615_1920.jpg', 58)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (123, N'gallery/63/siete_vacas_1.jpg', 63)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (124, N'gallery/63/siete_vacas_2.jpg', 63)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (125, N'gallery/62/Criterion_2jpg.jpg', 62)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (126, N'gallery/62/Criterion_1.jpg', 62)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (127, N'gallery/61/capo_di_capi_2.jpg', 61)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (128, N'gallery/61/capo_di_capi_1.jpg', 61)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (129, N'gallery/60/takuma_2.jpeg', 60)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (130, N'gallery/60/takuma_1.jpg', 60)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (131, N'gallery/59/harry_2.jpg', 59)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (132, N'gallery/59/harry_1.jpg', 59)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (157, N'gallery/12/mexican-food-5078491_1920.jpg', 12)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (158, N'gallery/12/mexico-1621835_1920.jpg', 12)
GO
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (159, N'gallery/4/mexican-food-5078491_1920.jpg', 4)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (160, N'gallery/4/mexico-1621835_1920.jpg', 4)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (165, N'gallery/3/vegetables-752153_1920.jpg', 3)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (166, N'gallery/3/vegetables-1006694_1920.jpg', 3)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (173, N'gallery/64/salmon-518032_1920.jpg', 64)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (174, N'gallery/64/salmon-g410fa6c5b_1920.jpg', 64)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (175, N'gallery/65/alitas1.jpg', 65)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (176, N'gallery/65/alitas2.jpg', 65)
INSERT [dbo].[restaurants_galleryrestaurant] ([id_imagen], [imagen], [restaurant_id]) VALUES (177, N'gallery/65/alitas3.jpg', 65)
SET IDENTITY_INSERT [dbo].[restaurants_galleryrestaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[restaurants_restaurant] ON 

INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (3, N'Kevin', N'Rodriguez', N'123123123', N'12312312', N'Cll 45 # 98-5', N'Engativa', N'asefasdf', N'menus/7/CERTIFICADO_LABORAL_KEVIN_RODRIGUEZ.pdf', CAST(2000.000 AS Numeric(10, 3)), N'9:00 AM - 12:00 PM', 1, N'Restaurante Gourmet', 7, N'Ambiente Familiar', 1, 0, 3, CAST(N'2022-06-29' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (4, N'Kevin', N'Rodriguez', N'5426554', N'3134931616', N'Cll 45 # 3 - 5', N'Chapinero', N'Muy rico y barato', N'menus/8/RODRIGUEZ_ENRIQUEZ_KEVIN_MATEO.pdf', CAST(20000.000 AS Numeric(10, 3)), N'9:00 AM - 12:00 PM', 1, N'Restaurante Gourmet', 8, N'Ambiente Familiar', 1, 0, 1, CAST(N'2022-06-29' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (12, N'Daniel', N'Ramirez', N'3216549875', N'3216549872', N'Cll 73 # 9 - 70', N'Quinta Camacho', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/16/Resturante_Daniel.pdf', CAST(40000.000 AS Numeric(10, 3)), N'12:00 PM - 8:00 PM', 1, N'Restaurante Gourmet', 16, N'Ambiente Familiar', 0, 0, 3, CAST(N'2022-10-12' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (13, N'Hector', N'Perez', N'3216549875', N'3216549875', N'Cra 13 # 85 - 32', N'Antiguo Country', N'Di Lucca is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/17/Di_Lucca.pdf', CAST(40000.000 AS Numeric(10, 3)), N'12:00 PM - 11:00 PM', 1, N'Restaurante Gourmet', 17, N'Ambiente Friends', 0, 0, 5, CAST(N'2022-10-12' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (14, N'Sofia', N'Peña', N'3216549878', N'3216549875', N'Cra 13 # 83-57', N'Antiguo Country', N'La cantina is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/18/La_Cantina_15_Bogotá.pdf', CAST(50000.000 AS Numeric(10, 3)), N'12:00 PM - 11:00 PM', 1, N'Restaurante Tematico', 18, N'Ambiente Friends', 0, 0, 4, CAST(N'2022-10-12' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (15, N'Juan', N'Delgado', N'3216549872', N'3216549876', N'Av 7 # 61-71', N'La Salle', N'Patacones Food and Gallerydummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/19/Patacones_Food_and_Gallery.pdf', CAST(20000.000 AS Numeric(10, 3)), N'12:00 PM - 9:00 PM', 1, N'Restaurante familiar', 19, N'Ambiente Familiar', 0, 0, 3, CAST(N'2022-10-12' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (16, N'Karen', N'Arias', N'3216549875', N'3216549875', N'Cll 69 # 4 - 97', N'Nueva Granada', N'Vitto Restaurante dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/20/Vitto_Restaurante.pdf', CAST(40000.000 AS Numeric(10, 3)), N'12:00 PM - 11:00 PM', 1, N'Restaurante Gourmet', 20, N'Ambiente Familiar', 1, 0, 3, CAST(N'2022-10-12' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (17, N'Omar', N'Enriquez', N'3216549878', N'3216549875', N'Cll 71 # 5 - 50', N'Emaús', N'Osaki Artisar dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/21/Osaki_Artisar.pdf', CAST(50000.000 AS Numeric(10, 3)), N'10:00 AM - 10:00 PM', 1, N'Restaurante Tematico', 21, N'Ambiente Familiar', 1, 0, 3, CAST(N'2022-10-12' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (18, N'Paula', N'Benedetti', N'3126549875', N'3216549875', N'Cra 10a # 69-38', N'Quinta Camacho', N'El Mono Bandido dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/22/El_Mono_Bandido.pdf', CAST(22000.000 AS Numeric(10, 3)), N'3:00 PM - 11:00 PM', 1, N'Restaurante Tematico', 22, N'Ambiente Friends', 0, 0, 3, CAST(N'2022-10-12' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (19, N'Esteban', N'Castro', N'3216549875', N'3216549875', N'Cll 63 # 11 - 61', N'Calderon Tejada', N'Restaurante Navarra dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/23/Restaurante_Navarra.pdf', CAST(100000.000 AS Numeric(10, 3)), N'7:00 AM - 9:00 PM', 1, N'Restaurante familiar', 23, N'Ambiente Familiar', 0, 0, 2, CAST(N'2022-10-12' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (20, N'Sara', N'Castañeda', N'3216549875', N'3216549875', N'Cll 70a # 10a - 18', N'Quinta Camacho', N'Restaurante Nueve dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/24/Restaurante_Nueve.pdf', CAST(30000.000 AS Numeric(10, 3)), N'12:00 PM - 11:00 PM', 1, N'Restaurante familiar', 24, N'Ambiente Familiar', 1, 0, 3, CAST(N'2022-10-12' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (21, N'Kevin', N'Navarro', N'3216549875', N'3216549875', N'Cra 10a # 70 - 50', N'Quinta Camacho', N'Bruto Restaurante dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/25/Bruto_Restaurante.pdf', CAST(30000.000 AS Numeric(10, 3)), N'8:00 AM - 4:30 PM', 1, N'Restaurante familiar', 25, N'Ambiente Familiar', 0, 0, 3, CAST(N'2022-10-12' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (28, N'Bárbara', N'Pineda', N'6012576402', N'3201908407', N'Cra. 13 #85-35', N'Antiguo Country', N'La Brasserie is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/141/LA_BRASSERIE.pdf', CAST(50000.000 AS Numeric(10, 3)), N'12:00 PM - 11:00 PM', 0, N'Restaurante Gourmet', 141, N'Ambiente Familiar', 0, 0, 3, CAST(N'2022-11-02' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (29, N'Bianca', N'Arango', N'3242537404', N'3175248280', N'Ac. 85 #7-74', N'Zona T', N'La Fabbrica is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/142/LA_FABBRICA.pdf', CAST(60000.000 AS Numeric(10, 3)), N'12:00 PM - 11:30 PM', 0, N'Restaurante Gourmet', 142, N'Ambiente Familiar', 1, 0, 3, CAST(N'2022-11-02' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (30, N'Samuel', N'Buitrago', N'6017128349', N'3048504391', N'Cl. 70 #9-92', N'Quinta Camacho', N'7 Cabras Restaurante Bar is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a type specimen book.', N'menus/143/7_CABRAS_RESTAURANTE_BAR.pdf', CAST(35000.000 AS Numeric(10, 3)), N'12:00 PM - 1:00 AM', 0, N'Restaurante familiar', 143, N'Ambiente Familiar', 1, 0, 2, CAST(N'2022-11-02' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (31, N'Nicolás', N'Hoyos', N'3182496836', N'3111366696', N'Cra. 13 #54-27', N'Antiguo Country', N'La Romana Restaurante is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/144/LA_ROMANA_RESTAURANTE.pdf', CAST(29900.000 AS Numeric(10, 3)), N'12:00 PM - 7:30 PM', 0, N'Restaurante Tematico', 144, N'Ambiente Friends', 1, 0, 3, CAST(N'2022-11-02' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (32, N'Miranda', N'Bernal', N'6014550630', N'3134909581', N'Tv. 4 Bis #57-52', N'Santa Fé', N'Mini Mal is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/145/MINI_MAL.pdf', CAST(30000.000 AS Numeric(10, 3)), N'12:00 PM - 10:00 PM', 0, N'Restaurante Gourmet', 145, N'Ambiente Friends', 1, 0, 5, CAST(N'2022-11-02' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (33, N'Sabrina', N'Franco', N'6012480468', N'3015338401', N'Cl. 69a #10-16', N'Quinta Camacho', N'Restaurante 69 is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/146/RESTAURANTE_69_GAUCHOS.pdf', CAST(38000.000 AS Numeric(10, 3)), N'12:30 PM - 10:00 PM', 0, N'Restaurante Gourmet', 146, N'Ambiente Solitario', 1, 0, 2, CAST(N'2022-11-02' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (34, N'Diego', N'Pacheco', N'6016447766', N'3105032585', N'Cl. 66 #4A-33', N'Quinta Camacho', N'Cantina y Punto is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/147/CANTINA_Y_PUNTO.pdf', CAST(33600.000 AS Numeric(10, 3)), N'12:30 PM - 10:00 PM', 0, N'Restaurante Tematico', 147, N'Ambiente Friends', 1, 0, 2, CAST(N'2022-11-02' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (35, N'Sebastián', N'Vergara', N'6018051787', N'3201827689', N'Cl. 61 #5-56', N'La Salle', N'Mesa Franca is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/148/MESA_FRANCA.pdf', CAST(35000.000 AS Numeric(10, 3)), N'12:30 PM - 10:00 PM', 0, N'Restaurante familiar', 148, N'Ambiente Familiar', 1, 0, 2, CAST(N'2022-11-02' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (36, N'Sebastián', N'Vergara', N'6018051787', N'3201827689', N'Cl. 69a #10-15', N'Quinta Camacho', N'OAK Ahumado y Brebajes is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/149/OAK_Ahumado_y_Brebajes.pdf', CAST(39000.000 AS Numeric(10, 3)), N'12:30 PM - 10:00 PM', 0, N'Restaurante Gourmet', 149, N'Ambiente Solitario', 0, 0, 3, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (37, N'Santiago', N'Vanegas', N'6018051787', N'3137290450', N'Cl. 57 #13-59', N'Chapinero Central', N'MUY Chapinero is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/150/MUY_Chapinero.pdf', CAST(12900.000 AS Numeric(10, 3)), N'11:00 AM - 16:00PM', 0, N'Restaurante familiar', 150, N'Ambiente Solitario', 1, 0, 2, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (38, N'Génesis', N'Cano', N'6014895345', N'3182847227', N'Cl. 73 #8-60', N'Quinta Camacho', N'The Market Bogotá is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/151/The_Market_Bogotá.pdf', CAST(32000.000 AS Numeric(10, 3)), N'7:00 AM - 10:00PM', 0, N'Restaurante tipo Buffet', 151, N'Ambiente Solitario', 1, 0, 3, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (39, N'Ana', N'Acevedo', N'3223449691', N'3001651884', N'Ak. 7 #No. 72 - 41', N'La Salle', N'La Ventana is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/152/la_ventana.pdf', CAST(42000.000 AS Numeric(10, 3)), N'6:30 AM - 10:00PM', 0, N'Restaurante tipo Buffet', 152, N'Ambiente Solitario', 1, 0, 2, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (40, N'Marta', N'Padilla', N'6012489565', N'3001651884', N'Ak. 7 #62-21', N'Los Rosales', N'Dilucca To Go Chapinero is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/153/Dilucca_To_Go_Chapinero.pdf', CAST(40000.000 AS Numeric(10, 3)), N'9:30 AM - 10:00 PM', 0, N'Restaurante Gourmet', 153, N'Ambiente Friends', 1, 0, 4, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (41, N'Ana María', N'Gil', N'3155979405', N'3042299012', N'Cl. 93 #13A-44', N'Chicó', N'La Diva Bogotá is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/154/La_Diva_Bogotá.pdf', CAST(33000.000 AS Numeric(10, 3)), N'12:00 PM - 10:00 PM', 0, N'Restaurante Tematico', 154, N'Ambiente Friends', 1, 0, 2, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (42, N'Gabriel', N'Narvaez', N'3134539276', N'3196628305', N'Cra. 9 #57-61', N'Chapinero Central', N'Casa Bar Bistro is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/155/Casa_Bar_Bistro.pdf', CAST(25000.000 AS Numeric(10, 3)), N'3:00 PM - 1:00 AM', 0, N'Comida Rapida', 155, N'Ambiente Friends', 0, 0, 3, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (43, N'David', N'Navarro', N'6015229590', N'3169881529', N'Cl. 64 #7-51', N'Quinta Camacho', N'Donde Pele Chapinero is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/156/Donde_Pele_Chapinero.pdf', CAST(23000.000 AS Numeric(10, 3)), N'11:30 AM - 2:00 AM', 0, N'Comida Rapida', 156, N'Ambiente Friends', 0, 0, 4, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (44, N'Juliana', N'Ortega', N'3202030744', N'3186359381', N'Cra. 8 #66-80', N'Quinta Camacho', N'Bhips Hamburguesas is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/157/Bhips_Hamburguesas.pdf', CAST(26000.000 AS Numeric(10, 3)), N'12:00 PM - 10:00 PM', 0, N'Comida Rapida', 157, N'Ambiente Friends', 0, 0, 4, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (45, N'Naomí', N'Acosta', N'6016223315', N'3118861150', N'Cl. 93a #11A-47', N'Chapinero Alto', N'Gato Negro is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/158/Gato_Negro.pdf', CAST(32000.000 AS Numeric(10, 3)), N'12:00 PM - 11:00 PM', 0, N'Restaurante familiar', 158, N'Ambiente Familiar', 0, 0, 2, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (46, N'Tomás', N'Barrios', N'3014857198', N'3111460601', N'Cra. 5 #56-06', N'Chapinero Central', N'HumoNegro is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/159/Humo_Negro.pdf', CAST(28000.000 AS Numeric(10, 3)), N'6:00 PM - 11:00 PM', 0, N'Restaurante Gourmet', 159, N'Ambiente Familiar', 1, 0, 3, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (47, N'Emiliano', N'Gallego', N'6012495195', N'3018330631', N'Cra. 9 #69A-26', N'Quinta Camacho', N'Restaurante La Herencia is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/160/Restaurante_La_Herencia.pdf', CAST(34000.000 AS Numeric(10, 3)), N'6:00 PM - 10:00 PM', 0, N'Restaurante Gourmet', 160, N'Ambiente Familiar', 1, 0, 4, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (48, N'Andrés', N'Barrera', N'3209418974', N'3155979405', N'Cl. 71 #9-21', N'Quinta Camacho', N'Sakura Enjoy is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/161/Sakura_Enjoy.pdf', CAST(28000.000 AS Numeric(10, 3)), N'12:30 PM - 10:00 PM', 0, N'Restaurante Tematico', 161, N'Ambiente Familiar', 0, 0, 4, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (49, N'Paulin', N'Salazar', N'6012359229', N'3135149107', N'Cl. 71 #5-65', N'Quinta Camacho', N'KONG Restaurante is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/162/KONG_Restaurante.pdf', CAST(29000.000 AS Numeric(10, 3)), N'12:30 PM - 10:00 PM', 0, N'Restaurante Tematico', 162, N'Ambiente Friends', 0, 0, 3, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (50, N'Pilar', N'Carvajal', N'6014326881', N'3042299012', N'Cl. 93 #11a-31', N'Chicó Norte', N'Chef Burger Parque 93 is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/163/Chef_Burger_Parque_93.pdf', CAST(35000.000 AS Numeric(10, 3)), N'12:30 PM - 10:00 PM', 0, N'Comida Rapida', 163, N'Ambiente Friends', 0, 0, 3, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (51, N'Natalie', N'Velasquez', N'6013459010', N'3163918483', N'Cra. 9 #70-34', N'Chapinero Central', N'Itanos is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/164/Itanos.pdf', CAST(27000.000 AS Numeric(10, 3)), N'12:30 PM - 9:30 PM', 0, N'Restaurante familiar', 164, N'Ambiente Familiar', 0, 0, 3, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (52, N'Morena', N'Molina', N'6018088840', N'3216097780', N'Cl. 74 #5-28', N'Quinta Camacho', N'Restaurante Nazca is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/165/Restaurante_Nazca.pdf', CAST(23000.000 AS Numeric(10, 3)), N'12:30 PM - 9:00 PM', 0, N'Restaurante familiar', 165, N'Ambiente Familiar', 0, 0, 3, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (53, N'Ariana', N'Londoño', N'6016942390', N'3101800305', N'Cra. 8 #64-17', N'Quinta Camacho', N'Marrakesh Comida Marroquí is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/166/Marrakesh_Comida_Marroquí_Chapinero.pdf', CAST(39000.000 AS Numeric(10, 3)), N'12:30 PM - 9:00 PM', 0, N'Restaurante Tematico', 166, N'Ambiente Friends', 1, 0, 3, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (55, N'Alexander', N'Ordoñez', N'3006568999', N'3187994491', N'Cra. 9a #60-44', N'Santa Fé', N'La Revolución de la Cuchara is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book', N'menus/167/La_Revolución_de_la_Cuchara_fCC7nxm.pdf', CAST(28000.000 AS Numeric(10, 3)), N'12:30 PM - 7:30 PM', 0, N'Restaurante Tematico', 167, N'Ambiente Friends', 1, 0, 3, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (56, N'Adrián', N'Duque', N'3215018077', N'3187994491', N'Cl. 63 #7-64', N'Quinta Camacho', N'Restaurante Chambaku is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/168/Restaurante_Chambaku.pdf', CAST(29000.000 AS Numeric(10, 3)), N'8:00 PM - 10:00 PM', 0, N'Restaurante Tematico', 168, N'Ambiente Familiar', 0, 0, 4, CAST(N'2022-11-03' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (57, N'Monserrat', N'Ramos', N'3179399206', N'3192814281', N'Cl. 70 #4 - 47', N'Chapinero Alto', N'Restaurante El Cielo is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/169/Restaurante_El_Cielo.pdf', CAST(40000.000 AS Numeric(10, 3)), N'8:00 PM - 10:00 PM', 0, N'Restaurante Tematico', 169, N'Ambiente Familiar', 0, 0, 2, CAST(N'2022-11-04' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (58, N'Monserrat', N'Tejada', N'3014857198', N'3192814281', N'Cl. 69a # 6-41', N'Calderón Tejada', N'El Árabe is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/170/El_Árabe.pdf', CAST(40000.000 AS Numeric(10, 3)), N'12:00 PM - 10:00 PM', 0, N'Restaurante Tematico', 170, N'Ambiente Friends', 1, 0, 4, CAST(N'2022-11-04' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (59, N'Laura Sofía', N'Duarte', N'3012943664', N'3184766586', N'Cra. 9 #70', N'Chapinero Central', N'Harry Sasson is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/171/Harry_Sasson.pdf', CAST(35000.000 AS Numeric(10, 3)), N'12:00 PM - 10:00 PM', 0, N'Restaurante Tematico', 171, N'Ambiente Friends', 0, 0, 3, CAST(N'2022-11-04' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (60, N'Sofía', N'Herrera', N'3136241966', N'3112930641', N'Cra. 11 #69-76', N'Quinta Camacho', N'Takuma Cocina Show is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/172/Takuma_Cocina_Show.pdf', CAST(55000.000 AS Numeric(10, 3)), N'1:00 PM - 12:00 AM', 0, N'Restaurante Tematico', 172, N'Ambiente Friends', 0, 0, 2, CAST(N'2022-11-04' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (61, N'Facundo', N'Jaimes', N'3054183867', N'3213428733', N'Cl. 63 #3-45', N'Quinta Camacho', N'Capo Di Capi is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/173/Capo_Di_Capi.pdf', CAST(39900.000 AS Numeric(10, 3)), N'12:00 PM - 11:00 PM', 0, N'Restaurante Tematico', 173, N'Ambiente Friends', 0, 0, 3, CAST(N'2022-11-04' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (62, N'Facundo', N'Jaimes', N'3054410053', N'3103912536', N'Cl. 69a # 5-75', N'Quinta Camacho', N'Criterión is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/174/Criterión.pdf', CAST(42000.000 AS Numeric(10, 3)), N'12:00 PM - 11:00 PM', 0, N'Restaurante Gourmet', 174, N'Ambiente Friends', 1, 0, 4, CAST(N'2022-11-04' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (63, N'Rosero', N'Jaime', N'3054410053', N'3103912536', N'Cra. 11 #73-61', N'Quinta Camacho', N'Un Toro Y Siete Vacas is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/175/Un_Toro_Y_Siete_Vacas.pdf', CAST(42000.000 AS Numeric(10, 3)), N'12:00 PM - 11:00 PM', 0, N'Restaurante Gourmet', 175, N'Ambiente Friends', 1, 0, 2, CAST(N'2022-11-04' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (64, N'Isabel', N'Correa', N'3139598459', N'3219113420', N'Cl. 65 #4-59', N'Quinta Camacho', N'Lorenzo El Griego is simply dummy text of the printing and typesetting industry. Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', N'menus/176/Lorenzo_El_Griego.pdf', CAST(42000.000 AS Numeric(10, 3)), N'12:00 PM - 10:00 PM', 0, N'Restaurante Gourmet', 176, N'Ambiente Friends', 1, 0, 0, CAST(N'2022-11-05' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (65, N'Luis', N'Prada', N'3145698745', N'3125654874', N'Cll 45 # 69 - 23', N'Quinta Camacho', N'El restaurante alitas de Luis tiene una gran trayectoria en el sector gastronómico, ofreciendo grandes experiencias a sus clientes', N'menus/183/Menu-Alitas-y-Asi.pdf', CAST(30000.000 AS Numeric(10, 3)), N'12:00 PM - 8:00 PM', 1, N'Comida Rapida', 183, N'Ambiente Familiar', 0, 0, 0, CAST(N'2022-11-28' AS Date))
INSERT [dbo].[restaurants_restaurant] ([id_restaurant], [name_representative], [last_name_representative], [phone_number], [phone_number_representative], [address], [neighborhood], [description], [menu], [prices], [schedule], [active], [type_food], [user_id], [environment], [vegetarian], [new], [punctuation], [date]) VALUES (66, N'Kevin', N'Rodriguez', N'5463156', N'3164598754', N'Cra. 20c #72-41', N'Santa Fé', N'Longos, es el restaurante que logró llevarse el primer lugar en Bogotá de esta edición del Burger Master con una hamburguesa con un concepto muy particular', N'menus/185/menuLongos.pdf', CAST(30000.000 AS Numeric(10, 3)), NULL, 0, NULL, 185, NULL, 0, 1, 0, CAST(N'2023-03-25' AS Date))
SET IDENTITY_INSERT [dbo].[restaurants_restaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[restaurants_tagsrestaurant] ON 

INSERT [dbo].[restaurants_tagsrestaurant] ([id_tags], [tags], [restaurant_id]) VALUES (1, N'pizza', 4)
INSERT [dbo].[restaurants_tagsrestaurant] ([id_tags], [tags], [restaurant_id]) VALUES (2, N'hamburguesa', 4)
INSERT [dbo].[restaurants_tagsrestaurant] ([id_tags], [tags], [restaurant_id]) VALUES (3, N'patacones', 15)
INSERT [dbo].[restaurants_tagsrestaurant] ([id_tags], [tags], [restaurant_id]) VALUES (4, N'patacones', 3)
INSERT [dbo].[restaurants_tagsrestaurant] ([id_tags], [tags], [restaurant_id]) VALUES (5, N'hamburguesa', 15)
INSERT [dbo].[restaurants_tagsrestaurant] ([id_tags], [tags], [restaurant_id]) VALUES (6, N'hamburguesa', 50)
INSERT [dbo].[restaurants_tagsrestaurant] ([id_tags], [tags], [restaurant_id]) VALUES (7, N'pizza', 50)
INSERT [dbo].[restaurants_tagsrestaurant] ([id_tags], [tags], [restaurant_id]) VALUES (8, N'alitas', 65)
SET IDENTITY_INSERT [dbo].[restaurants_tagsrestaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[suggestions_comments] ON 

INSERT [dbo].[suggestions_comments] ([id], [comment], [id_restaurant_id], [id_user_id], [date]) VALUES (1, N'Rico y delicioso', 4, 134, CAST(N'2022-10-25' AS Date))
INSERT [dbo].[suggestions_comments] ([id], [comment], [id_restaurant_id], [id_user_id], [date]) VALUES (2, N'Muy bueno pero no', 12, 2, CAST(N'2022-10-25' AS Date))
INSERT [dbo].[suggestions_comments] ([id], [comment], [id_restaurant_id], [id_user_id], [date]) VALUES (3, N'muy caro, bajar el precio de los platos', 18, 2, CAST(N'2022-10-25' AS Date))
INSERT [dbo].[suggestions_comments] ([id], [comment], [id_restaurant_id], [id_user_id], [date]) VALUES (4, N'containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum', 14, 2, CAST(N'2022-10-31' AS Date))
INSERT [dbo].[suggestions_comments] ([id], [comment], [id_restaurant_id], [id_user_id], [date]) VALUES (5, N'La comida es muy rica', 12, 34, CAST(N'2022-10-31' AS Date))
INSERT [dbo].[suggestions_comments] ([id], [comment], [id_restaurant_id], [id_user_id], [date]) VALUES (7, N'todo bien', 42, 181, CAST(N'2022-11-08' AS Date))
SET IDENTITY_INSERT [dbo].[suggestions_comments] OFF
GO
SET IDENTITY_INSERT [dbo].[suggestions_favorites] ON 

INSERT [dbo].[suggestions_favorites] ([id], [favorite], [date], [id_restaurant_id], [id_user_id]) VALUES (1, 1, CAST(N'2022-11-08' AS Date), 44, 181)
INSERT [dbo].[suggestions_favorites] ([id], [favorite], [date], [id_restaurant_id], [id_user_id]) VALUES (3, 1, CAST(N'2022-11-28' AS Date), 65, 184)
SET IDENTITY_INSERT [dbo].[suggestions_favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[suggestions_score] ON 

INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (1, 4, 21, 34, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (2, 2, 56, 48, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (3, 1, 37, 99, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (4, 5, 58, 75, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (5, 1, 47, 50, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (6, 2, 55, 85, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (7, 4, 40, 106, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (8, 1, 41, 91, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (9, 4, 43, 59, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (10, 3, 36, 65, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (11, 2, 34, 82, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (12, 2, 53, 110, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (13, 1, 63, 45, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (14, 4, 56, 57, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (15, 4, 61, 101, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (16, 1, 50, 83, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (17, 5, 58, 59, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (18, 4, 39, 102, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (19, 1, 60, 35, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (20, 2, 31, 88, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (21, 3, 53, 54, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (22, 4, 31, 37, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (23, 3, 63, 102, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (24, 1, 19, 98, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (25, 2, 51, 75, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (26, 1, 45, 104, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (27, 5, 17, 37, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (28, 4, 46, 65, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (29, 5, 52, 55, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (30, 5, 58, 41, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (31, 2, 52, 82, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (32, 3, 47, 60, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (33, 1, 33, 69, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (34, 3, 44, 99, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (35, 4, 57, 52, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (36, 5, 31, 63, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (37, 5, 42, 66, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (38, 4, 36, 44, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (39, 5, 47, 43, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (40, 2, 17, 106, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (41, 5, 55, 84, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (42, 4, 36, 74, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (43, 5, 47, 45, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (44, 5, 47, 96, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (45, 1, 50, 105, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (46, 3, 31, 35, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (47, 2, 18, 102, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (48, 1, 28, 77, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (49, 5, 47, 102, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (50, 5, 18, 81, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (51, 4, 58, 61, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (52, 1, 38, 50, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (53, 3, 52, 90, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (54, 4, 50, 43, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (55, 1, 34, 49, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (56, 3, 62, 35, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (57, 4, 34, 109, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (58, 2, 19, 56, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (59, 5, 20, 57, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (60, 5, 21, 99, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (61, 2, 56, 106, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (62, 2, 45, 62, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (63, 2, 41, 109, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (64, 5, 44, 110, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (65, 2, 45, 43, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (66, 5, 61, 52, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (67, 4, 44, 86, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (68, 3, 37, 55, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (69, 4, 59, 76, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (70, 1, 38, 101, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (71, 1, 29, 60, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (72, 2, 45, 75, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (73, 5, 53, 101, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (74, 1, 19, 72, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (75, 5, 38, 60, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (76, 3, 42, 106, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (77, 3, 46, 42, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (78, 1, 57, 80, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (79, 2, 38, 94, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (80, 3, 46, 73, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (81, 5, 38, 43, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (82, 5, 48, 88, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (83, 3, 52, 97, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (84, 1, 59, 42, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (85, 5, 50, 73, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (86, 1, 61, 46, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (87, 5, 19, 39, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (88, 5, 42, 107, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (89, 2, 36, 81, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (90, 1, 31, 86, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (91, 1, 20, 40, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (92, 5, 29, 107, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (93, 1, 41, 40, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (94, 4, 45, 110, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (95, 4, 40, 69, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (96, 3, 45, 45, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (97, 3, 56, 93, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (98, 2, 61, 45, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (99, 3, 56, 42, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
GO
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (100, 4, 56, 59, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (101, 2, 53, 55, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (102, 1, 42, 42, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (103, 2, 39, 109, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (104, 2, 60, 98, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (105, 3, 19, 100, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (106, 2, 58, 102, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (107, 1, 45, 57, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (108, 5, 56, 72, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (109, 2, 37, 70, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (110, 2, 35, 101, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (111, 2, 61, 99, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (112, 4, 56, 79, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (113, 4, 44, 60, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (114, 5, 59, 92, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (115, 5, 48, 40, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (116, 5, 43, 88, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (117, 5, 38, 53, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (118, 5, 28, 81, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (119, 5, 41, 44, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (120, 4, 46, 74, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (121, 2, 34, 68, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (122, 4, 60, 61, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (123, 1, 17, 68, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (124, 1, 39, 59, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (125, 1, 51, 100, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (126, 5, 43, 56, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (127, 3, 52, 46, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (128, 2, 48, 102, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (129, 1, 55, 73, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (130, 3, 33, 48, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (131, 2, 43, 47, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (132, 4, 53, 73, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (133, 3, 46, 82, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (134, 2, 63, 76, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (135, 5, 32, 100, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (136, 2, 52, 44, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (137, 1, 21, 109, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (138, 5, 51, 64, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (139, 2, 43, 57, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (140, 2, 57, 95, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (141, 4, 50, 55, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (142, 2, 61, 60, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (143, 5, 56, 90, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (144, 1, 59, 109, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (145, 1, 60, 106, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (146, 3, 18, 84, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (147, 3, 36, 89, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (148, 2, 46, 88, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (149, 3, 55, 92, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (150, 3, 38, 75, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (151, 1, 58, 78, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (152, 3, 17, 98, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (153, 5, 62, 40, N'Me encantó, recomendado', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (154, 3, 53, 60, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (155, 1, 39, 85, N'Malo', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (156, 4, 38, 54, N'Me gustó su comida, muy bueno', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (157, 3, 28, 87, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (158, 2, 44, 97, N'Podría mejorar', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (159, 3, 56, 99, N'Podrían poner más platillos', CAST(N'2022-11-04' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (160, 1, 4, 134, N'Rico y delicioso', CAST(N'2022-11-06' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (161, 3, 42, 181, N'muy rico todo', CAST(N'2022-11-08' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (162, 5, 31, 182, N'muy buena la comida', CAST(N'2022-11-08' AS Date))
INSERT [dbo].[suggestions_score] ([id], [punctuation], [id_restaurant_id], [id_user_id], [comment], [date]) VALUES (163, 4, 12, 182, N'muy buen restaurante', CAST(N'2022-11-28' AS Date))
SET IDENTITY_INSERT [dbo].[suggestions_score] OFF
GO
SET IDENTITY_INSERT [dbo].[users_commensal] ON 

INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (1, N'3134931616', 0, 21, 2, N'Ambiente Familiar', N'Restaurante Gourmet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (7, N'3006019019', 0, 22, 33, N'Ambiente Familiar', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (8, N'3006688285', 1, 25, 34, NULL, NULL, 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (9, N'3213456789', 0, 19, 35, N'Ambiente Friends', N'Restaurante Familiar', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (10, N'3002395010', 1, 16, 37, NULL, NULL, 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (11, N'3006900137', 0, 16, 39, N'Ambiente Friends', N'Restaurante tipo Buffet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (12, N'3008875946', 0, 18, 40, N'Ambiente Friends', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (13, N'3007421659', 0, 16, 41, N'Ambiente Solitario', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (14, N'3007492123', 0, 16, 42, N'Ambiente Familiar', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (15, N'3008591457', 0, 17, 43, N'Ambiente Solitario', N'Restaurante tipo Buffet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (16, N'3011918035', 0, 18, 44, N'Ambiente Familiar', N'Restaurante tipo Buffet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (17, N'3012640552', 0, 18, 45, N'Ambiente Solitario', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (18, N'3012666341', 0, 18, 46, N'Ambiente Familiar', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (19, N'3012963241', 0, 18, 47, N'Ambiente Friends', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (20, N'3209116061', 0, 91, 48, N'Ambiente Solitario', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (21, N'3209901734', 0, 92, 49, N'Ambiente Friends', N'Restaurante Gourmet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (22, N'3212449510', 0, 92, 50, N'Ambiente Familiar', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (23, N'3214309146', 0, 93, 51, N'Ambiente Friends', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (24, N'3214639931', 0, 94, 52, N'Ambiente Friends', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (25, N'3215083411', 0, 95, 53, N'Ambiente Solitario', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (26, N'3216371800', 0, 95, 54, N'Ambiente Solitario', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (27, N'3216522771', 0, 95, 55, N'Ambiente Familiar', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (28, N'3217113311', 0, 97, 56, N'Ambiente Friends', N'Restaurante Familiar', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (29, N'3217256629', 0, 98, 57, N'Ambiente Friends', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (30, N'3013139721', 0, 18, 58, N'Ambiente Familiar', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (31, N'3013958485', 0, 18, 59, N'Ambiente Solitario', N'Restaurante Gourmet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (32, N'3016934939', 0, 19, 60, N'Ambiente Solitario', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (33, N'3017497858', 0, 20, 61, N'Ambiente Solitario', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (34, N'3018826007', 0, 20, 62, N'Ambiente Friends', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (35, N'3021662572', 0, 20, 63, N'Ambiente Familiar', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (36, N'3022158047', 0, 21, 64, N'Ambiente Familiar', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (37, N'3025586080', 0, 21, 65, N'Ambiente Solitario', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (38, N'3026436826', 0, 22, 66, N'Ambiente Solitario', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (39, N'3199970902', 0, 82, 67, N'Ambiente Familiar', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (40, N'3201347441', 0, 84, 68, N'Ambiente Friends', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (41, N'3202408594', 0, 85, 69, N'Ambiente Friends', N'Restaurante Familiar', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (42, N'3203277601', 0, 86, 70, N'Ambiente Friends', N'Restaurante tipo Buffet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (43, N'3203784127', 0, 87, 71, N'Ambiente Familiar', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (44, N'3206629848', 0, 88, 72, N'Ambiente Friends', N'Restaurante Gourmet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (45, N'3207010271', 0, 89, 73, N'Ambiente Familiar', N'Restaurante tipo Buffet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (46, N'3207702311', 0, 90, 74, N'Ambiente Friends', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (47, N'3208024005', 0, 90, 75, N'Ambiente Familiar', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (48, N'3208755748', 0, 91, 76, N'Ambiente Solitario', N'Restaurante Familiar', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (49, N'3027455853', 0, 22, 77, N'Ambiente Friends', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (50, N'3027667763', 0, 22, 78, N'Ambiente Solitario', N'Restaurante tipo Buffet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (51, N'3029283284', 0, 23, 79, N'Ambiente Solitario', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (52, N'3041092100', 0, 23, 80, N'Ambiente Familiar', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (53, N'3041520391', 0, 23, 81, N'Ambiente Familiar', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (54, N'3043668721', 0, 23, 82, N'Ambiente Familiar', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (55, N'3044235546', 0, 24, 83, N'Ambiente Friends', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (56, N'3046450423', 0, 24, 84, N'Ambiente Friends', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (57, N'3185446309', 0, 69, 85, N'Ambiente Familiar', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (58, N'3185579511', 0, 69, 86, N'Ambiente Solitario', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (59, N'3186622768', 0, 69, 87, N'Ambiente Familiar', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (60, N'3187718381', 0, 71, 88, N'Ambiente Familiar', N'Restaurante tipo Buffet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (61, N'3187938257', 0, 71, 89, N'Ambiente Solitario', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (62, N'3188204684', 0, 72, 90, N'Ambiente Solitario', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (63, N'3189046525', 0, 74, 91, N'Ambiente Familiar', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (64, N'3189691840', 0, 75, 92, N'Ambiente Familiar', N'Restaurante tipo Buffet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (65, N'3191018241', 0, 76, 93, N'Ambiente Familiar', N'Restaurante tipo Buffet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (66, N'3192029507', 0, 76, 94, N'Ambiente Friends', N'Restaurante Gourmet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (67, N'3192575918', 0, 77, 95, N'Ambiente Solitario', N'Restaurante tipo Buffet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (68, N'3193373595', 0, 78, 96, N'Ambiente Friends', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (69, N'3194493799', 0, 78, 97, N'Ambiente Solitario', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (70, N'3194961969', 0, 78, 98, N'Ambiente Friends', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (71, N'3196134588', 0, 79, 99, N'Ambiente Friends', N'Restaurante tipo Buffet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (72, N'3197504071', 0, 80, 100, N'Ambiente Familiar', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (73, N'3197693653', 0, 80, 101, N'Ambiente Solitario', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (74, N'3199234980', 0, 81, 102, N'Ambiente Familiar', N'Restaurante tipo Buffet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (75, N'3046645666', 0, 24, 103, N'Ambiente Solitario', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (76, N'3046906221', 0, 24, 104, N'Ambiente Solitario', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (77, N'3046970169', 0, 24, 105, N'Ambiente Friends', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (78, N'3048017447', 0, 25, 106, N'Ambiente Friends', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (79, N'3048270537', 0, 25, 107, N'Ambiente Friends', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (80, N'3048598943', 0, 26, 108, N'Ambiente Solitario', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (81, N'3048928699', 0, 26, 109, N'Ambiente Familiar', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (82, N'3049227051', 0, 27, 110, N'Ambiente Familiar', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (83, N'3051141310', 0, 27, 111, N'Ambiente Friends', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (84, N'3052011395', 0, 27, 112, N'Ambiente Solitario', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (85, N'3052995975', 0, 27, 113, N'Ambiente Familiar', N'Restaurante tipo Buffet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (86, N'3053769008', 0, 27, 114, N'Ambiente Friends', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (87, N'3054431328', 0, 28, 115, N'Ambiente Friends', N'Restaurante tipo Buffet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (88, N'3054598414', 0, 28, 116, N'Ambiente Friends', N'Restaurante tipo Buffet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (89, N'3055640594', 0, 28, 117, N'Ambiente Friends', N'Restaurante tipo Buffet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (90, N'3056461240', 0, 28, 118, N'Ambiente Solitario', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (91, N'3057320318', 0, 28, 119, N'Ambiente Solitario', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (92, N'3057407163', 0, 29, 120, N'Ambiente Friends', N'Restaurante Tematico', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (93, N'3058664038', 0, 29, 121, N'Ambiente Friends', N'Restaurante Gourmet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (94, N'3178048794', 0, 65, 122, N'Ambiente Friends', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (95, N'3178453095', 0, 65, 123, N'Ambiente Solitario', N'Restaurante Gourmet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (96, N'3179211150', 0, 66, 124, N'Ambiente Friends', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (97, N'3181077401', 0, 66, 125, N'Ambiente Solitario', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (98, N'3181387933', 0, 66, 126, N'Ambiente Solitario', N'Restaurante Familiar', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (99, N'3182249787', 0, 66, 127, N'Ambiente Solitario', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (100, N'3182909220', 0, 67, 128, N'Ambiente Solitario', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (101, N'3182957969', 0, 67, 129, N'Ambiente Solitario', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (102, N'3185172919', 0, 68, 130, N'Ambiente Familiar', N'Restaurante Gourmet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (103, N'3185348112', 0, 68, 131, N'Ambiente Solitario', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (104, N'3058734007', 0, 29, 132, N'Ambiente Familiar', N'Restaurante Familiar', 0)
GO
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (105, N'3059178087', 0, 29, 133, N'Ambiente Friends', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (106, N'3059530013', 0, 29, 134, N'Ambiente Friends', N'Restaurante tipo Buffet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (107, N'3059825304', 0, 30, 135, N'Ambiente Friends', N'Restaurante Gourmet', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (108, N'3059937157', 0, 30, 136, N'Ambiente Solitario', N'Comida Rapida', 1)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (109, N'3101859329', 0, 31, 137, N'Ambiente Familiar', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (110, N'3102329673', 0, 31, 138, N'Ambiente Familiar', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (111, N'3102978383', 0, 32, 139, N'Ambiente Solitario', N'Restaurante Gourmet', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (112, N'3104415250', 0, 32, 140, N'Ambiente Friends', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (113, N'3224002645', 0, 16, 177, N'Ambiente Solitario', N'Comida Rapida', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (114, N'3169546321', 1, 25, 178, NULL, NULL, 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (115, N'3164946464', 1, 36, 179, NULL, NULL, 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (116, N'9794649797', 1, 64, 180, NULL, NULL, 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (117, N'646497978', 0, 23, 181, N'Ambiente Solitario', N'Restaurante Tematico', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (118, N'3618549231', 0, 32, 182, N'Ambiente Friends', N'Restaurante Familiar', 0)
INSERT [dbo].[users_commensal] ([id_commensal], [phone_number], [new], [age], [user_id], [environment], [interest], [vegetarian]) VALUES (119, N'3125469875', 0, 32, 184, N'Ambiente Friends', N'Comida Rapida', 0)
SET IDENTITY_INSERT [dbo].[users_commensal] OFF
GO
SET IDENTITY_INSERT [dbo].[users_user] ON 

INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (1, N'pbkdf2_sha256$320000$LfNvhamfDYM8AtIQztN4AE$W48V1MUBwbLrggAkRjP//P5vqm0CqGiHqHBEXkzeHsM=', CAST(N'2023-03-27T11:04:35.3470740' AS DateTime2), N'elbuencomensalbog@gmail.com', N'El Buen Comensal', N'Bogotá', 1, 1, 1, 1, 1)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (2, N'pbkdf2_sha256$320000$6oM0BklEdMtP8unxeTffq6$Pl1JNQ9nbtnJ44Zc6v3phoAmje1u7iS/nqid3CQtZVA=', CAST(N'2022-06-18T11:52:09.0000000' AS DateTime2), N'mateodryp@gmail.com', N'Kevin', N'Rodríguez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (7, N'pbkdf2_sha256$320000$PqVioOijufDY5oJIfKc6Qj$IQqQIyFGqgI7XbT42DbrWSa4XjbdlAGcWhIVJC/TlwU=', CAST(N'2022-06-23T18:54:51.5415840' AS DateTime2), N'mateodryp2@gmail.com', N'Super Delicia', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (8, N'pbkdf2_sha256$320000$WwI5FXZFRiW5wO0kWiuD5Z$mW2B0TPi3fPz28A/ZqVaTvpxz8FnuupHh4O/hljjucs=', CAST(N'2022-06-24T18:47:29.0066530' AS DateTime2), N'mateodryp3@gmail.com', N'Kevin Restaurante', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (16, N'pbkdf2_sha256$320000$2yQ3Los4N1BZ1Ec6Tt8QmC$3fx21MqqGEcImzbmVY7AHswTi+aW49nNwq2c7rK+ygs=', CAST(N'2022-10-12T18:48:44.9775970' AS DateTime2), N'danielr@gmail.com', N'Restaurante Daniel', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (17, N'pbkdf2_sha256$320000$1vrNnTwvIgZ1p5FSvQKyxB$YytTdDmXBjnfwIIc/YeDtroO8XfFz9OgeG6MZYjmsAU=', CAST(N'2022-10-12T18:53:54.0154710' AS DateTime2), N'hectorp@gmail.com', N'Di Lucca', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (18, N'pbkdf2_sha256$320000$BhsAFDhb5JTDngy8nOuC0Y$0NAZUdF2ktPnviI1aphQJHgNEDSE0H1OUMSKC3WQV/8=', CAST(N'2022-10-12T18:55:41.3381310' AS DateTime2), N'sofiap@gmail.com', N'Cantina La 15 Bogotá', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (19, N'pbkdf2_sha256$320000$U0Vu152G820eOlaYnExbdm$vW8zPSYpaOK/SBMDUt0oin53ehIhgiKTHjtWYKbcaRk=', CAST(N'2022-10-12T18:58:03.0693320' AS DateTime2), N'juand@gmail.com', N'Patacones Food and Gallery', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (20, N'pbkdf2_sha256$320000$boULPCESZaRiCukNYK80CS$Y/r8E02g2ccP3BZqFLpefG6F9qluR/UXERGkje/5gtQ=', CAST(N'2022-10-12T18:59:43.4663640' AS DateTime2), N'karena@gmail.com', N'Vitto Restaurante', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (21, N'pbkdf2_sha256$320000$MiHyyRqtRUe1U2UExJHsuS$INx/oZgdN1ZBG6PbEZkoIesrvF7uBX7WHXgRgnJrPP8=', CAST(N'2022-10-12T19:01:42.0866250' AS DateTime2), N'omare@gmail.com', N'Osaki Artisar', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (22, N'pbkdf2_sha256$320000$0iguTipoDMOENBwrFh8ODE$biNkeoIEK5ivLZka/LiR1v0wIsRLEmZufdAZQdHuLEE=', CAST(N'2022-10-12T19:03:35.9700120' AS DateTime2), N'paulab@gmail.com', N'El Mono Bandido', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (23, N'pbkdf2_sha256$320000$BabBCQFPZwSlfGNmNzb52Y$qvL4UN7WdhG/E4O2X98N3t1YCoXKDgooaThJ0mR3pl8=', CAST(N'2022-10-12T19:06:06.8389580' AS DateTime2), N'estebanc@gmail.com', N'Restaurante Navarra', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (24, N'pbkdf2_sha256$320000$QLVep4x9pa1yScpK9hHIQH$xpCI3ZFvELB6DnBs606MEQ6sW9DAUITz9Cv/pFZpxcc=', CAST(N'2022-10-12T19:08:37.1902500' AS DateTime2), N'sarac@gmail.com', N'Restaurante Nueve', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (25, N'pbkdf2_sha256$320000$NosbeT3YJlE0OJAs5jaT9y$hetZWPdiJE6SIIcR6fcgW2Nh7j4tL81SyirdGK+tUDg=', CAST(N'2022-10-12T19:10:24.6895040' AS DateTime2), N'kevinn@gmail.com', N'Bruto Restaurante', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (33, N'pbkdf2_sha256$320000$16PKTchwr8NKMNgm066KFi$xRzYncl25nQ8N+Gq3hOB3MsuavkFsK1Yf8O4Fgi9qRY=', CAST(N'2022-10-25T19:35:13.3222060' AS DateTime2), N'paulavsabogal@gmail.com', N'Paula', N'Sabogal', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (34, N'pbkdf2_sha256$320000$cNvZqJq88TFWXE0rV06muj$18r74ED7Qh3AsNVouowmqJJd+2BHxNazcVaKg33b2NY=', CAST(N'2022-10-25T19:52:02.1600030' AS DateTime2), N'carlam@gmail.com', N'Carla', N'Moris', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (35, N'pbkdf2_sha256$320000$NIskoGdPqlyPmzUKG7hPq8$LARH7C8OwimoxC4fI3YXdx6fQlRy76s2Cp+gusmZz1s=', NULL, N'rosmerypo@gmail.com', N'Rosmery', N'Poe', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (37, N'pbkdf2_sha256$320000$QcEJeaiK2tlw8jruCmkVYy$7t8ycMMxVnKsR18KcTrqXDWdkxoE5y97qY5IldQmHPA=', CAST(N'2022-10-31T23:26:48.1019300' AS DateTime2), N'sofiarodriguez@gmail.com', N'Sofía', N'Rodriguez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (39, N'pbkdf2_sha256$320000$nw5KktClC1z2KOhsAR7Eyf$PvlBh5cFgxRTMSVdaBU53X1t1Wd3dEFeMAIeHMR/vZM=', CAST(N'2022-10-31T23:42:01.3382700' AS DateTime2), N'camilamartinez@gmail.com', N'Camila', N'Martinez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (40, N'pbkdf2_sha256$320000$XcLgovhDcxlLebybDSTGCS$XN2I51CNilsSHlUpxhIy0qwStTjSCsjQ1yv5VzhF0JU=', CAST(N'2022-10-31T23:46:07.1584840' AS DateTime2), N'danielagonzalez@gmail.com', N'Daniela', N'Gonzalez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (41, N'pbkdf2_sha256$320000$CLvV1rzNb6PkgA9kMrtlcp$ccQMy/SsXYNhZjN00/6+ebl94Wkb/hBZQMYyeiKKKKY=', CAST(N'2022-11-01T18:46:40.6828320' AS DateTime2), N'valentinagarcia@gmail.com', N'Valentina', N'Garcia', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (42, N'pbkdf2_sha256$320000$3tPyGLiTF4uIqyKm9KhGX3$0h1BcSmDSssQZKDxxL4WK49Z48D37kBuaqWB139wtcQ=', CAST(N'2022-11-01T18:46:43.7972210' AS DateTime2), N'isabellagomez@gmail.com', N'Isabella', N'Gomez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (43, N'pbkdf2_sha256$320000$1YpJ5OfoLX7zyW0xbj4558$bwnicskqU+uiueXeESmIg/e98sx5/9NhkJqI7Aqxgjw=', CAST(N'2022-11-01T18:46:46.8596000' AS DateTime2), N'valerialopez@gmail.com', N'Valeria', N'Lopez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (44, N'pbkdf2_sha256$320000$ZImYVaPQM52impme8RQyzd$LBmUVk/93dG+wY/Dc99ukYhpll0v9uv36v0XIogD+G8=', CAST(N'2022-11-01T18:54:17.0275730' AS DateTime2), N'marianahernandez@gmail.com', N'Mariana', N'Hernandez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (45, N'pbkdf2_sha256$320000$ufDqKj6R0V5po9mJQaHt7a$/nj+U2K58WxBKAqWdZm1/PlEx0cuN3oRETSdbMMBPCs=', CAST(N'2022-11-01T18:54:20.4850380' AS DateTime2), N'sarasanchez@gmail.com', N'Sara', N'Sanchez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (46, N'pbkdf2_sha256$320000$Eo2xIW3Jg6HQ2DBpYUWQzZ$wEVpWwTHWAoH4+PXAi2s4TDsmGfgG1qufW3ABinenGc=', CAST(N'2022-11-01T18:54:23.5789080' AS DateTime2), N'victoriaperez@gmail.com', N'Victoria', N'Perez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (47, N'pbkdf2_sha256$320000$UMzpjJXybQ7Ggzlw1PPrx7$Y1l+LeQpzPqGOSOOklyvGeB2OPY2lO1eP37yPGdF9hw=', CAST(N'2022-11-01T18:54:26.6355380' AS DateTime2), N'gabrielaramirez@gmail.com', N'Gabriela', N'Ramirez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (48, N'pbkdf2_sha256$320000$TK1ALUbryBMyybwYvHMYzE$gLEJJxwuXQXMNwznXvS2SgiZw/IYHq8rjrSHuCghb6c=', CAST(N'2022-11-01T18:56:21.5700700' AS DateTime2), N'ikercarmona@gmail.com', N'Iker', N'Carmona', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (49, N'pbkdf2_sha256$320000$5hvxnivCTxhd1xG2Eqxgru$QO78f+p+I6ugWdfZbQr9rF/zpLLAkfjajOgGgxzrqcA=', CAST(N'2022-11-01T18:56:24.6135020' AS DateTime2), N'juanandrespulido@gmail.com', N'Juan Andrés', N'Pulido', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (50, N'pbkdf2_sha256$320000$8UYsEgUxOj0ETdyngOlNyH$5Ay63O88Ph8j5o0coJcXj7msd24uXCqqHa4Ehis3RLU=', CAST(N'2022-11-01T18:56:27.6724240' AS DateTime2), N'gonzalocaro@gmail.com', N'Gonzalo', N'Caro', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (51, N'pbkdf2_sha256$320000$y4MCROygRGdR1I5K8DkAr2$Tz5Y7FZ33/nL5h7uz7s0er0t5nZO41Y3HZL7CUufvy4=', CAST(N'2022-11-01T18:56:30.8481710' AS DateTime2), N'robertomelo@gmail.com', N'Roberto', N'Melo', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (52, N'pbkdf2_sha256$320000$OrwjeshwTVVL9Ppvhe1jxI$zenRh2dtnUp+ox1tcJLOZiDKETWTIrF3bmt7nDu71Nk=', CAST(N'2022-11-01T18:56:33.9179900' AS DateTime2), N'valentinogonzales@gmail.com', N'Valentino', N'Gonzales', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (53, N'pbkdf2_sha256$320000$8DWMz2ozOB6VSJPKHBNwed$LpeMjF9PLDsNaFw7cYLYmzCIbZAsjaKUPAHye17L5p0=', CAST(N'2022-11-01T18:56:37.0088490' AS DateTime2), N'facundobravo@gmail.com', N'Facundo', N'Bravo', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (54, N'pbkdf2_sha256$320000$JJq87zlAW1rBOATknNlQ35$suyeuI+gXknTSFN4xVv3FAV7ppaV60tJbLb2WSVli8M=', CAST(N'2022-11-01T18:56:40.1333020' AS DateTime2), N'patriciojaimes@gmail.com', N'Patricio', N'Jaimes', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (55, N'pbkdf2_sha256$320000$6xhsZXxGYltTA7Me2i3YIF$+b/oiNGi4d0v+WidTpXtvYfpH3CxgBq95XrmV6WEBW4=', CAST(N'2022-11-01T18:56:43.6472990' AS DateTime2), N'diegoalejandrorosero@gmail.com', N'Diego Alejandro', N'Rosero', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (56, N'pbkdf2_sha256$320000$aHvV4BfYHa1Jgxhv1u3WQ2$yVvEloRO8bP+ekJxN7akTrvEB2fKD07H7+QFA8Vtnjg=', CAST(N'2022-11-01T18:56:46.7369970' AS DateTime2), N'josueprieto@gmail.com', N'Josué', N'Prieto', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (57, N'pbkdf2_sha256$320000$ZeBfGTqqXPDuF8fzy9EWS2$0iO2lyA+uczwxHWRvhbYaS3ZJPIi2gz7c06EXpk6unk=', CAST(N'2022-11-01T18:56:49.8599240' AS DateTime2), N'francofigueroa@gmail.com', N'Franco', N'Figueroa', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (58, N'pbkdf2_sha256$320000$mPiDvRcepNWma1M31kSqYl$CTYW/e7VqR4EyzcAnG/E90ORUJDdGW8JqRn37vioi3c=', CAST(N'2022-11-01T19:02:11.8418890' AS DateTime2), N'ximenadiaz@gmail.com', N'Ximena', N'Diaz', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (59, N'pbkdf2_sha256$320000$Jmhp0QbGOKoraiuOdmJeAm$1UvPCF9xriboGfcFg1zBBwwlQbDan2eDPr8CwO/WEvs=', CAST(N'2022-11-01T19:02:14.9113000' AS DateTime2), N'andreatorres@gmail.com', N'Andrea', N'Torres', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (60, N'pbkdf2_sha256$320000$GM4CQMe1fAITRrSKQnu3WY$o2P8bASSbV2+Jr0MjXxaWRCvloZyrhSCqIgfP1emwaY=', CAST(N'2022-11-01T19:02:18.5520290' AS DateTime2), N'miarojas@gmail.com', N'Mía', N'Rojas', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (61, N'pbkdf2_sha256$320000$ElsxsCvz513TTgYh05VwLN$gkOnuulC7gf6VceHG+45tz9/puRuxR9T+91vNw1DBME=', CAST(N'2022-11-01T19:02:22.4587470' AS DateTime2), N'martinamoreno@gmail.com', N'Martina', N'Moreno', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (62, N'pbkdf2_sha256$320000$OhO9ECBKsmqpksKqF7yzvb$DzDQeX9XNYVgqCqsex94mv5BXc23HEKwCzAQf6Fiou4=', CAST(N'2022-11-01T19:02:25.5257070' AS DateTime2), N'luciavargas@gmail.com', N'Lucía', N'Vargas', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (63, N'pbkdf2_sha256$320000$pr08TTH6vLkLb5GSeQZ3TF$/SeSJTVYUo3+skdtnML6sv3vBD44FzGeMUAQeRwrnjg=', CAST(N'2022-11-01T19:02:28.5917820' AS DateTime2), N'samanthaortiz@gmail.com', N'Samantha', N'Ortiz', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (64, N'pbkdf2_sha256$320000$zPMmgUIwQzdbzvPENufPTl$VnO0wvRuE6f2tgVv9H7dTBFZyjvHDG+FA9Saf/sj1yg=', CAST(N'2022-11-01T19:02:31.6274220' AS DateTime2), N'mariajimenez@gmail.com', N'María', N'Jimenez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (65, N'pbkdf2_sha256$320000$Vgh0ypXlfCiml7MfcByWyR$TzC1+BquHzlHIupUbetvMUVhwRkSxRV9cdmLmBqn28g=', CAST(N'2022-11-01T19:02:34.8410440' AS DateTime2), N'mariafernandacastro@gmail.com', N'María Fernanda', N'Castro', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (66, N'pbkdf2_sha256$320000$sYMvumfXAXZAmyHUNQz6Sf$5qrPrBjse2Hq2BS2E3yjU+zHY95UK7bT7KfmLa6R23c=', CAST(N'2022-11-01T19:02:37.9309480' AS DateTime2), N'nicolegutierrez@gmail.com', N'Nicole', N'Gutierrez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (67, N'pbkdf2_sha256$320000$ehclWAP2r8FgXhJc13Uo0Z$xyXB7h5u0bgXI/u1w7zb602gCce7TwiBgisSPyqtoW4=', CAST(N'2022-11-01T19:03:28.8562310' AS DateTime2), N'valentinbecerra@gmail.com', N'Valentín', N'Becerra', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (68, N'pbkdf2_sha256$320000$kaZBd8We0b0ynkDNTxDtw7$XFpAl9KElIE9vZcqPKNInDoJP+HbFO4yNAumBNcoJRU=', CAST(N'2022-11-01T19:03:31.9066110' AS DateTime2), N'bautistafonseca@gmail.com', N'Bautista', N'Fonseca', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (69, N'pbkdf2_sha256$320000$SszS5auRzogkDLKvD5S0hW$fCAvgiDnmdp9lRRBQ/5YbQyf+Gjfr0TnaRUo6eRVdw8=', CAST(N'2022-11-01T19:03:35.0866640' AS DateTime2), N'alvaroperdomo@gmail.com', N'Álvaro', N'Perdomo', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (70, N'pbkdf2_sha256$320000$NJUJdDk1VWG8KrhHLhchfu$n6OYYV+jSDhx1Sj0bC8XouQJuWmQ2zfwGlFIS7E6aJo=', CAST(N'2022-11-01T19:03:38.1488620' AS DateTime2), N'dylancastellanos@gmail.com', N'Dylan', N'Castellanos', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (71, N'pbkdf2_sha256$320000$rUevgJKm6KKBc2u1h4Wvhh$U6pyKng1f+9b0vUHYJ/EFeojlXQqZLZjV7u/2gHGMGo=', CAST(N'2022-11-01T19:03:41.6367550' AS DateTime2), N'marcosbetancur@gmail.com', N'Marcos', N'Betancur', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (72, N'pbkdf2_sha256$320000$8N85AWZiUOYt4raHtQWzTY$VzwPRvH05f6QSTR4SUSln0LD6N4S89r36FdfRH1ic38=', CAST(N'2022-11-01T19:03:44.7574570' AS DateTime2), N'kimberlybohorquez@gmail.com', N'Kimberly', N'Bohorquez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (73, N'pbkdf2_sha256$320000$CLA7nYlsAsqEMDForQPJx2$Q6m28p7XVPzz3lyIQ7iCxrxBePdNzc9HBN2Rg6Vg6jc=', CAST(N'2022-11-01T19:03:47.7932370' AS DateTime2), N'lucianocampo@gmail.com', N'Luciano', N'Campo', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (74, N'pbkdf2_sha256$320000$MGRtQ0PgwzzjrBl7Ezmp0u$3XQiWb0h1dMgt6VhvIOgForx+B71PFP/0WaPX5DS+Ts=', CAST(N'2022-11-01T19:03:50.8348510' AS DateTime2), N'mariosalcedo@gmail.com', N'Mario', N'Salcedo', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (75, N'pbkdf2_sha256$320000$qoC8KQbgNTZjhTQ2mcG1NA$iYHgsgG/gd5X14TWjFI0z8XmEHd+9GHjNPT+h8tIhZo=', CAST(N'2022-11-01T19:03:54.6232420' AS DateTime2), N'cristoballuna@gmail.com', N'Cristóbal', N'Luna', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (76, N'pbkdf2_sha256$320000$x7ZV0g8VmAy8hY7my974s2$udx/I7+E5gbE0yBf7MTqFvg3qOwXPbJke0TLVZn36YE=', CAST(N'2022-11-01T19:03:57.8045660' AS DateTime2), N'lucagaleano@gmail.com', N'Luca', N'Galeano', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (77, N'pbkdf2_sha256$320000$HfYMWo8hso5N2ZK7tz3sCm$pdm5BxjxXkDiebTi8GOAhBrDi/e5oULkh/1eRp6/4QY=', CAST(N'2022-11-01T19:05:50.3709610' AS DateTime2), N'alejandraalvarez@gmail.com', N'Alejandra', N'Alvarez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (78, N'pbkdf2_sha256$320000$AMoaMLIsfZ6M7mNuBD3NOh$D/5Ujc+by724UIHqEjC7LjQyVitp28+x1qNHr4sshZc=', CAST(N'2022-11-01T19:05:55.1287950' AS DateTime2), N'paulavalencia@gmail.com', N'Paula', N'Valencia', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (79, N'pbkdf2_sha256$320000$MELP2bKB7zB009gl1kwyQe$XOdVeVjfcflJx/1suzkMhaz1nHsBowlvItTkWh6cbOw=', CAST(N'2022-11-01T19:05:58.1890020' AS DateTime2), N'emilyruiz@gmail.com', N'Emily', N'Ruiz', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (80, N'pbkdf2_sha256$320000$GKW5RyLKi2wGeYcIoeY060$dF2CZUB+HYiR4apqB+y64g5yQENBOwef03gsVZo7n8Q=', CAST(N'2022-11-01T19:06:02.1515500' AS DateTime2), N'fernandaherrera@gmail.com', N'Fernanda', N'Herrera', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (81, N'pbkdf2_sha256$320000$UlvFAtsujwajyb1f1NwTYN$AdmZ9ONYyFnPtfVXB2dtISjwj3KmrupABhm0eWSKiSY=', CAST(N'2022-11-01T19:06:05.2294460' AS DateTime2), N'lucianaromero@gmail.com', N'Luciana', N'Romero', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (82, N'pbkdf2_sha256$320000$JHGE8PwMeIjzKHrgZ0QKSA$i7nnYW0o9kiKI0am2i5NufdIsdwKVr1U7eWSUqeawcA=', CAST(N'2022-11-01T19:06:08.8559560' AS DateTime2), N'melaniemorales@gmail.com', N'Melanie', N'Morales', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (83, N'pbkdf2_sha256$320000$Rttivw3ydjmptQxqAjXqHA$1kgcrrc7vfV7AzQDqQ9m9WRKMXkGvBkFc3NWsemnc6U=', CAST(N'2022-11-01T19:06:11.8967990' AS DateTime2), N'reginagiraldo@gmail.com', N'Regina', N'Giraldo', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (84, N'pbkdf2_sha256$320000$eS8SaGytOBaeeO17Bg95uu$r/DEpvs6WBVpCdJ9wlkZan3JYdUuvtTP2BMf8dJi0xQ=', CAST(N'2022-11-01T19:06:14.9420300' AS DateTime2), N'catalinarivera@gmail.com', N'Catalina', N'Rivera', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (85, N'pbkdf2_sha256$320000$O2R0EFScBeZVHTVkvFS5o3$R67Wxs+heo02KSJBYDWF9yUw15KP5qZnXNYbeM41sIM=', CAST(N'2022-11-01T19:08:46.2558570' AS DateTime2), N'thiagomarquez@gmail.com', N'Thiago', N'Marquez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (86, N'pbkdf2_sha256$320000$MLdUzJtINTzwIGe4CFtZMn$PZ2LFCiWzayIFfoqt0p2j8f0CTanYlO3H0M8aScKMW8=', CAST(N'2022-11-01T19:08:49.3185350' AS DateTime2), N'jeronimocifuentes@gmail.com', N'Jerónimo', N'Cifuentes', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (87, N'pbkdf2_sha256$320000$QN91ggk9HnehbrLwRAEqYi$61zgdcTus7MCZ0LWhkdx+nFP8so3xtdeyJfysz5z2hI=', CAST(N'2022-11-01T19:08:52.6890480' AS DateTime2), N'hugomeza@gmail.com', N'Hugo', N'Meza', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (88, N'pbkdf2_sha256$320000$73tTws3R4Sb1NtgbxbU2O8$jwp7mhBe7TiFCPWY1tX2IoUmWRxkAq4AEWoi0AyqcNs=', CAST(N'2022-11-01T19:08:56.0116110' AS DateTime2), N'ricardosepulveda@gmail.com', N'Ricardo', N'Sepulveda', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (89, N'pbkdf2_sha256$320000$TsZFE04sAUgPQwa7rExL97$V6dRco4tLMi9hqkXsEN49bO6qh3MCc7GiC4jZspdpfw=', CAST(N'2022-11-01T19:08:59.7233850' AS DateTime2), N'antoniorueda@gmail.com', N'Antonio', N'Rueda', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (90, N'pbkdf2_sha256$320000$QSdxoOOqTlIPErQcsgQPcX$9IVJfH86cQwxYC1bpu/ybbpRjpgY9tsOd/adtyv0kAI=', CAST(N'2022-11-01T19:09:02.7812140' AS DateTime2), N'ianfuentes@gmail.com', N'Ian', N'Fuentes', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (91, N'pbkdf2_sha256$320000$yRwGhup7fsp9pC6mI8wp1o$j6T0QOvc9adz7qaidaff7tOJqtZYd/pKbmB+ws9JiaY=', CAST(N'2022-11-01T19:09:05.9117760' AS DateTime2), N'anthonybenitez@gmail.com', N'Anthony', N'Benitez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (92, N'pbkdf2_sha256$320000$usumrlQpd29tFgPd71MckJ$bzhMnsY1s4o24vaqqzcxJ7Ar0JbCjIbi31CSikHEZo8=', CAST(N'2022-11-01T19:09:09.2480790' AS DateTime2), N'pedromeneses@gmail.com', N'Pedro', N'Meneses', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (93, N'pbkdf2_sha256$320000$eGtm38gwbBKyCYGqo81U68$0z2n0Mjt4KU9S/c1wPWcZ1cAEbKCz4XpLjUmXp7tdOk=', CAST(N'2022-11-01T19:09:12.7546900' AS DateTime2), N'rafaelvelasco@gmail.com', N'Rafael', N'Velasco', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (94, N'pbkdf2_sha256$320000$YjpYW0BnjrWblJSYnFROsA$dC2nYxFuXJ97joJ8UVLcvU3l/cg68CRftBFwZWdF8ss=', CAST(N'2022-11-01T19:09:15.8198080' AS DateTime2), N'jonathanloaiza@gmail.com', N'Jonathan', N'Loaiza', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (95, N'pbkdf2_sha256$320000$xHFEgEmMtCucDCzNY5ouXU$YKl2Iyxh9HTvdRTty6sV+SUR9/pc0LQuwxPU2tF7dec=', CAST(N'2022-11-01T19:09:18.9031300' AS DateTime2), N'estebanestrada@gmail.com', N'Esteban', N'Estrada', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (96, N'pbkdf2_sha256$320000$sYqflcZUDXzYu5yNOkXKP9$YgSo9TyWVgwTH3rpFfuFKe6yqWVupRvZv/HFHQ/cbQ4=', CAST(N'2022-11-01T19:09:22.6458180' AS DateTime2), N'julianaguilar@gmail.com', N'Julián', N'Aguilar', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (97, N'pbkdf2_sha256$320000$Yv1VooFNgbcRn1iUd2Zrhk$wRql3DIJn90im1D2R6v5Lhx6cmmWfGh/HjRqQwTJCgk=', CAST(N'2022-11-01T19:09:25.6964580' AS DateTime2), N'mauricioayala@gmail.com', N'Mauricio', N'Ayala', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (98, N'pbkdf2_sha256$320000$Ym3IF9cPXi6krLffTYnENF$q69YN6ef2paWZbPB0KNlYEhk7zIMnbT9T3uYNozLy7Y=', CAST(N'2022-11-01T19:09:28.7196610' AS DateTime2), N'oscarsolano@gmail.com', N'Oscar', N'Solano', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (99, N'pbkdf2_sha256$320000$KULrinWu4xktGEYCNAfhuB$gfCYZAUehKCRHBewJ48j2EXPNIQwzH5g7beIa9HocDE=', CAST(N'2022-11-01T19:09:31.7520070' AS DateTime2), N'santinomonsalve@gmail.com', N'Santino', N'Monsalve', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (100, N'pbkdf2_sha256$320000$nzJXf4hBYWSK54aLTTttz8$M8wOSWDJGyiMhmzAPIo5wHvzG1e+ElVVFmzMfxTUFt4=', CAST(N'2022-11-01T19:09:35.7657500' AS DateTime2), N'sergioarenas@gmail.com', N'Sergio', N'Arenas', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (101, N'pbkdf2_sha256$320000$LymtEyap8Yxp8vmyU7n0Q9$RZRsjv2HCO2HHFzpe5zlRUESsD/OT5L5+Ovd4pW8BdM=', CAST(N'2022-11-01T19:09:38.8065420' AS DateTime2), N'guillermocabrera@gmail.com', N'Guillermo', N'Cabrera', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (102, N'pbkdf2_sha256$320000$gAf2w06CFHMTpv3jJgpsP3$3BBSRbQTA6koQao5GGkecilEqI69/7QSATepW7ICDl0=', CAST(N'2022-11-01T19:09:41.8601760' AS DateTime2), N'matthewgalindo@gmail.com', N'Matthew', N'Galindo', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (103, N'pbkdf2_sha256$320000$MQya48ZwzrvB9Ye7vfuxK7$VmUgZLDPWDQcyVq91ImQ0RvZbBAFYFPOjPth3DpKEVg=', CAST(N'2022-11-01T19:13:30.2051800' AS DateTime2), N'ashleyarias@gmail.com', N'Ashley', N'Arias', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (104, N'pbkdf2_sha256$320000$p0oU3SSPgaZwm2912Alv3s$+fiwy+lB7sXL1t93dD/0dvWrmFSUoSZV09AgNgSykfQ=', CAST(N'2022-11-01T19:13:33.3044280' AS DateTime2), N'renataflorez@gmail.com', N'Renata', N'Florez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (105, N'pbkdf2_sha256$320000$hXHlhhIcvhZWuNWjqcKZ4N$K3Q0n8ZD1TO+QWQhrOvejtyOst+CUc9LyLhi+mruII8=', CAST(N'2022-11-01T19:13:36.3906910' AS DateTime2), N'agustinamarin@gmail.com', N'Agustina', N'Marin', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (106, N'pbkdf2_sha256$320000$G10NMnVf1f4RUwlgZ2FYr6$oTqkzhGC8/vAKqmVaMQFdrDmYkCRl6c4/JEK/7aXyTA=', CAST(N'2022-11-01T19:13:39.4187360' AS DateTime2), N'abrilcastillo@gmail.com', N'Abril', N'Castillo', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (107, N'pbkdf2_sha256$320000$XMTLGebISTeLgTZ4AzfxPc$bhxRXXPhRjh6rTqgQijPKVOxNCfPQiPCgaqTtQlRz9s=', CAST(N'2022-11-01T19:13:43.0327770' AS DateTime2), N'emmamejia@gmail.com', N'Emma', N'Mejia', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (108, N'pbkdf2_sha256$320000$PLTVtiG7p87UQcNJivUW1o$WV1w3vFTu4boOIYleJcioRjguHj/MZzjmintkUKntDE=', CAST(N'2022-11-01T19:13:46.0637060' AS DateTime2), N'emiliamosquera@gmail.com', N'Emilia', N'Mosquera', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (109, N'pbkdf2_sha256$320000$Y1MJbtxPV5jbT49lJR5txN$Yx50dG+A4ozyuMvF4pegYBA0RQoSF/EDgg1pB/1l6kY=', CAST(N'2022-11-01T19:13:49.3429690' AS DateTime2), N'jazminosorio@gmail.com', N'Jazmín', N'Osorio', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (110, N'pbkdf2_sha256$320000$Hu45u04ixGNsYjtvFYkMFZ$rILQfZ+xCcW0BuhRyKP5lcSy/LbND7jOm+it7S1YhKg=', CAST(N'2022-11-01T19:13:52.4035590' AS DateTime2), N'juanitacardenas@gmail.com', N'Juanita', N'Cardenas', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (111, N'pbkdf2_sha256$320000$rVUCGKmbTTDiAGXFh9seQk$wbAW8m9yF337tGR1Jn0Vip1kxv4pf24TNHZY0Hf6/oQ=', CAST(N'2022-11-01T19:13:55.6236870' AS DateTime2), N'brianacardona@gmail.com', N'Briana', N'Cardona', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (112, N'pbkdf2_sha256$320000$almqMyseWBRwXUlyrnY3BQ$X0z0u/ADNpzee2iAFipOSoYr+vdJSanH2erJqLpoFYg=', CAST(N'2022-11-01T19:13:59.2567560' AS DateTime2), N'antoniazapata@gmail.com', N'Antonia', N'Zapata', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (113, N'pbkdf2_sha256$320000$8Bgm1DidtWksGN3H0Erje8$QNdICrUTGPO61wG45h636+xGo27PDhO8GCuFeLz6eeI=', CAST(N'2022-11-01T19:14:02.3117920' AS DateTime2), N'laurarestrepo@gmail.com', N'Laura', N'Restrepo', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (114, N'pbkdf2_sha256$320000$2UhQB1uVHQdFAVlp3Tyx80$4YV7YmP35ZbcC3ZtpKhHs/uM1tg1zpB+zleL+f+wPtQ=', CAST(N'2022-11-01T19:14:05.3429840' AS DateTime2), N'antonellaguerrero@gmail.com', N'Antonella', N'Guerrero', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (115, N'pbkdf2_sha256$320000$2zMWTA7jiwdDAot6MzNshx$p1kjJU0nRCu6XRHbrVv7SbOwxSiUNgtxa2uFzozoHho=', CAST(N'2022-11-01T19:14:08.7464390' AS DateTime2), N'lunaparra@gmail.com', N'Luna', N'Parra', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (116, N'pbkdf2_sha256$320000$DLDAysO7jtFXw1sJ91EsZU$Y6YdMAjcesq3pT4b77nDMf/VRE3k9h5hHssqEdu9EgU=', CAST(N'2022-11-01T19:14:11.7860320' AS DateTime2), N'carlamendoza@gmail.com', N'Carla', N'Mendoza', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (117, N'pbkdf2_sha256$320000$O7JKaBVCFhq7ppgHzix2rN$dLBdzPjcXWgjX0ING9kxckBE+q+/Wm3vsWZg6N5XL4o=', CAST(N'2022-11-01T19:14:14.8478080' AS DateTime2), N'allisonmedina@gmail.com', N'Allison', N'Medina', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (118, N'pbkdf2_sha256$320000$87V0r5i5YoUUHeRHSVbMIE$0McvbbE77GLbazjj42B04e+3bPxI9JLdckpiafe87JU=', CAST(N'2022-11-01T19:14:17.8897140' AS DateTime2), N'monserratramos@gmail.com', N'Monserrat', N'Ramos', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (119, N'pbkdf2_sha256$320000$E7ABKe30nQHO1wpuO7wp0L$WM/FYuqGqdjp10KGpds1dsLvDP5E9PS6LCad5qR+56s=', CAST(N'2022-11-01T19:14:21.1317660' AS DateTime2), N'paulinsalazar@gmail.com', N'Paulin', N'Salazar', 1, 0, 0, 1, 0)
GO
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (120, N'pbkdf2_sha256$320000$Aa4Ghj6y3tJjxvwrHMcqI8$7Ma0PlIntrGtIDN6yJqkU7jF16t4kRA9r0gxwqLsrSk=', CAST(N'2022-11-01T19:14:24.1998360' AS DateTime2), N'isabelcorrea@gmail.com', N'Isabel', N'Correa', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (121, N'pbkdf2_sha256$320000$a3ka5Dg9r7NAgWq0d2Tmsc$r42JYnG9Gj/oH6kFuzVYzydmMQbEqCqYv3oyVMrfKXA=', CAST(N'2022-11-01T19:14:27.2257770' AS DateTime2), N'julianaortega@gmail.com', N'Juliana', N'Ortega', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (122, N'pbkdf2_sha256$320000$M4vjo6ryOOZxL9Dv1Ex6xL$iRlEWZrCyqPfOC3RxTANaA1QvhXAnEsDUcO4H+yM2f0=', CAST(N'2022-11-01T19:15:59.5244100' AS DateTime2), N'juandavidgalvis@gmail.com', N'Juan David', N'Galvis', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (123, N'pbkdf2_sha256$320000$uZhCuiRQnOG0DZMP6bWwch$jrb83hqeuqfXhHYURXmyzBJkK9tDTJUwLHTl1W8hkKA=', CAST(N'2022-11-01T19:16:02.6027820' AS DateTime2), N'simonardila@gmail.com', N'Simón', N'Ardila', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (124, N'pbkdf2_sha256$320000$c6nPScSZGYEMj2cXPzNDiB$ZoOdmb4CSd+kH3XGnOWjD0KkkAIQc0JW7fLa+sFRsfs=', CAST(N'2022-11-01T19:16:05.6734110' AS DateTime2), N'joshuamesa@gmail.com', N'Joshua', N'Mesa', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (125, N'pbkdf2_sha256$320000$cdXFiPnu6rOvezgYAFZxkK$/+DZytsoa8M7LHC8Vnmvk5vFfFjXK9jFQ2jVqeBi5rw=', CAST(N'2022-11-01T19:16:08.7048350' AS DateTime2), N'maximilianotovar@gmail.com', N'Maximiliano', N'Tovar', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (126, N'pbkdf2_sha256$320000$VEOBsS9yL8jUvNAZOZecLy$N6zzTZuND2G6/LuKxGQci21l4ik3LkkrjH6MYMtZauI=', CAST(N'2022-11-01T19:16:12.0522340' AS DateTime2), N'miguelangelgaviria@gmail.com', N'Miguel Ángel', N'Gaviria', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (127, N'pbkdf2_sha256$320000$0uEaQJywU2TORbMNVgisZy$+T/iBpyUx5QVgSPDqmVg3YDKBdx60PxBP62SXMpctHo=', CAST(N'2022-11-01T19:16:15.1257490' AS DateTime2), N'juansebastianpalacio@gmail.com', N'Juan Sebastián', N'Palacio', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (128, N'pbkdf2_sha256$320000$R4avn3yVVbMyWu9E5Q0NB6$o8ur9yZSwG7VK8f0bVjFnwFAXlAwEDJlifKonQkLV/4=', CAST(N'2022-11-01T19:16:18.1930520' AS DateTime2), N'brunouribe@gmail.com', N'Bruno', N'Uribe', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (129, N'pbkdf2_sha256$320000$wyM76hqIpP3UVoTOFHwzUw$LInTKHlU9ZdIUSjyZeQ8eyxL23bDgM5NtNbvUVwjZds=', CAST(N'2022-11-01T19:16:21.2404500' AS DateTime2), N'ivanguevara@gmail.com', N'Iván', N'Guevara', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (130, N'pbkdf2_sha256$320000$uNJmljapdBXzSi5wyawGdN$VvoKrBZkzBMQ+hN2B6OBalzudotw35cpv27bSVquUWo=', CAST(N'2022-11-01T19:16:24.6636560' AS DateTime2), N'gaelarboleda@gmail.com', N'Gael', N'Arboleda', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (131, N'pbkdf2_sha256$320000$kNJo7zZpBRB9gB00D9eDTk$QraEP0tOQtQE7apE34l53WuY5IhadMm+j+VBzHIrtdc=', CAST(N'2022-11-01T19:16:27.7279110' AS DateTime2), N'miguelmiranda@gmail.com', N'Miguel', N'Miranda', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (132, N'pbkdf2_sha256$320000$cO67iW6vBeN7xcGprkYQRq$rf2PhjKgl90ppC809VEcp5Kxr8rLwWOl8K7ojBc5uoY=', CAST(N'2022-11-01T19:18:12.7776920' AS DateTime2), N'valerievasquez@gmail.com', N'Valerie', N'Vasquez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (133, N'pbkdf2_sha256$320000$vmcHfzVxGxTTyKMmRJ7BrC$2FUSXC2c7oQ2JyzWvJ56gBGGiW0FjL0Ex4fYUTjmSk4=', CAST(N'2022-11-01T19:18:15.8192580' AS DateTime2), N'florenciamontoya@gmail.com', N'Florencia', N'Montoya', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (134, N'pbkdf2_sha256$320000$RkEMqTwDLqgi6w0TRanuv1$03ntB8KHpyq3vnAceVf0rTe7EUSjk1ka817EOcFkdug=', CAST(N'2022-11-01T19:18:18.8989380' AS DateTime2), N'adrianacortes@gmail.com', N'Adriana', N'Cortes', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (135, N'pbkdf2_sha256$320000$pyhdott1jceWECQkkqSQyY$X9Z/EweWSrzcVF8bGC0E1aRGnsRR2xmz4MkHvW9753w=', CAST(N'2022-11-01T19:18:22.0837730' AS DateTime2), N'naomiacosta@gmail.com', N'Naomí', N'Acosta', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (136, N'pbkdf2_sha256$320000$4XVXvG5xUrm7jNw5hwnNVO$9q1uLzgQVYbRU/j5ZwNrUsLO8LrpEXNUWK4QJeskR0M=', CAST(N'2022-11-01T19:18:25.1245320' AS DateTime2), N'amandaguzman@gmail.com', N'Amanda', N'Guzman', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (137, N'pbkdf2_sha256$320000$2TtkLnSXgU5HbeZqfo5lsw$SwJ1uvqVbH4IDTZhPy5OiThDBsgFfRSBsJe11ef49ZA=', CAST(N'2022-11-01T19:18:29.4216460' AS DateTime2), N'morenamolina@gmail.com', N'Morena', N'Molina', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (138, N'pbkdf2_sha256$320000$00pKNvMnP47neokLpj4zd7$FsnQ8oYJzBSVK6SljpHIE7a7+A3GNWMKE4kYSRtWnr4=', CAST(N'2022-11-01T19:18:32.5840280' AS DateTime2), N'natalievelasquez@gmail.com', N'Natalie', N'Velasquez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (139, N'pbkdf2_sha256$320000$I66mxcEaVGmB4xwN1vkOPX$3qFoC1weVf1iaDjrgD2sP44cKY/jvY8qKf0WXelUeIE=', CAST(N'2022-11-01T19:18:35.6425220' AS DateTime2), N'constanzarincon@gmail.com', N'Constanza', N'Rincon', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (140, N'pbkdf2_sha256$320000$2afffkvO0btAyiLlpJXkd9$xAxtd4Ou40nK9CjU3Os0j1mDwPBIne8lfqJkT9mnxVQ=', CAST(N'2022-11-01T19:18:38.7009630' AS DateTime2), N'lolarios@gmail.com', N'Lola', N'Rios', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (141, N'pbkdf2_sha256$320000$wmkpk29OQIqSF6nQw6an2h$P29FPjNv0onKxCnKlYVcw2DtJGYUS6uE00QD/If3ydU=', CAST(N'2022-11-02T20:20:15.6102630' AS DateTime2), N'labrasserie@gmail.com', N'La Brasserie', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (142, N'pbkdf2_sha256$320000$M0ySePwMKnhfSYjVb9I2jX$D3zJswmLEDjUHzmsO+fWVUC/nKVY9a2nVO7h2xKT1p4=', CAST(N'2022-11-02T20:32:05.6391440' AS DateTime2), N'lafabbrica@gmail.com', N'La Fabbrica', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (143, N'pbkdf2_sha256$320000$UQ8iLzZ7Xz3PU7qKMCDqv5$rMRpUVCougVAOhugUUNXlUX8AgJihFQw4ct+nAr9j5g=', CAST(N'2022-11-02T20:43:46.0000000' AS DateTime2), N'cabrasrestaurantebar@gmail.com', N'7 Cabras', N'Restaurante Bar', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (144, N'pbkdf2_sha256$320000$GAcPrylDs5UF5LRCS9e2Ui$GIM88UkNYXrzCH/cUuGpjHZ1zOgL8i4ZI44vAB1pt4M=', CAST(N'2022-11-02T21:57:07.0948060' AS DateTime2), N'laromanarestaurante@gmail.com', N'La Romana Restaurante', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (145, N'pbkdf2_sha256$320000$6xcmqZttEN2tl6ufEq7R6y$G3LZ6ZhzPpXK1K0rdJQlCpp+A/EIwKkqa67ZvmAyPWQ=', CAST(N'2022-11-02T22:01:46.4917820' AS DateTime2), N'minimal@gmail.com', N'Mini Mal', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (146, N'pbkdf2_sha256$320000$NeBB36vwjDZWWhjFFaQfpz$wZoUyPoG1ZEH6YbrDG/HYc3+6BYVjTo7wq/dh8ACEv0=', CAST(N'2022-11-02T22:10:41.4263720' AS DateTime2), N'restaurante69gauchos@gmail.com', N'Restaurante 69 Gauchos', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (147, N'pbkdf2_sha256$320000$kowKS527FgrwvdJkG8ObJo$xQVADl/4xSa+evor7V3mNihV4K+VhYxQ2EUv9nYXmEA=', CAST(N'2022-11-02T22:15:33.4187500' AS DateTime2), N'cantinaypunto@gmail.com', N'Cantina y Punto', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (148, N'pbkdf2_sha256$320000$iItXpVN2Vzl23xpO55Qjkm$wYO7XKhukxdggdXAROMtuEUNQFMgF9cYIFpSCMZ2Kuk=', CAST(N'2022-11-02T22:25:24.1654270' AS DateTime2), N'mesafranca@gmail.com', N'Mesa Franca', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (149, N'pbkdf2_sha256$320000$dGtsI7ip6pfkJwnlEQILoH$/j/56lmiN0bvA4GUhJKUzWr0Cb++ECImqk/KIgUg/34=', CAST(N'2022-11-03T21:36:19.3680230' AS DateTime2), N'oakahumadobrebajes@gmail.com', N'OAK Ahumado y Brebajes', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (150, N'pbkdf2_sha256$320000$SCucMTwlCo1EtiPiGCaKdR$Mj3a+y070zabzsjgS6fUk+T6E3txjWQDUo0RvHJCXwQ=', CAST(N'2022-11-03T21:41:58.7982560' AS DateTime2), N'muychapinero@gmail.com', N'MUY Chapinero', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (151, N'pbkdf2_sha256$320000$HUhQCWOyfTLebeGWOa9dDC$J8yTqx8c0t4x7+IqCB9jPyhaC2OPYoVSPj+EZLQt0cI=', CAST(N'2022-11-03T21:48:02.4634770' AS DateTime2), N'themarketbogota@gmail.com', N'The Market Bogotá', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (152, N'pbkdf2_sha256$320000$YAzpkK2KLg2XFaEQoh47o8$QhgtvG9EAzXcT7Nj6dn7o+ouUFMw5Uaf/YWDoB0h4YM=', CAST(N'2022-11-03T21:51:27.9504120' AS DateTime2), N'laventana@gmail.com', N'La Ventana', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (153, N'pbkdf2_sha256$320000$5dCnPbnnUuY6eHdDkoFra7$dLOSBd1L1hm3EYUE6xF3781cwdi9fH+PDjTRcDvreyI=', CAST(N'2022-11-03T21:57:47.5508310' AS DateTime2), N'diluccachapinero@gmail.com', N'Dilucca To Go Chapinero', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (154, N'pbkdf2_sha256$320000$bE6nMxvlt26aoON3wb40Op$yDXBgb30xSzOgJLFGIRJ8PEvwMReg1EgceYfuUr4XT4=', CAST(N'2022-11-03T22:07:49.7497010' AS DateTime2), N'ladivabogota@gmail.com', N'La Diva Bogota', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (155, N'pbkdf2_sha256$320000$zkROFMnPuiF4cCBJ5oh6bK$A0I8gNlcxhJP6IOVO/P2RG6/zmtGAvDxD7Jb7P4Lu/k=', CAST(N'2022-11-03T22:12:25.4995660' AS DateTime2), N'casabarbistro@gmail.com', N'Casa Bar Bistro', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (156, N'pbkdf2_sha256$320000$haZWbn1y9cg4dRDazTL2ZM$EqsPxCzkx5OGNVaKcNE3ZTX3/AXKo0QycTdFzZoR/Ik=', CAST(N'2022-11-03T22:22:08.4951510' AS DateTime2), N'dondepelechapinero@gmail.com', N'Donde Pele Chapinero', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (157, N'pbkdf2_sha256$320000$eiLqbwahqctlngLZahcUoR$XK81EfyhCx6ccegilJqsd9xa2H535v/DQqreCX81KkI=', CAST(N'2022-11-03T22:25:34.7420170' AS DateTime2), N'bhipshamburguesas@gmail.com', N'Bhips Hamburguesas', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (158, N'pbkdf2_sha256$320000$QT6tuuKa0IWD93Dp7MsMG8$xkCUlfErt8FkQ4RmCEcLE3rxiV98AqWR63NyJZiE1rM=', CAST(N'2022-11-03T22:32:34.1440770' AS DateTime2), N'gatonegro@gmail.com', N'Gato Negro', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (159, N'pbkdf2_sha256$320000$OAZ8dQCQHnsLAqR913XcJ4$TT9NARO4y0WB/q5HYWRaIky2pynvHXAYNjMjP9hk9E0=', CAST(N'2022-11-03T22:47:53.3890830' AS DateTime2), N'humonegro@gmail.com', N'Humo Negro', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (160, N'pbkdf2_sha256$320000$p04mZUM8PckW043C869esh$jr9HOI30sYuJ9y1Iz70syUHrLBM1cq072yHqjBT9euo=', CAST(N'2022-11-03T22:52:21.1649310' AS DateTime2), N'restaurantelaherencia@gmail.com', N'Restaurante La Herencia', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (161, N'pbkdf2_sha256$320000$oOobJUrELynxly9oaqr6Lo$pHtInS9sTDa+gSg6fDZu5o6HiJvM0gnoRYKLOWJUflM=', CAST(N'2022-11-03T22:56:20.5279500' AS DateTime2), N'sakuraenjoy@gmail.com', N'Sakura Enjoy', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (162, N'pbkdf2_sha256$320000$irBIPWuxENxlZJgSArh7VE$wjjURxg5UKZPq9GviGloz242ozkESsapYFFT4LppsHw=', CAST(N'2022-11-03T23:00:53.4697220' AS DateTime2), N'kongrestaurante@gmail.com', N'KONG Restaurante', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (163, N'pbkdf2_sha256$320000$5rLNJWDVQF0hKkxjWAYYEF$HY+IucOrjds3t/VGhfXhY/A69I4cdILqposYynDgwnI=', CAST(N'2022-11-03T23:04:19.4598290' AS DateTime2), N'chefburgerparque93@gmail.com', N'Chef Burger Parque 93', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (164, N'pbkdf2_sha256$320000$IUwdvQGkLuFWQ7UpGBzqtx$HPBs0ylRFGTbn/60UrVWK+aGzGvAFA1glFd4EHkIbsk=', CAST(N'2022-11-03T23:11:15.3142170' AS DateTime2), N'itanos@gmail.com', N'Itanos', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (165, N'pbkdf2_sha256$320000$6m232cb1DWg8HKAJHpI9SB$1tW2h7X5V4OBSqlbtO/S8HUO5WiNfLju/vR4WDXlNMY=', CAST(N'2022-11-03T23:14:25.4785010' AS DateTime2), N'restaurantenazca@gmail.com', N'Restaurante Nazca', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (166, N'pbkdf2_sha256$320000$t19IT3Hg8xuuHYbz5DQQbk$6HLpaHGf4WMaZC1WLHf6Bm5HAtqA0t69iNZNIcUsZ/g=', CAST(N'2022-11-03T23:19:23.1564290' AS DateTime2), N'marrakeshmarroqui@gmail.com', N'Marrakesh Comida Marroquí Chapinero', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (167, N'pbkdf2_sha256$320000$yH8VjqiPQpJ1qQNGOfuVce$LRyjCpAKUgst80C/2MIfzcS0/kRajAEVzeFr0BAjpL8=', CAST(N'2022-11-03T23:21:45.7791900' AS DateTime2), N'larevolucioncuchara@gmail.com', N'La Revolución de la Cuchara', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (168, N'pbkdf2_sha256$320000$fK52VEylqPfWMhklBRGMXr$i8gVjS2V0QmwuVi9TlkdeA7UUv/JDZS+GKC3u7O0gmE=', CAST(N'2022-11-03T23:30:11.2913170' AS DateTime2), N'restaurantechambaku@gmail.com', N'Restaurante Chambaku', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (169, N'pbkdf2_sha256$320000$6xkxX8hCG1OovnilM61BTo$Mc6V9v2J1XvVHx1LMe4nei8xh+Z5g6IzmiVK6GVr1MM=', CAST(N'2022-11-04T00:56:26.2156250' AS DateTime2), N'restauranteelcielo@gmail.com', N'Restaurante El Cielo', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (170, N'pbkdf2_sha256$320000$ivxtW8oFN9vQXDaqDBDRJS$nuPuQjqXLsX9yFRtjPAszFKu64nGUMRv/D25GarUclI=', CAST(N'2022-11-04T01:00:29.3890050' AS DateTime2), N'elarabe@gmail.com', N'El Árabe', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (171, N'pbkdf2_sha256$320000$P5bip5706CSXc0EZrZbAlf$MjpKndu4bfRaajiyNlA9jkwXADfgGjGCh49U3zE2Zvs=', CAST(N'2022-11-04T01:13:23.3693150' AS DateTime2), N'harrysasson@gmail.com', N'Harry Sasson', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (172, N'pbkdf2_sha256$320000$nKxggaCxw0aUVBNpPbwDwL$jScYJ9W2PWS0l3Ufj7E1k/cCtLSgQ2Ekfg8lQsDS82w=', CAST(N'2022-11-04T01:18:37.4017330' AS DateTime2), N'takumacocinashow@gmail.com', N'Takuma Cocina Show', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (173, N'pbkdf2_sha256$320000$kyDP7bmo0VAnbq20CNDWEW$apwZeNBMAhXG3q51f5jpQfr/hZCxPgBrJ2iEhpjPI/g=', CAST(N'2022-11-04T01:24:51.1811130' AS DateTime2), N'capodicapi@gmail.com', N'Capo Di Capi', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (174, N'pbkdf2_sha256$320000$kDMzuXL9vj4kDuEWfWKA8j$Vy/oKpmF//IcOlpYCJAKuDd5jYk002sXTF74sLgtK00=', CAST(N'2022-11-04T01:27:22.1408970' AS DateTime2), N'criterion@gmail.com', N'Criterión', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (175, N'pbkdf2_sha256$320000$eiSqn0N2iIG2lPv1IB7DbB$o98xiW8pZ4XG2VAJAYMvFE+wG1Di9rDTMoDYxdQcibA=', CAST(N'2022-11-04T01:31:23.8434510' AS DateTime2), N'toroyvacas@gmail.com', N'Un Toro Y Siete Vacas', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (176, N'pbkdf2_sha256$320000$9xIg16kDrcYu8WoKu1lPFr$IPsvrSxC/yqYOVTuRHetdK8pdzv4JhyBtRD6xvStqiU=', CAST(N'2022-11-05T21:06:21.0150740' AS DateTime2), N'lorenzoelgriego@gmail.com', N'Lorenzo El Griego', N'', 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (177, N'pbkdf2_sha256$320000$naafZ6tpJz8IjOTlNiSKAY$duEYqHEJYaxB+LgLQLsMhr5PVJ6lQZyVX+v6oEEyN0I=', CAST(N'2022-11-06T12:16:43.3944260' AS DateTime2), N'jabesrodriguez100@gmail.com', N'Jhabes', N'Rodríguez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (178, N'pbkdf2_sha256$320000$rWDFCcMKeVKdYwS1wWb8f4$ieI2DSX4ma6m1Af0Ug6Ws8+MwsdZJbhfAfnzTY7DlOA=', CAST(N'2022-11-08T15:31:13.8560710' AS DateTime2), N'lotav@gmail.com', N'Lota', N'Villa', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (179, N'pbkdf2_sha256$320000$ITBkvpablXlgmBE77Us72B$o0vZkOjyIDvEoXfoh+ITauPLYiJCrofdkr4l4PVCsU8=', CAST(N'2022-11-08T15:41:20.4373160' AS DateTime2), N'bsksido@ndkdk.com', N'julio', N'kdk', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (180, N'pbkdf2_sha256$320000$fvOmfY9AWzjLFabXalSRrK$Wl/ML0/luTPZm83bw/QyIk4ngdAb9syMIxnJv0lfT74=', CAST(N'2022-11-08T16:05:05.5751540' AS DateTime2), N'ndkwosodd@kfkd.com', N'kfkdkdk', N'ndkdkdkdk', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (181, N'pbkdf2_sha256$320000$hQ6l3OVsRFwYzwnZwg8c7N$tkrwQk+M3uRrW8PBJHjqxFMFJW6hd+PU0wDf/TuKddg=', CAST(N'2022-11-08T16:18:53.5127880' AS DateTime2), N'wroldan@gmail.com', N'Wilmar', N'Roldan', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (182, N'pbkdf2_sha256$320000$LxFECVNqWVwJaWS3inbkdm$q+PxhekQS+Zfa1tBCiIQnqNyH5q2QKbMnj+EQ0Czrqk=', CAST(N'2022-11-08T16:52:22.4739440' AS DateTime2), N'pedrog@gmail.com', N'Pedro', N'Gomez', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (183, N'pbkdf2_sha256$320000$cEJIxmCQB04D5TlvJOH8Pm$C+wM8xyaJb4GiRsTvDlHM4B6XJf3Rh2kXbRds75+o08=', CAST(N'2022-11-28T19:15:44.0000000' AS DateTime2), N'lprada@gmail.com', N'Restaurante Alitas de luis', NULL, 1, 0, 1, 0, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (184, N'pbkdf2_sha256$320000$O94bTTix7uTM0ws72mbquN$J1Vzc8aKqscKMAR0UbRsillM3z6E9HefUt9wiw/x1h0=', CAST(N'2022-11-28T20:30:01.6952310' AS DateTime2), N'carlosl@gmail.com', N'Carlos', N'Linares', 1, 0, 0, 1, 0)
INSERT [dbo].[users_user] ([id], [password], [last_login], [email], [name], [last_name], [is_active], [is_staff], [is_restaurant], [is_commensal], [is_superuser]) VALUES (185, N'', CAST(N'2023-03-25T21:26:22.5401650' AS DateTime2), N'longos@gmail.com', N'Longos', N'', 1, 0, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[users_user] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [admin_interface_theme_name_30bda70f_uniq]    Script Date: 10/07/2023 8:17:57 p. m. ******/
ALTER TABLE [dbo].[admin_interface_theme] ADD  CONSTRAINT [admin_interface_theme_name_30bda70f_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_group_name_a6ea08ec_uniq]    Script Date: 10/07/2023 8:17:57 p. m. ******/
ALTER TABLE [dbo].[auth_group] ADD  CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__authtoke__B9BE370E2EF81F8A]    Script Date: 10/07/2023 8:17:57 p. m. ******/
ALTER TABLE [dbo].[authtoken_token] ADD UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [restaurants_galleryrestaurant_restaurant_id_3504d84d]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [restaurants_galleryrestaurant_restaurant_id_3504d84d] ON [dbo].[restaurants_galleryrestaurant]
(
	[restaurant_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__restaura__B9BE370E5EDE5D35]    Script Date: 10/07/2023 8:17:57 p. m. ******/
ALTER TABLE [dbo].[restaurants_restaurant] ADD UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [restaurants_tagsrestaurant_restaurant_id_99eade39]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [restaurants_tagsrestaurant_restaurant_id_99eade39] ON [dbo].[restaurants_tagsrestaurant]
(
	[restaurant_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [suggestions_comments_id_restaurant_id_5e098efa]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [suggestions_comments_id_restaurant_id_5e098efa] ON [dbo].[suggestions_comments]
(
	[id_restaurant_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [suggestions_comments_id_user_id_e9174458]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [suggestions_comments_id_user_id_e9174458] ON [dbo].[suggestions_comments]
(
	[id_user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [suggestions_favorites_id_restaurant_id_3eb52c82]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [suggestions_favorites_id_restaurant_id_3eb52c82] ON [dbo].[suggestions_favorites]
(
	[id_restaurant_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [suggestions_favorites_id_user_id_f6541b71]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [suggestions_favorites_id_user_id_f6541b71] ON [dbo].[suggestions_favorites]
(
	[id_user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [suggestions_score_id_restaurant_id_05ddd19f]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [suggestions_score_id_restaurant_id_05ddd19f] ON [dbo].[suggestions_score]
(
	[id_restaurant_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [suggestions_score_id_user_id_1fb008b1]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [suggestions_score_id_user_id_1fb008b1] ON [dbo].[suggestions_score]
(
	[id_user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__taggit_t__32DD1E4C9E3C2364]    Script Date: 10/07/2023 8:17:57 p. m. ******/
ALTER TABLE [dbo].[taggit_tag] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__taggit_t__72E12F1BFCDAF88A]    Script Date: 10/07/2023 8:17:57 p. m. ******/
ALTER TABLE [dbo].[taggit_tag] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [taggit_taggeditem_content_type_id_9957a03c]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [taggit_taggeditem_content_type_id_9957a03c] ON [dbo].[taggit_taggeditem]
(
	[content_type_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [taggit_taggeditem_content_type_id_object_id_196cc965_idx]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [taggit_taggeditem_content_type_id_object_id_196cc965_idx] ON [dbo].[taggit_taggeditem]
(
	[content_type_id] ASC,
	[object_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq] ON [dbo].[taggit_taggeditem]
(
	[content_type_id] ASC,
	[object_id] ASC,
	[tag_id] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [object_id] IS NOT NULL AND [tag_id] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [taggit_taggeditem_object_id_e2d7d1df]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [taggit_taggeditem_object_id_e2d7d1df] ON [dbo].[taggit_taggeditem]
(
	[object_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [taggit_taggeditem_tag_id_f4f5b767]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [taggit_taggeditem_tag_id_f4f5b767] ON [dbo].[taggit_taggeditem]
(
	[tag_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__users_co__B9BE370E48A15BEC]    Script Date: 10/07/2023 8:17:57 p. m. ******/
ALTER TABLE [dbo].[users_commensal] ADD UNIQUE NONCLUSTERED 
(
	[user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users_us__AB6E6164C11832AC]    Script Date: 10/07/2023 8:17:57 p. m. ******/
ALTER TABLE [dbo].[users_user] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_user_groups_group_id_9afc8d0e]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [users_user_groups_group_id_9afc8d0e] ON [dbo].[users_user_groups]
(
	[group_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_user_groups_user_id_5f6f5a90]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [users_user_groups_user_id_5f6f5a90] ON [dbo].[users_user_groups]
(
	[user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_user_groups_user_id_group_id_b88eab82_uniq]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [users_user_groups_user_id_group_id_b88eab82_uniq] ON [dbo].[users_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_user_user_permissions_permission_id_0b93982e]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [users_user_user_permissions_permission_id_0b93982e] ON [dbo].[users_user_user_permissions]
(
	[permission_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_user_user_permissions_user_id_20aca447]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE NONCLUSTERED INDEX [users_user_user_permissions_user_id_20aca447] ON [dbo].[users_user_user_permissions]
(
	[user_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [users_user_user_permissions_user_id_permission_id_43338c45_uniq]    Script Date: 10/07/2023 8:17:57 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [users_user_user_permissions_user_id_permission_id_43338c45_uniq] ON [dbo].[users_user_user_permissions]
(
	[user_id] ASC,
	[permission_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[authtoken_token]  WITH CHECK ADD  CONSTRAINT [authtoken_token_user_id_35299eff_fk_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users_user] ([id])
GO
ALTER TABLE [dbo].[authtoken_token] CHECK CONSTRAINT [authtoken_token_user_id_35299eff_fk_users_user_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_users_user_id]
GO
ALTER TABLE [dbo].[restaurants_galleryrestaurant]  WITH CHECK ADD  CONSTRAINT [restaurants_galleryrestaurant_restaurant_id_3504d84d_fk_restaurants_restaurant_id_restaurant] FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[restaurants_restaurant] ([id_restaurant])
GO
ALTER TABLE [dbo].[restaurants_galleryrestaurant] CHECK CONSTRAINT [restaurants_galleryrestaurant_restaurant_id_3504d84d_fk_restaurants_restaurant_id_restaurant]
GO
ALTER TABLE [dbo].[restaurants_restaurant]  WITH CHECK ADD  CONSTRAINT [restaurants_restaurant_user_id_d1e2839b_fk_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users_user] ([id])
GO
ALTER TABLE [dbo].[restaurants_restaurant] CHECK CONSTRAINT [restaurants_restaurant_user_id_d1e2839b_fk_users_user_id]
GO
ALTER TABLE [dbo].[restaurants_tagsrestaurant]  WITH CHECK ADD  CONSTRAINT [restaurants_tagsrestaurant_restaurant_id_99eade39_fk_restaurants_restaurant_id_restaurant] FOREIGN KEY([restaurant_id])
REFERENCES [dbo].[restaurants_restaurant] ([id_restaurant])
GO
ALTER TABLE [dbo].[restaurants_tagsrestaurant] CHECK CONSTRAINT [restaurants_tagsrestaurant_restaurant_id_99eade39_fk_restaurants_restaurant_id_restaurant]
GO
ALTER TABLE [dbo].[suggestions_comments]  WITH CHECK ADD  CONSTRAINT [suggestions_comments_id_restaurant_id_5e098efa_fk_restaurants_restaurant_id_restaurant] FOREIGN KEY([id_restaurant_id])
REFERENCES [dbo].[restaurants_restaurant] ([id_restaurant])
GO
ALTER TABLE [dbo].[suggestions_comments] CHECK CONSTRAINT [suggestions_comments_id_restaurant_id_5e098efa_fk_restaurants_restaurant_id_restaurant]
GO
ALTER TABLE [dbo].[suggestions_comments]  WITH CHECK ADD  CONSTRAINT [suggestions_comments_id_user_id_e9174458_fk_users_user_id] FOREIGN KEY([id_user_id])
REFERENCES [dbo].[users_user] ([id])
GO
ALTER TABLE [dbo].[suggestions_comments] CHECK CONSTRAINT [suggestions_comments_id_user_id_e9174458_fk_users_user_id]
GO
ALTER TABLE [dbo].[suggestions_favorites]  WITH CHECK ADD  CONSTRAINT [suggestions_favorites_id_restaurant_id_3eb52c82_fk_restaurants_restaurant_id_restaurant] FOREIGN KEY([id_restaurant_id])
REFERENCES [dbo].[restaurants_restaurant] ([id_restaurant])
GO
ALTER TABLE [dbo].[suggestions_favorites] CHECK CONSTRAINT [suggestions_favorites_id_restaurant_id_3eb52c82_fk_restaurants_restaurant_id_restaurant]
GO
ALTER TABLE [dbo].[suggestions_favorites]  WITH CHECK ADD  CONSTRAINT [suggestions_favorites_id_user_id_f6541b71_fk_users_user_id] FOREIGN KEY([id_user_id])
REFERENCES [dbo].[users_user] ([id])
GO
ALTER TABLE [dbo].[suggestions_favorites] CHECK CONSTRAINT [suggestions_favorites_id_user_id_f6541b71_fk_users_user_id]
GO
ALTER TABLE [dbo].[suggestions_score]  WITH CHECK ADD  CONSTRAINT [suggestions_score_id_restaurant_id_05ddd19f_fk_restaurants_restaurant_id_restaurant] FOREIGN KEY([id_restaurant_id])
REFERENCES [dbo].[restaurants_restaurant] ([id_restaurant])
GO
ALTER TABLE [dbo].[suggestions_score] CHECK CONSTRAINT [suggestions_score_id_restaurant_id_05ddd19f_fk_restaurants_restaurant_id_restaurant]
GO
ALTER TABLE [dbo].[suggestions_score]  WITH CHECK ADD  CONSTRAINT [suggestions_score_id_user_id_1fb008b1_fk_users_user_id] FOREIGN KEY([id_user_id])
REFERENCES [dbo].[users_user] ([id])
GO
ALTER TABLE [dbo].[suggestions_score] CHECK CONSTRAINT [suggestions_score_id_user_id_1fb008b1_fk_users_user_id]
GO
ALTER TABLE [dbo].[taggit_taggeditem]  WITH CHECK ADD  CONSTRAINT [taggit_taggeditem_content_type_id_9957a03c_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[taggit_taggeditem] CHECK CONSTRAINT [taggit_taggeditem_content_type_id_9957a03c_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[taggit_taggeditem]  WITH CHECK ADD  CONSTRAINT [taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id] FOREIGN KEY([tag_id])
REFERENCES [dbo].[taggit_tag] ([id])
GO
ALTER TABLE [dbo].[taggit_taggeditem] CHECK CONSTRAINT [taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id]
GO
ALTER TABLE [dbo].[users_commensal]  WITH CHECK ADD  CONSTRAINT [users_commensal_user_id_54a67947_fk_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users_user] ([id])
GO
ALTER TABLE [dbo].[users_commensal] CHECK CONSTRAINT [users_commensal_user_id_54a67947_fk_users_user_id]
GO
ALTER TABLE [dbo].[users_user_groups]  WITH CHECK ADD  CONSTRAINT [users_user_groups_group_id_9afc8d0e_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[users_user_groups] CHECK CONSTRAINT [users_user_groups_group_id_9afc8d0e_fk_auth_group_id]
GO
ALTER TABLE [dbo].[users_user_groups]  WITH CHECK ADD  CONSTRAINT [users_user_groups_user_id_5f6f5a90_fk_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users_user] ([id])
GO
ALTER TABLE [dbo].[users_user_groups] CHECK CONSTRAINT [users_user_groups_user_id_5f6f5a90_fk_users_user_id]
GO
ALTER TABLE [dbo].[users_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [users_user_user_permissions_permission_id_0b93982e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[users_user_user_permissions] CHECK CONSTRAINT [users_user_user_permissions_permission_id_0b93982e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[users_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [users_user_user_permissions_user_id_20aca447_fk_users_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users_user] ([id])
GO
ALTER TABLE [dbo].[users_user_user_permissions] CHECK CONSTRAINT [users_user_user_permissions_user_id_20aca447_fk_users_user_id]
GO
ALTER TABLE [dbo].[admin_interface_theme]  WITH CHECK ADD CHECK  (([logo_max_height]>=(0)))
GO
ALTER TABLE [dbo].[admin_interface_theme]  WITH CHECK ADD CHECK  (([logo_max_width]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
ALTER DATABASE [BuenComensal] SET  READ_WRITE 
GO
