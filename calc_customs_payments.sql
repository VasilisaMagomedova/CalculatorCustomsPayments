-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 30 2021 г., 13:51
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `calc_customs_payments`
--

-- --------------------------------------------------------

--
-- Структура таблицы `goods_categories`
--

CREATE TABLE `goods_categories` (
  `Category_ID` int(11) NOT NULL,
  `Category` varchar(255) NOT NULL,
  `Import_way` varchar(255) NOT NULL,
  `Transport_means` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods_categories`
--

INSERT INTO `goods_categories` (`Category_ID`, `Category`, `Import_way`, `Transport_means`) VALUES
(1, 'Товары для личного пользования', 'Сопровождаемый багаж', 'Воздушный'),
(2, 'Товары для личного пользования', 'Сопровождаемый багаж', 'Другой'),
(3, 'Товары для личного пользования', 'Несопровождаемый багаж', 'Воздушный'),
(4, 'Товары для личного пользования', 'Несопровождаемый багаж', 'Другой'),
(5, 'Товары для личного пользования', 'Доставка перевозчиком', NULL),
(6, 'Товары для личного пользования', 'Почтовое отправление', NULL),
(7, 'Алкогольные напитки и пиво', 'Сопровождаемый багаж', NULL),
(8, 'Алкогольные напитки и пиво', 'Несопровождаемый багаж', NULL),
(9, 'Алкогольные напитки и пиво', 'Доставка перевозчиком', NULL),
(10, 'Этиловый спирт', 'Сопровождаемый багаж', NULL),
(11, 'Этиловый спирт', 'Несопровождаемый багаж', NULL),
(12, 'Этиловый спирт', 'Доставка перевозчиком', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_customs_rates`
--

CREATE TABLE `goods_customs_rates` (
  `Rates_ID` int(11) NOT NULL,
  `Norms_ID` int(11) NOT NULL,
  `Cost_rate_percent` int(11) DEFAULT NULL,
  `Weight_rate_euro` int(11) DEFAULT NULL,
  `Quantity_rate_euro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods_customs_rates`
--

INSERT INTO `goods_customs_rates` (`Rates_ID`, `Norms_ID`, `Cost_rate_percent`, `Weight_rate_euro`, `Quantity_rate_euro`) VALUES
(1, 1, 30, 4, NULL),
(2, 2, 30, 4, NULL),
(3, 3, 30, 4, NULL),
(4, 4, 30, 4, NULL),
(5, 5, 15, 2, NULL),
(6, 6, 15, 2, NULL),
(7, 7, NULL, NULL, 10),
(8, 8, NULL, NULL, 10),
(9, 9, NULL, NULL, 10),
(10, 10, NULL, NULL, 22),
(11, 11, NULL, NULL, 22),
(12, 12, NULL, NULL, 22);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_import_norms`
--

CREATE TABLE `goods_import_norms` (
  `Norms_ID` int(11) NOT NULL,
  `Category_ID` int(11) NOT NULL,
  `Cost_norm_euro` decimal(8,2) DEFAULT NULL,
  `Weight_norm_kilos` decimal(5,2) DEFAULT NULL,
  `Quantity_norm` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods_import_norms`
--

INSERT INTO `goods_import_norms` (`Norms_ID`, `Category_ID`, `Cost_norm_euro`, `Weight_norm_kilos`, `Quantity_norm`) VALUES
(1, 1, '10000.00', '50.00', NULL),
(2, 2, '500.00', '25.00', NULL),
(3, 3, '10000.00', '50.00', NULL),
(4, 4, '500.00', '25.00', NULL),
(5, 5, '200.00', '31.00', NULL),
(6, 6, '200.00', '31.00', NULL),
(7, 7, NULL, NULL, 3),
(8, 8, NULL, NULL, 3),
(9, 9, NULL, NULL, 1),
(10, 10, NULL, NULL, 1),
(11, 11, NULL, NULL, 1),
(12, 12, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `info`
--

CREATE TABLE `info` (
  `Info_ID` int(11) NOT NULL,
  `Info_name` varchar(255) NOT NULL,
  `Info_sum` int(11) DEFAULT NULL,
  `Info_currency` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `info`
--

INSERT INTO `info` (`Info_ID`, `Info_name`, `Info_sum`, `Info_currency`) VALUES
(1, 'Таможенные сборы за таможенные операции', 500, ' руб.'),
(2, 'Беспошлинная норма ввоза не превышена', NULL, NULL),
(3, 'Таможенные платежи уплачивать не нужно', NULL, NULL),
(4, 'Таможенные платежи по единой ставке (за товары) - ', NULL, ' руб.'),
(5, 'Таможенные платежи по единой ставке (за алкоголь) - ', NULL, ' руб.'),
(6, 'Таможенные платежи по единой ставке (за этиловый спирт) - ', NULL, ' руб.'),
(7, 'Всего необходимо уплатить - ', NULL, ' руб.');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `goods_categories`
--
ALTER TABLE `goods_categories`
  ADD PRIMARY KEY (`Category_ID`);

--
-- Индексы таблицы `goods_customs_rates`
--
ALTER TABLE `goods_customs_rates`
  ADD PRIMARY KEY (`Rates_ID`),
  ADD KEY `Norms_ID` (`Norms_ID`);

--
-- Индексы таблицы `goods_import_norms`
--
ALTER TABLE `goods_import_norms`
  ADD PRIMARY KEY (`Norms_ID`),
  ADD KEY `Category_ID` (`Category_ID`);

--
-- Индексы таблицы `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`Info_ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `goods_categories`
--
ALTER TABLE `goods_categories`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `goods_customs_rates`
--
ALTER TABLE `goods_customs_rates`
  MODIFY `Rates_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `goods_import_norms`
--
ALTER TABLE `goods_import_norms`
  MODIFY `Norms_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `info`
--
ALTER TABLE `info`
  MODIFY `Info_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `goods_customs_rates`
--
ALTER TABLE `goods_customs_rates`
  ADD CONSTRAINT `goods_customs_rates_ibfk_1` FOREIGN KEY (`Norms_ID`) REFERENCES `goods_import_norms` (`Norms_ID`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `goods_import_norms`
--
ALTER TABLE `goods_import_norms`
  ADD CONSTRAINT `goods_import_norms_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `goods_categories` (`Category_ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
