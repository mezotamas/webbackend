-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Ápr 05. 11:31
-- Kiszolgáló verziója: 10.4.27-MariaDB
-- PHP verzió: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `vallas`
--
CREATE DATABASE IF NOT EXISTS `vallas` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `vallas`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `idezet`
--

CREATE TABLE `idezet` (
  `idezet_id` int(11) NOT NULL,
  `idezet_szoveg` varchar(1000) NOT NULL,
  `idezet_datum` datetime NOT NULL DEFAULT current_timestamp(),
  `idezet_konyv` varchar(75) NOT NULL,
  `idezet_fejezet_vers` varchar(50) NOT NULL,
  `idezet_kategoria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `idezet`
--

INSERT INTO `idezet` (`idezet_id`, `idezet_szoveg`, `idezet_datum`, `idezet_konyv`, `idezet_fejezet_vers`, `idezet_kategoria`) VALUES
(1, 'Hát nem azt a parancsot adtam neked, hogy légy erős és kitartó? Ne félj és ne aggódj tehát, mert az Úr, a te Istened veled lesz mindenütt, ahova csak mész.', '2023-01-04 13:58:30', 'Józsue könyve', '1,9', 2),
(2, ' Közel az Úr mindenkihez, aki hozzá kiált, mindenkihez, aki tiszta szívből hívja.', '2023-01-18 13:58:30', 'Zsoltárok', '145,18', 3),
(3, 'Ahogy a szarvasünő a forrás vizére kívánkozik, úgy vágyakozik a lelkem utánad, Uram.', '2023-01-01 13:58:30', 'Zsoltárok', '42, 2', 4),
(4, 'Szeretteim, szeressük egymást: mert a szeretet az Istentől van; és mindaz, a ki szeret, az Istentől született, és ismeri az Istent. A ki nem szeret, nem ismerte meg az Istent; mert az Isten szeretet.', '2023-01-16 13:58:30', '1 János', '4:7–8', 1),
(5, 'Szeressed azért az Urat, a te Istenedet teljes szívedből, teljes lelkedből, és teljes elmédből és teljes erődből. Ez az első parancsolat.” A második pedig hasonlatos ehhez: Szeresd felebarátodat, mint magadat.', '2022-01-21 13:58:30', 'Márk', '12:30–31', 2),
(6, 'Új parancsolatot adok néktek, hogy egymást szeressétek; a mint én szerettelek titeket, úgy szeressétek ti is egymást. Erről ismeri meg mindenki, hogy az én tanítványaim vagytok, ha egymást szeretni fogjátok.', '2023-01-09 13:58:30', 'János ', '13:34–35', 1),
(7, 'Eljön a nap, amikor felépítik falaidat,\r\nazon a napon szélesre tágul a határ.', '2023-01-02 13:58:30', 'Mik', '7,11', 3),
(9, 'Amikor Dávid király élemedett korú ember lett, takarókba burkolták, mégsem tudott1	Amikor Dávid király élemedett korú ember lett, takarókba burkolták, mégsem tudott fölmelegedni. fölmelegedni.', '2023-01-02 13:58:30', '', '', 1),
(225, 'És monda az Úr Józsuénak: Lásd! kezedbe adtam Jérikhót és királyát a sereg vitézeivel együtt.', '2023-01-27 14:03:43', '3', '2', 2),
(308, '', '2023-02-10 14:40:09', '', '', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoria`
--

CREATE TABLE `kategoria` (
  `kategoria_id` int(11) NOT NULL,
  `kategoria_nev` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoria`
--

INSERT INTO `kategoria` (`kategoria_id`, `kategoria_nev`) VALUES
(1, 'szeretet'),
(2, 'beszéd'),
(3, 'tanítás'),
(4, 'ünnep');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `roles`
--

INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
(1, 'user', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(2, 'moderator', '2020-08-02 14:57:31', '2020-08-02 14:57:31'),
(3, 'admin', '2020-08-02 14:57:31', '2020-08-02 14:57:31');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'user', 'user', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'mod', 'mod', '$2a$08$gXM4pyuhZFlC72PeAwxrUOR0uA31/d2PdgnHP35JGV.0bQNiZBatS', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'admin', 'admin', '$2a$08$97Ze1/hXfOX44WdC62Rq8uRkog9HYC1HukRX8eld2ZEKPyenM5v.G', '2020-08-02 15:03:59', '2020-08-02 15:03:59');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `user_roles`
--

CREATE TABLE `user_roles` (
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `user_roles`
--

INSERT INTO `user_roles` (`createdAt`, `updatedAt`, `roleId`, `userId`) VALUES
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 1),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 1, 3),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 2),
('0000-00-00 00:00:00', '0000-00-00 00:00:00', 2, 3),
('2020-08-02 15:04:00', '2020-08-02 15:04:00', 3, 3);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `velemeny`
--

CREATE TABLE `velemeny` (
  `velemeny_id` int(11) NOT NULL,
  `velemeny_szoveg` varchar(1000) NOT NULL,
  `velemeny_idopont` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `velemeny_idezet_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `velemeny`
--

INSERT INTO `velemeny` (`velemeny_id`, `velemeny_szoveg`, `velemeny_idopont`, `velemeny_idezet_id`) VALUES
(49, 'Ez egy jó ', '2023-01-23 17:51:24', 4),
(108, 'Nagyon szep', '2023-02-10 13:33:07', 225),
(113, '', '2023-02-10 14:40:23', 2);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `idezet`
--
ALTER TABLE `idezet`
  ADD PRIMARY KEY (`idezet_id`),
  ADD KEY `idezet_kategoria` (`idezet_kategoria`);

--
-- A tábla indexei `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`kategoria_id`);

--
-- A tábla indexei `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`roleId`,`userId`),
  ADD KEY `userId` (`userId`);

--
-- A tábla indexei `velemeny`
--
ALTER TABLE `velemeny`
  ADD PRIMARY KEY (`velemeny_id`),
  ADD KEY `velemeny_idezet_id` (`velemeny_idezet_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `idezet`
--
ALTER TABLE `idezet`
  MODIFY `idezet_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- AUTO_INCREMENT a táblához `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `kategoria_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT a táblához `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT a táblához `velemeny`
--
ALTER TABLE `velemeny`
  MODIFY `velemeny_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `idezet`
--
ALTER TABLE `idezet`
  ADD CONSTRAINT `idezet_ibfk_1` FOREIGN KEY (`idezet_kategoria`) REFERENCES `kategoria` (`kategoria_id`);

--
-- Megkötések a táblához `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `velemeny`
--
ALTER TABLE `velemeny`
  ADD CONSTRAINT `velemeny_ibfk_1` FOREIGN KEY (`velemeny_idezet_id`) REFERENCES `idezet` (`idezet_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
