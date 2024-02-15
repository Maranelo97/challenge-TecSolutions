-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 15-02-2024 a las 15:05:38
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `laravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `coverUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `timesDelivered` int NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `usuario_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `libros_usuario_id_foreign` (`usuario_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `coverUrl`, `title`, `description`, `rating`, `timesDelivered`, `delivered`, `usuario_id`, `created_at`, `updated_at`) VALUES
(3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZSDZ0vf2LSwACDzNTuKHR91_baW6x0YvZI3MJ21fhxA&s', 'El Padrino', 'La historia de la familia Corleone y su imperio criminal.', 5, 0, 1, NULL, NULL, NULL),
(4, 'https://images.cdn3.buscalibre.com/fit-in/360x360/61/8d/618d227e8967274cd9589a549adff52d.jpg', 'Cien años de soledad', 'La saga multigeneracional de los Buendía en Macondo.', 5, 0, 0, NULL, NULL, NULL),
(5, 'https://www.penguinlibros.com/ar/2133471/harry-potter-y-la-piedra-filosofal-harry-potter-1.jpg', 'Harry Potter y la piedra filosofal', 'El inicio de las aventuras de Harry en el mundo de la magia.', 5, 0, 0, NULL, NULL, NULL),
(6, 'https://www.penguinlibros.com/ar/1597713/1984-la-novela-grafica.jpg', '1984', 'Distopía que explora el control totalitario y la vigilancia.', 5, 0, 0, NULL, NULL, NULL),
(7, 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg/800px-To_Kill_a_Mockingbird_%28first_edition_cover%29.jpg', 'Matar a un ruiseñor', 'La lucha contra la injusticia racial en el sur de EE. UU.', 5, 0, 0, NULL, NULL, NULL),
(8, 'https://assets-global.website-files.com/6034d7d1f3e0f52c50b2adee/6540f3a95dd2301ef9751dd6_H2tjHnUNhg_lBh5PnN9lJhXAfqX5EUHakOyByeEodU4.jpeg', 'Orgullo y prejuicio', 'La historia de Elizabeth Bennet y Mr. Darcy en la Inglaterra del siglo XIX.', 5, 0, 0, NULL, NULL, NULL),
(9, 'https://cdn.edelvives.es/docs/catalogo/15744/imgs/original/076532_quijotemancha_EDV.jpg', 'Don Quijote de la Mancha', 'Las cómicas aventuras del caballero Don Quijote y su fiel escudero Sancho Panza.', 5, 0, 0, NULL, NULL, NULL),
(10, 'https://editorialelateneo.com.ar/productos/temp/EL_GRAN_GATSBY_B.jpg', 'El Gran Gatsby', 'La decadencia de la sociedad estadounidense en la década de 1920.', 5, 0, 0, NULL, NULL, NULL),
(11, 'https://www.tematika.com/media/catalog/Ilhsa/Imagenes/654656.jpg', 'El guardián entre el centeno', 'La odisea de un adolescente en Nueva York.', 5, 0, 0, NULL, NULL, NULL),
(12, 'https://lh5.googleusercontent.com/proxy/3K3xw4e73gaLISszb6ivIhMoo0Gm-you4y8mJKp5FfYQspcdHacmXq5I5xv4lAkWecCX1KMsDmA0YdrIr9O09-Ii1RhJm8jorBkq6_ljHGTr1bgnLypXjA', 'Cien años de soledad (en inglés)', 'The multigenerational saga of the Buendía family in Macondo.', 5, 0, 0, NULL, NULL, NULL),
(13, 'https://i.pinimg.com/originals/5b/db/6b/5bdb6bf7e2b394e945f8a7702d3ff067.jpg', 'El Hobbit', 'The journey of Bilbo Baggins in Middle-earth.', 5, 0, 0, NULL, NULL, NULL),
(14, 'https://editoresmexicanosunidos.mx/wp-content/uploads/2022/02/UNMUNDOFEMUBE9786071415615.png', 'Un mundo feliz', 'Dystopian exploration of a future society.', 5, 0, 0, NULL, NULL, NULL),
(15, 'https://http2.mlstatic.com/D_NQ_NP_688188-MLM52351332358_112022-O.webp', 'El Señor de los Anillos', 'The epic fantasy trilogy by J.R.R. Tolkien.', 5, 0, 0, NULL, NULL, NULL),
(16, 'https://http2.mlstatic.com/D_NQ_NP_622195-MLA51533509585_092022-O.webp', 'Las Crónicas de Narnia', 'The magical adventures of the Pevensie siblings.', 5, 0, 0, NULL, NULL, NULL),
(17, 'https://www.tematika.com/media/catalog/Ilhsa/Imagenes/660374.jpg', 'El resplandor', 'The psychological horror novel by Stephen King.', 5, 0, 0, NULL, NULL, NULL),
(18, 'https://www.tematika.com/media/catalog/Ilhsa/Imagenes/579009.jpg', 'El código Da Vinci', 'A gripping mystery involving symbolism and conspiracy.', 5, 0, 0, NULL, NULL, NULL),
(19, 'https://www.penguinlibros.com/ar/1604980/los-juegos-del-hambre-1-los-juegos-del-hambre.jpg', 'Los juegos del hambre', 'The dystopian tale of Katniss Everdeen.', 5, 0, 0, NULL, NULL, NULL),
(20, 'https://readaloudrevival.com/wp-content/uploads/2016/05/Pride-and-Prejudice.png.webp', 'Orgullo y prejuicio (en inglés)', 'The story of Elizabeth Bennet and Mr. Darcy in 19th century England.', 5, 0, 0, NULL, NULL, NULL),
(21, 'https://www.anagrama-ed.es/uploads/media/portadas/0001/23/b8f4708a995f1138942b0062ff792efe842d4d0c.jpeg', 'Guía del autoestopista galáctico', 'Sci-fi comedy adventure across the galaxy.', 5, 0, 0, NULL, NULL, NULL),
(22, 'https://assets-global.website-files.com/6034d7d1f3e0f52c50b2adee/625452f43a8fa502af2b8a14_6034d7d1f3e0f525c6b2b272_frankenstein-mary-shelley-editorial-alma.jpeg', 'Frankenstein', 'Mary Shelley\'s classic tale of science and morality.', 5, 0, 0, NULL, NULL, NULL),
(23, 'https://www.aboutespanol.com/thmb/k-sErHBNeUbw6u9Z5u5sp5TaEuA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/el-alquimista-Debolsillo-56a5a5543df78cf772893e5e.jpg', 'El alquimista', 'A philosophical novel about a young Andalusian shepherd.', 5, 0, 0, NULL, NULL, NULL),
(24, 'https://assets-global.website-files.com/6034d7d1f3e0f52c50b2adee/625454132a4288889ad4b1d8_6034d7d1f3e0f57d87b2b2a9_Moby-dick-herman-melville-editorial-alma.jpeg', 'Moby-Dick', 'The harrowing journey of Captain Ahab to hunt the white whale.', 5, 0, 0, NULL, NULL, NULL),
(25, 'https://covers.alibrate.com/b/59872ea0cba2bce50c1d42a7/94eafc9b-2935-454d-b117-665e986193ee/share', 'La carretera', 'A post-apocalyptic tale of a father and son\'s journey.', 5, 0, 0, NULL, NULL, NULL),
(26, 'https://www.penguinlibros.com/ar/1607050/cometas-en-el-cielo-novela-grafica.jpg', 'Cometas en el cielo', 'A story of redemption and the bonds of friendship.', 5, 0, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(27, '2014_10_12_000000_create_users_table', 1),
(28, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(29, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(30, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(31, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(32, '2016_06_01_000004_create_oauth_clients_table', 1),
(33, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(34, '2019_08_19_000000_create_failed_jobs_table', 1),
(35, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(36, '2024_02_11_170744_create_libros_table', 1),
(37, '2024_02_11_170809_create_usuarios_table', 1),
(38, '2024_02_11_170814_create_reservas_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

DROP TABLE IF EXISTS `reservas`;
CREATE TABLE IF NOT EXISTS `reservas` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `titleDelivered` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deliveredAt` timestamp NOT NULL DEFAULT '2024-02-15 15:40:27',
  `deliveredTo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `libro_id` bigint UNSIGNED NOT NULL,
  `usuario_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservas_libro_id_foreign` (`libro_id`),
  KEY `reservas_usuario_id_foreign` (`usuario_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `historial` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `email`, `historial`, `created_at`, `updated_at`) VALUES
(1, 'test', 'test123', 'test@gmail.com', NULL, NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
