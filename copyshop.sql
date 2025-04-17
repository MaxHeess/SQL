-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 14. Nov 2024 um 14:02
-- Server-Version: 10.4.32-MariaDB
-- PHP-Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `copyshop`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `addressen`
--

CREATE TABLE `addressen` (
  `Addr_id` int(11) NOT NULL,
  `PLZ` varchar(5) NOT NULL,
  `Wohnort` varchar(30) NOT NULL,
  `Strasse` varchar(30) NOT NULL,
  `Hausnr` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellposten`
--

CREATE TABLE `bestellposten` (
  `Postennr` int(11) NOT NULL,
  `Bestellnr` int(11) NOT NULL,
  `Kunden_id` int(11) NOT NULL,
  `Produkt` varchar(30) NOT NULL,
  `Format` varchar(30) NOT NULL,
  `Menge` int(11) NOT NULL,
  `Preis` float NOT NULL,
  `Artikelnr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bestellungen`
--

CREATE TABLE `bestellungen` (
  `Bestellnr` int(11) NOT NULL,
  `Kunden_id` int(11) NOT NULL,
  `l_addr_id` int(11) DEFAULT NULL,
  `r_addr_id` int(11) DEFAULT NULL,
  `Gesamtpreis` float NOT NULL,
  `Status_id` varchar(30) DEFAULT 'eingegangen',
  `Datum` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunden`
--

CREATE TABLE `kunden` (
  `Kunden_id` int(11) NOT NULL,
  `Nachname` varchar(30) NOT NULL,
  `Vorname` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Telefonnr` varchar(15) DEFAULT NULL,
  `iban` varchar(30) DEFAULT NULL,
  `pwhash` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kunden_addressen`
--

CREATE TABLE `kunden_addressen` (
  `id` int(11) NOT NULL,
  `Kunden_id` int(11) NOT NULL,
  `Addr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `addressen`
--
ALTER TABLE `addressen`
  ADD PRIMARY KEY (`Addr_id`);

--
-- Indizes für die Tabelle `bestellposten`
--
ALTER TABLE `bestellposten`
  ADD PRIMARY KEY (`Postennr`),
  ADD KEY `Bestellnr` (`Bestellnr`);

--
-- Indizes für die Tabelle `bestellungen`
--
ALTER TABLE `bestellungen`
  ADD PRIMARY KEY (`Bestellnr`),
  ADD KEY `Bestellnr` (`Bestellnr`),
  ADD KEY `r_addr_id` (`r_addr_id`),
  ADD KEY `l_addr_id` (`l_addr_id`),
  ADD KEY `Kunden_id` (`Kunden_id`);

--
-- Indizes für die Tabelle `kunden`
--
ALTER TABLE `kunden`
  ADD PRIMARY KEY (`Kunden_id`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `id` (`Kunden_id`);

--
-- Indizes für die Tabelle `kunden_addressen`
--
ALTER TABLE `kunden_addressen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Kunden_id` (`Kunden_id`),
  ADD KEY `Addr_id` (`Addr_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `addressen`
--
ALTER TABLE `addressen`
  MODIFY `Addr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `bestellposten`
--
ALTER TABLE `bestellposten`
  MODIFY `Postennr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `bestellungen`
--
ALTER TABLE `bestellungen`
  MODIFY `Bestellnr` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kunden`
--
ALTER TABLE `kunden`
  MODIFY `Kunden_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `kunden_addressen`
--
ALTER TABLE `kunden_addressen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bestellungen`
--
ALTER TABLE `bestellungen`
  ADD CONSTRAINT `bestellungen_ibfk_1` FOREIGN KEY (`r_addr_id`) REFERENCES `addressen` (`Addr_id`),
  ADD CONSTRAINT `bestellungen_ibfk_2` FOREIGN KEY (`l_addr_id`) REFERENCES `addressen` (`Addr_id`),
  ADD CONSTRAINT `bestellungen_ibfk_3` FOREIGN KEY (`Kunden_id`) REFERENCES `kunden` (`Kunden_id`);

--
-- Constraints der Tabelle `kunden_addressen`
--
ALTER TABLE `kunden_addressen`
  ADD CONSTRAINT `kunden_addressen_ibfk_1` FOREIGN KEY (`Kunden_id`) REFERENCES `kunden` (`Kunden_id`),
  ADD CONSTRAINT `kunden_addressen_ibfk_2` FOREIGN KEY (`Addr_id`) REFERENCES `addressen` (`Addr_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
