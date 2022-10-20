-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 20, 2022 at 10:02 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pakjiddat_islamcompanion`
--

-- --------------------------------------------------------

--
-- Table structure for table `ic_quranic_suras_meta`
--

CREATE TABLE `ic_quranic_suras_meta` (
  `id` int(11) NOT NULL,
  `sindex` int(11) NOT NULL,
  `ayas` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tname` varchar(100) NOT NULL,
  `ename` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `sorder` int(11) NOT NULL,
  `rukus` int(11) NOT NULL,
  `audiofile` varchar(255) NOT NULL,
  `checksum` text NOT NULL,
  `created_on` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='used to store sura information of the Holy Quran';

--
-- Dumping data for table `ic_quranic_suras_meta`
--

INSERT INTO `ic_quranic_suras_meta` (`id`, `sindex`, `ayas`, `start`, `name`, `tname`, `ename`, `type`, `sorder`, `rukus`, `audiofile`, `checksum`, `created_on`) VALUES
(1, 1, 7, 0, 'الفاتحة', 'Al-Faatiha', 'The Opening', 'Meccan', 5, 1, 'fatiha', '1151ca813f5dabb544be2f2fdb8ee90f', 1420981637),
(2, 2, 286, 7, 'البقرة', 'Al-Baqara', 'The Cow', 'Medinan', 87, 40, 'baqara', 'ed79d33d081352c8593a41c057947d15', 1420981637),
(3, 3, 200, 293, 'آل عمران', 'Aal-i-Imraan', 'The Family of Imraan', 'Medinan', 89, 20, 'aaleimran', 'bafe5218356ef05ab55df91ae584ef1b', 1420981637),
(4, 4, 176, 493, 'النساء', 'An-Nisaa', 'The Women', 'Medinan', 92, 24, 'nisa', 'd106d7d19c7fec9c9392ccd3f2ad1958', 1420981637),
(5, 5, 120, 669, 'المائدة', 'Al-Maaida', 'The Table', 'Medinan', 112, 16, 'maida', 'd25dd1f54124056520589b5ba915de9b', 1420981637),
(6, 6, 165, 789, 'الأنعام', 'Al-An\'aam', 'The Cattle', 'Meccan', 55, 20, 'alanam', '93f0a3ad9de5e637e6714b03cb3e51a8', 1420981637),
(7, 7, 206, 954, 'الأعراف', 'Al-A\'raaf', 'The Heights', 'Meccan', 39, 24, 'alaraf', '44bb6683d46bd7f6f3aa2432e9a733f0', 1420981637),
(8, 8, 75, 1160, 'الأنفال', 'Al-Anfaal', 'The Spoils of War', 'Medinan', 88, 10, 'alanfal', '0753ba18aad0e51c613a8d454a12d32f', 1420981637),
(9, 9, 129, 1235, 'التوبة', 'At-Tawba', 'The Repentance', 'Medinan', 113, 16, 'tauba', '715220e49385e1e629b5e0a6da8f4c90', 1420981637),
(10, 10, 109, 1364, 'يونس', 'Yunus', 'Jonas', 'Meccan', 51, 11, 'younus', 'f2dd2cc62497501432b24e5c2f392909', 1420981637),
(11, 11, 123, 1473, 'هود', 'Hud', 'Hud', 'Meccan', 52, 10, 'huud', '0b2996609f34831e29f17878e26b88ae', 1420981637),
(12, 12, 111, 1596, 'يوسف', 'Yusuf', 'Joseph', 'Meccan', 53, 12, 'yousuf', '7f84d5224012235a5c89da20cd2707cf', 1420981637),
(13, 13, 43, 1707, 'الرعد', 'Ar-Ra\'d', 'The Thunder', 'Medinan', 96, 6, 'arraad', 'de4f70499318bece2bf8833d84ce6267', 1420981637),
(14, 14, 52, 1750, 'ابراهيم', 'Ibrahim', 'Abraham', 'Meccan', 72, 7, 'ibrahim', '3fdf1c3f7745b5ae22a8dc59a8107efa', 1420981637),
(15, 15, 99, 1802, 'الحجر', 'Al-Hijr', 'The Rock', 'Meccan', 54, 6, 'alhijr', 'cd18f3fe18db265be90a88fcae83a955', 1420981637),
(16, 16, 128, 1901, 'النحل', 'An-Nahl', 'The Bee', 'Meccan', 70, 16, 'annahal', '1b32cb96908ceb57dfd376158f1950bf', 1420981637),
(17, 17, 111, 2029, 'الإسراء', 'Al-Israa', 'The Night Journey', 'Meccan', 50, 12, 'baniisrail', '5ca54fb2063fc1986a4bd465d48ae773', 1420981637),
(18, 18, 110, 2140, 'الكهف', 'Al-Kahf', 'The Cave', 'Meccan', 69, 12, 'alkahaf', '7f795e25b1e030f733b08d6ad28969bf', 1420981637),
(19, 19, 98, 2250, 'مريم', 'Maryam', 'Mary', 'Meccan', 44, 6, 'maryam', '0f5dbc75dd81561f280d49ccf0258b67', 1420981637),
(20, 20, 135, 2348, 'طه', 'Taa-Haa', 'Taa-Haa', 'Meccan', 45, 8, 'taha', 'bb70cc60dc5bc7c3f832493e8bc6c649', 1420981637),
(21, 21, 112, 2483, 'الأنبياء', 'Al-Anbiyaa', 'The Prophets', 'Meccan', 73, 7, 'alanbia', '6224bd435f7d2c2d40d3e6a767650f0c', 1420981637),
(22, 22, 78, 2595, 'الحج', 'Al-Hajj', 'The Pilgrimage', 'Medinan', 103, 10, 'alhajj', 'b0803857fe118827637b0bfe390c7434', 1420981637),
(23, 23, 118, 2673, 'المؤمنون', 'Al-Muminoon', 'The Believers', 'Meccan', 74, 6, 'almominoon', '3ab2090d434f34dd7b6dea248197db4d', 1420981637),
(24, 24, 64, 2791, 'النور', 'An-Noor', 'The Light', 'Medinan', 102, 9, 'noor', '95538e64af6752fbd58559fe1c9a561b', 1420981637),
(25, 25, 77, 2855, 'الفرقان', 'Al-Furqaan', 'The Criterion', 'Meccan', 42, 6, 'furqan', '016b634d6c53fe40defc76ac525ed493', 1420981637),
(26, 26, 227, 2932, 'الشعراء', 'Ash-Shu\'araa', 'The Poets', 'Meccan', 47, 11, 'shoara', '99dab98f521a5ccb8ce6b0e01718f8ab', 1420981637),
(27, 27, 93, 3159, 'النمل', 'An-Naml', 'The Ant', 'Meccan', 48, 7, 'namal', '842ad5885a3b4716f8b7d4c7aceccbcd', 1420981637),
(28, 28, 88, 3252, 'القصص', 'Al-Qasas', 'The Stories', 'Meccan', 49, 8, 'alqasas', 'd14a1ed8514d31f48457a99a6d2c6dee', 1420981637),
(29, 29, 69, 3340, 'العنكبوت', 'Al-Ankaboot', 'The Spider', 'Meccan', 85, 7, 'ankaboot', '46ec3cd0cc99ebd181007bc68426ecd0', 1420981637),
(30, 30, 60, 3409, 'الروم', 'Ar-Room', 'The Romans', 'Meccan', 84, 6, 'arroom', 'c345910c804a601433c39ecc7002515f', 1420981637),
(31, 31, 34, 3469, 'لقمان', 'Luqman', 'Luqman', 'Meccan', 57, 3, 'luqman', '52ccd20aea270ce4ea67975abee4d6a7', 1420981637),
(32, 32, 30, 3503, 'السجدة', 'As-Sajda', 'The Prostration', 'Meccan', 75, 3, 'assijda', '5667b90601b678bd166d35a44154d4b2', 1420981637),
(33, 33, 73, 3533, 'الأحزاب', 'Al-Ahzaab', 'The Clans', 'Medinan', 90, 9, 'ahzab', '11a2029da86d8d3ffdfd8826c873e69f', 1420981637),
(34, 34, 54, 3606, 'سبإ', 'Saba', 'Sheba', 'Meccan', 58, 6, 'saba', '882674764f688c1890c9cc23500831b6', 1420981637),
(35, 35, 45, 3660, 'فاطر', 'Faatir', 'The Originator', 'Meccan', 43, 5, 'fatir', '1e700b99825ac5a2cf40c9e11055229b', 1420981637),
(36, 36, 83, 3705, 'يس', 'Yaseen', 'Yaseen', 'Meccan', 41, 5, 'yaseen', 'dc5c6156bde3af6b40dce4dadf293d0e', 1420981637),
(37, 37, 182, 3788, 'الصافات', 'As-Saaffaat', 'Those drawn up in Ranks', 'Meccan', 56, 5, 'assaffat', '84371e158b3025be3b31ab842cf88c06', 1420981637),
(38, 38, 88, 3970, 'ص', 'Saad', 'The letter Saad', 'Meccan', 38, 5, 'suad', 'e85ccaff08a1b8b4a183c500c79a810b', 1420981637),
(39, 39, 75, 4058, 'الزمر', 'Az-Zumar', 'The Groups', 'Meccan', 59, 8, 'azzumar', '0cb63b55eea0134028f8117eb32d5fc6', 1420981637),
(40, 40, 85, 4133, 'غافر', 'Al-Ghaafir', 'The Forgiver', 'Meccan', 60, 9, 'momin', 'e14c4ee380015b4ee97b76354ecbe491', 1420981637),
(41, 41, 54, 4218, 'فصلت', 'Fussilat', 'Explained in detail', 'Meccan', 61, 6, 'hameemassijda', 'a29ad08f60b3fccfa1c7600a8cd2ac4a', 1420981637),
(42, 42, 53, 4272, 'الشورى', 'Ash-Shura', 'Consultation', 'Meccan', 62, 5, 'shoora', 'cd5da7630876d93ec83cef3707c48a74', 1420981637),
(43, 43, 89, 4325, 'الزخرف', 'Az-Zukhruf', 'Ornaments of gold', 'Meccan', 63, 7, 'zukhraf', '12926555feb3c784b9f5a61c46b9b7fa', 1420981637),
(44, 44, 59, 4414, 'الدخان', 'Ad-Dukhaan', 'The Smoke', 'Meccan', 64, 3, 'addukhan', '75b43695a5b55048577eb9abb8278a4d', 1420981637),
(45, 45, 37, 4473, 'الجاثية', 'Al-Jaathiya', 'Crouching', 'Meccan', 65, 4, 'aljasia', '88524273f9c7a350a551b5d90ad2f534', 1420981637),
(46, 46, 35, 4510, 'الأحقاف', 'Al-Ahqaf', 'The Dunes', 'Meccan', 66, 4, 'ahqaf', '235b025132e899cd8858fb8e3d297f7b', 1420981637),
(47, 47, 38, 4545, 'محمد', 'Muhammad', 'Muhammad', 'Medinan', 95, 4, 'mohammad', 'a42fd57cf305d8877378387a0ad3a2fc', 1420981637),
(48, 48, 29, 4583, 'الفتح', 'Al-Fath', 'The Victory', 'Medinan', 111, 4, 'alfatah', '2e6982d927b3227da8980cc55811b5da', 1420981637),
(49, 49, 18, 4612, 'الحجرات', 'Al-Hujuraat', 'The Inner Apartments', 'Medinan', 106, 2, 'alhujurat', '6ecebe6106284ba820dcc4108a4a5755', 1420981637),
(50, 50, 45, 4630, 'ق', 'Qaaf', 'The letter Qaaf', 'Meccan', 34, 3, 'qaaf', '93a65f6ea2f97287d97a84b3a47681ac', 1420981637),
(51, 51, 60, 4675, 'الذاريات', 'Adh-Dhaariyat', 'The Winnowing Winds', 'Meccan', 67, 3, 'azzariyat', '075ae50da5356c0d23f58f8c3ef64610', 1420981637),
(52, 52, 49, 4735, 'الطور', 'At-Tur', 'The Mount', 'Meccan', 76, 2, 'attoor', '59485354d9ff318516af4b2a1eb3838e', 1420981637),
(53, 53, 62, 4784, 'النجم', 'An-Najm', 'The Star', 'Meccan', 23, 3, 'annajm', '46da3819925ef34702e1d8f47d77f82a', 1420981637),
(54, 54, 55, 4846, 'القمر', 'Al-Qamar', 'The Moon', 'Meccan', 37, 3, 'alqamar', 'f49cbe10e0ac243de469a2c8447d18ca', 1420981637),
(55, 55, 78, 4901, 'الرحمن', 'Ar-Rahmaan', 'The Beneficent', 'Medinan', 97, 3, 'rahman', '35bd7f0add0806f1b84a5d76f434dd82', 1420981637),
(56, 56, 96, 4979, 'الواقعة', 'Al-Waaqia', 'The Inevitable', 'Meccan', 46, 3, 'alwaqia', '848209d8b8cb366d58bf5d1ebf1b7391', 1420981637),
(57, 57, 29, 5075, 'الحديد', 'Al-Hadid', 'The Iron', 'Medinan', 94, 4, 'hadeed', 'c1b826185773453dabb80f92b97d6e79', 1420981637),
(58, 58, 22, 5104, 'المجادلة', 'Al-Mujaadila', 'The Pleading Woman', 'Medinan', 105, 3, 'mujadla', '3e99be4446245011b8125a2d1ff0427b', 1420981637),
(59, 59, 24, 5126, 'الحشر', 'Al-Hashr', 'The Exile', 'Medinan', 101, 3, 'alhashr', 'cb81aa8837323664eccf2a9ec0409244', 1420981637),
(60, 60, 13, 5150, 'الممتحنة', 'Al-Mumtahana', 'She that is to be examined', 'Medinan', 91, 2, 'mumtahina', '87cc9d11a25929e260c8144a2ed3b0de', 1420981637),
(61, 61, 14, 5163, 'الصف', 'As-Saff', 'The Ranks', 'Medinan', 109, 2, 'assaf', '4d259a1d1621f8d13950af7caa4a79e6', 1420981637),
(62, 62, 11, 5177, 'الجمعة', 'Al-Jumu\'a', 'Friday', 'Medinan', 110, 2, 'aljuma', '0a0b7ed1e5041bc141642929c92192a4', 1420981637),
(63, 63, 11, 5188, 'المنافقون', 'Al-Munaafiqoon', 'The Hypocrites', 'Medinan', 104, 2, 'munafiqoon', 'e807413167b8a5aa6c389e51e0a15759', 1420981637),
(64, 64, 18, 5199, 'التغابن', 'At-Taghaabun', 'Mutual Disillusion', 'Medinan', 108, 2, 'taghabun', '1272effb73d0c045e53d59d2378a676b', 1420981637),
(65, 65, 12, 5217, 'الطلاق', 'At-Talaaq', 'Divorce', 'Medinan', 99, 2, 'attalaq', '8a66d27c3aacff9d7efd561f61f0550f', 1420981637),
(66, 66, 12, 5229, 'التحريم', 'At-Tahrim', 'The Prohibition', 'Medinan', 107, 2, 'attahreem', '2d664a199e6db15962621e6673ee761a', 1420981637),
(67, 67, 30, 5241, 'الملك', 'Al-Mulk', 'The Sovereignty', 'Meccan', 77, 2, 'almulk', '4fec83f12dbfe8cb67f5d57a16d9d695', 1420981637),
(68, 68, 52, 5271, 'القلم', 'Al-Qalam', 'The Pen', 'Meccan', 2, 2, 'alqalam', '65478202c0d263c031b13473d3b87786', 1420981637),
(69, 69, 52, 5323, 'الحاقة', 'Al-Haaqqa', 'The Reality', 'Meccan', 78, 2, 'alhaqqa', '8222f2d7d121c3c0d065e7cd0a0cc9f2', 1420981637),
(70, 70, 44, 5375, 'المعارج', 'Al-Ma\'aarij', 'The Ascending Stairways', 'Meccan', 79, 2, 'almuaarij', 'fce1055eb7c31dbf77f4153b96e5c5ec', 1420981637),
(71, 71, 28, 5419, 'نوح', 'Nooh', 'Noah', 'Meccan', 71, 2, 'annooh', '4524da5eaaaa34cd4387e778199a4620', 1420981637),
(72, 72, 28, 5447, 'الجن', 'Al-Jinn', 'The Jinn', 'Meccan', 40, 2, 'aljin', '9a67459488c002a9f17f27b89b0faa53', 1420981637),
(73, 73, 20, 5475, 'المزمل', 'Al-Muzzammil', 'The Enshrouded One', 'Meccan', 3, 2, 'almuzzammil', 'f5c2b3bd64560d5c31b522a16b25920f', 1420981637),
(74, 74, 56, 5495, 'المدثر', 'Al-Muddaththir', 'The Cloaked One', 'Meccan', 4, 2, 'almuddasir', 'a2148ed9c193eab6fc0bc0d3d86a323c', 1420981637),
(75, 75, 40, 5551, 'القيامة', 'Al-Qiyaama', 'The Resurrection', 'Meccan', 31, 2, 'alqiyama', '388ba746986f7789751f91596e210fbc', 1420981637),
(76, 76, 31, 5591, 'الانسان', 'Al-Insaan', 'Man', 'Medinan', 98, 2, 'addahr', '4e2b0b336b232222f68661e1b4eb7c77', 1420981637),
(77, 77, 50, 5622, 'المرسلات', 'Al-Mursalaat', 'The Emissaries', 'Meccan', 33, 2, 'almursalat', 'a68097a91625c3db2515e85ca7efbec3', 1420981637),
(78, 78, 40, 5672, 'النبإ', 'An-Naba', 'The Announcement', 'Meccan', 80, 2, 'annaba', '69f83915363494a69b4d0359b6331dbf', 1420981637),
(79, 79, 46, 5712, 'النازعات', 'An-Naazi\'aat', 'Those who drag forth', 'Meccan', 81, 2, 'annaziat', '01ef818b914ac021320e54750408c85f', 1420981637),
(80, 80, 42, 5758, 'عبس', 'Abasa', 'He frowned', 'Meccan', 24, 1, 'abass', '69a2cbac1a8ce7f3abcda2c4bbf57564', 1420981637),
(81, 81, 29, 5800, 'التكوير', 'At-Takwir', 'The Overthrowing', 'Meccan', 7, 1, 'attakveer', '25976e25431bf670bdcb0ebf0369f347', 1420981637),
(82, 82, 19, 5829, 'الإنفطار', 'Al-Infitaar', 'The Cleaving', 'Meccan', 82, 1, 'alinfitar', '9a341cca71a762f15195ef9f18fe235e', 1420981637),
(83, 83, 36, 5848, 'المطففين', 'Al-Mutaffifin', 'Defrauding', 'Meccan', 86, 1, 'mutafifin', '1a78062ec046ccc69127292fa96f7e47', 1420981637),
(84, 84, 25, 5884, 'الإنشقاق', 'Al-Inshiqaaq', 'The Splitting Open', 'Meccan', 83, 1, 'inshiqaq', '489f5531a10fa1de17f38ed44a7c3727', 1420981637),
(85, 85, 22, 5909, 'البروج', 'Al-Burooj', 'The Constellations', 'Meccan', 27, 1, 'alburooj', '30d477c97b2dcfb98f6046f9e1cb4a91', 1420981637),
(86, 86, 17, 5931, 'الطارق', 'At-Taariq', 'The Morning Star', 'Meccan', 36, 1, 'attaariq', '290f50106b9726437cadc15f62ebf057', 1420981637),
(87, 87, 19, 5948, 'الأعلى', 'Al-A\'laa', 'The Most High', 'Meccan', 8, 1, 'alaala', 'ad3db3329029b993dd8559defa55a864', 1420981637),
(88, 88, 26, 5967, 'الغاشية', 'Al-Ghaashiya', 'The Overwhelming', 'Meccan', 68, 1, 'alghashia', 'c442aa52f88477b87afaf2777e286738', 1420981637),
(89, 89, 30, 5993, 'الفجر', 'Al-Fajr', 'The Dawn', 'Meccan', 10, 1, 'alfajr', '24ed8bcce1e601ed59dea7dac33ba9d5', 1420981637),
(90, 90, 20, 6023, 'البلد', 'Al-Balad', 'The City', 'Meccan', 35, 1, 'albalad', 'd59db56ee81d2fe3c43e7b3cec32ffe6', 1420981637),
(91, 91, 15, 6043, 'الشمس', 'Ash-Shams', 'The Sun', 'Meccan', 26, 1, 'ashshams', '65987aa8ca91bd41004ff5127f01f950', 1420981637),
(92, 92, 21, 6058, 'الليل', 'Al-Lail', 'The Night', 'Meccan', 9, 1, 'allail', '01fad685c934005e33e26eb343c3ff16', 1420981637),
(93, 93, 11, 6079, 'الضحى', 'Ad-Dhuhaa', 'The Morning Hours', 'Meccan', 11, 1, 'azzuha', 'f4f0e151708f014aa521d24036244271', 1420981637),
(94, 94, 8, 6090, 'الشرح', 'Ash-Sharh', 'The Consolation', 'Meccan', 12, 1, 'alamnashrah', '82a8c3b22e91d4d082d6de52ccca27d7', 1420981637),
(95, 95, 8, 6098, 'التين', 'At-Tin', 'The Fig', 'Meccan', 28, 1, 'atteen', 'edd22ec25dc3f0a51d1aacebb8b325d4', 1420981637),
(96, 96, 19, 6106, 'العلق', 'Al-Alaq', 'The Clot', 'Meccan', 1, 1, 'alalaq', '8a6ff68e69c11fccdb3e24076f09bcf0', 1420981637),
(97, 97, 5, 6125, 'القدر', 'Al-Qadr', 'The Power, Fate', 'Meccan', 25, 1, 'alqadar', 'b7b9eda356b1921a59f46f048189be2c', 1420981637),
(98, 98, 8, 6130, 'البينة', 'Al-Bayyina', 'The Evidence', 'Medinan', 100, 1, 'albayyina', '99e5166b5780eaa308df5e02703e4d6c', 1420981637),
(99, 99, 8, 6138, 'الزلزلة', 'Az-Zalzala', 'The Earthquake', 'Medinan', 93, 1, 'azzilzal', 'cfdef90ac11e43ec4ccd185213b45ec8', 1420981637),
(100, 100, 11, 6146, 'العاديات', 'Al-Aadiyaat', 'The Chargers', 'Meccan', 14, 1, 'aladiyat', '788de2f853ed328a27ad64cd236bade0', 1420981637),
(101, 101, 11, 6157, 'القارعة', 'Al-Qaari\'a', 'The Calamity', 'Meccan', 30, 1, 'alqariya', '89de281e39d03c735ac8affde04599c3', 1420981637),
(102, 102, 8, 6168, 'التكاثر', 'At-Takaathur', 'Competition', 'Meccan', 16, 1, 'attakusar', '281b1fe0c1f366013c88c7d9d095fe2f', 1420981637),
(103, 103, 3, 6176, 'العصر', 'Al-Asr', 'The Declining Day, Epoch', 'Meccan', 13, 1, 'alasr', 'da4d7c8d4f9881c9feaf88b2bb97bc90', 1420981637),
(104, 104, 9, 6179, 'الهمزة', 'Al-Humaza', 'The Traducer', 'Meccan', 32, 1, 'alhumaza', '1211f4a9420544c77da94c8e1156e6b1', 1420981637),
(105, 105, 5, 6188, 'الفيل', 'Al-Fil', 'The Elephant', 'Meccan', 19, 1, 'alfeel', '4dd5dc80cbb9c17c1c44bb0af0c8810d', 1420981637),
(106, 106, 4, 6193, 'قريش', 'Quraish', 'Quraysh', 'Meccan', 29, 1, 'quraish', 'abb1aad4e3ce512415ca2c7f57578ed2', 1420981637),
(107, 107, 7, 6197, 'الماعون', 'Al-Maa\'un', 'Almsgiving', 'Meccan', 17, 1, 'almaoon', 'd02110b0fc0da30d300b5511fc2afea4', 1420981637),
(108, 108, 3, 6204, 'الكوثر', 'Al-Kawthar', 'Abundance', 'Meccan', 15, 1, 'kausar', '2235d65319080677e1ece0068175ddcb', 1420981637),
(109, 109, 6, 6207, 'الكافرون', 'Al-Kaafiroon', 'The Disbelievers', 'Meccan', 18, 1, 'kafiroon', 'de920a8f420478ec15065aef344332b3', 1420981637),
(110, 110, 3, 6213, 'النصر', 'An-Nasr', 'Divine Support', 'Medinan', 114, 1, 'annasar', '4391cc4d9504a04bdf262bbe58a20b75', 1420981637),
(111, 111, 5, 6216, 'المسد', 'Al-Masad', 'The Palm Fibre', 'Meccan', 6, 1, 'lahab', '96819754ee735e84249a2b5dc145ba9b', 1420981637),
(112, 112, 4, 6221, 'الإخلاص', 'Al-Ikhlaas', 'Sincerity', 'Meccan', 22, 1, 'ikhlas', 'b2a01e80837e5db88621a2b1d9c7df06', 1420981637),
(113, 113, 5, 6225, 'الفلق', 'Al-Falaq', 'The Dawn', 'Meccan', 20, 1, 'falaq', 'ffa66912981c74e0e14c48cc0ff953f5', 1420981637),
(114, 114, 6, 6230, 'الناس', 'An-Naas', 'Mankind', 'Meccan', 21, 1, 'annass', '74d247ccd599800a0f8ee6247fa6dcaa', 1420981637);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ic_quranic_suras_meta`
--
ALTER TABLE `ic_quranic_suras_meta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index` (`sindex`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ic_quranic_suras_meta`
--
ALTER TABLE `ic_quranic_suras_meta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
