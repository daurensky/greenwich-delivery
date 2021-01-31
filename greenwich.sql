-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 31 2021 г., 21:06
-- Версия сервера: 5.7.20
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `greenwich`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `product` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cart`
--

INSERT INTO `cart` (`id`, `userId`, `product`) VALUES
(22, 5, '11'),
(24, 5, '11'),
(25, 5, '27');

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent`) VALUES
(1, 'Безалкогольные напитки', 0),
(2, 'Мясные изделия ', 0),
(3, 'Молочные продукты ', 0),
(4, 'Чай и кофе', 0),
(5, 'Овощи фрукты', 0),
(7, 'Соки, нектары, сокосодержащие напитки ', 1),
(8, 'Вода, напитки газ, б\\газа ', 1),
(9, 'Энергетические напитки ', 1),
(11, 'Продукция ТМ РубиКом ', 2),
(12, 'Деликатесы и сырокопченая колбаса ', 2),
(14, 'Сгущенное молоко', 3),
(15, 'Молоко ', 3),
(16, 'Сыры ', 3),
(18, 'Творог, сырки ', 3),
(19, 'Кисломолочные продукты', 3),
(22, 'Молочные напитки ', 3),
(25, 'Чай', 4),
(29, 'Кофе', 4),
(30, 'Овощи ', 5),
(31, 'Фрукты, ягоды ', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `image` text NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `categoryId`) VALUES
(1, 'ВЕТЧИНА ПРАЗДНИЧНАЯ 400 гр ', 502, 'https://static-sl.insales.ru/images/products/1/1603/300844611/large_%D0%92%D0%B5%D1%82%D1%87%D0%B8%D0%BD%D0%B0_%D0%BF%D1%80%D0%B0%D0%B7%D0%B4%D0%BD%D0%B8%D1%87%D0%BD%D0%B0%D1%8F.png', 11),
(2, 'КЛАССИЧЕСКАЯ ДЛЯ ВАС 500 гр ', 839, 'https://static-sl.insales.ru/images/products/1/4436/300855636/large_%D0%9A%D0%BB%D0%B0%D1%81%D1%81%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F_%D0%B4%D0%BB%D1%8F_%D0%B2%D0%B0%D1%81.jpeg', 11),
(3, 'ВЕНСКАЯ-Р в/у шт ', 1425, 'https://static-sl.insales.ru/images/products/1/4247/299258007/large_%D0%92%D0%B5%D0%BD%D1%81%D0%BA%D0%B0%D1%8F_r.jpg', 11),
(4, 'ПИТЕРСКАЯ п/к в/у 380 г ', 1088, 'https://static-sl.insales.ru/images/products/1/4905/299258665/large_%D0%9F%D0%B8%D1%82%D0%B5%D1%80%D1%81%D0%BA%D0%B0%D1%8F.jpeg', 11),
(5, 'СОСИСКИ ПЕТРОВСКИЕ фас 0,7 кг ', 1915, 'https://static-sl.insales.ru/images/products/1/5816/299259576/large_%D0%BF%D0%B5%D1%82%D1%80%D0%BE%D0%B2%D1%81%D0%BA%D0%B8%D0%B5__1_.jpg', 11),
(6, 'КЛАССИЧЕСКАЯ СО ШПИКОМ ДЛЯ ВАС 500 гр ', 1105, 'https://static-sl.insales.ru/images/products/1/3053/299322349/large_%D0%BA%D0%BB%D0%B0%D1%81%D1%81%D0%B8%D1%82%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F_%D1%81%D0%BE_%D1%88%D0%BF%D0%B8%D0%BA%D0%BE%D0%BC.png', 11),
(7, 'АППЕТИТНАЯ ', 1138, 'https://static-sl.insales.ru/images/products/1/1381/303318373/large_%D0%90%D0%BF%D0%BF%D0%B5%D1%82%D0%B8%D1%82%D0%BD%D0%B0%D1%8F.jpg', 11),
(8, 'АСТАНА ', 1459, 'https://static-sl.insales.ru/images/products/1/4654/300855854/large_%D0%90%D1%81%D1%82%D0%B0%D0%BD%D0%B0.png', 11),
(9, 'Напиток DAILI Fresh Алоэ 1 л пл/б КАЗАХСТАН ', 482, 'https://static-sl.insales.ru/images/products/1/3819/325414635/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_DAILI_Fresh_%D0%90%D0%BB%D0%BE%D1%8D_1_%D0%BB_%D0%BF%D0%BB.jpg', 7),
(10, 'Напиток DAILI Fresh Алоэ Гранат 1 л пл/б КАЗАХСТАН', 482, 'https://static-sl.insales.ru/images/products/1/4015/325414831/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_DAILI_Fresh_%D0%90%D0%BB%D0%BE%D1%8D_%D0%93%D1%80%D0%B0%D0%BD%D0%B0%D1%82_1_%D0%BB_%D0%BF%D0%BB.jpg', 7),
(11, 'Напиток DAILI Fresh Алоэ Манго 1 л пл/б КАЗАХСТАН ', 482, 'https://static-sl.insales.ru/images/products/1/4177/325414993/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_DAILI_Fresh_%D0%90%D0%BB%D0%BE%D1%8D_%D0%9C%D0%B0%D0%BD%D0%B3%D0%BE_1_%D0%BB_%D0%BF%D0%BB.jpg', 7),
(12, 'Напиток PIKO Pulpy Виноград 0,5 л пл/б КАЗАХСТАН', 295, 'https://static-sl.insales.ru/images/products/1/1708/315885228/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_PIKO_Pulpy_%D0%92%D0%B8%D0%BD%D0%BE%D0%B3%D1%80%D0%B0%D0%B4_0_5_%D0%BB_%D0%BF%D0%BB.jpg', 7),
(13, 'Напиток PIKO Pulpy Виноград 1 л пл/б КАЗАХСТАН ', 395, 'https://static-sl.insales.ru/images/products/1/1934/315885454/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_PIKO_Pulpy_%D0%92%D0%B8%D0%BD%D0%BE%D0%B3%D1%80%D0%B0%D0%B4_1_%D0%BB_%D0%BF%D0%BB.jpg', 7),
(14, 'Напиток PIKO Tempo Ананас 1 л т/п ', 247, 'https://static-sl.insales.ru/images/products/1/2506/315886026/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_PIKO_Tempo_%D0%90%D0%BD%D0%B0%D0%BD%D0%B0%D1%81_1_%D0%BB_%D1%82.jpg', 7),
(15, 'Напиток PIKO Tempo Вишня 1 л т/п ', 247, 'https://static-sl.insales.ru/images/products/1/5072/318903248/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_PIKO_Tempo_%D0%92%D0%B8%D1%88%D0%BD%D1%8F_1_%D0%BB_%D1%82.jpg', 7),
(16, 'Напиток PIKO Tempo Вишня 2 л т/п КАЗАХСТАН', 488, 'https://static-sl.insales.ru/images/products/1/5310/318903486/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_PIKO_Tempo_%D0%92%D0%B8%D1%88%D0%BD%D1%8F_2_%D0%BB_%D1%82.jpg', 7),
(17, 'Вода ARZU LIFE FITNESS б/газа 1,5 л пл/б Riks КАЗАХСТАН ', 148, 'https://static-sl.insales.ru/images/products/1/5449/314398025/large_%D0%92%D0%BE%D0%B4%D0%B0_ARZU_LIFE_FITNESS_%D0%B1_%D0%B3%D0%B0%D0%B7%D0%B0_1_5_%D0%BB_%D0%BF%D0%BB.jpg', 8),
(18, 'Вода ARZU LIFE FITNESS б/газа 1 л пл/б Riks КАЗАХСТАН ', 117, 'https://static-sl.insales.ru/images/products/1/5269/314397845/large_%D0%92%D0%BE%D0%B4%D0%B0_ARZU_LIFE_FITNESS_%D0%B1_%D0%B3%D0%B0%D0%B7%D0%B0_1_%D0%BB.jpg', 8),
(19, 'Вода ARZU LIFE FITNESS газ 0,5 л пл/б Riks КАЗАХСТАН ', 86, 'https://static-sl.insales.ru/images/products/1/5581/314398157/large_%D0%92%D0%BE%D0%B4%D0%B0_ARZU_LIFE_FITNESS_%D0%B3%D0%B0%D0%B7_0_5_%D0%BB_%D0%BF%D0%BB.jpg', 8),
(20, 'Вода ARZU LIFE FITNESS газ 1,5 л пл/б Riks КАЗАХСТАН', 148, 'https://static-sl.insales.ru/images/products/1/6866/314399442/large_%D0%92%D0%BE%D0%B4%D0%B0_ARZU_LIFE_FITNESS_%D0%B3%D0%B0%D0%B7_1_5_%D0%BB_%D0%BF%D0%BB.jpg', 8),
(21, 'Вода ARZU LIFE FITNESS газ 1 л пл/б Riks КАЗАХСТАН', 117, 'https://static-sl.insales.ru/images/products/1/5914/314398490/large_%D0%92%D0%BE%D0%B4%D0%B0_ARZU_LIFE_FITNESS_%D0%B3%D0%B0%D0%B7_1_%D0%BB_%D0%BF%D0%BB.jpg', 8),
(22, 'Вода ARZU LIFE FITNESS Лимон 0,52 л пл/б Riks КАЗАХСТАН ', 104, 'https://static-sl.insales.ru/images/products/1/5751/314398327/large_%D0%92%D0%BE%D0%B4%D0%B0_ARZU_LIFE_FITNESS_%D0%9B%D0%B8%D0%BC%D0%BE%D0%BD_0_52_%D0%BB_%D0%BF%D0%BB.jpg', 8),
(23, 'Вода ARZU LIFE FITNESS Лимон 1,02 л пл/б Riks КАЗАХСТАН ', 153, 'https://static-sl.insales.ru/images/products/1/3926/314380118/large_%D0%92%D0%BE%D0%B4%D0%B0_ARZU_LIFE_FITNESS_%D0%9B%D0%B8%D0%BC%D0%BE%D0%BD_1_02_%D0%BB_%D0%BF%D0%BB.jpg', 8),
(24, 'Вода ARZU LIFE FITNESS Персик 0,52 л пл/б Riks КАЗАХСТАН ', 104, 'https://static-sl.insales.ru/images/products/1/4559/314380751/large_%D0%92%D0%BE%D0%B4%D0%B0_ARZU_LIFE_FITNESS_%D0%9F%D0%B5%D1%80%D1%81%D0%B8%D0%BA_0_52_%D0%BB_%D0%BF%D0%BB.jpg', 8),
(25, 'Напиток энергетический FLASH Up Berry Mix 0,45 л ж/б РОССИЯ ', 268, 'https://static-sl.insales.ru/images/products/1/4741/325415557/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_%D1%8D%D0%BD%D0%B5%D1%80%D0%B3%D0%B5%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_FLASH_Up_Berry_Mix_0_45_%D0%BB_%D0%B6.jpg', 9),
(26, 'Напиток энергетический GORILLA Классический б/алк 0,45 л ж/б РОССИЯ ', 329, 'https://static-sl.insales.ru/images/products/1/6906/316300026/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_%D1%8D%D0%BD%D0%B5%D1%80%D0%B3%D0%B5%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_GORILLA_%D0%9A%D0%BB%D0%B0%D1%81%D1%81%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_%D0%B1_%D0%B0%D0%BB%D0%BA_0_45_%D0%BB_%D0%B6.jpg', 9),
(27, 'Напиток энергетический daurensky б/алк 0,45 л ж/б КАЗАХСТАН', 450, 'assets/img/energy.jpg', 9),
(28, 'Напиток энергетический ADRENALINE RUSH 0,449 л ж/б РОССИЯ', 480, 'https://static-sl.insales.ru/images/products/1/7809/316292737/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_%D1%8D%D0%BD%D0%B5%D1%80%D0%B3%D0%B5%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_ADRENALINE_RUSH_0_449_%D0%BB_%D0%B6_%D0%B1_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 9),
(29, 'Напиток энергетический DIZZY БАNКА 0,5 л ж/б Riks КАЗАХСТАН ', 313, 'https://static-sl.insales.ru/images/products/1/2768/316295888/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_%D1%8D%D0%BD%D0%B5%D1%80%D0%B3%D0%B5%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_DIZZY_%D0%91%D0%90N%D0%9A%D0%90_0_5_%D0%BB_%D0%B6.jpg', 9),
(30, 'Напиток энергетический DIZZY Doctor б/алк 0,5 л ж/б КАЗАХСТАН', 313, 'https://static-sl.insales.ru/images/products/1/1534/316294654/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_%D1%8D%D0%BD%D0%B5%D1%80%D0%B3%D0%B5%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_DIZZY_Doctor_%D0%B1_%D0%B0%D0%BB%D0%BA_0_5_%D0%BB_%D0%B6_%D0%B1_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 9),
(31, 'Напиток энергетический FLASH Energy 0,45 л ж/б РОССИЯ', 268, 'https://static-sl.insales.ru/images/products/1/3033/320646105/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_%D1%8D%D0%BD%D0%B5%D1%80%D0%B3%D0%B5%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_FLASH_Energy_0_33_%D0%BB_%D0%B6.jpg', 9),
(32, 'Напиток энергетический FLASH Up Mojito 0,45 л ж/б РОССИЯ ', 268, 'https://static-sl.insales.ru/images/products/1/2759/320645831/large_%D0%9D%D0%B0%D0%BF%D0%B8%D1%82%D0%BE%D0%BA_%D1%8D%D0%BD%D0%B5%D1%80%D0%B3%D0%B5%D1%82%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_FLASH_Up_Mojito_0_45_%D0%BB_%D0%B6.jpg', 9),
(33, 'КАЗЫ Арай в/у ', 8780, 'https://static-sl.insales.ru/images/products/1/3731/311717523/large_%D0%9A%D0%90%D0%97%D0%AB_%D0%90%D1%80%D0%B0%D0%B9_%D0%B2_%D1%83.jpg', 12),
(34, 'Колбаса АРИАНТ Холодец Деревенский 500 г РОССИЯ ', 960, 'https://static-sl.insales.ru/images/products/1/7670/335519222/large_%D0%A5%D0%BE%D0%BB%D0%BE%D0%B4%D0%B5%D1%86_%D0%B4%D0%B5%D1%80%D0%B5%D0%B2%D0%B5%D0%BD%D1%81%D0%BA%D0%B8%D0%B9.jpg', 12),
(35, 'Колбаса АРИАНТ Холодец Домашний 500 г РОССИЯ ', 960, 'https://static-sl.insales.ru/images/products/1/8064/335519616/large_%D0%A5%D0%BE%D0%BB%D0%BE%D0%B4%D0%B5%D1%86_%D0%B4%D0%BE%D0%BC%D0%B0%D1%88%D0%BD%D0%B8%D0%B9.jpg', 12),
(36, 'Колбаса АРОМАТНАЯ с/к 100 г в/у Останкино РОССИЯ ', 790, 'https://static-sl.insales.ru/images/products/1/131/335519875/large_%D0%9A%D0%BE%D0%BB%D0%B1%D0%B0%D1%81%D0%B0_%D0%90%D0%A0%D0%9E%D0%9C%D0%90%D0%A2%D0%9D%D0%90%D0%AF__100_%D0%B3.jpg', 12),
(37, 'Колбаса БРАУНШВЕЙГСКАЯ с/к 300 г Сибколбасы РОССИЯ ', 2815, 'https://static-sl.insales.ru/images/products/1/1344/335521088/large_%D0%9A%D0%BE%D0%BB%D0%B1%D0%B0%D1%81%D0%B0_%D0%91%D0%A0%D0%90%D0%A3%D0%9D%D0%A8%D0%92%D0%95%D0%99%D0%93%D0%A1%D0%9A%D0%90%D0%AF_%D0%A1%D0%B8%D0%B1%D0%BA%D0%BE%D0%BB%D0%B1%D0%B0%D1%81%D1%8B.jpg', 12),
(38, 'Колбаса ДАМДI ЕТ Закусочная п/к в/у охл КАЗАХСТАН ', 1755, 'https://static-sl.insales.ru/images/products/1/8066/334651266/large_%D0%97%D0%B0%D0%BA%D1%83%D1%81%D0%BE%D1%87%D0%BD%D0%B0%D1%8F.jpg', 12),
(39, 'Колбаса ДАМДI ЕТ Нежная в/к в/у охл КАЗАХСТАН ', 2055, 'https://static-sl.insales.ru/images/products/1/211/334651603/large_%D0%9D%D0%B5%D0%B6%D0%BD%D0%B0%D1%8F.jpg', 12),
(40, 'Колбаса ДАМДI ЕТ Особая п/к в/у охл КАЗАХСТАН ', 2000, 'https://static-sl.insales.ru/images/products/1/1987/334653379/large_%D0%9E%D1%81%D0%BE%D0%B1%D0%B0%D1%8F.jpg', 12),
(41, 'Молоко сгущеное с сахаром 8,5% 250 гр ДП МолКОМ КАЗАХСТАН ', 324, 'https://static-sl.insales.ru/images/products/1/3569/395455985/large_%D0%A1%D0%B3%D1%83%D1%89%D1%91%D0%BD%D0%BA%D0%B0_%D0%94%D0%BE%D0%B9%D0%BF%D0%B0%D0%BA.jpg', 14),
(42, 'Молоко сгущеное с сахаром 8,5% 380 гр ж/б МолКОМ КАЗАХСТАН ', 489, 'https://static-sl.insales.ru/images/products/1/3583/395455999/large_%D0%A1%D0%B3%D1%83%D1%89%D1%91%D0%BD%D0%BA%D0%B0.jpg', 14),
(43, 'Молоко сгущеное 8,5% 300 г ДП Рогачев РОССИЯ ', 449, 'https://static-sl.insales.ru/images/products/1/3086/300895246/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_%D1%81%D0%B3%D1%83%D1%89%D0%B5%D0%BD%D0%BE%D0%B5_8_5__300_%D0%B3_%D0%94%D0%9F_%D0%A0%D0%BE%D0%B3%D0%B0%D1%87%D0%B5%D0%B2_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 14),
(44, 'Молоко сгущеное 8,5% 380 гр Рогачев БЕЛАРУСЬ ', 439, 'https://static-sl.insales.ru/images/products/1/3557/300895717/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_%D1%81%D0%B3%D1%83%D1%89%D0%B5%D0%BD%D0%BE%D0%B5_8_5__380_%D0%B3%D1%80_%D0%A0%D0%BE%D0%B3%D0%B0%D1%87%D0%B5%D0%B2_%D0%91%D0%95%D0%9B%D0%90%D0%A0%D0%A3%D0%A1%D0%AC.jpg', 14),
(45, 'Молоко сгущеное ГЛУБОКСКОЕ ГОСТ 8,5% 380 гр ж/б БЕЛОРУСЬ ', 432, 'https://static-sl.insales.ru/images/products/1/4025/300896185/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_%D1%81%D0%B3%D1%83%D1%89%D0%B5%D0%BD%D0%BE%D0%B5_%D0%93%D0%9B%D0%A3%D0%91%D0%9E%D0%9A%D0%A1%D0%9A%D0%9E%D0%95_%D0%93%D0%9E%D0%A1%D0%A2_8_5__380_%D0%B3%D1%80_%D0%B6%D0%91%D0%95%D0%9B%D0%9E%D0%A0%D0%A3%D0%A1%D0%AC.jpg', 14),
(46, 'Молоко сгущеное с сахаром ШАДРИНСКОЕ цельное 8,5% 380 мл ж/б Данон РОССИЯ ', 585, 'https://static-sl.insales.ru/images/products/1/8081/302784401/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_%D1%81%D0%B3%D1%83%D1%89%D0%B5%D0%BD%D0%BE%D0%B5_%D1%81_%D1%81%D0%B0%D1%85%D0%B0%D1%80%D0%BE%D0%BC_%D0%A8%D0%90%D0%94%D0%A0%D0%98%D0%9D%D0%A1%D0%9A%D0%9E%D0%95_%D1%86%D0%B5%D0%BB%D1%8C%D0%BD%D0%BE%D0%B5_8_5__380_%D0%BC%D0%BB_%D0%B6_%D0%B1_%D0%94%D0%B0%D0%BD%D0%BE%D0%BD_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 14),
(47, 'Молоко сгущеное ЮБИЛЕЙНОЕ 380 гр ж/б ГлавПродукт РОССИЯ ', 314, 'https://static-sl.insales.ru/images/products/1/5130/300897290/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_%D1%81%D0%B3%D1%83%D1%89%D0%B5%D0%BD%D0%BE%D0%B5_%D0%AE%D0%91%D0%98%D0%9B%D0%95%D0%99%D0%9D%D0%9E%D0%95_380_%D0%B3%D1%80_%D0%B6%D0%93%D0%BB%D0%B0%D0%B2%D0%9F%D1%80%D0%BE%D0%B4%D1%83%D0%BA%D1%82_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 14),
(48, 'Молоко сгущеное вареное ЕГОРКА 8,5% 360 г Рогачев РОССИЯ ', 510, 'https://static-sl.insales.ru/images/products/1/3926/347221846/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_%D1%81%D0%B3%D1%83%D1%89%D0%B5%D0%BD%D0%BE%D0%B5_%D0%B2%D0%B0%D1%80%D0%B5%D0%BD%D0%BE%D0%B5_%D0%95%D0%93%D0%9E%D0%A0%D0%9A%D0%90_8_5__360_%D0%B3_%D0%A0%D0%BE%D0%B3%D0%B0%D1%87%D0%B5%D0%B2_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 14),
(49, 'Молоко 2,5% 950 мл ф/п Молком КАЗАХСТАН ', 216, 'https://static-sl.insales.ru/images/products/1/4366/300871950/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_2_5__950_%D0%BC%D0%BB__%D0%9C%D0%BE%D0%BB%D0%BA%D0%BE%D0%BC_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 15),
(50, 'Молоко 2,5% 0,9 л пл/б МолКом КАЗАХСТАН ', 231, 'https://static-sl.insales.ru/images/products/1/5552/307099056/large_%D0%BC%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE2_5.png', 15),
(51, 'Молоко ВКУСНОЕ 3,2% 0,95 л ф/п Молком КАЗАХСТАН ', 253, 'https://static-sl.insales.ru/images/products/1/2358/300878134/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_%D0%92%D0%9A%D0%A3%D0%A1%D0%9D%D0%9E%D0%95_3_2__0_95_%D0%BB__%D0%9C%D0%BE%D0%BB%D0%BA%D0%BE%D0%BC_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 15),
(52, 'Молоко ВКУСНОЕ 3,2% 0,9 л пл/б МолКом КАЗАХСТАН ', 226, 'https://static-sl.insales.ru/images/products/1/4737/303583873/large_%D0%92%D0%BA%D1%83%D1%81%D0%BD%D0%BE%D0%B5_3_2_%D0%B1%D1%83%D1%82..jpg', 15),
(53, 'Молоко Домашнее 2,5% 1 л ф/п МолКом КАЗАХСТАН ', 255, 'https://static-sl.insales.ru/images/products/1/4742/303583878/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_%D0%B4%D0%BE%D0%BC%D0%B0%D1%88%D0%BD%D0%B5%D0%B5.jpg', 15),
(54, 'Молоко топленое 2,5% 0,9 л пл/б МолКом КАЗАХСТАН ', 264, 'https://static-sl.insales.ru/images/products/1/5595/300897755/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_%D1%82%D0%BE%D0%BF%D0%BB%D0%B5%D0%BD%D0%BE%D0%B5_2_5__0_9_%D0%BB_%D0%BF%D0%BB%D0%B1_%D0%9C%D0%BE%D0%BB%D0%9A%D0%BE%D0%BC_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 15),
(55, 'Молоко ОРЛОВСКОЕ 2,5% 0,9 л пл/б МолКом КАЗАХСТАН ', 241, 'https://static-sl.insales.ru/images/products/1/5634/307099138/large_%D0%BE%D1%80%D0%BB%D0%BE%D0%B2%D1%81%D0%BA%D0%BE%D0%B5.png', 15),
(56, 'Молоко LACTEL Витамин D 2,5% 1000 гр т/п Food Master КАЗАХСТАН ', 394, 'https://static-sl.insales.ru/images/products/1/6767/300874351/large_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_LACTEL_%D0%92%D0%B8%D1%82%D0%B0%D0%BC%D0%B8%D0%BD_D_2_5__.jpg', 15),
(57, 'Сыр плавл HOCHLAND Ассорти/деликатесное/ 140 гр шайба РОССИЯ ', 530, 'https://static-sl.insales.ru/images/products/1/3657/301133385/large_%D0%A1%D1%8B%D1%80_%D0%BF%D0%BB%D0%B0%D0%B2%D0%BB_HOCHLAND_%D0%90%D1%81%D1%81%D0%BE%D1%80%D1%82%D0%B8%D0%B4%D0%B5%D0%BB%D0%B8%D0%BA%D0%B0%D1%82%D0%B5%D1%81%D0%BD%D0%BE%D0%B5_140_%D0%B3%D1%80_%D1%88%D0%B0%D0%B9%D0%B1%D0%B0_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 16),
(58, 'Сыр плавл HOCHLAND Ассорти/желтое/ 140 гр шайба РОССИЯ ', 530, 'https://static-sl.insales.ru/images/products/1/3822/301133550/large_%D0%A1%D1%8B%D1%80_%D0%BF%D0%BB%D0%B0%D0%B2%D0%BB_HOCHLAND_%D0%90%D1%81%D1%81%D0%BE%D1%80%D1%82%D0%B8%D0%B6%D0%B5%D0%BB%D1%82%D0%BE%D0%B5_140_%D0%B3%D1%80_%D1%88%D0%B0%D0%B9%D0%B1%D0%B0_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 16),
(59, 'Сыр плавл HOCHLAND Ассорти/зеленое/ 140 гр шайба РОССИЯ ', 530, 'https://static-sl.insales.ru/images/products/1/4016/301133744/large_%D0%A1%D1%8B%D1%80_%D0%BF%D0%BB%D0%B0%D0%B2%D0%BB_HOCHLAND_%D0%90%D1%81%D1%81%D0%BE%D1%80%D1%82%D0%B8%D0%B7%D0%B5%D0%BB%D0%B5%D0%BD%D0%BE%D0%B5140_%D0%B3%D1%80_%D1%88%D0%B0%D0%B9%D0%B1%D0%B0_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 16),
(60, 'Сыр плавл HOCHLAND Ассорти/синее/ 140 гр шайба РОССИЯ ', 530, 'https://static-sl.insales.ru/images/products/1/4080/301133808/large_%D0%A1%D1%8B%D1%80_%D0%BF%D0%BB%D0%B0%D0%B2%D0%BB_HOCHLAND_%D0%90%D1%81%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%81%D0%B8%D0%BD%D0%B5%D0%B5_140_%D0%B3%D1%80_%D1%88%D0%B0%D0%B9%D0%B1%D0%B0_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 16),
(61, 'Сыр плавл HOCHLAND Ассорти/сырное/ 140 гр шайба РОССИЯ ', 530, 'https://static-sl.insales.ru/images/products/1/4144/301133872/large_%D0%A1%D1%8B%D1%80_%D0%BF%D0%BB%D0%B0%D0%B2%D0%BB_HOCHLAND_%D0%90%D1%81%D1%81%D0%BE%D1%80%D1%82%D0%B8%D1%8B%D1%80%D0%BD%D0%BE%D0%B5140_%D0%B3%D1%80_%D1%88%D0%B0%D0%B9%D0%B1%D0%B0_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 16),
(62, 'Сыр плавл HOCHLAND Ветчина 100 гр блок РОССИЯ ', 274, 'https://static-sl.insales.ru/images/products/1/5589/301135317/large_%D0%A1%D1%8B%D1%80_%D0%BF%D0%BB%D0%B0%D0%B2%D0%BB_HOCHLAND_%D0%92%D0%B5%D1%82%D1%87%D0%B8%D0%BD%D0%B0_100_%D0%B3%D1%80_%D0%B1%D0%BB%D0%BE%D0%BA_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 16),
(63, 'Сыр плавл HOCHLAND Ветчина 140 гр шайба РОССИЯ ', 530, 'https://static-sl.insales.ru/images/products/1/3003/301140923/large_%D0%A1%D1%8B%D1%80_%D0%BF%D0%BB%D0%B0%D0%B2%D0%BB_HOCHLAND_%D0%92%D0%B5%D1%82%D1%87%D0%B8%D0%BD%D0%B0_140_%D0%B3%D1%80_%D1%88%D0%B0%D0%B9%D0%B1%D0%B0_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 16),
(64, 'Сыр плавл HOCHLAND Ветчина 150 гр нарезка РОССИЯ ', 545, 'https://static-sl.insales.ru/images/products/1/3106/301141026/large_%D0%A1%D1%8B%D1%80_%D0%BF%D0%BB%D0%B0%D0%B2%D0%BB_HOCHLAND_%D0%92%D0%B5%D1%82%D1%87%D0%B8%D0%BD%D0%B0_150_%D0%B3%D1%80_%D0%BD%D0%B0%D1%80%D0%B5%D0%B7%D0%BA%D0%B0_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 16),
(65, 'Десерт творожный 100 гр Молком КАЗАХСТАН ', 140, 'https://static-sl.insales.ru/images/products/1/1447/300901799/large_%D0%94%D0%B5%D1%81%D0%B5%D1%80%D1%82_%D1%82%D0%B2%D0%BE%D1%80%D0%BE%D0%B6%D0%BD%D1%8B%D0%B9_100_%D0%B3%D1%80_%D0%9C%D0%BE%D0%BB%D0%BA%D0%BE%D0%BC_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 18),
(66, 'Сырок творожный МОЛКОМ Клубника 4,5% 100 гр КАЗАХСТАН ', 147, 'https://static-sl.insales.ru/images/products/1/149/302784661/large_%D0%A1%D1%8B%D1%80%D0%BE%D0%BA_%D1%82%D0%B2%D0%BE%D1%80%D0%BE%D0%B6%D0%BD%D1%8B%D0%B9_%D0%9C%D0%9E%D0%9B%D0%9A%D0%9E%D0%9C_%D0%9A%D0%BB%D1%83%D0%B1%D0%BD%D0%B8%D0%BA%D0%B0_4_5__100_%D0%B3%D1%80_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 18),
(67, 'Сырок творожный МОЛКОМ сладкий 100 гр КАЗАХСТАН ', 147, 'https://static-sl.insales.ru/images/products/1/307/302784819/large_%D0%A1%D1%8B%D1%80%D0%BE%D0%BA_%D1%82%D0%B2%D0%BE%D1%80%D0%BE%D0%B6%D0%BD%D1%8B%D0%B9_%D0%9C%D0%9E%D0%9B%D0%9A%D0%9E%D0%9C_%D1%81%D0%BB%D0%B0%D0%B4%D0%BA%D0%B8%D0%B9_100_%D0%B3%D1%80_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 18),
(68, 'Творог 0% 200 гр Молком КАЗАХСТАН', 252, 'https://static-sl.insales.ru/images/products/1/2862/302787374/large_%D0%A2%D0%B2%D0%BE%D1%80%D0%BE%D0%B3_0__200_%D0%B3%D1%80_%D0%9C%D0%BE%D0%BB%D0%BA%D0%BE%D0%BC_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 18),
(69, 'Творог жирный 9% 200 гр Молком КАЗАХСТАН ', 264, 'https://static-sl.insales.ru/images/products/1/3677/301166173/large_%D0%A2%D0%B2%D0%BE%D1%80%D0%BE%D0%B3_%D0%B6%D0%B8%D1%80%D0%BD%D1%8B%D0%B9_9__200_%D0%B3%D1%80_%D0%9C%D0%BE%D0%BB%D0%BA%D0%BE%D0%BC_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 18),
(70, 'Сырок творожный ДОЛЬЧЕ Ваниль 26% 36 гр фольга Food Master КАЗАХСТАН ', 133, 'https://static-sl.insales.ru/images/products/1/4577/301126113/large_%D0%A1%D1%8B%D1%80%D0%BE%D0%BA_%D1%82%D0%B2%D0%BE%D1%80%D0%BE%D0%B6%D0%BD%D1%8B%D0%B9_%D0%94%D0%9E%D0%9B%D0%AC%D0%A7%D0%95_%D0%92%D0%B0%D0%BD%D0%B8%D0%BB%D1%8C_26__36_%D0%B3%D1%80_%D1%84%D0%BE%D0%BB%D1%8C%D0%B3%D0%B0_Food_Master_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 18),
(71, 'Сырок творожный ДОЛЬЧЕ Вишня 26% 36 гр фольга Food Master КАЗАХСТАН ', 133, 'https://static-sl.insales.ru/images/products/1/4615/301126151/large_%D0%A1%D1%8B%D1%80%D0%BE%D0%BA_%D1%82%D0%B2%D0%BE%D1%80%D0%BE%D0%B6%D0%BD%D1%8B%D0%B9_%D0%94%D0%9E%D0%9B%D0%AC%D0%A7%D0%95_%D0%92%D0%B8%D1%88%D0%BD%D1%8F_26__36_%D0%B3%D1%80_%D1%84%D0%BE%D0%BB%D1%8C%D0%B3%D0%B0_Food_Master_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 18),
(72, 'Творожная масса ВАНИЛЬНАЯ 8% 200 гр Молком КАЗАХСТАН ', 292, 'https://static-sl.insales.ru/images/products/1/5092/303584228/large_%D0%A2%D0%B2%D0%BE%D1%80%D0%BE%D0%B6%D0%BD%D0%B0%D1%8F_%D0%BC%D0%B0%D1%81%D1%81%D0%B0.jpg', 18),
(73, 'Коктейль молочный ДАНИССИМО Мороженое Крем-брюле 215 г Danone БЕЛАРУСЬ ', 270, 'https://static-sl.insales.ru/images/products/1/760/326058744/large_%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D1%8C_%D0%BC%D0%BE%D0%BB%D0%BE%D1%87%D0%BD%D1%8B%D0%B9_%D0%94%D0%90%D0%9D%D0%98%D0%A1%D0%A1%D0%98%D0%9C%D0%9E_%D0%9C%D0%BE%D1%80%D0%BE%D0%B6%D0%B5%D0%BD%D0%BE%D0%B5_%D0%9A%D1%80%D0%B5%D0%BC-%D0%B1%D1%80%D1%8E%D0%BB%D0%B5_215_%D0%B3_Danone_%D0%91%D0%95%D0%9B%D0%90%D0%A0%D0%A3%D0%A1%D0%AC.jpg', 22),
(74, 'Коктейль молочный ФРУТО НЯНЯ Какао 2,8% 0,2 л РОССИЯ ', 228, 'https://static-sl.insales.ru/images/products/1/4231/347205767/large_%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D1%8C_%D0%BC%D0%BE%D0%BB%D0%BE%D1%87%D0%BD%D1%8B%D0%B9_%D0%A4%D0%A0%D0%A3%D0%A2%D0%9E_%D0%9D%D0%AF%D0%9D%D0%AF_%D0%9A%D0%B0%D0%BA%D0%B0%D0%BE_2_8__0_2_%D0%BB_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 22),
(75, 'Коктейль молочный ФРУТО НЯНЯ Малина 2,1% 200 мл РОССИЯ ', 228, 'https://static-sl.insales.ru/images/products/1/492/347161068/large_%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D1%8C_%D0%BC%D0%BE%D0%BB%D0%BE%D1%87%D0%BD%D1%8B%D0%B9_%D0%A4%D0%A0%D0%A3%D0%A2%D0%9E_%D0%9D%D0%AF%D0%9D%D0%AF_%D0%9C%D0%B0%D0%BB%D0%B8%D0%BD%D0%B0_2_1__200_%D0%BC%D0%BB_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 22),
(76, 'Коктейль молочный ФРУТО НЯНЯ Молоко с печеньем 2,4% 200 мл РОССИЯ ', 233, 'https://static-sl.insales.ru/images/products/1/4552/347206088/large_%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D1%8C_%D0%BC%D0%BE%D0%BB%D0%BE%D1%87%D0%BD%D1%8B%D0%B9_%D0%A4%D0%A0%D0%A3%D0%A2%D0%9E_%D0%9D%D0%AF%D0%9D%D0%AF_%D0%9C%D0%BE%D0%BB%D0%BE%D0%BA%D0%BE_%D1%81_%D0%BF%D0%B5%D1%87%D0%B5%D0%BD%D1%8C%D0%B5%D0%BC_2_4__200_%D0%BC%D0%BB_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 22),
(77, 'Коктейль молочный ЧУДО Клубника 5% 0,95 л ', 730, 'https://static-sl.insales.ru/images/products/1/3067/326061051/large_%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D1%8C_%D0%BC%D0%BE%D0%BB%D0%BE%D1%87%D0%BD%D1%8B%D0%B9_%D0%A7%D0%A3%D0%94%D0%9E_%D0%9A%D0%BB%D1%83%D0%B1%D0%BD%D0%B8%D0%BA%D0%B0_5__0_95_%D0%BB.jpg', 22),
(78, 'Коктейль молочный ЧУДО Пекан Крем-брюле 3% 0,2 л РОССИЯ ', 245, 'https://static-sl.insales.ru/images/products/1/2649/326060633/large_%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D1%8C_%D0%BC%D0%BE%D0%BB%D0%BE%D1%87%D0%BD%D1%8B%D0%B9_%D0%A7%D0%A3%D0%94%D0%9E_%D0%9F%D0%B5%D0%BA%D0%B0%D0%BD_%D0%9A%D1%80%D0%B5%D0%BC-%D0%B1%D1%80%D1%8E%D0%BB%D0%B5_3__0_2_%D0%BB_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 22),
(79, 'Коктейль молочный ЧУДО Трюфель шоколадный 3% 0,2 л РОССИЯ ', 245, 'https://static-sl.insales.ru/images/products/1/2577/326060561/large_%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D1%8C_%D0%BC%D0%BE%D0%BB%D0%BE%D1%87%D0%BD%D1%8B%D0%B9_%D0%A7%D0%A3%D0%94%D0%9E_%D0%A2%D1%80%D1%8E%D1%84%D0%B5%D0%BB%D1%8C_%D1%88%D0%BE%D0%BA%D0%BE%D0%BB%D0%B0%D0%B4%D0%BD%D1%8B%D0%B9_3__0_2_%D0%BB_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 22),
(80, 'Коктейль молочный ЧУДО Ягодное мороженое 2% 0,96 л РОССИЯ ', 640, 'https://static-sl.insales.ru/images/products/1/2481/326060465/large_%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D1%8C_%D0%BC%D0%BE%D0%BB%D0%BE%D1%87%D0%BD%D1%8B%D0%B9_%D0%A7%D0%A3%D0%94%D0%9E_%D0%AF%D0%B3%D0%BE%D0%B4%D0%BD%D0%BE%D0%B5_%D0%BC%D0%BE%D1%80%D0%BE%D0%B6%D0%B5%D0%BD%D0%BE%D0%B5_2__0_96_%D0%BB_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 22),
(81, 'Чай AHMAD Классический черн лист 200 г РОССИЯ ', 778, 'https://static-sl.insales.ru/images/products/1/3671/301174359/large_%D0%A7%D0%B0%D0%B9_AHMAD_%D0%9A%D0%BB%D0%B0%D1%81%D1%81%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9_%D1%87%D0%B5%D1%80%D0%BD_%D0%BB%D0%B8%D1%81%D1%82_200_%D0%B3_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 25),
(82, 'Чай ASSAM Индийский 25*1,8 г п/пак КАЗАХСТАН ', 314, 'https://static-sl.insales.ru/images/products/1/5378/301184258/large_%D0%A7%D0%B0%D0%B9_ASSAM_25_1_8_%D0%B3%D1%80_%D0%BF%D0%BF%D0%B0%D0%BA_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 25),
(83, 'Чай ASSAM Индийский гран 1 кг КАЗАХСТАН', 3570, 'https://static-sl.insales.ru/images/products/1/5804/301184684/large_%D0%A7%D0%B0%D0%B9_ASSAM_%D0%B3%D1%80%D0%B0%D0%BD_1_%D0%BA%D0%B3_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 25),
(84, 'Чай BAZAAR Altyn Kenya 250 г КАЗАХСТАН ', 637, 'https://static-sl.insales.ru/images/products/1/6216/301185096/large_%D0%A7%D0%B0%D0%B9_BAZAAR_Altyn_Kenya_250_%D0%B3_%D0%9A%D0%90%D0%97%D0%90%D0%A5%D0%A1%D0%A2%D0%90%D0%9D.jpg', 25),
(85, 'Чай GREENFIELD Earl Grey Fantasy 25*2 гр п/пак РОССИЯ ', 605, 'https://static-sl.insales.ru/images/products/1/6493/301185373/large_%D0%A7%D0%B0%D0%B9_GREENFIELD_Earl_Grey_Fantasy_25_2_%D0%B3%D1%80_%D0%BF%D0%BF%D0%B0%D0%BA_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 25),
(86, 'Чай GREENFIELD English Edition черн 25*2 г п/пак РОССИЯ ', 605, 'https://static-sl.insales.ru/images/products/1/670/301187742/large_%D0%A7%D0%B0%D0%B9_GREENFIELD_English_Edition_%D1%87%D0%B5%D1%80%D0%BD_25___2_%D0%B3_%D0%BF_%D0%BF%D0%B0%D0%BA_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 25),
(87, 'Чай GREENFIELD Golden Ceylon 25*2 гр п/пак РОССИЯ ', 605, 'https://static-sl.insales.ru/images/products/1/821/301187893/large_%D0%A7%D0%B0%D0%B9_GREENFIELD_Golden_Ceylon_25_2_%D0%B3%D1%80_%D0%BF_%D0%B0%D0%BA_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 25),
(88, 'Чай GREENFIELD Зеленый Flying Dragon 25*2 гр п/пак РОССИЯ ', 590, 'https://static-sl.insales.ru/images/products/1/5839/301389519/large_%D0%A7%D0%B0%D0%B9_GREENFIELD_%D0%97%D0%B5%D0%BB%D0%B5%D0%BD%D1%8B%D0%B9_Flying_Dragon_25_2_%D0%B3%D1%80_%D0%BF%D0%BF%D0%B0%D0%BA_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 25),
(89, 'Кофе CARTE NOIRE 150 гр м/у РОССИЯ ', 3995, 'https://static-sl.insales.ru/images/products/1/7419/301407483/large_%D0%9A%D0%BE%D1%84%D0%B5_CARTE_NOIRE_150_%D0%B3%D1%80_%D0%BC%D1%83_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 29),
(90, 'Кофе CARTE NOIRE 230 гр м/у РОССИЯ ', 2440, 'https://static-sl.insales.ru/images/products/1/7494/301407558/large_%D0%9A%D0%BE%D1%84%D0%B5_CARTE_NOIRE_230_%D0%B3%D1%80_%D0%BC_%D1%83_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 29),
(91, 'Кофе CARTE NOIRE 95 гр ст/б РОССИЯ ', 2621, 'https://static-sl.insales.ru/images/products/1/7586/301407650/large_%D0%9A%D0%BE%D1%84%D0%B5_CARTE_NOIRE_95_%D0%B3%D1%80_%D1%81%D1%82_%D0%B1_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 29),
(92, 'Кофе CARTE NOIRE зерно 230 гр м/у РОССИЯ ', 1909, 'https://static-sl.insales.ru/images/products/1/7805/301407869/large_%D0%9A%D0%BE%D1%84%D0%B5_CARTE_NOIRE_%D0%B7%D0%B5%D1%80%D0%BD%D0%BE_230_%D0%B3%D1%80_%D0%BC_%D1%83_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 29),
(93, 'Кофе CARTE NOIRE зерно 800 гр м/у РОССИЯ ', 7390, 'https://static-sl.insales.ru/images/products/1/7859/301407923/large_%D0%9A%D0%BE%D1%84%D0%B5_Carte_Noire_%D0%B7%D0%B5%D1%80%D0%BD%D0%BE_800_%D0%B3%D1%80.jpg', 29),
(94, 'Кофе JACOBS 3 в 1 Original 12 гр РОССИЯ ', 62, 'https://static-sl.insales.ru/images/products/1/8033/301408097/large_%D0%9A%D0%BE%D1%84%D0%B5_JACOBS_3_%D0%B2_1_Original_12_%D0%B3%D1%80_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 29),
(95, 'Кофе JACOBS MONARCH 150 гр м/у РОССИЯ ', 2470, 'https://static-sl.insales.ru/images/products/1/72/301408328/large_%D0%9A%D0%BE%D1%84%D0%B5_JACOBS_MONARCH_150_%D0%B3%D1%80_%D0%BC_%D1%83_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 29),
(96, 'Кофе JACOBS MONARCH 190 гр м/у РОССИЯ ', 2040, 'https://static-sl.insales.ru/images/products/1/145/301408401/large_%D0%9A%D0%BE%D1%84%D0%B5_JACOBS_MONARCH_190_%D0%B3%D1%80_%D0%BC_%D1%83_%D0%A0%D0%9E%D0%A1%D0%A1%D0%98%D0%AF.jpg', 29),
(97, 'Авокадо ', 920, 'https://static-sl.insales.ru/images/products/1/1943/299747223/large_%D0%90%D0%B2%D0%BE%D0%BA%D0%B0%D0%B4%D0%BE.jpg', 30),
(98, 'Капуста Брокколи 1 кг', 2990, 'https://static-sl.insales.ru/images/products/1/2318/299739406/large_%D0%B1%D1%80%D0%BE%D0%BA%D0%BA%D0%BE%D0%BB%D0%B8.jpg', 30),
(99, 'Капуста красная свежая 1 кг ', 437, 'https://static-sl.insales.ru/images/products/1/2583/299739671/large_%D0%9A%D0%B0%D0%BF%D1%83%D1%81%D1%82%D0%B0_%D0%BA%D1%80%D0%B0%D1%81%D0%BD%D0%B0%D1%8F.jpg', 30),
(100, 'Капуста пекинская', 510, 'https://static-sl.insales.ru/images/products/1/3262/299740350/large_%D0%BF%D0%B5%D0%BA%D0%B8%D0%BD%D1%81%D0%BA%D0%B0%D1%8F_%D0%BA%D0%B0%D0%BF%D1%83%D1%81%D1%82%D0%B0.jpg', 30),
(101, 'Капуста свежая весовая ', 88, 'https://static-sl.insales.ru/images/products/1/1044/299738132/large_%D0%BA%D0%B0%D0%BF%D1%83%D1%81%D1%82%D0%B0.jpg', 30),
(102, 'Картофель южный 1 кг ', 121, 'https://static-sl.insales.ru/images/products/1/7675/304864763/large_%D0%91%D0%B5%D0%B7%D1%8B%D0%BC%D1%8F%D0%BD%D0%BD%D1%8B%D0%B9-1.jpg', 30),
(103, 'Лук красный вес ', 368, 'https://static-sl.insales.ru/images/products/1/5238/299742326/large_%D0%9B%D1%83%D0%BA_%D0%BA%D1%80%D0%B0%D1%81%D0%BD%D1%8B%D0%B9.jpg', 30),
(104, 'Перец ПАПРИКА 1 кг', 1955, 'https://static-sl.insales.ru/images/products/1/7541/299744629/large_%D0%BF%D0%B0%D0%BF%D1%80%D0%B8%D0%BA%D0%B0.jpg', 30),
(105, 'Авокадо ', 920, 'https://static-sl.insales.ru/images/products/1/1943/299747223/large_%D0%90%D0%B2%D0%BE%D0%BA%D0%B0%D0%B4%D0%BE.jpg', 31),
(106, 'Апельсины Египет 1 кг ', 750, 'https://static-sl.insales.ru/images/products/1/2383/299747663/large_%D0%B0%D0%BF%D0%B5%D0%BB%D1%8C%D1%81%D0%B8%D0%BD%D1%8B_%D0%95%D0%B3%D0%B8%D0%BF%D0%B5%D1%82.jpg', 31),
(107, 'Бананы 1 кг ', 660, 'https://static-sl.insales.ru/images/products/1/2774/299748054/large_%D0%B1%D0%B0%D0%BD%D0%B0%D0%BD%D1%8B.jpg', 31),
(108, 'Гранат 1 кг', 750, 'https://static-sl.insales.ru/images/products/1/3164/299748444/large_%D0%B3%D1%80%D0%B0%D0%BD%D0%B0%D1%82.jpg', 31),
(109, 'Грейпфрут 1 кг ', 920, 'https://static-sl.insales.ru/images/products/1/3274/299748554/large_%D0%93%D1%80%D0%B5%D0%B9%D0%BF%D1%84%D1%80%D1%83%D1%82_%D0%B2%D0%B5%D1%81.jpg', 31),
(110, 'Груша АРГЕНТИНА зеленая 1 кг ', 750, 'https://static-sl.insales.ru/images/products/1/3664/302247504/large_%D0%93%D1%80%D1%83%D1%88%D0%B0_%D0%90%D0%A0%D0%93%D0%95%D0%9D%D0%A2%D0%98%D0%9D%D0%90_%D0%B7%D0%B5%D0%BB%D0%B5%D0%BD%D0%B0%D1%8F_1_%D0%BA%D0%B3.jpg', 31),
(111, 'Груша КОНФЕРЕНЦИЯ 1 кг ', 920, 'https://static-sl.insales.ru/images/products/1/3479/299748759/large_%D0%93%D1%80%D1%83%D1%88%D0%B0_%D0%9A%D0%BE%D0%BD%D1%84%D0%B5%D1%80%D0%B5%D0%BD%D1%86%D0%B8%D1%8F.jpg', 31),
(112, 'Лайм 1 шт ', 230, 'https://static-sl.insales.ru/images/products/1/8189/299761661/large_%D0%9B%D0%B0%D0%B9%D0%BC.jpg', 31);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `name`, `password`) VALUES
(4, 'dkambarov17@gmail.com', 'Даурен', '$2y$10$RKhlxrQoeC3Y0k0aDdqHvOYYL2oKaCj5DOPsdATA0jokUsLErfMgm'),
(5, 'test@test', 'Tester', '$2y$10$4ffo3bbeUECKtYnsVyMK/.d1AHGxkVVWDH9R8OO0j9YSBdYKrnMWG');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
