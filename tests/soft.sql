-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 10, 2020 at 09:50 AM
-- Server version: 5.7.31-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soft`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` bigint(20) NOT NULL,
  `role` tinyint(4) DEFAULT NULL COMMENT 'from enum of roles:\\\\\\\\\\\\\\\\n            1 - student\\\\\\\\\\\\\\\\n            2 - mentor\\\\\\\\\\\\\\\\n            4 - admin',
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) NOT NULL COMMENT 'email has been set to not null and unique',
  `password` varchar(65) NOT NULL COMMENT 'password has been set to not null',
  `salt` varchar(65) NOT NULL COMMENT 'salt has been set to not null',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'is_active has been set to not null with true as a default value'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `role`, `first_name`, `last_name`, `email`, `password`, `salt`, `is_active`) VALUES
(6, 1, 'Michail', 'Kuptsev', 'test@mail.com', '1234', '1234', 0),
(8, 1, 'firstNamesd', 'lastName', 'test111@mail.com', '1234', '1234', 0),
(23, 2, 'Mike', 'Dzihovskyi', 'mike@gmail.com', '0afb051eaab31c94e2505428e5b709d5337e101f0db9796e17e0af911d1428d0', 'XXmxIQ7cZGxh0tQ', 1),
(24, 2, 'CiCiPlusi', 'Ci', 'plusi@mentor.ua', '684ab1397595c021ee8e5973d8a0f0f35bbe8a4d7d6d3fe0bdef7b40c360dd55', 'tg0ceEhm6i6bOGv', 1),
(25, 2, 'Kolya', 'Jsovich', 'kolya@gmail.com', '1b95b720e53156949ba19d06c648165c0c10fb223b8eb8799fb41a216d0d6723', '9ZIVmvBnudw6aD1', 0),
(26, 2, 'Ivan', 'Franko', 'javamentorsuper@gmail.com', '5679ca7b220964824f7441e5684c88322538d45e948692f8bf7f34d54c4aa13d', 'Zo8wT2vLPZigjdr', 1),
(27, 1, 'Felix', 'PewDiePie', 'somebodyTouchaMySpagett@mail.ua', 'c5b747ad640a0772caf141c76fdd60666803e34ee23241145d45f975e5f56e0a', '0Jex-ElZ4BwsBf0', 1),
(28, 1, 'Ivankoasas', 'Lesyad', 'softserveceo@gmail.com', '8fa5bdb53078f633ed4e7a9e005b1dafcdd6808052aede2b160708b864c388ad', 'S5cGO1Sa-foBh3u', 0),
(29, 2, 'Genadiy', 'Pivnyak', 'prihodchenko@mentor.ua', '2e2f46e35cadb763445c1c9bdf7046475bf2f5037a77763a00ef608be7b16b5c', 'Ao5L7yUKAPZGtBf', 0),
(30, 4, 'admin', 'adminovich', 'adminsoft2020@gmail.com', '8397f8f4c7baec7b17ece03ec0bd97ae9f24cccf88c161508b7bb6cc3da1fbac', 'klIqNLHCpFW16fm', 1),
(31, 1, 'Andrii', 'Kyselov', 'anriikyselov@gmail.com', 'f74255bd1ec26cf6bbe3a9269180c90eefbacdcec9554079432aa854ec3a9598', 'yECrLeOHLd9B3Ih', 1),
(32, 2, 'Andrii', 'Martynenko', 'martyn@nmu.one', 'b2776ad9eddbb21244111ca88dad7539810e62251abee9adb94116d361602b98', '-d7Co6W7hs-CpDI', 1),
(33, 1, 'Vika', 'Kuprienko', 'kuprienko.v@nmu.one', '45a03d72cfeb333101d177d0b96960058d80a4d69d9b48b51f4738e65b31d0e5', 'HaEJ-BFQ25tbYPT', 1),
(34, 1, 'Gena', 'Pivnyak', 'jaworer441@ioxmail.net', 'ea90b0b438ed0c60546ca9c78564556a6353da6760feda266d89183aa0ae60d5', '1yqjS0-0nkeFSDe', 1),
(35, 1, 'Mykyta', 'Morar', 'morar.nikita@gmail.com', 'b248a00a87c0832de0bd460a51b8a7ee305828affa0ceb24b845086bc7b3cada', 'aeeprzlZ0-5BROj', 1),
(36, 1, 'Oleksii', 'Mutianov', 'mutianov.o.o@gmail.com', 'c888f50e9985b43c65ba2555dbb0aedf1ef2ab5f1eb13cd4f0d23e6e3c77564e', 'Ye3bil31hhZvHb2', 1),
(39, 2, 'Mentor', 'Mentorovich', 'djol12345@gmail.com', '5bb6a68e0407893f03658e33831e57652213ff4d6d90eabf666662374e5ea0ee', 'DmcWHyRG8ZcA0SG', 1),
(41, 1, NULL, NULL, 'mykyta.morar@gmail.com', 'ff9786abbbfafb685ec362feb6de79d89b5e9271b04c2ee82754f0f85ab35eda', 'mjH7boQAHUMSSuC', 1),
(42, 1, NULL, NULL, 'mail3@gmail.com', 'b29d18ce034c9938d15700edcef87d8a7d6c3a6a248d03a8d01e577bd009fc7a', 'rOSo6iPY86uvZCL', 1),
(43, 1, NULL, NULL, 'mail4@gmail.com', '312131ad6d55495a9dcffe20b05102ee11307ad9231efa0e3b5e2dd39588f3b4', 'UlMoxE-Sie0-ubK', 1),
(44, 1, 'yo', NULL, 'mail2@gmail.com', '7ff7a4e0f2b87a6569d9f45ddc877b2ee137ad58749f6df74cb18e2cbf07c224', 'KbJXcPcIwrscUJj', 1),
(45, 1, NULL, NULL, 'mail@gmail.com', '4a0fb9a59e5adc4d1dbc7434900feac007e5b73e821dc107a48e8b3620e7ac08', 'akJVA6gSy0pWca3', 1),
(50, 1, NULL, NULL, 'test3@gmail.com', '3e898fdcfbcb32bb56e079293c71bb3d08ffbceaaea4e9e621c3a7a6d768cdfb', 'nVQYzcN3XLoitB0', 1),
(51, 1, NULL, NULL, 'test1@gmail.com', '67171e50e06069a442b40e606fb799f74cc17a1e609f3f86197d590da5d72a7c', 'fybuw2PVPdY4zxb', 1),
(52, 1, NULL, NULL, 'test2@gmail.com', '5efd4031c76b6cd098ed936e2e70b28c59d7243bc36bccca3ded98dd9727e0ab', '1aY0GMt1DTiekPu', 1),
(55, 1, NULL, NULL, 'test@gmail.com', '1a1e907ed410ef32fbb1046cffccd91f9fee81a9d0dbec5bbb7ea6588e445615', 'udg2G1PHU9MKkMH', 1),
(56, 1, NULL, NULL, 'tests@gmail.com', '26a01dfd53ee0c7ac96a57f5efb4c19e857b28a0b13e544d665cc8d99d4a7e90', 'uvZA3msCVQOGcy2', 1),
(57, 1, NULL, NULL, 'tests3@gmail.com', '108c7346ea97dcb7b75aa15454229d60b802ce1aa33c17e543d3ec55c5b930ab', 'CcCy0O8H4qFUQjo', 1),
(58, 1, NULL, NULL, 'test2s@gmail.com', '6c77f401e621d7ca11a7a88e9cc4035a9caab5c5022ed6b111024f0df936369d', 'YHw2p6D1JX0lK93', 1),
(63, 1, NULL, NULL, 'mail10@gmail.com', 'b23729f77c75b983b2b305b584629db65b4a9a8df2536b9394a4b9ce7617a0b6', '6R9K7wz2zi5wXf0', 1),
(64, 1, NULL, NULL, 'mail11@gmail.com', '959cbff58c08fd1ffa14106705f00e79c5e0a6b14e0256dcba2da8f616ac2b60', 'MMX0rMMZN89GubN', 1),
(65, 1, NULL, NULL, 'bob2@gmail.com', 'f19cbd8e6b2461ffb9679dce22fe464619a7d15747b2744a8c65fcb0f2a25535', '4Em7HCl5yumcTJn', 1),
(66, 1, NULL, NULL, 'bob@gmail.com', '13baebffa12f4cdbfe2eeda861a4ecaafcf75506407299e14f2ac964d6ab79cc', 'ZdQ2Is00l1vipvW', 1),
(70, 1, NULL, NULL, 'gmail2@gmail.com', '7c6ee4ae5e05f8a7ebdd0ae7ce5a06348cf4f96f5fd3f6418baf42b7a632bba4', 'nO9Nu0CrBYKr6vk', 1),
(71, 1, NULL, NULL, 'gmail1@gmail.com', '0cb9fc8336845b29509408c08c8239767e04ebbe3fb354fe6da269d66a399879', 'w-y2BEa-zEIQd0e', 1),
(73, 1, NULL, NULL, 'sdasd@mail.ru', '58a2a6ad78b0f85d1b5b82e4bc0d24be28c370eea9ffd59a004dd5ba9c4a6ebc', '8zEK3tsAI0oequa', 1),
(74, 1, NULL, NULL, 'asdas@das.ru', '361f582ba5e049833d0aca422904c94308e83da9a8f6238de856107ba0797f75', 'xr0FxhOs-0AepPC', 1),
(76, 1, NULL, NULL, 'sadasdas@das.sa', 'f7e3b26921866b2c8328ea34110f9637d5f58c71a18edd3f525088303bea8edb', 'sMpzsnUxElqWCaX', 1),
(77, 1, NULL, NULL, 'asdasd@sad.sda', 'd30671c74307ccd43971726e245559dd99b5dee9ec4e297b9d49684a0386dfdd', 'zFea94-DpVe05vS', 1),
(78, 2, 'Ivan', 'Mentorenko', 'mentoremail@email.com', '9fa426f2ae11491e23be065fd166da736cd9393fdb84bf355d9370b3f3adb9b4', 'z9Ko6Cedv3YmL8Z', 1),
(79, 1, 'Student', 'Studenko', 'student@gmail.com', '9fa426f2ae11491e23be065fd166da736cd9393fdb84bf355d9370b3f3adb9b4', 'z9Ko6Cedv3YmL8Z', 1),
(80, 4, 'admin', 'admin', 'admin@gmail.com', 'c2c6cc85826d89d6c599dc7376e2cf7497a00e8092658c0597bba01391f96a18', 'Xu0uX1OgMH7dbSo', 1),
(82, 1, NULL, NULL, 'coder2@gmail.com', '105b5128ef42152a3e4b2fd97517482458ec7cbba03c5d4e1fc4cf67d5c448d7', 'ZU3Ch74FkoRwvqk', 1),
(83, 1, NULL, NULL, 'coder1@gmail.com', '422d98398fe50b803e3aef073858717e5531342c8837472a6ccdf536eab0f8a4', 'NHMBYYlcYaNysYb', 1),
(84, 1, NULL, NULL, 'student2@ukr.net', '19ab464cdd5e625813655138b254bc7843f21b94f64a2603ae40552c58854a76', 'ttlhOoW9grVyXlS', 1),
(85, 1, NULL, NULL, 'student1@ukr.net', 'bd615de8eac7e463668a8634d2544c82cd24e75e94c443af8f99d0bfbf376c31', 'ole2LgddqEHSqUf', 1),
(86, 1, NULL, NULL, 'billgates@gmail.com', '773b7186481b92c67ce5e40473aaa4c34d15ffd98fbd787cf2f4a5ec053df629', 'OYodfYmSw0alGPU', 1),
(87, 1, NULL, NULL, 'stevejobs@gmail.com', '35447c3185532962bff047ed5526d666012066933c81ea433ad6f4c7980fc08c', 'Tr-QZyLXR0uFjc-', 1),
(92, 1, NULL, NULL, 'test102@gmail.com', '56662c41bf9f8edf021bd5a3eb3b03119f4a68ba5ec455491adabc54996372c8', 'hW94CxfeR-0gUlG', 1),
(93, 1, NULL, NULL, 'test101@gmail.com', '72f583ee2ae9be935cb703ab77c046313dcc309f1631b2f8b0c28187bf16876a', 'mvzQri7zRcXK9Nh', 1),
(94, 1, NULL, NULL, 'test103@gmail.com', '479c86a62cc0fe268cad81bf1cffb49f89cca570a27dedbe23ee9f52caa920d3', 'qrz5UlnS4taQtd0', 1),
(96, 2, 'Mentor', 'Mentorenko', 'sviridenko.99@inbox.ru', 'b88c7cc458f615b0d73b6d8d2462bb4e7384d53526ff692e2d71cbaa254eb296', 'Sz-UO5PUQXXv5KY', 1),
(97, 1, NULL, NULL, 'blablabla@gmail.com', 'f992788962531db64ffca77d9ed0e6f878f96c2577421a64afdc726c5d5a114d', 'b8qlg2zuln0ocAu', 1),
(99, 2, 'otec', 'otec', 'batya@gmail.com', '0f9958031e07d5cd5dbdb1fe13d79e86afbe73db7ca78d6e16cf5457fb1f95b0', '8zI5wu0MU3pU0Uu', 1),
(100, 2, 'Egor', 'Igor', 'ig.sviridenko@yandex.ru', '25b088a2178590a7b8c974e60926d55471c472c4dc32d8de913737693c343b0e', 'TiRVt5grI4GrA52', 0),
(103, 1, NULL, NULL, 'teststudent@gmail.com', '637a46a020889d19f2ff4c47c85a47e1a3ee25a942be6ba3e19e454318ff7f9f', 'Z5cousgGcoo1RbU', 1),
(104, 1, NULL, NULL, 'studenttest@gmai.com', 'e1f892c851eff7ca03f23295e990f257b3e01f93aa441d185b9546cbab95364c', 'Joo2w8LszNLHYeN', 1),
(105, 1, NULL, NULL, 'gmail3@gmail.com', '32e5ef9ce096a98fd30fdd4d7b22f04dd6b74b04d095ac98cad25f4de95063e8', 'lBjoTzzQXwtE8av', 1),
(107, 1, NULL, NULL, 'alex1210@gmail.com', '84b27f8aa47fff1ea46e3873b27213a398e7afbf85348725f9820999d3a6a1b7', 'gINCWAL1wwSExu4', 1),
(108, 2, 'Anastasia', 'Gordienko', 'anastasiagordienko99@gmail.com', 'd81d3285b6a40281e0de70a6aa350fb3aa5237c32325a1e91e29c50190f50748', '9LipIdwYvfv1AeD', 1),
(109, 1, NULL, NULL, 'lolo@gmail.com', 'eac13c957e0b83364f4022a28a69b7371e6db6998e9170f94f096bf408ed6605', 'zQs8Z5U---DDM79', 1),
(110, 1, NULL, NULL, 'adadad@gmail.com', '7c78ae4e1fe0ccdf6fbb5d602777abc1942029c00b193cc83526c074e62b61f0', 'rsVnFv2rSZ7-o6y', 1),
(111, 2, 'Dmitriy', 'Stroy', 'dmitriystroy18@gmail.com', '89f7c2b2df4b339234dad3faee1f371f7140efd12feb27261aa86d391e47e35d', 'dWtLYCC5ty3zjBI', 1),
(112, 2, 'Andrew', 'test', 'Test@test.com', '913898dc8376913955b8243adeffc011c23808cff37b97d04ac40da6cbb9b4da', '8con9mrpuTpIgBk', 1),
(113, 2, 'Andrew', 'Kyselov', 'testasdadsa@mail.com', 'eca761ae819d2ef5840a4f72eb22a987fc7e580b48b96153f7c5938a4a1d0cb5', 'nfu4NJKgrfeKiiz', 1),
(114, 1, NULL, NULL, 'asdasd@gmail.com', '97a4a1600bbf85433da765bdd954fa851e872dda9e97a133b9a24fddfd2757b1', '59M0wxqXQfDvDmy', 1),
(115, 2, 'Egor', 'Yudin', 'eydnep2000@gmail.com', 'b1fca91758bdd65aa67fb4131f4f84ff8bd30f87709d6bb73f110f8e693696fb', 'cSl9UaW2XMPUnJ3', 1),
(116, 1, 'Tom', 'Jones', 'some@gmail.com', '6739c2dada31f1cb3257f9318231e6c28172fd633e622b68539eea4ea084e72f', 'XYwLgZiwDsiYEcZ', 1),
(117, 2, 'Melany', 'Strong', 'melany@gmail.com', '1bb3f606b4c79e52fb80e1da66121ba4a020e57347c6f41c9bed8d0253ffacce', '31VpsFp2MJFXzJD', 0),
(118, 1, NULL, NULL, 'test_test@gmail.com', '769a6fbf7a7a230ed9f55fbf91d9ae61f9226eb59b2d3fbf34004a6a255fcfcc', 'Jsx3BUqROvOf-y5', 0),
(119, 1, NULL, NULL, 'test@example.com', '2a57f4476754fd50b0fc113f547dace04467e80e2afe5aa092d14657fedb3365', 'ZBthinxls56bIAY', 0),
(120, 1, 'Test', 'Example', 'test@example2.com', 'f5c7b75f0a97b89842408167420aae9a5f95aa9e5054cc3c8bfec3d02a39e9c3', 'QuZJdT0KqORcEhf', 0),
(121, 2, 'User', 'Test', 'test_mentor@example.com', 'a7a33646f062a4f3ed08ac369ca7a2070d1c281b53581d24e3f9634578fbbbae', 'M7Iln7aZMnOxY0R', 0);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'name has been set to not null and unique'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `name`) VALUES
(6, 'Java 2'),
(4, 'kakaha322'),
(8, 'Node.js basics'),
(26, 'Node.js Course'),
(15, 'OmegaCourse 2'),
(32, 'puper-super-course'),
(10, 'Python Bacics'),
(28, 'Super Course'),
(13, 'SuperCourse'),
(47, 'TAQC Python'),
(48, 'TAQC Python IT Academy 1.0'),
(49, 'TAQC Python IT Academy 2.0'),
(31, 'TEST'),
(22, 'Test Java and C# course');

-- --------------------------------------------------------

--
-- Table structure for table `lesson`
--

CREATE TABLE `lesson` (
  `id` bigint(20) NOT NULL,
  `mentor_id` bigint(20) DEFAULT NULL,
  `student_group_id` bigint(20) DEFAULT NULL,
  `theme_id` bigint(20) DEFAULT NULL,
  `lesson_date` datetime NOT NULL COMMENT 'lesson_date has been set to not null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lesson`
--

INSERT INTO `lesson` (`id`, `mentor_id`, `student_group_id`, `theme_id`, `lesson_date`) VALUES
(19, 24, 31, 1, '2020-07-13 21:35:52'),
(27, 24, 51, 9, '2020-07-06 12:30:52'),
(28, 24, 51, 10, '2020-07-06 12:30:52'),
(30, 22, 24, 2, '2020-07-15 03:48:28'),
(31, 22, 24, 15, '2020-07-15 04:17:49'),
(32, 22, 24, 5, '2018-07-15 04:17:49'),
(33, 22, 24, 5, '2018-07-15 04:17:49'),
(36, 24, 12, 1, '2020-07-14 07:40:00'),
(37, 22, 24, 2, '2012-08-01 08:00:00'),
(41, 22, 24, 20, '2012-10-15 11:00:00'),
(42, 22, 43, NULL, '4000-12-12 07:07:07'),
(43, 22, 47, 22, '2020-10-09 10:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `mentor`
--

CREATE TABLE `mentor` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mentor`
--

INSERT INTO `mentor` (`id`, `account_id`) VALUES
(17, 23),
(19, 25),
(20, 26),
(21, 29),
(22, 32),
(23, 39),
(24, 78),
(26, 96),
(28, 99),
(29, 100),
(31, 108),
(32, 111),
(33, 112),
(34, 113),
(35, 115),
(36, 117),
(37, 121);

-- --------------------------------------------------------

--
-- Table structure for table `mentor_of_course`
--

CREATE TABLE `mentor_of_course` (
  `course_id` bigint(20) DEFAULT NULL,
  `mentor_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mentor_of_course`
--

INSERT INTO `mentor_of_course` (`course_id`, `mentor_id`, `id`) VALUES
(4, 21, 19),
(6, 17, 14),
(6, 19, 48),
(6, 20, 17),
(6, 21, 20),
(6, 22, 36),
(6, 23, 24),
(6, 24, 38),
(6, 26, 34),
(6, 31, 47),
(8, 21, 18),
(8, 23, 25),
(8, 29, 46),
(13, 22, 37),
(13, 26, 35);

-- --------------------------------------------------------

--
-- Table structure for table `mentor_of_student_group`
--

CREATE TABLE `mentor_of_student_group` (
  `mentor_id` bigint(20) DEFAULT NULL,
  `student_group_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mentor_of_student_group`
--

INSERT INTO `mentor_of_student_group` (`mentor_id`, `student_group_id`, `id`) VALUES
(22, 24, 1),
(26, 51, 4);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` bigint(20) NOT NULL,
  `account_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `account_id`) VALUES
(3, 6),
(4, 8),
(6, 27),
(7, 28),
(8, 31),
(9, 33),
(10, 34),
(11, 35),
(12, 36),
(14, 41),
(15, 42),
(16, 43),
(17, 44),
(18, 45),
(19, 50),
(20, 51),
(21, 52),
(22, 55),
(23, 56),
(24, 57),
(25, 58),
(26, 63),
(27, 64),
(28, 65),
(29, 66),
(30, 70),
(31, 71),
(32, 73),
(33, 74),
(34, 76),
(35, 77),
(36, 79),
(37, 82),
(38, 83),
(39, 84),
(40, 85),
(41, 86),
(42, 87),
(44, 92),
(45, 93),
(46, 94),
(48, 97),
(49, 103),
(50, 104),
(51, 105),
(52, 107),
(53, 109),
(54, 110),
(55, 114),
(56, 116),
(57, 118),
(58, 119),
(59, 120);

-- --------------------------------------------------------

--
-- Table structure for table `student_group`
--

CREATE TABLE `student_group` (
  `id` bigint(20) NOT NULL,
  `course_id` bigint(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL COMMENT 'name has been set to not null and unique',
  `start_date` date DEFAULT NULL,
  `finish_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_group`
--

INSERT INTO `student_group` (`id`, `course_id`, `name`, `start_date`, `finish_date`) VALUES
(10, 6, 'stridTestWork', '2000-01-01', '2000-01-01'),
(12, 4, 'Test-SG-1', '2000-04-01', '2000-02-01'),
(20, 6, 'abrakadabraabc', '2020-07-01', '2020-07-09'),
(23, 6, 'abrakadabraaabcaa', '2020-07-01', '2020-07-09'),
(24, 8, 'Node.js 2020 Summer', '2020-07-01', '2020-07-31'),
(26, 6, 'Java Summer Practice', '2019-01-01', '2020-01-01'),
(27, 10, 'Python Practice', '2018-01-01', '2019-01-01'),
(31, 10, 'Python Richard', '2017-01-01', '2020-01-01'),
(33, NULL, 'TestGroup', '2000-01-11', '2000-03-22'),
(34, NULL, 'TestGroup2', '2000-01-11', '2000-03-22'),
(35, NULL, 'TestGroup3', '2000-01-11', '2000-03-22'),
(36, NULL, 'TestGroup4', '2000-01-11', '2000-03-22'),
(37, 13, 'OmegaGroup', '2020-06-18', '2020-08-09'),
(38, 13, 'AlphaGroup', '2020-06-18', '2020-08-10'),
(40, 4, 'lalala', '2000-12-03', '2000-12-06'),
(41, 13, 'Some summer practice', '2020-06-23', '2020-07-15'),
(43, 4, 'Just do it', '2000-01-01', '2020-01-01'),
(46, 10, 'test 14.07', '2019-12-03', '2020-10-15'),
(47, 6, 'test 14.07 1', '2019-12-03', '2020-10-15'),
(48, 6, 'test 14.07 12', '2019-12-03', '2020-10-15'),
(50, NULL, 'Web2020', '2020-12-30', '2021-10-10'),
(51, 13, 'SuperGroup', '2020-07-01', '2020-08-08'),
(52, 4, 'testGroupCharlie', '2020-12-07', '2020-12-09'),
(54, 4, 'myGroup', '2020-12-07', '2020-12-09'),
(56, 10, 'test 15.07', '2019-12-02', '2020-12-02'),
(57, 8, 'TestGroup222', '2000-01-11', '2000-03-22'),
(58, 6, 'test group 15.07', '2019-12-02', '2020-12-02'),
(59, 6, 'string', '2000-06-09', '2000-07-09'),
(61, 49, 'NameGroup', '4500-12-12', '5000-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `student_of_student_group`
--

CREATE TABLE `student_of_student_group` (
  `student_group_id` bigint(20) DEFAULT NULL,
  `student_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_of_student_group`
--

INSERT INTO `student_of_student_group` (`student_group_id`, `student_id`, `id`) VALUES
(10, 3, 3),
(10, 4, 4),
(12, 4, 7),
(20, 3, 30),
(20, 4, 31),
(23, 3, 39),
(23, 4, 40),
(24, 11, 44),
(24, 12, 45),
(24, 8, 46),
(26, 10, 50),
(26, 12, 51),
(31, 10, 54),
(31, 11, 55),
(31, 36, 69),
(37, 36, 71),
(38, 36, 72),
(38, 6, 73),
(41, 20, 74),
(51, 27, 119),
(51, 28, 120),
(51, 24, 121),
(51, 25, 122),
(54, 52, 124),
(23, 9, 134),
(24, 9, 135),
(31, 9, 136),
(46, 9, 137),
(47, 9, 138),
(48, 9, 139),
(52, 9, 140),
(56, 9, 141),
(58, 9, 142),
(59, 42, 143),
(59, 56, 144),
(61, 3, 145);

-- --------------------------------------------------------

--
-- Table structure for table `theme`
--

CREATE TABLE `theme` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'name has been set to not null and unique'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `theme`
--

INSERT INTO `theme` (`id`, `name`) VALUES
(10, '.Net Core'),
(3, 'C#'),
(15, 'Collections in Node.js'),
(2, 'DevOps'),
(1, 'Java'),
(7, 'Java Core'),
(4, 'JS'),
(17, 'New Theme 2222'),
(18, 'New Theme 2222dzxcfczxczx'),
(6, 'Node.js'),
(21, 'OOP'),
(22, 'Python'),
(5, 'Spring Framework'),
(9, 'Spring Security'),
(19, 'Themesdasdas'),
(20, 'Trying to update'),
(8, 'Жить здорово'),
(11, 'лалала'),
(14, 'ООП'),
(16, 'ООП1'),
(13, 'Полиморфизм'),
(12, 'убейте меня');

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE `visit` (
  `student_id` bigint(20) DEFAULT NULL,
  `lesson_id` bigint(20) DEFAULT NULL,
  `student_mark` tinyint(4) DEFAULT NULL,
  `presence` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'presence default value has been set',
  `comment` varchar(1024) DEFAULT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`student_id`, `lesson_id`, `student_mark`, `presence`, `comment`, `id`) VALUES
(36, 19, 5, 1, 'Excellent', 24),
(25, 27, 4, 1, 'string', 39),
(28, 27, 4, 1, 'string', 40),
(27, 27, 5, 1, 'string', 41),
(24, 27, 4, 1, 'comment123', 42),
(24, 28, 5, 1, 'string', 47),
(27, 28, 3, 1, 'string', 48),
(28, 28, 4, 1, 'string', 49),
(9, 30, 5, 1, 'good job', 50),
(9, 31, 2, 1, 'omg', 51),
(9, 32, 2, 1, 'omg', 52),
(9, 33, 2, 1, 'omg', 53),
(12, 33, 3, 0, 'not visited', 54),
(4, 36, 5, 1, '', 55),
(9, 37, 1, 1, 'testingnewdate', 56),
(9, 41, 5, 1, 'testForUpdate', 57),
(3, 42, 5, 1, 'comment', 58),
(3, 42, 33, 1, 'string', 59),
(11, 43, 5, 1, 'string', 60);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `lesson`
--
ALTER TABLE `lesson`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_mentor_of_lesson` (`mentor_id`),
  ADD KEY `FK_student_group_of_lesson` (`student_group_id`),
  ADD KEY `FK_ThemeOfLesson_idx` (`theme_id`);

--
-- Indexes for table `mentor`
--
ALTER TABLE `mentor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_account_of_mentor` (`account_id`);

--
-- Indexes for table `mentor_of_course`
--
ALTER TABLE `mentor_of_course`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `AK_UniqueMentorAndCourse` (`course_id`,`mentor_id`),
  ADD UNIQUE KEY `mentorAndCourseIndex` (`course_id`,`mentor_id`),
  ADD KEY `FK_mentorId` (`mentor_id`);

--
-- Indexes for table `mentor_of_student_group`
--
ALTER TABLE `mentor_of_student_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `AK_UniqueStudentGroupAndMentor` (`mentor_id`,`student_group_id`),
  ADD UNIQUE KEY `mentorAndStudentGroupIndex` (`mentor_id`,`student_group_id`),
  ADD KEY `FK__idx` (`student_group_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_account_of_student` (`account_id`);

--
-- Indexes for table `student_group`
--
ALTER TABLE `student_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`),
  ADD KEY `FK_course_of_student_group` (`course_id`);

--
-- Indexes for table `student_of_student_group`
--
ALTER TABLE `student_of_student_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__idx` (`student_group_id`),
  ADD KEY `FK_student_of_student_group_idx` (`student_id`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Indexes for table `visit`
--
ALTER TABLE `visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_lesson_of_visit` (`lesson_id`),
  ADD KEY `FK_student_of_visit_idx` (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;
--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `lesson`
--
ALTER TABLE `lesson`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `mentor`
--
ALTER TABLE `mentor`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `mentor_of_course`
--
ALTER TABLE `mentor_of_course`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `mentor_of_student_group`
--
ALTER TABLE `mentor_of_student_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `student_group`
--
ALTER TABLE `student_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `student_of_student_group`
--
ALTER TABLE `student_of_student_group`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `theme`
--
ALTER TABLE `theme`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `visit`
--
ALTER TABLE `visit`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `FK_mentor_of_lesson` FOREIGN KEY (`mentor_id`) REFERENCES `mentor` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_student_group_of_lesson` FOREIGN KEY (`student_group_id`) REFERENCES `student_group` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_theme_of_lesson` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`);

--
-- Constraints for table `mentor`
--
ALTER TABLE `mentor`
  ADD CONSTRAINT `FK_account_of_mentor` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `mentor_of_course`
--
ALTER TABLE `mentor_of_course`
  ADD CONSTRAINT `FK_course_of_mentor` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `FK_mentor_of_course` FOREIGN KEY (`mentor_id`) REFERENCES `mentor` (`id`);

--
-- Constraints for table `mentor_of_student_group`
--
ALTER TABLE `mentor_of_student_group`
  ADD CONSTRAINT `FK_mentor_of_student_group` FOREIGN KEY (`mentor_id`) REFERENCES `mentor` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_student_group_of_mentor` FOREIGN KEY (`student_group_id`) REFERENCES `student_group` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `FK_account_of_student` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `student_group`
--
ALTER TABLE `student_group`
  ADD CONSTRAINT `FK_course_of_student_group` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `student_of_student_group`
--
ALTER TABLE `student_of_student_group`
  ADD CONSTRAINT `FK_student_group_of_student` FOREIGN KEY (`student_group_id`) REFERENCES `student_group` (`id`),
  ADD CONSTRAINT `FK_student_of_student_group` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `FK_lesson_of_visit` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_student_of_visit` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
