-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2022 at 05:34 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


Database: `toby`


DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `CurrentMonthBirthdays` ()   BEGIN
	SELECT name, dob FROM employees WHERE month(dob) = month(now());
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `complaints`
--

CREATE TABLE `complaints` (
  `complaint_id` int(11) NOT NULL,
  `date_of_complaint` date NOT NULL,
  `person_complaint` varchar(50) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `employee_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(64) NOT NULL,
  `house_no_customer` int(11) NOT NULL,
  `street_customer` int(11) NOT NULL,
  `postcode_customer` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_order`
--

CREATE TABLE `c_order` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delete_audit`
--

CREATE TABLE `delete_audit` (
  `emp_id_del` varchar(11) NOT NULL,
  `del_date` datetime NOT NULL,
  `del_by` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_no` int(11) NOT NULL,
  `manager_id` varchar(11) NOT NULL,
  `manager_name_emp` varchar(100) NOT NULL,
  `department_name` varchar(50) NOT NULL,
  `employee_no_dept` int(11) NOT NULL,
  `head_office_location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_no`, `manager_id`, `manager_name_emp`, `department_name`, `employee_no_dept`, `head_office_location`) VALUES
(1, '74-0303597', 'Bria Thomkins', 'Driver', 70, 'Manchester'),
(2, '87-4865660', 'Jase Fulk', 'HR', 50, 'London'),
(3, '33-1897506', 'Verla Seacroft', 'Manager', 10, 'Manchester'),
(4, '93-5661312', 'Gordie Gaynesford', 'Packager', 60, 'Manchester');

-- --------------------------------------------------------

--
-- Table structure for table `department_details`
--

CREATE TABLE `department_details` (
  `department_no` int(11) NOT NULL,
  `department_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `employee_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `area` varchar(50) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `manager_id` varchar(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emergency_contact`
--

CREATE TABLE `emergency_contact` (
  `employee_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `emergency_name` varchar(250) NOT NULL,
  `emergency_relationship` varchar(100) NOT NULL,
  `emergency_phone` varchar(15) NOT NULL COMMENT 'People may add country codes as well'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `emergency_contact`
--

INSERT INTO `emergency_contact` (`employee_id`, `emergency_name`, `emergency_relationship`, `emergency_phone`) VALUES
('58-1884587', 'Riley Cruise', 'Father', '07161 248 632'),
('22-5924187', 'Holly Glaren', 'Mother', '07511 368 733'),
('97-4321387', 'Grace Williams', 'Mother', '07002 172 725'),
('41-6191387', 'Meerab Manzoor', 'Sister', '07232 861 851'),
('53-1234567', 'Clay Cooper', 'Father', '07515 864 721'),
('72-1534527', 'Randy Perkins', 'Father', '07516 815 632'),
('81-6234529', 'Darwin Bradey', 'Father', '07342 611 725'),
('43-6543212', 'Dan Hoover', 'Father', '07452 539 216'),
('52-6523811', 'John Wills', 'Father', '07212 718 912'),
('76-9223723', 'Richard Buck', 'Father', '07612 271 422'),
('72-3232197', 'Harry Payne', 'Father', '07812 777 293'),
('81-8642645', 'Jake Collins', 'Father', '07532 717 492'),
('31-4342493', 'Omar Kahaleh', 'Father', '07732 893 712'),
('63-8539273', 'Ariana Bill', 'Sister', '07534 853 916'),
('23-5369219', 'Shahveer Jafry', 'Husband', '07726 827 128');

-- --------------------------------------------------------

--
-- Table structure for table `employeee`
--

CREATE TABLE `employeee` (
  `employee_id` varchar(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `salary` int(11) NOT NULL,
  `dob` date NOT NULL,
  `nin` varchar(9) NOT NULL,
  `belongs_to_dept` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employeee`
--

INSERT INTO `employeee` (`employee_id`, `name`, `address`, `salary`, `dob`, `nin`, `belongs_to_dept`) VALUES
('22-5924187', 'Mellisa Diver', '8273 Notwil St.', 43100, '1995-02-04', 'hd123156n', 'HR'),
('23-5369219', 'Lily Singh', '7263 Flix St.', 23000, '0000-00-00', 'ls391378d', 'HR'),
('31-4342493', 'Kareem Kahaleh', '9538 Soni St.', 40600, '2003-03-10', 'kk593789c', 'Driver'),
('41-6191387', 'Ahmad Zahid', '5181 Batin St.', 40281, '2000-12-02', 'am181189m', 'HR'),
('43-6543212', 'Collen Hoover', '7532 Girley St.', 60700, '2003-04-11', 'ch765298b', 'Driver'),
('52-6523811', 'Lauren Wills', '6281 Bilm St.', 81720, '1982-02-02', 'lw455499q', 'Driver'),
('53-1234567', 'Lisa Cooper', '1789 Campness St.', 28850, '1985-04-05', 'az123456m', 'Driver'),
('58-1884587', 'Manya Featon', '5281 Blubon St.', 30250, '1992-12-02', 'nm129156b', 'Packager'),
('63-8539273', 'Aura Shilly', '8127 Newton St.', 45000, '2003-03-04', 'as836372b', 'Packager'),
('72-1534527', 'Ria Perkins', '6875 Bel St.', 54100, '1994-09-02', 'vr826391b', 'Driver'),
('72-3232197', 'Liam Payne', '3819 Brook St.', 45600, '1995-05-03', 'lp453594f', 'Driver'),
('76-9223723', 'Chloe Buck', '6912 Rol St.', 23010, '1999-06-02', 'cb328792h', 'Driver'),
('81-6234529', 'Selena Bradey', '5321 Lelii St.', 34500, '2001-02-16', 'vr871392n', 'Driver'),
('81-8642645', 'Samantha Collins', '7514 Lipty St.', 35090, '2001-07-11', 'sc673535g', 'Driver'),
('97-4321387', 'Gordan Ramsey', '8918 Food St.', 80182, '1985-04-06', 'gr171156f', 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` varchar(10) NOT NULL,
  `name` varchar(22) DEFAULT NULL,
  `address` varchar(27) DEFAULT NULL,
  `salary` varchar(10) DEFAULT NULL,
  `dob` varchar(10) DEFAULT NULL,
  `nin` varchar(9) DEFAULT NULL,
  `department` varchar(8) DEFAULT NULL,
  `emergency_name` varchar(23) DEFAULT NULL,
  `emergency_relationship` varchar(13) DEFAULT NULL,
  `emergency_phone` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `name`, `address`, `salary`, `dob`, `nin`, `department`, `emergency_name`, `emergency_relationship`, `emergency_phone`) VALUES
('00-4334715', 'Stormie Lowndes', '280 Thompson Plaza', '?66,017.87', '1964-11-20', 'xn991742p', 'HR', 'Anastasia Camamile', 'Civil Partner', '07043 627 535'),
('01-5576008', 'Jaquenetta Rankin', '3249 Dahle Plaza', '?42,698.62', '1988-12-28', 'ir187391u', 'Packager', 'Gustave Benedikt', 'Husband', '07689 714 850'),
('01-6146269', 'Krispin Eastmond', '584 Twin Pines Place', '?46,304.52', '1956-04-25', 'oc293284f', 'Driver', 'Chandra Tiesman', 'Father', '07829 492 462'),
('01-9065592', 'Catina Josovitz', '09 Center Alley', '?78,353.10', '1974-12-09', 'gl907590t', 'Driver', 'Zachariah Trassler', 'Girlfriend', '07670 477 662'),
('01-9983285', 'Evvy Burrill', '18 Pennsylvania Crossing', '?65,007.09', '1994-08-02', 'pz402630g', 'HR', 'Dianne Pease', 'Wife', '07983 466 814'),
('02-1151200', 'Bax Di Gregorio', '34063 Fordem Way', '?76,631.69', '1983-01-13', 'kt775367m', 'Driver', 'Eb Ludlem', 'Boyfriend', '07258 306 130'),
('02-4109274', 'Efren Sealove', '7623 Lien Center', '?59,217.95', '1967-03-30', 'jk980246h', 'Driver', 'Aksel Ticehurst', 'Girlfriend', '07496 100 258'),
('02-6214516', 'Merrill Joust', '75 Portage Center', '?51,515.84', '1958-01-16', 'wa104983f', 'Driver', 'Amabelle Ferreiro', 'Wife', '07395 862 130'),
('02-9566746', 'Dud Firman', '467 Lighthouse Bay Junction', '?35,155.65', '1961-08-08', 'xs400698x', 'Packager', 'Forster Naisby', 'Civil Partner', '07236 732 030'),
('03-2826761', 'Pyotr Ingham', '81 John Wall Junction', '?38,532.11', '1990-01-17', 'ys435194s', 'Packager', 'Brnaby Snoday', 'Husband', '07570 183 764'),
('03-3544565', 'Feodor Inge', '5 Knutson Plaza', '?91,614.47', '1961-12-03', 'en390360s', 'Packager', 'Nolie Turfitt', 'Boyfriend', '07872 652 134'),
('04-1386775', 'Omero Hurles', '878 Vidon Point', '?85,092.27', '1985-05-25', 'zz594734b', 'Driver', 'Judas Tonn', 'Mother', '07354 878 768'),
('04-2608361', 'Homer Bresman', '84058 Hayes Parkway', '?66,224.45', '1970-03-21', 'ku802868l', 'Driver', 'Ileana Wicken', 'Girlfriend', '07816 723 310'),
('04-2758260', 'Simeon Dilworth', '749 Summit Circle', '?63,320.02', '1974-04-10', 'ql275702i', 'Driver', 'Filberto Railton', 'Wife', '07719 120 956'),
('04-2798023', 'Cinda Plesing', '57518 Chinook Park', '?49,509.39', '1988-06-29', 'bl772452l', 'Packager', 'Corabella Possek', 'Girlfriend', '07171 514 291'),
('05-1128789', 'Paulita Casewell', '18 Riverside Trail', '?73,099.76', '1995-06-15', 'ds948250k', 'Driver', 'Bambie Bennell', 'Father', '07411 921 600'),
('05-1945849', 'Cherilyn Jepps', '062 Nevada Parkway', '?85,550.33', '1971-10-30', 'xz796669h', 'Driver', 'Michaelina Brahms', 'Civil Partner', '07996 211 011'),
('05-3647243', 'Yank Vasilyonok', '5 Debs Alley', '?38,871.26', '1999-02-23', 'kc608204k', 'Packager', 'Arlie Korfmann', 'Husband', '07348 062 445'),
('05-5059849', 'Giffard Endecott', '13672 Caliangt Terrace', '?30,809.16', '1953-03-14', 'tu153415t', 'Packager', 'Joela Artois', 'Boyfriend', '07419 063 793'),
('05-5646283', 'Karole Roderighi', '6281 Hovde Road', '?83,507.63', '1988-12-22', 'np061992l', 'Driver', 'Jacky Schwandt', 'Father', '07787 718 899'),
('05-9682452', 'Dorothee Pennell', '90 Rutledge Circle', '?44,159.39', '1977-04-27', 'bo740928h', 'Driver', 'Odelle Godsmark', 'Wife', '07530 434 901'),
('06-0280761', 'Odey Smeeth', '46584 Kedzie Point', '?97,871.00', '2000-07-23', 'rz638367h', 'HR', 'Troy Danielis', 'Boyfriend', '07543 372 808'),
('06-2857563', 'Osgood Sutherby', '88855 Merrick Road', '?27,045.62', '1990-08-20', 'ya877759r', 'Manager', 'Joyann Spellessy', 'Husband', '07873 688 139'),
('06-3396053', 'Hayes Butting', '120 Lotheville Pass', '?50,125.67', '1958-09-26', 'jm300330r', 'Packager', 'Margot Barabich', 'Boyfriend', '07585 007 222'),
('06-3776558', 'Kristofer Janson', '18140 Straubel Road', '?94,483.61', '1972-03-01', 'pw205885r', 'Packager', 'Boony Hardwell', 'Wife', '07211 259 256'),
('06-3850682', 'Celinda Joberne', '5 Jana Way', '?61,612.72', '1993-12-03', 'lw782748u', 'Driver', 'Harmon Gindghill', 'Civil Partner', '07285 352 836'),
('06-7381402', 'Pansy Benasik', '777 Welch Junction', '?41,672.28', '1953-03-04', 'rb727027l', 'Driver', 'Melodee Sillars', 'Boyfriend', '07822 069 566'),
('06-9710935', 'Wileen Elwell', '82 Tennyson Alley', '?78,678.52', '1991-09-21', 'no969473z', 'Packager', 'Stevy Cestard', 'Husband', '07510 562 958'),
('07-4517183', 'Rochell O\'Doohaine', '1802 Hayes Court', '?25,471.21', '1973-11-08', 'rz111360g', 'Packager', 'Regan Yarn', 'Mother', '07967 811 408'),
('07-4724394', 'Christiane Barnes', '2958 Butterfield Point', '?51,949.10', '1965-08-25', 'vw694872r', 'Packager', 'Augustine Corstorphine', 'Father', '07793 242 869'),
('08-4428147', 'Daryl Chartman', '2413 Ramsey Avenue', '?58,749.21', '1996-08-06', 'ad905076o', 'Packager', 'Sydel Dexter', 'Father', '07795 010 970'),
('08-5459846', 'Leola Dayly', '1 Tony Avenue', '?43,761.91', '1995-02-24', 'xz369649i', 'Driver', 'Claudetta Plaistowe', 'Civil Partner', '07358 746 653'),
('08-7213723', 'Dorie Brazener', '7720 Miller Way', '?14,357.12', '1966-01-19', 'qa101983v', 'Driver', 'Melody Brotherwood', 'Wife', '07735 358 950'),
('09-2857613', 'Faunie Testo', '903 Pawling Terrace', '?42,813.15', '1952-09-02', 'yh126921t', 'Driver', 'Lorrin Morman', 'Boyfriend', '07627 803 411'),
('09-4017521', 'Flemming Arnoll', '2 Eggendart Crossing', '?22,873.04', '2002-08-03', 'sb614856m', 'HR', 'Brear Kluge', 'Husband', '07267 762 763'),
('09-4856118', 'Sofie Cavaney', '12677 Northridge Alley', '?19,096.73', '1966-10-24', 'hg982259y', 'Driver', 'Krisha Mingasson', 'Mother', '07594 793 358'),
('09-8147999', 'Alfonso Pirdue', '201 Garrison Crossing', '?60,175.71', '1950-01-27', 'pq325071u', 'Packager', 'Charmain Ewbanck', 'Husband', '07876 106 377'),
('10-1743239', 'Clareta Bamlet', '1038 Bellgrove Parkway', '?46,542.99', '1964-04-09', 'tx858508r', 'Packager', 'Selia Sopp', 'Husband', '07937 394 557'),
('10-4168432', 'Robinetta Triswell', '5 Independence Trail', '?74,033.43', '1956-09-29', 'eu934314q', 'Packager', 'Ivett Rapier', 'Boyfriend', '07016 239 710'),
('10-6127924', 'Joshuah Faircliffe', '8 Merry Center', '?30,666.21', '1992-09-16', 'ft026339d', 'Packager', 'Freddie Lorie', 'Husband', '07975 207 662'),
('10-6321236', 'Janot Kleinsinger', '4324 Huxley Point', '?59,407.49', '1982-10-05', 'vw739034c', 'HR', 'Tasha Bromilow', 'Civil Partner', '07666 955 404'),
('10-6680137', 'Burnaby McGreay', '55 Hansons Center', '?54,552.70', '1971-09-13', 'xz020089e', 'Driver', 'Dion Tolson', 'Mother', '07154 115 530'),
('10-8148353', 'Frannie Pedron', '85 Meadow Valley Avenue', '?20,034.33', '1979-10-10', 'kw816523w', 'HR', 'Llywellyn Buckley', 'Girlfriend', '07978 885 045'),
('10-9736161', 'Pet Littrik', '19 Haas Pass', '?99,117.25', '1981-10-01', 'fa725896g', 'Driver', 'Cecil Gathercoal', 'Wife', '07480 391 714'),
('11-0990160', 'Rhea Saffle', '77051 Shasta Circle', '?37,907.97', '1999-06-12', 'el763944v', 'Packager', 'Jeane Fleet', 'Girlfriend', '07452 139 490'),
('11-4556284', 'Joceline Oats', '8 East Pass', '?19,329.56', '1963-08-11', 'iu795663w', 'Packager', 'Mariejeanne Prendeville', 'Mother', '07474 771 437'),
('11-5411031', 'Joaquin Eringey', '890 Brickson Park Circle', '?76,521.21', '1959-03-09', 'di653042t', 'Driver', 'Damian Elsworth', 'Wife', '07934 375 220'),
('11-6489646', 'Alfie Glasebrook', '5942 Del Mar Court', '?24,207.50', '1987-08-25', 'kc363601g', 'HR', 'Ogden Wynne', 'Father', '07740 998 062'),
('11-9162644', 'Ninnette Reach', '018 2nd Parkway', '?33,411.86', '2002-04-11', 'qi586048l', 'Driver', 'Gerry Bastone', 'Boyfriend', '07831 515 385'),
('12-0104092', 'Gerladina MacGinney', '270 Melody Park', '?26,606.61', '1992-12-29', 'pc545418r', 'Packager', 'Sibyl Danovich', 'Girlfriend', '07655 343 095'),
('12-5128654', 'Hadlee Stealey', '0 4th Court', '?52,510.07', '1997-11-17', 'tf577069v', 'Packager', 'Renee Kubatsch', 'Mother', '07643 213 336'),
('12-6888959', 'Benoit Collman', '827 Erie Junction', '?74,922.96', '1982-12-12', 'yc393041q', 'Packager', 'Neila Haimes', 'Girlfriend', '07794 407 646'),
('12-8760096', 'Mallorie De Brett', '1 Lillian Drive', '?27,166.70', '1987-05-25', 'gb976841w', 'Packager', 'Thain Kellard', 'Boyfriend', '07540 241 186'),
('13-8722134', 'Adler Wheeliker', '018 Lakewood Parkway', '?97,905.35', '1979-01-25', 'gd959536a', 'Packager', 'Karel Gully', 'Father', '07088 509 851'),
('13-9234597', 'Katya Ilewicz', '68697 Sutteridge Road', '?62,528.81', '1977-08-21', 'he783674o', 'Packager', 'Cull Harraway', 'Mother', '07970 418 060'),
('14-0432288', 'Marius Brosnan', '94941 Fairfield Terrace', '?35,816.39', '1996-07-07', 'fp824869e', 'Driver', 'Palmer Vial', 'Civil Partner', '07277 220 402'),
('14-1209073', 'Cheri Cancellieri', '97763 Anhalt Way', '?62,678.28', '1993-09-07', 'fj377449j', 'Driver', 'Leesa Bonhome', 'Wife', '07668 929 915'),
('14-2911172', 'Koren McCluskey', '6677 Evergreen Plaza', '?73,800.93', '1955-08-11', 'ox915931w', 'Packager', 'Rolph Reast', 'Wife', '07388 570 448'),
('14-4001908', 'Wilmette Jerrom', '6 Monica Way', '?34,082.14', '1974-10-30', 'gb391445q', 'Packager', 'Zaneta Deddum', 'Mother', '07529 897 607'),
('14-6532726', 'Salim Cator', '74 Lyons Place', '?40,060.04', '1988-05-30', 'os724826w', 'Packager', 'Diannne Streight', 'Boyfriend', '07974 403 769'),
('14-9076003', 'Padgett Casel', '3552 Towne Road', '?61,058.36', '1956-06-02', 'ws394988s', 'Driver', 'Nathalia Frake', 'Boyfriend', '07568 334 465'),
('15-4783339', 'Ermengarde Breitling', '2376 Brentwood Place', '?18,516.54', '1963-07-06', 'qh838641y', 'HR', 'Bord Bartoletti', 'Mother', '07369 214 958'),
('15-5837614', 'Loren Kupper', '24 West Plaza', '?92,010.30', '1999-07-10', 'tx310999b', 'Driver', 'Lazarus Pomeroy', 'Boyfriend', '07288 097 464'),
('15-6949928', 'Dominique Causon', '2 Mallard Way', '?61,194.11', '1978-11-16', 'jz826946h', 'Driver', 'Marwin Haburne', 'Husband', '07467 024 579'),
('16-0283796', 'Delphinia Skelhorn', '115 Cody Point', '?91,026.23', '1969-08-29', 'mx935884p', 'Driver', 'Zita Greasty', 'Father', '07672 610 977'),
('16-1242322', 'Gris Elington', '12 School Way', '?40,776.94', '1963-12-30', 'sp696523t', 'Driver', 'Jon Guisby', 'Boyfriend', '07770 964 956'),
('17-1342407', 'Mala Eyree', '6 Dorton Circle', '?24,532.92', '1993-07-14', 'kf326923s', 'Driver', 'Traci Hammersley', 'Wife', '07950 182 116'),
('17-1925809', 'Donella Chinery', '3 Tennessee Street', '?31,438.66', '1970-02-12', 'xr596082y', 'Packager', 'Klara Eckford', 'Girlfriend', '07580 481 684'),
('17-3967296', 'Tiffany Wessing', '422 Darwin Lane', '?69,965.03', '1983-03-09', 'fi082187y', 'Packager', 'Layne Laurenty', 'Boyfriend', '07925 739 484'),
('17-5831110', 'Viviana Dreschler', '3 Oak Terrace', '?56,587.83', '1954-11-28', 'vx435216w', 'Driver', 'Hurley Nadin', 'Husband', '07141 801 105'),
('18-0534773', 'Alix Ambrogelli', '60 North Place', '?62,229.76', '1960-10-22', 'ny144248g', 'Packager', 'Harrietta Arpin', 'Mother', '07469 896 525'),
('18-3863597', 'Tamiko Holton', '49 Cody Lane', '?97,318.42', '1960-10-15', 'dm359618l', 'Packager', 'Hagen Lantoph', 'Wife', '07512 531 127'),
('18-3911956', 'Rafferty Edowes', '96 Helena Crossing', '?41,496.02', '1988-07-24', 'yk522444d', 'HR', 'Francene Licquorish', 'Husband', '07831 756 132'),
('18-6142811', 'Starr Akhurst', '42 Golf Course Hill', '?16,005.59', '1951-06-01', 'qj120357r', 'Packager', 'Augustus Goodluck', 'Mother', '07997 004 063'),
('18-9171336', 'Sallie Hardwell', '6 Golf View Pass', '?80,829.14', '1983-09-20', 'yx656704n', 'Packager', 'Marsh Abilowitz', 'Wife', '07026 832 505'),
('19-0713712', 'Georg De Gouy', '06 Hermina Terrace', '?37,144.20', '1993-01-18', 'vi744437v', 'Packager', 'Leoine Ayrs', 'Boyfriend', '07403 137 340'),
('19-1079892', 'Charline Saggers', '32 Burning Wood Alley', '?85,860.59', '1995-11-26', 'uw710251u', 'Packager', 'Concordia Marklund', 'Civil Partner', '07959 795 234'),
('19-1277494', 'Perice Abramovitz', '2354 Jenifer Place', '?55,612.48', '1964-09-30', 'bs437833j', 'Packager', 'Sella Ronca', 'Civil Partner', '07235 827 256'),
('19-6732633', 'Ferrell Lages', '39705 Goodland Center', '?63,515.05', '1996-04-23', 'xb032437g', 'Driver', 'Ramsey Denacamp', 'Boyfriend', '07342 317 379'),
('20-2758343', 'Harrison Waller-Bridge', '73899 Sachtjen Alley', '?39,846.48', '1991-04-25', 'dw797814s', 'HR', 'Alaine Gozney', 'Girlfriend', '07874 802 135'),
('20-3044693', 'Raina Yearn', '7 Havey Point', '?91,757.16', '1972-09-03', 'uz970481u', 'Driver', 'Caroline Brinicombe', 'Father', '07276 959 298'),
('20-5440287', 'Doralyn Freemantle', '33 Gateway Crossing', '?36,023.61', '1994-05-11', 'oj166622v', 'Driver', 'Adena Vasyuchov', 'Husband', '07515 558 479'),
('20-6300983', 'Juliann Profit', '047 Mandrake Drive', '?59,829.91', '1963-05-11', 'bx776119o', 'Driver', 'Caresa McGeown', 'Girlfriend', '07546 091 676'),
('20-7194686', 'Carolin Jagson', '57891 Bultman Circle', '?56,278.56', '1953-12-06', 'yb039141a', 'HR', 'Grove Spellissy', 'Husband', '07555 870 467'),
('20-7886428', 'Dael Confort', '0533 Grasskamp Park', '?56,391.77', '1999-12-30', 'ee121177l', 'Packager', 'Elisa McNamee', 'Boyfriend', '07173 106 494'),
('20-9516100', 'Cordula Redsull', '3 Sullivan Lane', '?70,412.31', '1953-05-14', 'mu901992i', 'Driver', 'Noelle Physick', 'Mother', '07224 883 037'),
('21-1787461', 'Stefa Stringman', '3 Lake View Lane', '?76,206.39', '1987-12-09', 'qn206371i', 'Driver', 'Brittan Rubroe', 'Girlfriend', '07620 851 960'),
('21-2689388', 'Mildrid Ethington', '4 Buhler Pass', '?18,703.01', '1950-01-06', 'kp709951v', 'Packager', 'Cordey Peer', 'Girlfriend', '07645 326 285'),
('21-3155551', 'Alaric Santarelli', '8757 Thompson Trail', '?24,449.19', '1959-09-28', 'hn280217c', 'Packager', 'Durand Klassman', 'Father', '07324 591 670'),
('21-4089887', 'Corette Mourbey', '246 Wayridge Hill', '?76,423.32', '1983-06-04', 'km813203w', 'Driver', 'Aksel Gallimore', 'Father', '07677 246 578'),
('22-0788973', 'Kalvin Corrado', '770 Fallview Trail', '?59,688.79', '1980-11-07', 'ei247057v', 'Driver', 'Eunice Chmarny', 'Father', '07717 672 468'),
('22-2051613', 'Alys Feye', '000 Grayhawk Court', '?50,021.50', '1975-01-21', 'rs859776q', 'Packager', 'Stearne Coveny', 'Girlfriend', '07552 624 180'),
('22-3052971', 'Giorgia McCrohon', '80323 Myrtle Court', '?91,699.68', '1984-02-09', 'jk018371c', 'Driver', 'Goddard Schenkel', 'Boyfriend', '07248 542 532'),
('22-3708071', 'Rab Feast', '9503 Buell Drive', '?30,397.56', '1986-04-01', 'rb499211c', 'HR', 'Jereme Slayford', 'Girlfriend', '07721 065 357'),
('22-6627032', 'Brynna Dyble', '0 Bonner Pass', '?23,496.30', '1979-05-05', 'al340446b', 'Packager', 'Noland Doret', 'Boyfriend', '07157 222 552'),
('22-7191567', 'Goddard Bagot', '362 Coleman Way', '?90,643.98', '1980-05-24', 'lx057194p', 'Driver', 'Jeremiah Pavlasek', 'Father', '07425 200 343'),
('22-9529013', 'Reginauld Oak', '8 Pleasure Drive', '?80,693.80', '1955-03-25', 'ju954932e', 'Packager', 'Hieronymus Eldon', 'Mother', '07315 598 289'),
('24-4585192', 'Elvira Vinson', '37 Kipling Lane', '?91,216.82', '1966-06-10', 'sa107205q', 'Packager', 'Nariko Illsley', 'Civil Partner', '07008 281 309'),
('24-4677621', 'Derril Scaife', '4 Tony Street', '?82,281.31', '1965-01-08', 'qb596623c', 'Packager', 'Inness Hendrick', 'Father', '07196 056 242'),
('24-6851371', 'Puff Speeding', '22016 New Castle Hill', '?78,841.84', '1951-11-12', 'mh954487u', 'Driver', 'Esme MacGlory', 'Girlfriend', '07291 150 140'),
('24-9067553', 'Lief Schimann', '4786 Rowland Trail', '?87,146.69', '1957-07-01', 'xo554182r', 'Packager', 'Shannon McGinty', 'Girlfriend', '07499 192 522'),
('24-9840403', 'Ashley Barcke', '7 Eastlawn Alley', '?33,391.07', '1968-07-30', 'ww328815i', 'Packager', 'Iseabal Leidl', 'Girlfriend', '07683 879 132'),
('25-4103329', 'Elfrieda Slessar', '5536 Stone Corner Terrace', '?64,639.39', '1954-02-02', 'ri926857q', 'Driver', 'Baxie De Rye Barrett', 'Wife', '07594 266 644'),
('25-6187206', 'Farlay Haughan', '99 Schurz Plaza', '?63,905.08', '1984-08-21', 'fg558529z', 'Driver', 'Sandye De Gouy', 'Husband', '07383 021 093'),
('25-9736142', 'Aurore Neilson', '9 Darwin Parkway', '?53,082.75', '1981-02-17', 'bi255825p', 'Packager', 'Stearne Chaffer', 'Mother', '07640 868 506'),
('26-0938951', 'Fabe Lief', '94 Gerald Crossing', '?56,639.65', '1980-01-02', 'cc841112d', 'Driver', 'Kev Bradmore', 'Boyfriend', '07180 333 916'),
('26-3324931', 'Nelle Thams', '04 Weeping Birch Junction', '?12,571.28', '1982-12-16', 'qj455525d', 'Driver', 'Jaime Picford', 'Mother', '07745 996 565'),
('26-9050326', 'Dode Hurtado', '12322 Cottonwood Point', '?40,814.61', '2002-02-06', 'lm182202b', 'Driver', 'Cully Galilee', 'Civil Partner', '07898 839 206'),
('27-1540713', 'Raphaela Symon', '41109 Stephen Plaza', '?72,118.42', '1983-03-07', 'ry550614d', 'Driver', 'Baudoin Danigel', 'Girlfriend', '07315 752 509'),
('27-8037561', 'Junina McAirt', '45 Ramsey Junction', '?39,500.15', '1988-07-08', 'cx516631k', 'Packager', 'Xaviera Chaves', 'Mother', '07054 012 385'),
('27-8094243', 'Rhodia Realy', '2748 Wayridge Junction', '?54,901.54', '1959-12-23', 'sh464311u', 'Packager', 'Byran Greaser', 'Husband', '07556 017 337'),
('27-8387260', 'Annetta Cock', '76245 Hoffman Court', '?90,559.92', '1984-07-16', 'vd818340c', 'Driver', 'Sara-ann Knoller', 'Civil Partner', '07189 537 844'),
('28-4979315', 'Sashenka Artin', '71 Talmadge Drive', '?36,543.57', '1982-09-22', 'tp697018e', 'Driver', 'Nichol Rawsthorne', 'Civil Partner', '07508 127 404'),
('28-7012669', 'Rahel Gallo', '798 Karstens Parkway', '?60,391.38', '1997-05-15', 'kz848071o', 'HR', 'Ahmad Muge', 'Boyfriend', '07028 898 207'),
('28-7818998', 'Alfi MacFadzean', '6 Old Shore Center', '?45,825.46', '1983-05-07', 'tp307139n', 'Packager', 'Caz Dartnell', 'Mother', '07448 651 046'),
('29-2364794', 'Guido Hoopper', '51 Prairieview Alley', '?78,530.16', '1986-07-16', 'in158664i', 'Manager', 'Joel Fairham', 'Girlfriend', '07080 664 959'),
('29-2785103', 'Agnes Dendon', '158 Twin Pines Crossing', '?17,734.18', '1986-02-17', 'kk792060s', 'Packager', 'Eimile Vial', 'Husband', '07477 622 496'),
('29-5105992', 'Borg Szymanzyk', '41 Amoth Crossing', '?77,828.80', '1998-02-26', 'hm134578n', 'Driver', 'Bobby Breslin', 'Boyfriend', '07156 132 741'),
('29-5209106', 'Mellisa Mapam', '65 Maryland Junction', '?85,398.19', '1961-12-21', 'wn277158x', 'Packager', 'Bastien Hollingshead', 'Girlfriend', '07250 548 384'),
('29-6350132', 'Pietro Ochterlony', '75 Weeping Birch Junction', '?51,249.75', '1989-08-28', 'fv388894k', 'Packager', 'Willis Deary', 'Girlfriend', '07475 627 111'),
('29-6571924', 'Arne Bosson', '77803 Messerschmidt Park', '?73,371.57', '2001-01-28', 'ux813250n', 'Packager', 'Haroun Izakovitz', 'Husband', '07369 136 446'),
('29-6656577', 'Lynne Muccino', '65 Northland Avenue', '?63,251.24', '1960-05-27', 'rg151568q', 'Driver', 'Mose Pulham', 'Boyfriend', '07818 864 970'),
('29-7832408', 'Lexine Joney', '73817 Muir Court', '?19,232.41', '1974-04-07', 'pk696816m', 'Packager', 'Quinn Goodfellow', 'Husband', '07755 486 861'),
('30-1322103', 'Earl Wagerfield', '34 Lillian Center', '?91,770.28', '1998-04-05', 'zw251674d', 'Packager', 'Bastian Walliker', 'Civil Partner', '07695 349 556'),
('30-2374884', 'Felicdad Escala', '26 Holy Cross Place', '?22,260.80', '1976-11-27', 'ei636866y', 'Driver', 'Alonzo Whilder', 'Boyfriend', '07404 498 162'),
('30-3058947', 'Hettie Broadbent', '5 Rowland Road', '?74,439.57', '1950-05-29', 'an167975t', 'Packager', 'Paten Velten', 'Husband', '07747 283 371'),
('30-7334418', 'Lorita Fere', '9899 Johnson Park', '?64,340.92', '1973-07-26', 'yh523785h', 'Packager', 'Darby Lias', 'Husband', '07194 892 472'),
('30-8456021', 'Tandi Dmitrovic', '5447 Lyons Center', '?99,223.26', '1970-01-19', 'sr314203n', 'Packager', 'Florentia Cornelisse', 'Wife', '07465 428 558'),
('30-8953969', 'Will Craik', '50 Florence Junction', '?85,698.44', '1998-04-23', 'rk384949o', 'Driver', 'Aaren Lomaz', 'Civil Partner', '07117 843 636'),
('31-5831645', 'Sofia Skoof', '47354 Clyde Gallagher Point', '?58,714.12', '1965-11-26', 'va211893v', 'Driver', 'Coleen Tolley', 'Father', '07220 519 362'),
('31-7111614', 'Artemis Adami', '99842 Spenser Point', '?58,500.47', '1960-06-17', 'bp682069w', 'Driver', 'Ardyce McAree', 'Mother', '07648 096 231'),
('31-7167962', 'Emanuele Strickland', '3772 Dawn Drive', '?15,549.15', '1967-04-14', 'qy726870d', 'HR', 'Winfred Moncey', 'Wife', '07510 608 683'),
('31-8312411', 'Georgine Winspare', '2732 Cottonwood Way', '?50,921.83', '1966-10-10', 'eo514879y', 'Driver', 'Nickolaus Riepel', 'Girlfriend', '07194 463 040'),
('31-9709677', 'Heda Cathersides', '7 Laurel Park', '?32,079.57', '1995-10-05', 'fp198238e', 'Driver', 'Orelie Balasin', 'Civil Partner', '07971 986 560'),
('32-3604971', 'Sterling Elgood', '428 8th Point', '?14,162.95', '1999-12-05', 'eh265089x', 'Driver', 'Dougy Hamlen', 'Boyfriend', '07003 409 288'),
('32-4834306', 'Andra Bamfield', '9799 Russell Crossing', '?59,706.55', '1967-12-08', 'rw267230v', 'Driver', 'Corabella Bitten', 'Boyfriend', '07918 827 977'),
('32-6251861', 'Frederic Ginnaly', '2 Drewry Circle', '?98,924.54', '1971-10-02', 'rs647299i', 'Packager', 'Terrijo Piatto', 'Husband', '07870 877 830'),
('33-0071114', 'Nola Wilcox', '7055 Southridge Drive', '?61,500.70', '1985-01-06', 'aq503711l', 'HR', 'Madelaine Hutt', 'Mother', '07734 801 502'),
('33-0489054', 'Onfre Woolmore', '7868 Pearson Hill', '?61,377.23', '1983-11-22', 'xa033094e', 'Packager', 'Erie Wardingly', 'Civil Partner', '07055 738 740'),
('33-1261585', 'Bary Skoof', '20630 Tony Avenue', '?95,728.74', '2001-12-02', 'fh221614b', 'Driver', 'Benni Botting', 'Wife', '07639 903 071'),
('33-1897506', 'Verla Seacroft', '0134 Fieldstone Trail', '?52,928.18', '2000-05-18', 'un133384d', 'Manager', 'Georgena Clappison', 'Husband', '07584 205 419'),
('33-5159037', 'Ina Farrans', '65968 Fairview Center', '?67,306.02', '1952-03-10', 'vk466721d', 'Packager', 'Hollie Hebble', 'Mother', '07399 003 920'),
('33-7183053', 'Lucinda McGhee', '625 Mitchell Point', '?53,031.50', '1981-03-26', 'nn735991o', 'HR', 'Jacquette Cardenosa', 'Civil Partner', '07642 004 857'),
('33-7614004', 'Modesty Chicchelli', '74 Bashford Pass', '?23,376.55', '1961-01-22', 'zz664726s', 'Packager', 'Antoine De Caville', 'Father', '07676 274 711'),
('34-2543597', 'Rodina Ofener', '5556 Schmedeman Court', '?92,118.32', '1973-07-13', 'dy170889s', 'Packager', 'Megen Vynall', 'Wife', '07100 762 873'),
('34-2817296', 'Jemmy Levens', '298 Elka Alley', '?31,521.70', '1950-09-26', 'dw387671h', 'Packager', 'Shannon Kesteven', 'Father', '07543 934 498'),
('34-4740678', 'Germain Stockow', '102 Haas Junction', '?56,278.62', '1981-05-30', 'yo417120d', 'Packager', 'Nobie Scardifeild', 'Mother', '07035 382 913'),
('34-8601206', 'Dulcia Antonutti', '9 Kingsford Plaza', '?61,015.90', '1996-07-19', 'za364662q', 'Driver', 'Pandora Furnell', 'Husband', '07519 157 083'),
('34-8695852', 'Reg Lanphier', '049 Cambridge Road', '?93,925.10', '1979-12-09', 'lr289379r', 'HR', 'Penelope Hancill', 'Mother', '07018 375 399'),
('35-2689059', 'Junette Hackforth', '74801 Lakewood Trail', '?36,180.91', '1998-03-26', 'pr407605t', 'Driver', 'Wain Corneck', 'Girlfriend', '07089 659 356'),
('35-6685131', 'Shaw Brandsen', '55545 Toban Trail', '?47,949.95', '1974-10-22', 'ps562104c', 'Driver', 'Ada Vaissiere', 'Girlfriend', '07065 792 686'),
('35-7212754', 'Dorian Claringbold', '7422 Crownhardt Avenue', '?13,347.31', '1955-11-18', 'uw834458r', 'Manager', 'Amye Brecknock', 'Mother', '07633 415 279'),
('35-8208617', 'Sayre Simnel', '761 Kennedy Lane', '?72,894.00', '1952-05-19', 'jr596419t', 'Packager', 'Flory Billham', 'Husband', '07184 248 686'),
('36-1132600', 'Danyette Kendrew', '1 Karstens Point', '?98,386.60', '2000-06-23', 'dc106173c', 'Driver', 'Madonna McCague', 'Wife', '07187 549 944'),
('36-1480567', 'Skell Swainson', '31 Sundown Terrace', '?80,604.76', '1994-05-12', 'ib067151y', 'HR', 'Nola Yeowell', 'Mother', '07556 127 597'),
('36-4190617', 'Glyn Canet', '565 Glendale Park', '?54,281.26', '1999-11-25', 'gr760688u', 'Driver', 'Nap Muzzlewhite', 'Wife', '07942 102 464'),
('36-4580826', 'Olivia MacPhee', '09 Saint Paul Point', '?85,391.76', '1963-02-01', 'dj312271a', 'Driver', 'Trey Shannon', 'Husband', '07275 260 538'),
('36-6348131', 'Tedda Daggett', '12 Lindbergh Place', '?25,694.32', '1989-05-30', 'bm829464z', 'Packager', 'Stanley Duffitt', 'Boyfriend', '07136 718 165'),
('36-6943031', 'Wolfgang Frake', '97152 Waubesa Center', '?21,505.69', '1982-01-28', 'op535073z', 'Packager', 'Ulick Snyder', 'Father', '07013 596 878'),
('36-7073092', 'Thelma Wilkie', '113 Badeau Plaza', '?32,280.23', '1984-10-01', 'bl221585z', 'Packager', 'Tabbitha Shemmans', 'Wife', '07625 474 049'),
('37-0478226', 'Jenn Alsina', '281 Marquette Drive', '?40,753.20', '1987-12-08', 'pw357899l', 'Packager', 'Christoforo Decker', 'Husband', '07396 626 394'),
('37-1673392', 'Constantine Gilfillan', '87 Washington Junction', '?32,245.83', '1961-12-01', 'ct112101i', 'HR', 'Alasteir McKeand', 'Wife', '07373 224 784'),
('37-6605556', 'Jacobo Pashba', '101 Linden Crossing', '?67,037.04', '1976-05-15', 'vg977309d', 'Driver', 'Goldia Nisard', 'Girlfriend', '07475 211 884'),
('37-7900056', 'Victoir Loveitt', '7 Judy Parkway', '?24,486.52', '1996-02-05', 'vd479897l', 'Packager', 'Leon McCotter', 'Father', '07126 636 219'),
('37-8247167', 'Elaina Ramplee', '9 Merry Hill', '?70,979.93', '1983-09-12', 'eo273727q', 'Packager', 'Fidela Heaviside', 'Wife', '07081 377 359'),
('38-0609594', 'Bev Yakunikov', '50563 Waubesa Point', '?69,660.66', '1973-02-07', 'ku940218f', 'Packager', 'Bren Epperson', 'Girlfriend', '07295 123 244'),
('38-1272080', 'Mozes Fishleigh', '2636 Burning Wood Crossing', '?42,919.29', '1952-04-10', 'zx396808c', 'Packager', 'Iolanthe Carlick', 'Girlfriend', '07006 963 911'),
('38-1884801', 'Valida Bootes', '06 Bluejay Way', '?75,580.43', '1968-07-23', 'hy568138e', 'Driver', 'Waldemar Plunket', 'Civil Partner', '07417 261 693'),
('38-2126707', 'Vinni Champneys', '38416 Susan Plaza', '?35,513.16', '1976-05-01', 'vn364397s', 'Packager', 'Giustina Stephen', 'Wife', '07101 430 354'),
('38-3647372', 'Carey Netley', '279 Helena Place', '?67,072.08', '1963-10-22', 'lb767754c', 'Driver', 'Giuseppe Petican', 'Wife', '07685 471 321'),
('38-4369228', 'Merwin Partener', '29021 Clemons Terrace', '?13,685.06', '1988-04-16', 'ef765749d', 'Driver', 'Samaria Rennie', 'Civil Partner', '07366 799 382'),
('38-5473326', 'Feodora Benning', '620 Sachtjen Center', '?89,549.75', '1994-02-18', 'kz832424w', 'Packager', 'Chaddie Kelcey', 'Husband', '07135 140 819'),
('38-8885296', 'Ginelle Morgon', '411 2nd Pass', '?84,423.53', '1960-04-26', 'ps334310v', 'Packager', 'Audrey Calafate', 'Boyfriend', '07905 196 224'),
('38-9798664', 'Minor Bennion', '9756 Cottonwood Lane', '?17,020.16', '1958-07-14', 'fl067205y', 'Driver', 'Calv Alelsandrovich', 'Boyfriend', '07717 918 115'),
('39-1227728', 'Tandy Goodbourn', '719 Sloan Drive', '?47,852.85', '1996-10-03', 'go119787t', 'HR', 'Colette Reisk', 'Husband', '07457 814 451'),
('39-4788866', 'Phillida Musicka', '111 Twin Pines Center', '?84,543.42', '1973-10-22', 'pg674068r', 'Packager', 'Coleen McPhater', 'Father', '07695 675 287'),
('40-0786243', 'Oswell Beddingham', '12989 Village Green Street', '?97,980.89', '1953-04-24', 'lh106861m', 'HR', 'Leslie Keningham', 'Father', '07765 606 938'),
('40-1037983', 'Odelinda Wardingly', '069 Mesta Road', '?90,622.48', '1980-07-07', 'bk920804k', 'Driver', 'Lanny Pendred', 'Boyfriend', '07493 098 720'),
('40-1136806', 'Julio Featherstonhalgh', '35498 Jackson Pass', '?89,162.28', '1987-02-20', 'qr454157y', 'Driver', 'Scotti Nowill', 'Boyfriend', '07797 601 369'),
('40-2208062', 'Sonny Tabrett', '25326 Briar Crest Hill', '?62,818.83', '1989-01-29', 'zs026946u', 'Packager', 'Bibbie Tradewell', 'Wife', '07829 257 797'),
('40-5288701', 'Ame Balser', '2282 Sutteridge Lane', '?71,557.80', '1998-01-22', 'dt545040m', 'Packager', 'Kipp Lavens', 'Boyfriend', '07489 365 686'),
('40-6943405', 'Charlena Marques', '2800 Dahle Avenue', '?83,307.32', '1966-11-24', 'vz886203m', 'Driver', 'Marylinda Titta', 'Girlfriend', '07410 675 062'),
('41-1429269', 'Jacki Rumin', '84 Kipling Parkway', '?81,648.46', '1991-01-21', 'rp562470q', 'Driver', 'Northrup Pittendreigh', 'Mother', '07603 027 379'),
('41-3216938', 'Joeann Beckerleg', '6442 Dennis Street', '?56,988.53', '1992-12-14', 'zi901356n', 'Packager', 'Rustie Ridge', 'Husband', '07462 515 206'),
('41-3268639', 'Sherlocke Cornner', '00811 Morning Crossing', '?43,444.78', '1960-03-15', 'uo254689s', 'Driver', 'Melinda Edelston', 'Mother', '07607 490 054'),
('41-3659990', 'Ruperta Stobie', '2825 Pepper Wood Center', '?83,681.20', '1976-09-17', 'qf137469l', 'Packager', 'Joly Doram', 'Girlfriend', '07106 575 891'),
('41-3975053', 'Felipe Ferschke', '5508 Hauk Terrace', '?63,359.81', '1986-12-25', 'pu346240t', 'HR', 'Sibyl Mabson', 'Civil Partner', '07924 859 819'),
('41-6555988', 'Marwin Raybould', '925 Novick Lane', '?51,081.29', '1983-05-31', 'dp016938u', 'HR', 'Margette Osman', 'Girlfriend', '07794 678 823'),
('41-9319442', 'Luisa Burtonwood', '554 Marcy Crossing', '?48,099.78', '1975-12-02', 'ji602428k', 'Packager', 'Ezmeralda Ertel', 'Boyfriend', '07929 318 804'),
('41-9645109', 'Merrel Miklem', '00 Marcy Trail', '?39,131.10', '2000-07-27', 'ls403208x', 'Driver', 'Creighton Hinzer', 'Girlfriend', '07394 851 273'),
('42-0131259', 'Kelsi Cunney', '5 Toban Terrace', '?92,101.67', '1955-07-02', 'nm508435w', 'Driver', 'Cassandre Attawell', 'Wife', '07612 472 814'),
('42-0717807', 'Robin Bartkowiak', '5559 Shelley Circle', '?89,053.24', '1988-07-14', 'mu698813c', 'Packager', 'Rollo Olczak', 'Mother', '07268 021 034'),
('42-1134854', 'Norma Budgeon', '5061 Northland Place', '?45,208.71', '1986-01-19', 'gq875183d', 'Driver', 'Allie Hambleton', 'Wife', '07583 207 317'),
('42-2072103', 'Oates Snepp', '684 Park Meadow Junction', '?42,019.18', '1967-07-29', 'ie180913g', 'Packager', 'Papageno Baiyle', 'Girlfriend', '07413 999 083'),
('42-5263028', 'Corny Leynham', '8 Hansons Drive', '?82,698.63', '1972-03-03', 'kc800413c', 'Packager', 'Dorise Polin', 'Civil Partner', '07030 945 316'),
('42-7011523', 'Giorgia Hynes', '23948 Ruskin Place', '?44,916.43', '1963-01-15', 'xh499685d', 'Packager', 'Harper Crutchley', 'Father', '07349 039 768'),
('42-7240015', 'Godfrey Napoleon', '030 Fallview Court', '?89,542.77', '1966-10-12', 'hg523274c', 'Packager', 'Brose Jepp', 'Husband', '07935 559 320'),
('42-8848918', 'Zahara Pepis', '15 2nd Crossing', '?17,215.70', '1992-03-16', 'vv722651o', 'Packager', 'Hayden Monkley', 'Wife', '07958 131 810'),
('43-2037577', 'Leisha Mieville', '027 Clarendon Center', '?68,826.28', '1950-11-23', 'nj080641o', 'Driver', 'Alyosha Halewood', 'Boyfriend', '07204 386 023'),
('43-6568300', 'Gillan Stolberger', '04255 Mayfield Way', '?92,147.29', '1985-06-01', 'hx200738r', 'Packager', 'Nickie Driscoll', 'Husband', '07163 688 713'),
('43-7385696', 'Nicky Ipplett', '7153 Merrick Terrace', '?48,895.33', '1983-10-25', 'tk845900k', 'Driver', 'Maritsa McGann', 'Wife', '07389 587 350'),
('43-8492699', 'Hortense Berecloth', '2 Barby Parkway', '?38,548.00', '1987-07-29', 'zt656754o', 'Driver', 'Baird Fingleton', 'Boyfriend', '07789 751 694'),
('44-1072008', 'Jacob Kelf', '48033 Forest Run Parkway', '?66,228.12', '1965-11-25', 'zi651705l', 'Driver', 'Merlina Adolthine', 'Civil Partner', '07498 555 907'),
('44-4915402', 'Phaidra Ivey', '46 Toban Lane', '?61,580.95', '1970-01-02', 'yg637206i', 'Driver', 'Franz Barribal', 'Mother', '07304 601 591'),
('44-7083318', 'Dari Siene', '57 Randy Point', '?85,262.11', '1971-01-29', 'ku592945q', 'Packager', 'Galvan Kaszper', 'Girlfriend', '07814 082 485'),
('45-1060690', 'Morgen Shortland', '3 Doe Crossing Trail', '?81,649.14', '2002-08-17', 'vr974451g', 'HR', 'Cooper Sillars', 'Husband', '07228 676 244'),
('45-1168337', 'Jade Yaakov', '13 Parkside Avenue', '?95,249.87', '1986-02-17', 'eb401601e', 'Packager', 'Marybeth Dibben', 'Boyfriend', '07888 296 305'),
('45-2811300', 'Veradis Wagstaff', '592 Sullivan Pass', '?54,982.88', '1951-08-08', 've944995l', 'Driver', 'Odo Frame', 'Mother', '07142 691 496'),
('45-3804689', 'Pauly McDell', '4 Fordem Trail', '?66,117.54', '2001-09-18', 'ac869050u', 'Driver', 'Tam Howler', 'Boyfriend', '07107 484 803'),
('45-3951342', 'Chris Skittrell', '174 Namekagon Court', '?80,039.37', '1986-08-23', 'io334297g', 'HR', 'Arthur Landsborough', 'Mother', '07679 670 222'),
('45-5773014', 'Patric Etienne', '87269 Huxley Place', '?22,053.53', '1954-12-24', 'nd673205l', 'Driver', 'Ken Sloane', 'Mother', '07771 820 262'),
('45-6995640', 'Sigfrid Mankor', '9773 Old Shore Way', '?12,758.05', '1997-07-13', 'fi299116a', 'Driver', 'Troy Connock', 'Boyfriend', '07603 307 243'),
('45-7500187', 'Juditha Pesterfield', '076 Heath Drive', '?37,428.34', '1952-10-19', 'zf490474b', 'Driver', 'Agnella Wyman', 'Husband', '07269 336 319'),
('46-0059406', 'Marylou McClunaghan', '7 Bluestem Pass', '?60,710.92', '1982-09-24', 'ys652384q', 'Packager', 'Paule Willingham', 'Father', '07689 398 886'),
('46-2600043', 'Del Fitter', '4290 Superior Terrace', '?54,544.33', '1982-11-26', 'tt394813q', 'Packager', 'Adolph Hedgeman', 'Wife', '07295 967 993'),
('46-4344763', 'Benny Lander', '86904 Montana Road', '?88,061.49', '1991-01-06', 'sq353921l', 'Driver', 'Rorke Biles', 'Father', '07204 662 049'),
('47-1387266', 'Bevon Gaskoin', '549 Oakridge Avenue', '?56,671.63', '2000-06-06', 'ce665632s', 'Packager', 'Bobbette Ruddlesden', 'Civil Partner', '07116 235 571'),
('47-3147567', 'Britta Northin', '757 Ramsey Terrace', '?74,080.45', '1959-09-11', 'yz717919v', 'Manager', 'Sigmund McLafferty', 'Wife', '07996 723 103'),
('47-5302795', 'Gerardo Brosio', '6949 Bonner Junction', '?92,669.35', '1968-03-20', 'rb204617t', 'Driver', 'Haley Kellock', 'Girlfriend', '07487 727 188'),
('48-1799687', 'Charissa Peattie', '6497 Haas Park', '?32,502.37', '1952-06-23', 'lw132386n', 'Driver', 'Prudi Blum', 'Girlfriend', '07262 636 173'),
('48-5840838', 'Raquel Stave', '8 Springview Plaza', '?91,219.79', '1998-06-21', 'yl966209u', 'HR', 'Brien Narrie', 'Girlfriend', '07567 015 757'),
('48-9328765', 'Orsola Francillo', '31360 Debra Junction', '?98,161.15', '1970-06-06', 'tq009471b', 'Packager', 'Poul Poznan', 'Wife', '07353 747 279'),
('49-1036239', 'Onofredo Joontjes', '938 2nd Way', '?36,626.20', '1990-04-01', 'so040048u', 'Driver', 'Reinold Kaubisch', 'Husband', '07005 138 853'),
('49-1159362', 'Valeria Proschek', '6 Red Cloud Court', '?97,436.14', '1996-02-18', 'xd817271x', 'Driver', 'Der Merner', 'Girlfriend', '07472 485 627'),
('49-1457327', 'Sinclair Byfford', '201 Melody Parkway', '?50,636.92', '1981-12-10', 'hp128399x', 'Driver', 'Sallee Hughes', 'Mother', '07731 937 530'),
('49-2217652', 'Georas Divisek', '25 Moulton Lane', '?87,452.13', '1951-05-10', 'ht175666x', 'Packager', 'Nessy Panting', 'Civil Partner', '07326 502 172'),
('49-5299749', 'Vonny Meeny', '06702 Lawn Plaza', '?83,205.62', '1982-01-24', 'ah996640u', 'Driver', 'Farleigh Norwich', 'Husband', '07452 090 283'),
('49-6102253', 'Annabelle Fairnie', '12384 Warrior Point', '?60,436.09', '1992-11-27', 'dl892664i', 'Driver', 'Gideon Gillivrie', 'Boyfriend', '07257 411 126'),
('49-9705882', 'Quentin Devine', '09 Knutson Park', '?23,326.81', '1962-02-08', 'fm907610k', 'Driver', 'Kass Haysman', 'Girlfriend', '07480 332 736'),
('50-0945563', 'Ashbey England', '3 Oneill Crossing', '?66,223.46', '1979-09-18', 'uj306006a', 'Driver', 'Tim Stiff', 'Girlfriend', '07764 772 037'),
('50-5810953', 'Jarad Thorowgood', '01 East Hill', '?80,581.88', '2000-03-24', 'fe255201p', 'Driver', 'Hurlee Bendle', 'Father', '07016 639 458'),
('50-6111855', 'Shepard Johansson', '22 Hudson Trail', '?86,414.16', '1986-07-24', 'ng987509r', 'Packager', 'Matias Ruckert', 'Girlfriend', '07792 360 390'),
('50-7117246', 'Everett Hoggetts', '4809 Gale Trail', '?99,084.22', '1999-11-15', 'pk662258w', 'Packager', 'Justina Steinson', 'Girlfriend', '07978 286 641'),
('50-9092071', 'Jodie Busswell', '8 Pepper Wood Avenue', '?14,441.41', '1958-12-07', 'qz236393m', 'Packager', 'Simone Kitchenman', 'Father', '07958 325 944'),
('51-0122715', 'Ardyce Calcraft', '953 Green Trail', '?63,482.01', '1982-08-31', 'kk311112p', 'Packager', 'Damara Dudny', 'Mother', '07425 771 845'),
('51-6967096', 'Bertina Berard', '1 Almo Place', '?21,320.75', '1961-10-18', 'ed732328n', 'Driver', 'Shelly Gimblet', 'Boyfriend', '07107 706 065'),
('51-7315582', 'Kathy Goodnow', '24494 Kenwood Alley', '?94,364.48', '1988-05-05', 'dn632963a', 'Driver', 'Braden Sabben', 'Girlfriend', '07264 110 068'),
('51-7472749', 'Bonnibelle Disley', '9 Vermont Trail', '?32,710.49', '1987-07-30', 'si278865g', 'Driver', 'Peyton MacShirie', 'Girlfriend', '07219 511 447'),
('51-9601829', 'Maressa Hans', '73 Coolidge Park', '?21,773.24', '2001-10-13', 'er279775r', 'Driver', 'Nicol Dockray', 'Wife', '07174 952 329'),
('52-0404205', 'Pierce Kemp', '63008 Raven Place', '?82,902.41', '1984-06-29', 'dd271029j', 'Packager', 'Seumas Ivantsov', 'Husband', '07643 549 188'),
('52-1336694', 'Renaldo Fussey', '7 Northland Street', '?46,099.86', '1955-04-11', 'nz535691o', 'Driver', 'Gloriana McFade', 'Husband', '07061 354 829'),
('52-4567561', 'Braden Wigin', '9641 Loftsgordon Park', '?85,761.99', '1983-10-31', 'lc856388d', 'Packager', 'Leia MacMearty', 'Father', '07525 541 001'),
('52-4726377', 'Vania Simonsson', '666 Hoffman Parkway', '?90,719.74', '2001-12-22', 'ry740755s', 'HR', 'Eduino Gainsboro', 'Civil Partner', '07169 495 661'),
('52-5735024', 'Donica Hewell', '2911 Southridge Hill', '?34,806.46', '1978-01-03', 'wn058972w', 'Packager', 'Waylan Kochlin', 'Boyfriend', '07629 713 818'),
('52-6674444', 'Codie Stambridge', '38 Schurz Pass', '?29,289.03', '1953-02-11', 'ku840832k', 'Driver', 'Emera Yearne', 'Father', '07206 048 771'),
('53-0431396', 'Demetrius Lowmass', '8 Stone Corner Crossing', '?99,061.45', '1968-07-24', 'wd175217c', 'Driver', 'Emelen Spender', 'Father', '07345 326 453'),
('53-5630368', 'Evey Luckman', '898 Butternut Point', '?26,964.71', '1992-08-10', 'ee740794t', 'Driver', 'Bradford Rudolf', 'Girlfriend', '07753 919 257'),
('53-6948800', 'Dorothea Trewinnard', '0 Stephen Way', '?74,486.86', '1998-02-16', 'cd290362a', 'Packager', 'Arielle Etock', 'Boyfriend', '07312 873 616'),
('53-7191465', 'Delila Folland', '5993 Warner Park', '?32,281.47', '1955-11-27', 'vk993165i', 'Driver', 'Cori Phillipps', 'Husband', '07572 306 041'),
('53-9062912', 'Doralynn Suddaby', '4 Springview Plaza', '?59,458.15', '1952-09-16', 'zh337987i', 'Driver', 'Roddie O\' Molan', 'Boyfriend', '07464 651 444'),
('54-1117411', 'Schuyler Stoffels', '31 Carioca Terrace', '?41,087.65', '1980-09-20', 'sh512546i', 'Driver', 'Sisely Castelin', 'Mother', '07152 080 965'),
('54-5318903', 'Stanislaus Ferreli', '5 Northland Park', '?51,816.24', '1975-04-20', 'sw345892x', 'HR', 'Tootsie Holdey', 'Wife', '07329 818 995'),
('54-6428980', 'Janek Semeradova', '12015 Dayton Trail', '?89,572.34', '1966-08-06', 'hm636135w', 'Packager', 'Bald Bennoe', 'Wife', '07580 556 646'),
('54-7676865', 'Pepillo Maha', '2025 Waxwing Drive', '?38,143.51', '1953-02-26', 'ii522336e', 'Driver', 'Manfred Morston', 'Wife', '07857 880 717'),
('54-7904459', 'Alexandros Ormesher', '664 Gale Plaza', '?51,642.73', '1998-03-15', 'sl566148h', 'Packager', 'Gabriela Wehden', 'Mother', '07904 464 506'),
('54-8296596', 'Tommie Vallintine', '37 Superior Parkway', '?87,912.38', '1973-11-21', 'tm808573f', 'Packager', 'Porter Nance', 'Civil Partner', '07097 155 888'),
('54-9522118', 'Nari Chowne', '169 Clemons Drive', '?40,585.75', '1979-01-17', 'vm874796y', 'Manager', 'Ilsa McAusland', 'Boyfriend', '07064 930 835'),
('55-0320348', 'Granville McKitterick', '04 Rieder Parkway', '?83,664.78', '1965-02-20', 'dr180938w', 'Driver', 'Zita Stanborough', 'Mother', '07532 693 273'),
('55-3650046', 'Gerek Bardnam', '91085 Maple Court', '?51,185.61', '1966-12-29', 'xh198735c', 'Driver', 'Nanete Hassard', 'Boyfriend', '07005 200 200'),
('55-4384947', 'Eudora Marten', '6 Corry Road', '?80,059.87', '1981-08-19', 'mz193764k', 'Packager', 'Bradly Mitrovic', 'Husband', '07708 980 078'),
('55-5908272', 'Petronille Squelch', '67 Golden Leaf Park', '?65,853.46', '1987-01-30', 'ly831340g', 'Packager', 'Alden Bourthoumieux', 'Boyfriend', '07435 864 662'),
('55-6072477', 'Waring Durkin', '9597 Towne Center', '?82,140.98', '1984-03-07', 'mg195096h', 'Packager', 'Paolina Rosenwasser', 'Wife', '07405 739 948'),
('55-9616651', 'Murdock Linsay', '8 Shelley Terrace', '?55,605.57', '1992-12-08', 'tn328405l', 'Packager', 'Fae Whales', 'Boyfriend', '07698 294 787'),
('55-9770243', 'Janeva Carlet', '5557 Washington Point', '?35,334.78', '1974-07-18', 'pu508250s', 'Packager', 'Kimmie McKevitt', 'Boyfriend', '07591 865 044'),
('56-0484045', 'Lyn Topp', '20 Sloan Circle', '?36,487.51', '1979-06-06', 'np848289h', 'Driver', 'Hermine Sapsed', 'Boyfriend', '07245 144 587'),
('56-3682739', 'Melany Klugel', '14577 Truax Alley', '?41,959.59', '1955-05-18', 'tg734644m', 'HR', 'Shannon Purdy', 'Mother', '07885 597 859'),
('56-4309508', 'Tessy Cartan', '75834 Burning Wood Parkway', '?85,017.74', '1985-02-04', 'of985665x', 'Packager', 'Conway Howman', 'Husband', '07285 064 810'),
('56-7734821', 'Micki Wyness', '26 Novick Plaza', '?38,060.45', '1974-12-06', 'nh139989u', 'Packager', 'Thedric Kenwright', 'Father', '07519 455 911'),
('57-1609142', 'Jilly Skirvane', '4227 Darwin Circle', '?91,296.52', '1961-04-27', 'md982609a', 'Packager', 'Gearard Lindback', 'Father', '07918 823 802'),
('57-2548391', 'Wynne Flowitt', '8 Harbort Road', '?45,230.72', '1961-11-09', 'ns537861h', 'Packager', 'Lesya Phebey', 'Wife', '07741 907 270'),
('57-4162757', 'Beulah Vala', '07601 Sunfield Hill', '?37,954.91', '1951-09-09', 'ro435900h', 'Packager', 'Scarlet Maps', 'Girlfriend', '07959 819 817'),
('57-7596762', 'Joelie Bacchus', '0374 Pawling Hill', '?14,722.35', '1978-10-09', 'ok001999u', 'Driver', 'Emmy Giraldo', 'Boyfriend', '07456 139 081'),
('58-0128736', 'Sandye How', '2 Fordem Street', '?13,440.04', '1963-05-24', 'wj636565x', 'Driver', 'Ethelbert Warret', 'Boyfriend', '07813 571 441'),
('58-0824770', 'Zared Klulicek', '62958 Canary Junction', '?40,677.89', '1966-07-22', 'hx158296g', 'Driver', 'Johna Radki', 'Civil Partner', '07783 704 124'),
('58-2471319', 'Constantino Phlippsen', '52 Nevada Road', '?77,184.02', '1965-08-21', 'vz575305z', 'Packager', 'Salem Courtliff', 'Boyfriend', '07239 492 326'),
('58-5912504', 'Nappy Ludmann', '3329 Sheridan Junction', '?51,318.65', '1991-08-15', 'ge941219f', 'Packager', 'El Grishagin', 'Husband', '07888 438 593'),
('58-8249246', 'Maggi Hamshar', '92344 Main Avenue', '?34,269.41', '1950-04-19', 'rb919501k', 'Driver', 'Theresina Tring', 'Civil Partner', '07536 036 354'),
('58-8390431', 'Brandi Andreassen', '008 Service Alley', '?19,209.80', '2000-07-12', 'ib637202u', 'Driver', 'Bendicty Macek', 'Husband', '07726 134 897'),
('59-0150604', 'Florry Oblein', '5 Elmside Lane', '?87,584.21', '1984-12-20', 'vv093891d', 'HR', 'Casie MacAirt', 'Civil Partner', '07394 653 792'),
('59-0997098', 'Aila Paolillo', '41 Esker Terrace', '?14,148.29', '1975-03-19', 'cm005454h', 'Packager', 'Debera Itzkovich', 'Mother', '07196 432 406'),
('59-1166943', 'Parker Filippov', '9 Granby Terrace', '?65,946.54', '1995-03-05', 'xp081647h', 'Packager', 'Rora Windross', 'Boyfriend', '07964 139 091'),
('59-2576093', 'Katerina Barnfield', '34404 Bellgrove Avenue', '?61,807.51', '2000-10-26', 'jx648488c', 'Packager', 'Nancy Masterson', 'Father', '07031 588 061'),
('59-4661298', 'Stearne Stennet', '664 Warrior Drive', '?37,835.13', '1993-04-08', 'vu851838j', 'HR', 'Jenn Sander', 'Wife', '07434 841 982'),
('59-4684006', 'Angie Waddams', '82 Truax Crossing', '?62,378.68', '1996-01-10', 'df003975r', 'Packager', 'Husain Yerborn', 'Civil Partner', '07241 523 713'),
('59-5937939', 'Blancha McMillian', '59 Buhler Trail', '?89,177.07', '1991-07-21', 'zp730277w', 'Driver', 'Lizbeth Curbishley', 'Father', '07104 138 411'),
('59-6274425', 'Talbert Abbotts', '29565 Jenifer Court', '?92,884.08', '1996-08-13', 'ae100121f', 'Packager', 'Jon McAlester', 'Husband', '07015 001 355'),
('59-8314806', 'Scotty Keson', '14 Kipling Point', '?67,107.29', '1967-08-12', 'gx924268x', 'Packager', 'Norrie Aggis', 'Husband', '07390 692 263'),
('59-8381667', 'Emmey Dallywater', '98705 Forest Run Avenue', '?92,664.30', '1953-04-10', 'dk443174l', 'HR', 'Gabi Crooks', 'Father', '07021 173 423'),
('60-0655971', 'Cherie Murch', '3340 Gale Way', '?12,502.40', '1963-12-02', 'ap253442h', 'HR', 'Beitris Morison', 'Boyfriend', '07455 807 075'),
('60-1691051', 'Winnah Gillott', '40711 Dayton Plaza', '?48,040.51', '1982-12-31', 'qv299811c', 'Packager', 'Amabelle McFaell', 'Mother', '07406 136 450'),
('60-2276889', 'Ransell Seakings', '1 Ramsey Park', '?43,734.59', '1995-07-22', 'uu534964w', 'Packager', 'Monro Piatkowski', 'Girlfriend', '07439 078 961'),
('60-3158201', 'Carlee Shearmur', '2 Vermont Terrace', '?78,619.51', '1966-06-28', 'lo612272u', 'Driver', 'Hiram Imrie', 'Husband', '07218 567 891'),
('60-6270362', 'Theressa Prentice', '2026 Oak Valley Hill', '?78,594.80', '1973-02-18', 'qf112815j', 'Packager', 'Sanders Firsby', 'Husband', '07483 322 111'),
('60-6428015', 'Fayette Hackin', '212 Loomis Trail', '?51,844.54', '1986-03-31', 'rn693599v', 'Driver', 'Birgitta Naerup', 'Wife', '07161 526 613'),
('60-7601093', 'Elnar Tabrett', '280 Drewry Way', '?85,741.90', '1963-03-15', 'rf462586d', 'HR', 'Shara Bernardy', 'Mother', '07045 228 558'),
('60-9203590', 'Shoshana Downie', '8416 Carberry Crossing', '?83,867.01', '1998-05-02', 'ee740085i', 'Packager', 'Montague Giles', 'Girlfriend', '07602 582 994'),
('61-7469906', 'Demetre Headrick', '98692 Forster Hill', '?88,965.32', '1963-10-11', 'ns990887t', 'HR', 'Conrado Laker', 'Girlfriend', '07004 401 178'),
('61-9391449', 'Lester Carmo', '6 Buell Trail', '?37,061.26', '1997-02-02', 'mt812263o', 'Driver', 'Alis Plaster', 'Father', '07547 928 939'),
('62-1957072', 'Elliot Allitt', '8 Redwing Court', '?41,808.84', '1978-03-17', 'nd981367q', 'HR', 'Christan Leupoldt', 'Husband', '07699 612 785'),
('62-2186332', 'Meridith Bolton', '9 Hooker Avenue', '?81,390.66', '1951-01-06', 'vw612487d', 'Driver', 'Delmore Borel', 'Civil Partner', '07050 832 727'),
('62-4020686', 'Tait Bremeyer', '82 Calypso Junction', '?83,142.55', '1950-05-29', 'ie609169k', 'Packager', 'Gina Manueli', 'Boyfriend', '07640 597 771'),
('62-4959178', 'Josie Henricsson', '8035 Brown Lane', '?64,586.93', '2001-03-06', 'oh486872e', 'Packager', 'Cathyleen Lindfors', 'Husband', '07119 333 689'),
('62-6726896', 'Marje Cranage', '15 Crescent Oaks Junction', '?82,421.91', '1981-02-23', 'kt951067x', 'HR', 'Jabez Yewman', 'Father', '07280 779 671'),
('62-6894804', 'Merrie Stayt', '0 Manufacturers Alley', '?39,159.86', '1995-10-04', 'cq847516d', 'Packager', 'Sumner Armer', 'Civil Partner', '07124 699 528'),
('62-7019089', 'Agnese Murrhardt', '4666 Jay Court', '?88,965.75', '1955-12-18', 'yz407625p', 'Driver', 'Bondie Schruyers', 'Father', '07868 628 411'),
('62-7120162', 'Fanni Melrose', '33 Sutteridge Parkway', '?97,520.73', '1962-06-10', 'na997468x', 'Driver', 'Malissa Scurrah', 'Wife', '07189 813 349'),
('63-0638100', 'Edd Speere', '812 High Crossing Junction', '?13,662.80', '1950-01-05', 'au549358u', 'Packager', 'Kristopher Pawfoot', 'Boyfriend', '07623 018 398'),
('63-1545651', 'Dedra MacConnulty', '22342 Sauthoff Center', '?85,921.50', '1989-05-13', 'zc732912g', 'Packager', 'Wallache Ropkins', 'Girlfriend', '07410 226 285'),
('63-1925261', 'Willyt Ezzy', '61751 Burrows Drive', '?14,811.14', '1983-06-12', 'vy468006g', 'Driver', 'Sallyanne Minchinton', 'Father', '07491 768 068'),
('63-2539882', 'Darelle Peverell', '52683 Aberg Parkway', '?80,717.20', '1978-08-08', 'pg514115j', 'Packager', 'Helen Gouda', 'Boyfriend', '07268 106 425'),
('63-5722038', 'Vikki Guthrie', '6 Farragut Road', '?95,626.81', '1976-04-10', 'hx643872o', 'Packager', 'Kristin Stanhope', 'Civil Partner', '07095 123 826'),
('63-6111701', 'Fayre Tomney', '1506 Ryan Point', '?58,829.33', '1979-07-23', 'ia005234g', 'Driver', 'Berty Brimblecomb', 'Girlfriend', '07765 565 720'),
('63-8802366', 'Cody Peasey', '6 Dixon Point', '?54,393.78', '1974-01-26', 'fu609000b', 'Driver', 'Joscelin Dumblton', 'Wife', '07719 695 663'),
('63-9116461', 'Aylmer Gabbatiss', '8828 Blue Bill Park Avenue', '?27,880.52', '1950-09-20', 'qj799086z', 'HR', 'Paxton Aspole', 'Boyfriend', '07789 380 331'),
('63-9446221', 'Tybie Exell', '1 Anderson Plaza', '?56,541.59', '1985-09-03', 'gi458830f', 'Packager', 'Alberik Meaton', 'Boyfriend', '07785 086 128'),
('64-0621633', 'Sigismundo FitzGibbon', '8 Gina Terrace', '?55,410.48', '1981-06-14', 'au449889p', 'Packager', 'Morley Mastrantone', 'Mother', '07615 396 907'),
('64-0636526', 'Antonetta Beefon', '68 Blackbird Drive', '?39,943.08', '1961-12-17', 'hb766263l', 'Packager', 'Lief Wilhelmy', 'Boyfriend', '07972 492 545'),
('64-6729020', 'Sarajane Abrams', '26499 Warrior Avenue', '?87,543.10', '1985-01-02', 'yh646941o', 'Packager', 'Jamison Richardet', 'Civil Partner', '07608 960 744'),
('64-6879023', 'Brose Niece', '18466 Village Green Plaza', '?74,713.01', '1964-02-02', 'yz865649d', 'Packager', 'Annette Bydaway', 'Boyfriend', '07670 530 361'),
('65-1738561', 'Say Lodwig', '54399 Forest Dale Avenue', '?17,891.12', '1987-08-27', 'tj978150h', 'Manager', 'Donella Scullard', 'Boyfriend', '07764 317 881'),
('65-7661186', 'Lombard Debling', '36 Mayer Drive', '?53,121.90', '1989-01-13', 'jb039257n', 'Packager', 'Ross Little', 'Father', '07811 367 312'),
('66-0739491', 'Latashia McGaugan', '1386 Artisan Parkway', '?58,941.46', '1992-07-08', 'nz662678p', 'Manager', 'Eada Silmon', 'Wife', '07007 182 872'),
('66-1883695', 'Jorge Bonham', '8 2nd Trail', '?33,284.78', '1998-03-19', 'ql642076f', 'Driver', 'Tildy Donett', 'Civil Partner', '07996 433 549'),
('66-2361006', 'Hillard Milan', '9010 Straubel Park', '?81,724.41', '1967-04-06', 'og602265e', 'HR', 'Janela Jeffels', 'Wife', '07747 406 557'),
('66-2522703', 'Alyss Nance', '0974 Red Cloud Junction', '?20,416.96', '1952-09-07', 'gy674145h', 'HR', 'Natassia Ludvigsen', 'Father', '07785 317 092'),
('66-2765926', 'Jacinta Partleton', '3957 Hoard Place', '?96,193.45', '1962-10-15', 'sh419152d', 'Driver', 'Rand Madrell', 'Civil Partner', '07252 015 009'),
('66-5805863', 'Vincents De Bruijne', '3 Claremont Parkway', '?81,193.24', '1983-03-20', 'na778983r', 'Driver', 'Dominick Schirach', 'Girlfriend', '07814 696 449');
INSERT INTO `employees` (`emp_id`, `name`, `address`, `salary`, `dob`, `nin`, `department`, `emergency_name`, `emergency_relationship`, `emergency_phone`) VALUES
('66-7576883', 'Dur Janodet', '91175 Northland Hill', '?54,589.37', '1950-04-17', 'jd412382q', 'Driver', 'Golda Preston', 'Father', '07636 377 875'),
('67-4076527', 'Clarissa Houson', '1 Granby Pass', '?35,964.42', '1975-05-12', 'kh895707v', 'Packager', 'Cordy Sudell', 'Father', '07007 011 997'),
('67-5029558', 'Gianina Leppington', '1 Jenifer Park', '?77,499.37', '1979-05-27', 've628368y', 'HR', 'Joycelin Mushet', 'Father', '07772 470 745'),
('67-5304822', 'Taber Nuton', '94646 Charing Cross Parkway', '?85,586.57', '1966-01-29', 'ig939447u', 'Driver', 'Taylor Micka', 'Civil Partner', '07239 031 455'),
('67-6284946', 'Alia Sygroves', '7 Roth Alley', '?19,945.20', '1967-12-20', 'ws189951j', 'Driver', 'Alameda Iacobacci', 'Wife', '07244 048 879'),
('67-6903314', 'Dorene Ipplett', '87 Cardinal Court', '?93,942.93', '1986-11-16', 'ul176502b', 'Packager', 'Lew O\'Dempsey', 'Mother', '07885 465 113'),
('67-7636850', 'Felice Plaide', '0617 Daystar Drive', '?58,909.33', '1953-03-05', 'vl606950t', 'Driver', 'Codee Hurndall', 'Boyfriend', '07296 394 678'),
('68-3132421', 'Catlaina McInerney', '19 Aberg Plaza', '?69,134.66', '1953-11-03', 'pr574429q', 'Driver', 'Raphaela Fishlee', 'Girlfriend', '07691 368 084'),
('68-3172017', 'Hayyim Fleay', '3644 Blaine Court', '?55,384.02', '1974-02-05', 'yh345037b', 'Packager', 'Aristotle MacGrath', 'Boyfriend', '07717 401 856'),
('68-4171892', 'Yoshi Peakman', '641 Warner Point', '?20,293.38', '1953-03-06', 'to907441w', 'Packager', 'Patty Horsburgh', 'Husband', '07924 918 978'),
('68-5871521', 'Bearnard Parysowna', '60052 Monument Alley', '?85,175.33', '1985-09-08', 'vg613456a', 'Driver', 'Ernestine Syne', 'Father', '07699 779 427'),
('68-6940299', 'Tobi Bute', '46 Jenifer Plaza', '?97,878.28', '1986-01-31', 'mw253204t', 'Driver', 'Fifi Lamputt', 'Father', '07477 278 621'),
('68-7037451', 'Saree Starling', '1 Artisan Drive', '?34,145.23', '1973-10-07', 'ct629800a', 'Packager', 'Duane Mitton', 'Civil Partner', '07087 447 204'),
('68-7096348', 'Darsey Fryman', '996 Sauthoff Circle', '?80,568.78', '1974-11-30', 'gd794016y', 'Packager', 'Davey Gregan', 'Mother', '07204 221 186'),
('68-7504033', 'Brandi Clayson', '7 Myrtle Circle', '?37,302.00', '1963-11-22', 'kn988197t', 'Driver', 'Glenden Livett', 'Civil Partner', '07613 591 203'),
('68-8976238', 'Florie Reyes', '2 Heffernan Center', '?98,224.34', '1999-11-28', 'ub855681n', 'HR', 'Libbey Van den Bosch', 'Civil Partner', '07623 894 854'),
('69-0393201', 'Lissa Egalton', '28673 Bultman Junction', '?77,974.79', '1978-07-16', 'ep586696m', 'Packager', 'Bernadene Lowey', 'Wife', '07937 182 672'),
('69-0536291', 'Jaime Woolhouse', '59 Jenna Park', '?34,370.50', '1977-05-01', 'dz195791x', 'Packager', 'Denys Tuckwood', 'Father', '07099 769 526'),
('69-0803348', 'Editha Anney', '271 Browning Plaza', '?67,023.77', '2001-08-23', 'mk604551h', 'Driver', 'Lloyd Pidon', 'Boyfriend', '07416 146 403'),
('69-3965258', 'Archie Godden', '7 Marcy Road', '?33,511.85', '1979-12-08', 'gk840892x', 'Packager', 'Goran Lamburn', 'Father', '07304 482 930'),
('69-5458568', 'Elvina Matuszynski', '6 Grover Road', '?76,167.80', '1956-05-27', 'ob669602j', 'Driver', 'Justinn Maginot', 'Civil Partner', '07255 258 700'),
('69-5925327', 'Sydelle Pelzer', '34635 Dawn Drive', '?15,069.38', '1973-11-12', 'ap767547i', 'Packager', 'Katusha Kirkham', 'Civil Partner', '07216 578 917'),
('69-6968657', 'Diannne Scala', '96290 Bunker Hill Hill', '?86,102.65', '1955-07-09', 'lw629488e', 'Packager', 'Duke Ruske', 'Father', '07775 640 640'),
('70-2965789', 'Lyell Brannan', '7 Anzinger Center', '?49,943.14', '1984-09-05', 'sv922230q', 'Driver', 'Domingo Zuppa', 'Boyfriend', '07642 910 675'),
('70-4763276', 'Nikaniki Scarman', '81 Fallview Avenue', '?92,757.77', '1994-12-05', 'uu528507s', 'Driver', 'Letitia Ellph', 'Boyfriend', '07764 688 949'),
('71-3652304', 'Esteban Ziemen', '4832 Pankratz Road', '?16,929.76', '1956-07-01', 'wc844307p', 'Driver', 'Ilyse Schultheiss', 'Wife', '07228 818 773'),
('71-4783541', 'Brandise Kondrachenko', '3 Kenwood Alley', '?49,471.98', '1961-02-28', 'fm459704k', 'Packager', 'Alica Adnam', 'Civil Partner', '07339 364 526'),
('71-7374760', 'Alfie Dean', '15 Mccormick Point', '?21,930.10', '1963-03-10', 'lh444635g', 'Packager', 'Godard Klimmek', 'Wife', '07219 099 770'),
('71-7837650', 'Shelley Camilletti', '91311 Hauk Avenue', '?67,736.10', '1974-12-25', 'yx527895g', 'Driver', 'Malory Hawes', 'Husband', '07066 178 667'),
('72-0413596', 'Philly Halliberton', '33 Sheridan Road', '?15,689.28', '1994-08-23', 'mo726896p', 'HR', 'Dorthy Savoury', 'Mother', '07911 839 364'),
('72-2448628', 'Gina Macrae', '607 Northport Center', '?36,331.78', '1961-05-14', 'tv211484w', 'Packager', 'Reeta Feary', 'Wife', '07985 842 262'),
('72-3040567', 'Tanney Marques', '9382 Prairie Rose Alley', '?70,585.82', '1966-02-19', 'no949821c', 'Packager', 'Joel Laxson', 'Girlfriend', '07781 001 495'),
('72-3549258', 'Bailey Lewington', '3 Bobwhite Center', '?90,668.84', '1993-02-02', 'ze015887n', 'Packager', 'Angus Ranscome', 'Boyfriend', '07105 859 928'),
('72-5913162', 'Rudolfo Norridge', '22 Golf Court', '?37,428.03', '1968-08-24', 'du615694i', 'Packager', 'Frazier Snelman', 'Boyfriend', '07235 513 354'),
('72-6079643', 'Leonelle Claridge', '09468 Lunder Place', '?61,662.41', '1974-01-15', 'qv402258l', 'Driver', 'Harlan Foxton', 'Husband', '07054 759 828'),
('72-7823438', 'Adrienne Myall', '9 Oneill Place', '?31,683.24', '1972-08-11', 'uv348158a', 'Driver', 'Taylor Screach', 'Civil Partner', '07029 866 049'),
('72-9006336', 'Ikey Sholl', '62 North Place', '?77,016.02', '1985-07-23', 'qf846140g', 'HR', 'Marianne Elion', 'Mother', '07866 004 620'),
('72-9328783', 'Constantia Privett', '162 Moland Terrace', '?25,686.80', '1980-01-29', 'tx491950i', 'Packager', 'Bryan Shawdforth', 'Father', '07939 930 407'),
('73-2251057', 'Lodovico Ashborne', '7312 Shoshone Court', '?72,963.41', '1983-08-24', 'cb298473a', 'Manager', 'Vilhelmina Wrangle', 'Mother', '07750 131 976'),
('73-6200004', 'Marie Gummoe', '4 Debra Terrace', '?45,954.79', '1954-07-31', 'kw585002h', 'Driver', 'Thibaud Bladder', 'Mother', '07357 406 936'),
('73-7147493', 'Chelsea Robertucci', '94833 Northview Way', '?78,083.27', '1956-12-28', 'df426741g', 'Driver', 'Alysa Bonavia', 'Husband', '07998 104 368'),
('74-0303597', 'Bria Thomkins', '7 Homewood Road', '?88,871.61', '1952-04-01', 'tx085395s', 'Manager', 'Reed Easterfield', 'Civil Partner', '07523 340 134'),
('74-9747670', 'Hymie Dows', '12 Dwight Terrace', '?62,699.64', '1965-11-16', 'aq304702r', 'Driver', 'Gerik Graeser', 'Girlfriend', '07753 745 592'),
('75-0124112', 'Jennica Welbeck', '78916 Green Ridge Trail', '?57,947.01', '1952-04-18', 'ma973579k', 'Packager', 'Abbey Waryk', 'Boyfriend', '07260 273 133'),
('75-0131682', 'Charlot Dignall', '950 Arizona Terrace', '?15,153.98', '1972-05-12', 'bj869010d', 'Packager', 'Staci Normadell', 'Girlfriend', '07035 352 138'),
('75-0328049', 'Cassy Hiddersley', '9902 Starling Circle', '?71,258.15', '1999-09-03', 'sg232892l', 'Packager', 'Samuele Solesbury', 'Wife', '07037 038 101'),
('75-0958781', 'Velvet Carbine', '682 Kensington Drive', '?31,440.81', '1987-04-12', 'of014519k', 'Driver', 'Lorri Elkington', 'Girlfriend', '07692 074 959'),
('75-1340477', 'Ferd Uccello', '90243 Karstens Pass', '?72,024.81', '1997-01-09', 'nu487701k', 'Driver', 'Edi Haygreen', 'Husband', '07382 538 132'),
('75-6520267', 'Truda Edleston', '37994 Green Ridge Drive', '?23,646.90', '1966-03-07', 'lp500272n', 'Driver', 'Tyler Rowsell', 'Wife', '07753 973 466'),
('75-6891165', 'Robinett Iacopini', '2224 Kensington Street', '?62,045.69', '1961-08-27', 'lq983512u', 'Driver', 'Stepha Doohan', 'Husband', '07728 862 325'),
('75-8250680', 'Conney Ferras', '43048 American Ash Hill', '?93,389.40', '1993-07-19', 'us717372t', 'Packager', 'Dagmar Ranahan', 'Mother', '07367 105 969'),
('75-9134355', 'Ramonda Overpool', '12879 Mayfield Lane', '?28,892.13', '1958-03-01', 'ew007431m', 'Driver', 'Alie Lutz', 'Civil Partner', '07880 354 813'),
('76-0000021', 'Norton Bygrove', '0412 Packers Lane', '?43,733.47', '1952-12-09', 'xx491915v', 'HR', 'Agatha Nulty', 'Girlfriend', '07895 871 178'),
('76-0099650', 'Tymon Smeal', '22635 Toban Court', '?65,314.49', '1983-12-07', 'ww210857j', 'Driver', 'Phyllys Lamey', 'Boyfriend', '07427 306 598'),
('76-2727093', 'Nesta Dottrell', '6 Ridgeway Court', '?71,905.32', '1981-04-26', 'mg608324j', 'Driver', 'Joe MacCleay', 'Mother', '07329 779 233'),
('76-2985832', 'Desirae Gooch', '6306 Reinke Circle', '?42,779.29', '1979-01-07', 'uc493497v', 'Manager', 'Phillie Eles', 'Husband', '07925 034 405'),
('76-3367992', 'Pammy Sterling', '466 Northfield Alley', '?86,046.49', '1966-04-21', 'sj533699h', 'Driver', 'Milty Corney', 'Husband', '07432 348 532'),
('76-4036199', 'Noni Szymoni', '6 Kedzie Circle', '?90,864.71', '1959-02-09', 'yl605202h', 'Packager', 'Joyce Jaynes', 'Civil Partner', '07184 014 200'),
('76-4086283', 'Laird Stalley', '75447 Norway Maple Park', '?91,412.37', '1953-12-05', 'fc920310o', 'Driver', 'Krishna Payle', 'Mother', '07834 640 631'),
('76-4940799', 'Anderea Challicombe', '8 Melvin Terrace', '?87,575.30', '1999-03-21', 'vv690440b', 'Packager', 'Towny Deetch', 'Civil Partner', '07086 691 240'),
('76-8791360', 'Afton Cassels', '4 Grover Way', '?30,662.87', '1984-06-15', 'uu202177x', 'Driver', 'Ryley Schieferstein', 'Mother', '07941 015 817'),
('77-1835914', 'Annabelle Caddies', '66 Loomis Alley', '?94,451.03', '1964-03-26', 'mp067841c', 'Packager', 'Lucila Farlamb', 'Husband', '07665 666 934'),
('77-2348932', 'Sal Dominy', '88006 Charing Cross Hill', '?39,168.52', '1994-07-30', 'ro907653y', 'HR', 'Verney Essam', 'Husband', '07173 823 511'),
('77-5513461', 'Noell Azam', '66 Brown Hill', '?60,586.79', '1974-05-19', 'zk782722r', 'Driver', 'Dante Snozzwell', 'Boyfriend', '07066 007 108'),
('77-5748543', 'Fanchon Stebbings', '77689 Donald Alley', '?38,753.87', '1966-11-15', 'xy286906n', 'Packager', 'Clayton Segar', 'Mother', '07030 174 840'),
('77-6317806', 'Keelby Pelling', '5 Jay Trail', '?57,007.18', '1965-12-22', 'hj451937l', 'HR', 'Clyve Pedroli', 'Father', '07680 068 925'),
('77-7401728', 'Cloris Truckell', '84521 Pearson Street', '?72,938.51', '1995-05-03', 'bn687310q', 'Driver', 'Eben Samms', 'Wife', '07923 010 205'),
('77-8203719', 'Netta McCabe', '1 Lakewood Gardens Plaza', '?45,095.62', '1998-02-26', 'vy489059e', 'Driver', 'Veradis Glidder', 'Girlfriend', '07392 244 305'),
('78-0380118', 'Dewitt Gabby', '8 Montana Park', '?93,187.29', '1961-06-07', 'mo353148n', 'Driver', 'Marjorie Fraine', 'Wife', '07037 535 429'),
('78-1195027', 'Meade Ketteman', '47 Nevada Center', '?17,823.35', '1950-07-30', 'ul369491o', 'Driver', 'Meridith Lowes', 'Civil Partner', '07881 576 200'),
('78-4344207', 'Aldridge Kensett', '94 Dunning Trail', '?86,064.22', '1987-12-04', 'sk062184b', 'Driver', 'Griffith Witherow', 'Father', '07449 485 950'),
('78-6321379', 'Thea Bradborne', '3118 Lien Circle', '?35,665.99', '1967-09-27', 'vb943949c', 'Driver', 'Theo Sheard', 'Mother', '07356 401 825'),
('78-8816060', 'Marilyn Glassborow', '6 Waubesa Crossing', '?90,675.10', '1978-11-19', 'lh695834z', 'Driver', 'Rivy Gensavage', 'Husband', '07544 911 166'),
('78-9623211', 'Margaretha Kikke', '24 Logan Circle', '?25,726.10', '2000-01-08', 'uv389552l', 'Packager', 'Leshia Allcorn', 'Mother', '07341 771 237'),
('79-0464882', 'Lia Hargreaves', '721 Graceland Alley', '?13,755.82', '1995-08-03', 'dt884304c', 'Driver', 'Becka Card', 'Father', '07503 035 492'),
('79-1576734', 'Malchy Kempshall', '5 Melby Plaza', '?48,788.98', '1950-04-08', 'nv658761a', 'Packager', 'Ossie McBean', 'Civil Partner', '07137 684 264'),
('79-4798875', 'Iorgo Dowsey', '904 Pond Park', '?14,568.84', '2001-07-08', 'vv771459v', 'Driver', 'Mile Scholler', 'Father', '07558 144 894'),
('79-5517945', 'Darryl Payfoot', '62334 Prairie Rose Drive', '?84,841.60', '1955-10-15', 'rc413749a', 'Packager', 'Daloris Lanon', 'Mother', '07102 109 240'),
('79-9536595', 'Noni Abbatucci', '1 Monterey Center', '?14,602.61', '1989-03-18', 'nt307553s', 'Driver', 'Cybil Bemrose', 'Mother', '07078 712 010'),
('80-3234805', 'Greer Durnford', '44200 Sauthoff Terrace', '?82,703.39', '1996-11-16', 'ry037414u', 'Packager', 'Mindy Gatch', 'Girlfriend', '07074 285 151'),
('80-6524018', 'Ambur Challenor', '2 Morning Crossing', '?47,033.97', '1955-09-17', 'tn459758p', 'Packager', 'Eilis Domenici', 'Civil Partner', '07141 393 691'),
('80-7938995', 'Armstrong Ivachyov', '41681 Welch Court', '?36,204.54', '1973-12-10', 'ly992939e', 'Driver', 'Fiorenze Elvey', 'Father', '07902 274 458'),
('80-7941049', 'Chiarra Dundridge', '04 Porter Avenue', '?67,648.79', '1972-01-10', 'ps295181z', 'HR', 'Leroi Dingivan', 'Husband', '07244 918 390'),
('80-8617080', 'Salomi Lintin', '29507 Bartillon Terrace', '?78,695.13', '1985-04-26', 'cc846598u', 'Driver', 'Delainey Benedtti', 'Mother', '07621 668 278'),
('81-0188200', 'Nadine Davidson', '0 Jana Alley', '?23,660.37', '1998-05-19', 'eb645921x', 'Driver', 'Frederique Wheatman', 'Civil Partner', '07068 255 984'),
('81-2733835', 'Magdalen McIlwrick', '2099 Debra Trail', '?41,997.19', '1974-01-19', 'rr316532p', 'HR', 'Brendis Saunder', 'Mother', '07747 163 685'),
('81-4865027', 'Annette Josephs', '532 Kipling Place', '?46,710.64', '1960-03-07', 'vk802431y', 'Driver', 'Rouvin Von Oertzen', 'Mother', '07950 739 212'),
('81-5031235', 'Gill Fulford', '9 Susan Avenue', '?46,429.85', '1968-03-20', 'vg667583e', 'Driver', 'Rafaellle Tweedlie', 'Wife', '07036 754 544'),
('81-5228790', 'Rene Waddup', '47 Southridge Parkway', '?40,348.66', '1992-08-08', 'vy525798f', 'Driver', 'Katee Dilrew', 'Father', '07612 660 166'),
('81-7038918', 'Fraze Maletratt', '96 Rockefeller Circle', '?30,986.25', '1993-04-02', 'dr489342o', 'Packager', 'Ruggiero Kilgrove', 'Civil Partner', '07100 170 818'),
('81-8060778', 'Estevan Francesco', '2 Troy Avenue', '?85,869.29', '1970-09-16', 'sf717839d', 'HR', 'Jacki Tupling', 'Boyfriend', '07890 810 674'),
('82-1629865', 'Dag Choules', '53 Blue Bill Park Center', '?23,537.76', '1998-08-16', 'dz430103g', 'Driver', 'Nikaniki Stenhouse', 'Husband', '07585 388 400'),
('82-2609006', 'Cyrus Willmetts', '470 Oakridge Circle', '?70,654.72', '1986-08-02', 'gx740846k', 'HR', 'Levon Bratt', 'Boyfriend', '07123 594 714'),
('82-2981878', 'Cherida Gocke', '395 Comanche Center', '?31,735.68', '1951-12-06', 'ej657352g', 'Driver', 'Erhart Husset', 'Boyfriend', '07683 714 091'),
('82-6558984', 'Hebert Zaniolini', '8 Buell Place', '?50,633.71', '1991-09-05', 'kd209714d', 'Manager', 'Sim Sacher', 'Father', '07962 176 107'),
('82-9457047', 'Merralee Vannuchi', '7 Vera Place', '?56,425.54', '1986-01-20', 'lf092320a', 'Driver', 'Brnaby Hilhouse', 'Girlfriend', '07346 042 351'),
('83-1009344', 'Eba Fiander', '0094 Fallview Terrace', '?61,818.38', '1993-10-17', 'nf421951o', 'Packager', 'Emmet Speedy', 'Husband', '07964 772 320'),
('83-1217063', 'Viola Holleran', '877 Twin Pines Plaza', '?94,882.77', '1984-03-23', 'zb232750v', 'Driver', 'Francois Goodrick', 'Civil Partner', '07224 909 347'),
('83-3514873', 'Roscoe Honeyghan', '89 Golden Leaf Drive', '?93,281.90', '1977-11-11', 'lv730967l', 'Packager', 'Ferrell Scruton', 'Boyfriend', '07455 760 917'),
('83-4865660', 'Jase Fulk', '80 Pennsylvania Center', '?90,529.95', '1984-03-29', 'ak984038n', 'Manager', 'Rosabella Howlin', 'Father', '07545 233 448'),
('83-5537250', 'Arly Bartolommeo', '759 Esch Way', '?67,921.89', '1960-02-12', 'la176569w', 'Packager', 'Dickie Prophet', 'Wife', '07596 027 218'),
('83-6435523', 'Bevan Durrell', '18 Butternut Road', '?24,202.05', '1950-02-09', 'wa954782v', 'Packager', 'Cris Melladew', 'Mother', '07427 006 306'),
('83-7810679', 'Davie Cutill', '61998 Fisk Lane', '?92,319.52', '1961-12-28', 'xq363276d', 'Packager', 'Michale Kluger', 'Husband', '07685 967 303'),
('84-0386773', 'Nady Yvens', '84 Mayer Court', '?82,751.39', '1993-05-26', 'rs150649p', 'Driver', 'Randall Corriea', 'Husband', '07654 630 110'),
('84-3457422', 'Ernestus Dewsnap', '937 Springs Road', '?65,304.51', '1963-09-14', 'xe947994r', 'Driver', 'Dixie Glazebrook', 'Mother', '07427 129 714'),
('84-3853067', 'Bianka Druce', '5 Pierstorff Plaza', '?98,768.78', '1955-02-28', 'xa610379g', 'HR', 'Marlie Schwaiger', 'Civil Partner', '07055 302 769'),
('84-5153657', 'Catharine Sharpous', '081 Hermina Trail', '?98,273.90', '1983-08-10', 'vg979335t', 'Driver', 'Hamnet Hamly', 'Wife', '07692 458 187'),
('84-8762859', 'Hewett Collcutt', '453 Emmet Center', '?21,438.35', '1953-07-05', 'nk424390j', 'Driver', 'Izzy Ahlf', 'Father', '07044 089 640'),
('84-9275069', 'Julina Copnar', '8 Randy Court', '?55,255.85', '1991-06-01', 'xd785936e', 'Driver', 'Rozelle McCullouch', 'Husband', '07387 875 939'),
('85-0601601', 'Dotti Busek', '32564 Veith Circle', '?12,043.56', '1984-06-06', 'xc467370v', 'HR', 'Adam Roderighi', 'Husband', '07503 037 843'),
('85-3334513', 'Benita Taffarello', '89784 Hollow Ridge Avenue', '?58,884.21', '1991-11-24', 'op270447a', 'Driver', 'Bron Danby', 'Mother', '07385 290 163'),
('85-4557957', 'Barr Eefting', '234 Susan Lane', '?44,265.60', '1976-11-12', 'ju063558q', 'Packager', 'Charla Crickmore', 'Boyfriend', '07512 743 229'),
('85-5431069', 'Marney Kolak', '5 Merrick Road', '?97,251.70', '1978-10-15', 'xb125807v', 'HR', 'Murielle Suett', 'Husband', '07932 036 011'),
('85-7355238', 'Kial Labden', '55507 Bultman Circle', '?39,885.17', '1998-03-07', 'ux496294h', 'Packager', 'Jennee Costock', 'Father', '07362 630 943'),
('85-7718619', 'Rhody Yaxley', '90344 Merrick Crossing', '?98,055.42', '1983-01-24', 'of102924m', 'HR', 'Margot Santos', 'Girlfriend', '07915 649 295'),
('86-1870935', 'Gwynne Garrow', '2648 Old Gate Circle', '?66,379.47', '2000-03-21', 'ds178316s', 'Driver', 'Philis Gulleford', 'Father', '07838 716 945'),
('86-2503827', 'Nikola Henbury', '8116 Erie Junction', '?95,300.54', '1968-03-28', 'cz046288u', 'Driver', 'Jone Tatersale', 'Mother', '07761 255 990'),
('86-5274202', 'Holden Artharg', '61 Vera Crossing', '?55,750.53', '1971-08-11', 'cw848240k', 'Packager', 'George Barczynski', 'Girlfriend', '07927 318 789'),
('87-1470903', 'Stafani Clampe', '8 Bultman Avenue', '?28,092.26', '1954-05-05', 'vu807135v', 'Packager', 'Toma Van\'t Hoff', 'Boyfriend', '07866 974 051'),
('87-1949652', 'Malcolm Louys', '2 Ronald Regan Pass', '?72,398.03', '1996-02-13', 'wu157014q', 'Driver', 'Lelia Heppenspall', 'Mother', '07865 407 286'),
('87-3376412', 'Michaela Shrieve', '78 Raven Road', '?70,070.27', '1958-10-13', 'jn422060l', 'Driver', 'Valaree Treadgold', 'Civil Partner', '07427 564 348'),
('87-4453963', 'Sibeal Fullard', '6296 Pleasure Road', '?46,783.79', '1978-12-16', 'er088315j', 'Driver', 'Nonie Ledgard', 'Girlfriend', '07316 951 272'),
('87-6633787', 'Vivie Jagels', '77 Dovetail Drive', '?41,830.50', '1964-12-06', 'sm423704x', 'Manager', 'Cassandra Merle', 'Mother', '07220 743 776'),
('87-7188668', 'Salli Oulner', '26 Pepper Wood Parkway', '?90,004.65', '1957-10-24', 'kt389837b', 'HR', 'Kane Piers', 'Husband', '07453 022 869'),
('87-8002965', 'Fredericka Mathivat', '370 Mendota Court', '?68,554.76', '1989-04-17', 'rp358778t', 'Manager', 'Reeba Lamartine', 'Mother', '07726 563 483'),
('87-8745898', 'Harwell Lain', '11 Bartelt Terrace', '?60,453.87', '1978-01-31', 'yz604658j', 'Packager', 'Elston Loins', 'Girlfriend', '07930 606 296'),
('87-8762204', 'Patric Izsak', '02 Comanche Place', '?65,976.34', '1959-09-10', 'lb704495e', 'Packager', 'Alikee O\'Malley', 'Girlfriend', '07352 836 056'),
('88-4435308', 'Cedric Chazotte', '77 Ilene Parkway', '?84,591.95', '1965-07-07', 'ji880896f', 'Packager', 'Friedrich Howsego', 'Father', '07787 734 288'),
('89-0022888', 'Nelli Esche', '78814 Summer Ridge Court', '?15,353.78', '1994-01-04', 'nr398078m', 'Packager', 'Essa Sor', 'Husband', '07629 867 802'),
('89-1889473', 'Alysa Marley', '0906 Duke Point', '?79,091.50', '1988-05-14', 'ap444024o', 'Packager', 'Pattie Bohl', 'Girlfriend', '07158 470 617'),
('89-4176534', 'Conni Orhrt', '92 Moose Park', '?14,137.68', '2000-05-09', 'ui092814r', 'Driver', 'Zaneta Shrubb', 'Father', '07613 479 105'),
('89-4884561', 'Wynn Winterscale', '931 Warbler Road', '?76,837.12', '1989-12-12', 'us493269a', 'HR', 'Welbie Hearon', 'Mother', '07174 233 681'),
('89-5714177', 'Bobbye Pottinger', '4633 Scott Street', '?99,191.41', '1953-12-04', 'vy437276r', 'Packager', 'Budd Follacaro', 'Girlfriend', '07569 513 210'),
('89-6058656', 'Yorgos Philippard', '8976 Dakota Terrace', '?60,909.78', '1968-07-13', 'bu861195y', 'Driver', 'Violet Doutch', 'Wife', '07346 373 537'),
('90-0686303', 'Ludovika Blucher', '0141 Forest Alley', '?59,728.01', '1956-01-13', 'sk016695u', 'Packager', 'Wain Savine', 'Civil Partner', '07473 391 474'),
('90-1403954', 'Jeffy Camel', '067 Columbus Street', '?78,815.19', '1987-11-19', 'ql321121l', 'Packager', 'Vinnie Parr', 'Father', '07792 234 252'),
('90-3945672', 'Lianna Seden', '655 Superior Alley', '?37,009.12', '1964-07-19', 'jt347163f', 'Driver', 'Jacenta Slimme', 'Boyfriend', '07903 181 488'),
('90-5035577', 'Isacco Chaperling', '71120 West Crossing', '?81,126.94', '1975-11-03', 'sn878406k', 'HR', 'Cindelyn Gallant', 'Husband', '07583 588 628'),
('90-6409982', 'Irv Tomsen', '0 Harper Way', '?66,852.98', '1995-08-05', 'ms059474n', 'Driver', 'Krissy Clayworth', 'Mother', '07448 190 979'),
('90-9258513', 'Yank Mullan', '94728 5th Center', '?82,932.31', '1986-01-25', 'is015669m', 'Packager', 'Cornie Moodie', 'Girlfriend', '07878 023 821'),
('92-9480837', 'Phyllis Lalevee', '77169 Sullivan Crossing', '?38,220.79', '1962-03-06', 'wh734079v', 'Driver', 'Tallie Huggon', 'Father', '07493 025 274'),
('92-9623071', 'Wait Prate', '0367 Moose Hill', '?95,732.18', '2000-08-24', 'bn415170d', 'Driver', 'Umberto Mulrooney', 'Boyfriend', '07291 039 769'),
('92-9715314', 'Larissa Holtham', '8751 Hoepker Circle', '?97,254.38', '1969-01-15', 'bt371843i', 'Driver', 'Frasquito Legerwood', 'Mother', '07484 895 380'),
('93-0686984', 'Dirk Perrott', '679 Summer Ridge Road', '?82,551.62', '1995-10-17', 'jc445141x', 'Driver', 'Sansone Harragin', 'Mother', '07946 591 368'),
('93-5661312', 'Gordie Gaynesford', '4 Fordem Circle', '?67,381.57', '1986-10-24', 'hm085014v', 'Manager', 'Granville Hacket', 'Husband', '07058 101 214'),
('93-5928498', 'Sukey Roddan', '5 Gulseth Center', '?18,304.57', '1979-04-06', 'ik578743b', 'Packager', 'Wanids Dunckley', 'Boyfriend', '07415 773 406'),
('93-8667645', 'Marna Abramski', '6 Scoville Pass', '?13,595.15', '1985-10-15', 'gj588599m', 'HR', 'Carling Jell', 'Civil Partner', '07345 068 432'),
('94-4705277', 'Orton Willmore', '4 Pine View Street', '?14,870.36', '1985-01-31', 'xh603239m', 'Driver', 'Timothy Reck', 'Civil Partner', '07149 504 735'),
('94-6907133', 'Alica Barthel', '80231 Twin Pines Center', '?82,703.00', '1987-09-02', 'mw080326p', 'Driver', 'Torrence Fowells', 'Civil Partner', '07620 698 046'),
('95-1174328', 'Heath Manvell', '77 Westridge Road', '?29,749.03', '1970-02-28', 'ub404168r', 'Driver', 'Ham Snalum', 'Father', '07513 042 679'),
('95-1790755', 'Staford Klarzynski', '02676 Mesta Junction', '?62,596.85', '1951-03-09', 'lw151180l', 'Driver', 'Sayre Faint', 'Girlfriend', '07320 940 413'),
('95-3517999', 'Garald Greenrde', '15302 Independence Drive', '?56,092.80', '1975-09-04', 'hp673805w', 'Packager', 'Caryl Coyle', 'Girlfriend', '07142 015 007'),
('95-7092127', 'Dulciana Duxfield', '44249 Westridge Drive', '?62,408.05', '1964-10-18', 'do305555k', 'Packager', 'Lee Burt', 'Mother', '07001 392 333'),
('96-0987852', 'Nataline Roycroft', '52339 Eastlawn Crossing', '?81,005.05', '1967-06-04', 'rc734008g', 'Packager', 'Danny Heinsen', 'Father', '07194 408 632'),
('96-1648398', 'Hugues Tavner', '78 Parkside Point', '?37,393.68', '1980-12-03', 'va219127u', 'Driver', 'Tobe Vazquez', 'Boyfriend', '07936 699 391'),
('97-0147786', 'Haze Rosenbush', '0 Kropf Alley', '?89,561.58', '1995-11-10', 'wx774255i', 'HR', 'Joanie Scholtz', 'Husband', '07244 882 292'),
('97-0913105', 'Kelly Farragher', '6 Meadow Vale Trail', '?52,644.35', '1980-10-20', 'ob677832o', 'HR', 'Zaria Tallet', 'Boyfriend', '07473 173 088'),
('97-3138911', 'Alvina Paterno', '09 Golf Drive', '?23,002.76', '1986-06-21', 'ao592540g', 'Driver', 'Sal Bruckstein', 'Wife', '07113 310 488'),
('97-3703178', 'Thatch Kinvig', '9 Fuller Street', '?31,866.49', '1983-03-16', 'gm065123w', 'HR', 'Mike Tiron', 'Girlfriend', '07100 728 296'),
('97-4110845', 'Judah Groomebridge', '1714 Clyde Gallagher Point', '?52,171.58', '1959-10-25', 'kc825703y', 'HR', 'Asher Ferrarotti', 'Civil Partner', '07460 150 758'),
('97-5558458', 'Sarina Kalb', '565 Annamark Alley', '?45,859.99', '1950-11-14', 'qu905290s', 'Packager', 'Perla Sokill', 'Girlfriend', '07455 033 890'),
('97-5683996', 'Cornie Hub', '564 Muir Alley', '?13,017.59', '1999-04-01', 'vs049545n', 'Driver', 'Darci Milbourne', 'Civil Partner', '07035 959 026'),
('97-6528129', 'Darn O\'Lunny', '228 Porter Street', '?23,811.76', '1962-06-23', 'ai316031z', 'Driver', 'Eilis Decent', 'Husband', '07190 067 060'),
('97-9018441', 'Morganica Dracksford', '867 Pierstorff Hill', '?91,483.69', '1986-08-03', 'po115732f', 'Driver', 'Rorie Silverton', 'Civil Partner', '07675 154 777'),
('98-1678319', 'Lamar Chesters', '2234 Heffernan Place', '?97,090.47', '1952-02-01', 'wh660279o', 'Driver', 'Maryjo Elgie', 'Wife', '07007 723 133'),
('98-3556505', 'Douglas MacArdle', '14 Laurel Court', '?92,356.56', '1991-07-15', 'wk661827y', 'Driver', 'Lynsey Moraleda', 'Wife', '07652 112 844'),
('98-4762907', 'Nari Crawshaw', '40 Debra Center', '?91,733.92', '1992-03-21', 'kd444344u', 'Driver', 'Ewart Benton', 'Civil Partner', '07888 475 034'),
('98-9650752', 'Alene Amiss', '07913 Jenna Trail', '?94,129.62', '1977-08-25', 'hm391563j', 'Packager', 'Cristina Ervine', 'Civil Partner', '07854 566 028'),
('99-0222188', 'Lonnie Niessen', '754 Lien Road', '?95,600.64', '1977-04-12', 'gb123108s', 'Packager', 'Ashley Jeenes', 'Wife', '07512 219 266'),
('99-1372878', 'Annnora Leabeater', '931 Waxwing Pass', '?84,021.43', '1962-07-22', 'zy295345w', 'HR', 'Leena Gorry', 'Father', '07049 508 215'),
('99-4615801', 'Meggi Abbado', '3078 Hoffman Junction', '?50,699.73', '1966-02-17', 'kv498760u', 'Driver', 'Mikey Vedeniktov', 'Boyfriend', '07326 764 405'),
('99-4988360', 'Carlie Braganza', '806 Sachs Parkway', '?31,442.08', '1964-05-16', 'ev422969a', 'Packager', 'Hadleigh Twining', 'Civil Partner', '07302 069 966'),
('99-6209168', 'Renaud Skpsey', '4430 Fieldstone Alley', '?44,136.49', '2002-01-26', 'tm559297a', 'HR', 'Clotilda Blues', 'Girlfriend', '07754 815 231');

--
-- Triggers `employees`
--
DELIMITER $$
CREATE TRIGGER `terminate` AFTER DELETE ON `employees` FOR EACH ROW INSERT INTO delete_audit
SET emp_id_del = OLD.emp_id,
	del_date = NOW()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `hours`
--

CREATE TABLE `hours` (
  `employee_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hours_per_week` int(11) NOT NULL COMMENT 'Can be null'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hr`
--

CREATE TABLE `hr` (
  `employee_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `manager_id` varchar(11) NOT NULL,
  `office_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` varchar(11) NOT NULL,
  `manager_name` varchar(60) NOT NULL,
  `employee_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `office_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `office`
--

CREATE TABLE `office` (
  `office_id` varchar(11) NOT NULL,
  `office_name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ordered_products`
--

CREATE TABLE `ordered_products` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packager`
--

CREATE TABLE `packager` (
  `employee_id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `manager_id` varchar(11) NOT NULL,
  `office_id` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity_remaining` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `starting_location` varchar(50) NOT NULL,
  `ending_location` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `arrival_time_final` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

CREATE TABLE `stops` (
  `stop_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `stop_location` varchar(50) NOT NULL,
  `arrival_time_stop` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_id` int(11) NOT NULL,
  `vehicle_name` varchar(50) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `unique_location` varchar(50) NOT NULL,
  `size` int(11) NOT NULL,
  `area` int(11) NOT NULL COMMENT 'area can just be an int, no need for it to be a VARCHAR',
  `purpose` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_product_quantity`
--

CREATE TABLE `warehouse_product_quantity` (
  `warehouse_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_remaining` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaints`
--
ALTER TABLE `complaints`
  ADD PRIMARY KEY (`complaint_id`),
  ADD KEY `complaint_employee_fk` (`employee_id`),
  ADD KEY `complaint_customer` (`customer_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `c_order`
--
ALTER TABLE `c_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `order_customer_fk` (`customer_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_no`);

--
-- Indexes for table `department_details`
--
ALTER TABLE `department_details`
  ADD KEY `dep_no_fk` (`department_no`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD KEY `managerid_fk` (`manager_id`),
  ADD KEY `driver_emp_id_fk` (`employee_id`),
  ADD KEY `driver_route_fk` (`route_id`),
  ADD KEY `driver_vehicle_fk` (`vehicle_id`),
  ADD KEY `driver_warehouse_fk` (`warehouse_id`);

--
-- Indexes for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD KEY `emp_fk` (`employee_id`);

--
-- Indexes for table `employeee`
--
ALTER TABLE `employeee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `hours`
--
ALTER TABLE `hours`
  ADD KEY `hours_emp_id_fk` (`employee_id`);

--
-- Indexes for table `hr`
--
ALTER TABLE `hr`
  ADD KEY `hr_emp_id_fk` (`employee_id`),
  ADD KEY `hr_manger_id_fk` (`manager_id`),
  ADD KEY `hr_office_id_fk` (`office_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`),
  ADD KEY `emp_id_manager_id_fk` (`employee_id`),
  ADD KEY `manager_office_id_fk` (`office_id`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`);

--
-- Indexes for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD KEY `op_order_fk` (`order_id`),
  ADD KEY `op_product_fk` (`product_id`);

--
-- Indexes for table `packager`
--
ALTER TABLE `packager`
  ADD KEY `packager_emp_id_fk` (`employee_id`),
  ADD KEY `packager_mnger_id_fk` (`manager_id`),
  ADD KEY `packager_office_id_fk` (`office_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `stops`
--
ALTER TABLE `stops`
  ADD PRIMARY KEY (`stop_id`),
  ADD KEY `stop_route_fk` (`route_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD KEY `vehicle_warehouse_fk` (`warehouse_id`),
  ADD KEY `vehicle_route` (`route_id`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`warehouse_id`);

--
-- Indexes for table `warehouse_product_quantity`
--
ALTER TABLE `warehouse_product_quantity`
  ADD KEY `wp_warehouse_fk` (`warehouse_id`),
  ADD KEY `wp_product_fk` (`product_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `complaints`
--
ALTER TABLE `complaints`
  ADD CONSTRAINT `Complaints_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `complaint_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `complaint_employee_fk` FOREIGN KEY (`employee_id`) REFERENCES `employeee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `c_order`
--
ALTER TABLE `c_order`
  ADD CONSTRAINT `order_customer_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `department_details`
--
ALTER TABLE `department_details`
  ADD CONSTRAINT `dep_no_fk` FOREIGN KEY (`department_no`) REFERENCES `department` (`department_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver`
--
ALTER TABLE `driver`
  ADD CONSTRAINT `driver_emp_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employeee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_route_fk` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_vehicle_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`vehicle_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `driver_warehouse_fk` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `managerid_fk` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emergency_contact`
--
ALTER TABLE `emergency_contact`
  ADD CONSTRAINT `emp_fk` FOREIGN KEY (`employee_id`) REFERENCES `employeee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hours`
--
ALTER TABLE `hours`
  ADD CONSTRAINT `hours_emp_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employeee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `hr`
--
ALTER TABLE `hr`
  ADD CONSTRAINT `hr_emp_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employeee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_manger_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hr_office_id_fk` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `emp_id_manager_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employeee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `manager_office_id_fk` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ordered_products`
--
ALTER TABLE `ordered_products`
  ADD CONSTRAINT `op_order_fk` FOREIGN KEY (`order_id`) REFERENCES `c_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `op_product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `packager`
--
ALTER TABLE `packager`
  ADD CONSTRAINT `packager_emp_id_fk` FOREIGN KEY (`employee_id`) REFERENCES `employeee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `packager_mnger_id_fk` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `packager_office_id_fk` FOREIGN KEY (`office_id`) REFERENCES `office` (`office_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stops`
--
ALTER TABLE `stops`
  ADD CONSTRAINT `stop_route_fk` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `vehicle_route` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `vehicle_warehouse_fk` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `warehouse_product_quantity`
--
ALTER TABLE `warehouse_product_quantity`
  ADD CONSTRAINT `wp_product_fk` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `wp_warehouse_fk` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
