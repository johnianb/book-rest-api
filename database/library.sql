CREATE DATABASE IF NOT EXISTS `library_dev`;
USE `library_dev`;

DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isbn` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `year` varchar(4) NOT NULL,
  `author` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO `book` (`id`, `isbn`, `name`, `year`, `author`, `description`, `image`, `createdAt`, `updatedAt`) VALUES
(1, '9781785883262', 'Android Programming for Beginners', '2015', 'John Horton', 'Learn Android application development with this accessible tutorial that takes you through Android and Java programming with practical and actionable steps.', '9781785883262.png', '2018-04-22 13:57:30', '0000-00-00 00:00:00'),
(2, '9781787121799', 'Practical Game Design', '2018', 'Adam Kramarzewski, Ennio De Nucci', 'Design accessible and creative games across genres, platforms, and development realities', 'B06082.png', '0000-00-00 00:00:00', '2018-04-22 13:57:30'),
(3, '9781788293631', 'Learn Node.js by Building 6 Projects', '2018', 'Eduonix Learning Solutions', 'This is an advanced, practical guide to harnessing the power of Node.js by creating 6 full-scale real-world projects, from creating a chat application to an eLearning system.', 'B07858_cover.png', '2018-04-22 13:57:14', '2018-04-22 13:57:14'),
(17, '9781785283109', 'Multiplayer Game Development with HTML5', '2015', 'Rodrigo Silveira', 'Build fully-featured, highly interactive multiplayer games with HTML5', '3109OS_Multiplayer Game Development with HTML5.jpg', '2018-04-23 18:46:36', '2018-04-23 18:46:36'),
(18, '9781788299954', 'Integrating Twitter and Facebook into Your iOS Apps', '2018', 'Nick Walter', 'Learn how to integrate Twitter and Facebook APIs into iOS apps', 'V07323_low.png', '2018-04-23 18:47:04', '2018-04-23 18:47:04');