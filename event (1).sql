-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 03, 2025 lúc 09:57 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `event`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comment`
--

CREATE TABLE `comment` (
  `UniqueID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `PostID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `Content` text NOT NULL,
  `Timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comment`
--

INSERT INTO `comment` (`UniqueID`, `UserID`, `PostID`, `EventID`, `Content`, `Timestamp`) VALUES
(4, 4, 179, 2, 'This is going to be a fantastic event. Thank you for the post!', '2024-04-10 09:00:00'),
(5, 5, 179, 6, 'Very informative! Looking forward to joining.', '2024-04-12 11:20:00'),
(6, 6, 179, 1, 'I am so excited about this conference. Thanks for the update!', '2024-04-14 13:00:00'),
(7, 7, 180, 4, 'This workshop seems like a great opportunity. Can’t wait!', '2024-05-01 09:00:00'),
(8, 8, 180, 7, 'Looking forward to the training! Thanks for sharing.', '2024-05-03 10:10:00'),
(9, 9, 180, 15, 'I’ve signed up already! Hope it’s as good as it sounds.', '2024-05-05 14:45:00'),
(10, 10, 181, 18, 'I love how this post is so detailed. Can’t wait for the event!', '2024-06-01 13:30:00'),
(11, 11, 181, 13, 'Excited for what’s to come at the event. See you there!', '2024-06-03 15:15:00'),
(12, 12, 181, 9, 'This information is going to help a lot. Thanks!', '2024-06-04 17:00:00'),
(13, 13, 182, 10, 'This post really helps with my event preparations. Thanks!', '2024-06-10 14:30:00'),
(14, 14, 182, 19, 'Can’t wait for the training session. It’s going to be great!', '2024-06-12 16:00:00'),
(15, 15, 182, 20, 'So glad I found this post. Looking forward to the session!', '2024-06-14 18:30:00'),
(16, 16, 183, 12, 'I’ve been waiting for this! Can’t wait to attend the event.', '2024-07-01 08:30:00'),
(17, 17, 183, 4, 'I’m excited to meet other professionals at this event!', '2024-07-03 09:45:00'),
(18, 18, 183, 14, 'This post gave me all the info I needed. Thanks!', '2024-07-05 11:10:00'),
(19, 19, 184, 1, 'I’m really excited for the upcoming event. See you there!', '2024-08-01 10:00:00'),
(20, 20, 184, 17, 'This post is exactly what I needed to prepare. Thanks!', '2024-08-02 11:30:00'),
(51, 1, 194, 9, 'This looks like a must-attend event! Thanks for the details.', '2025-01-24 18:30:00'),
(85, 1, 119, 5, 'Great post! I learned a lot from this.', '2024-04-02 10:30:00'),
(86, 2, 119, 8, 'Looking forward to more content like this!', '2024-04-05 12:00:00'),
(87, 3, 119, 3, 'Can’t wait to attend the event after reading this post.', '2024-04-07 14:30:00'),
(88, 4, 179, 2, 'This is going to be a fantastic event. Thank you for the post!', '2024-04-10 09:00:00'),
(89, 5, 179, 6, 'Very informative! Looking forward to joining.', '2024-04-12 11:20:00'),
(90, 6, 179, 1, 'I am so excited about this conference. Thanks for the update!', '2024-04-14 13:00:00'),
(91, 7, 180, 4, 'This workshop seems like a great opportunity. Can’t wait!', '2024-05-01 09:00:00'),
(92, 8, 180, 7, 'Looking forward to the training! Thanks for sharing.', '2024-05-03 10:10:00'),
(93, 9, 180, 15, 'I’ve signed up already! Hope it’s as good as it sounds.', '2024-05-05 14:45:00'),
(94, 10, 181, 18, 'I love how this post is so detailed. Can’t wait for the event!', '2024-06-01 13:30:00'),
(95, 11, 181, 13, 'Excited for what’s to come at the event. See you there!', '2024-06-03 15:15:00'),
(96, 12, 181, 9, 'This information is going to help a lot. Thanks!', '2024-06-04 17:00:00'),
(97, 13, 182, 10, 'This post really helps with my event preparations. Thanks!', '2024-06-10 14:30:00'),
(98, 14, 182, 19, 'Can’t wait for the training session. It’s going to be great!', '2024-06-12 16:00:00'),
(99, 15, 182, 20, 'So glad I found this post. Looking forward to the session!', '2024-06-14 18:30:00'),
(100, 16, 183, 12, 'I’ve been waiting for this! Can’t wait to attend the event.', '2024-07-01 08:30:00'),
(101, 17, 183, 4, 'I’m excited to meet other professionals at this event!', '2024-07-03 09:45:00'),
(102, 18, 183, 14, 'This post gave me all the info I needed. Thanks!', '2024-07-05 11:10:00'),
(103, 19, 184, 1, 'I’m really excited for the upcoming event. See you there!', '2024-08-01 10:00:00'),
(104, 20, 184, 17, 'This post is exactly what I needed to prepare. Thanks!', '2024-08-02 11:30:00'),
(133, 19, 194, 4, 'I’ve signed up for this event! Can’t wait to attend.', '2025-03-03 12:30:00'),
(134, 20, 194, 9, 'Thanks for the great post. I’m so excited to attend this event!', '2025-03-05 13:30:00'),
(156, 1, 204, 13, 'Looking forward to attending. I’m sure it will be an amazing experience.', '2025-05-06 14:10:00'),
(157, 2, 205, 5, 'This event sounds exactly like what I need. Thanks for the post!', '2025-05-08 11:30:00'),
(158, 3, 205, 12, 'I’ve already registered! Excited for what’s to come.', '2025-05-10 13:00:00'),
(159, 4, 205, 16, 'Looking forward to learning from the best in the field at this event.', '2025-05-12 14:50:00'),
(160, 1, 119, 1, 'abcd', '2025-01-06 09:02:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event`
--

CREATE TABLE `event` (
  `EventID` int(11) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Description` text NOT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `Location` varchar(255) NOT NULL,
  `HostID` int(11) NOT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `MaxParticipants` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `event`
--

INSERT INTO `event` (`EventID`, `Title`, `Description`, `StartDate`, `EndDate`, `Location`, `HostID`, `Category`, `MaxParticipants`, `note`) VALUES
(1, 'Conference on AI', 'A conference about the latest in Artificial Intelligence.', '2025-05-01 09:00:00', '2025-05-01 17:00:00', 'Hanoi Convention Center', 1, 'Technology', 200, ''),
(2, 'Marketing Workshop', 'A workshop on effective digital marketing strategies.', '2025-06-10 08:30:00', '2025-06-10 16:30:00', 'Ho Chi Minh City Center', 2, 'Business', 100, ''),
(3, 'Product Launch Event', 'An exciting launch event for the new product line.', '2025-07-20 10:00:00', '2025-07-20 18:00:00', 'Saigon Square', 3, 'Business', 150, ''),
(4, 'Web Development Bootcamp', 'Intensive training on modern web development tools.', '2025-08-05 09:00:00', '2025-08-10 17:00:00', 'Da Nang', 4, 'Technology', 50, ''),
(5, 'Annual Charity Gala', 'A charity event for raising funds for underprivileged children.', '2025-09-15 18:00:00', '2025-09-15 22:00:00', 'Hanoi Hilton', 5, 'Charity', 300, ''),
(6, 'Music Festival', 'A massive music event featuring international artists.', '2025-10-01 17:00:00', '2025-10-02 02:00:00', 'Nha Trang Beach', 6, 'Music', 500, ''),
(7, 'Art Exhibition', 'Exhibition showcasing modern art from local artists.', '2025-11-10 10:00:00', '2025-11-12 17:00:00', 'Hanoi Art Museum', 7, 'Art', 150, ''),
(8, 'International Conference on Technology', 'A conference bringing together leading experts in technology.', '2025-12-05 08:30:00', '2025-12-05 17:30:00', 'Ho Chi Minh City Conference Center', 8, 'Technology', 200, ''),
(9, 'Youth Empowerment Seminar', 'Seminar focusing on empowering youth through education.', '2025-11-20 09:00:00', '2025-11-20 16:00:00', 'Can Tho University', 9, 'Education', 100, ''),
(10, 'Green Energy Conference', 'A conference about renewable energy solutions.', '2025-09-25 10:00:00', '2025-09-25 16:00:00', 'Phu Quoc Convention Center', 10, 'Environment', 150, ''),
(11, 'Digital Transformation Workshop', 'Workshop on digital transformation strategies for businesses.', '2025-08-20 09:00:00', '2025-08-20 17:00:00', 'Da Nang Convention Center', 11, 'Business', 100, ''),
(12, 'Fitness and Wellness Expo', 'A fitness expo featuring wellness products and fitness programs.', '2025-07-15 10:00:00', '2025-07-15 18:00:00', 'Hanoi Fitness Center', 12, 'Health', 200, ''),
(13, 'Entrepreneurship Forum', 'Forum on the latest trends and challenges in entrepreneurship.', '2025-06-01 09:00:00', '2025-06-01 18:00:00', 'Ho Chi Minh City', 13, 'Business', 150, ''),
(14, 'Coding Bootcamp', 'A bootcamp for coding beginners to learn modern programming languages.', '2025-05-15 09:00:00', '2025-05-20 17:00:00', 'Hanoi Tech Hub', 14, 'Education', 50, ''),
(15, 'Charity Auction', 'An auction event to raise funds for charity organizations.', '2025-10-10 18:00:00', '2025-10-10 22:00:00', 'Saigon Hotel', 15, 'Charity', 100, ''),
(16, 'Virtual Reality Conference', 'Conference focusing on the future of Virtual Reality technology.', '2025-11-05 09:00:00', '2025-11-05 18:00:00', 'Nha Trang Convention Center', 16, 'Technology', 200, ''),
(17, 'Fashion Show', 'A glamorous fashion show featuring top designers and models.', '2025-12-15 19:00:00', '2025-12-15 22:00:00', 'Hanoi Fashion Center', 17, 'Fashion', 300, ''),
(18, 'Food Festival', 'Festival celebrating food from all over the world.', '2025-08-10 10:00:00', '2025-08-10 18:00:00', 'Ho Chi Minh City', 18, 'Food', 400, ''),
(19, 'Startup Pitching Competition', 'Competition for startups to pitch their business ideas to investors.', '2025-07-25 09:00:00', '2025-07-25 17:00:00', 'Hanoi Startup Hub', 19, 'Business', 100, ''),
(20, 'Blockchain Conference', 'A conference discussing the impact of blockchain technology.', '2025-09-30 08:30:00', '2025-09-30 17:30:00', 'Saigon Convention Center', 20, 'Technology', 200, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `PostID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `Content` text NOT NULL,
  `Timestamp` datetime NOT NULL,
  `Visibility` enum('Public','Private') NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`PostID`, `UserID`, `EventID`, `Content`, `Timestamp`, `Visibility`, `image`, `likes`) VALUES
(119, 1, 1, 'Looking forward to seeing everyone at the AI conference next month! Get ready for a great session on machine learning.', '2024-04-01 09:00:00', 'Public', NULL, 40),
(179, 2, 1, 'Excited to attend the AI Trends 2024 event next month. Will be an incredible experience!', '2024-04-10 14:00:00', 'Public', NULL, 30),
(180, 3, 1, 'I can’t wait to see all the amazing presentations about AI. See you at the conference!', '2024-04-15 16:00:00', 'Private', NULL, 50),
(181, 4, 2, 'Excited for the marketing workshop tomorrow. Ready to learn some amazing strategies!', '2024-06-09 18:00:00', 'Public', NULL, 60),
(182, 5, 2, 'Can’t wait for the marketing strategies discussion tomorrow. It’s going to be insightful!', '2024-06-09 19:00:00', 'Private', NULL, 80),
(183, 6, 2, 'The marketing trends for 2024 are very promising. I’m sure we’ll learn a lot tomorrow!', '2024-06-10 08:30:00', 'Public', NULL, 101),
(184, 7, 3, 'I am attending the product launch event next week. Can’t wait to see the new products!', '2024-07-19 14:00:00', 'Private', NULL, 100),
(185, 8, 3, 'Looking forward to the product launch event next week. I’ve heard a lot about the new features!', '2024-07-20 15:00:00', 'Public', NULL, 221),
(186, 9, 3, 'The new product launch is going to be amazing! I can’t wait to get my hands on the new tech.', '2024-07-21 16:30:00', 'Public', NULL, 321),
(187, 10, 4, 'Looking forward to speaking at the Web Development Bootcamp. It’s going to be a great learning experience!', '2024-08-04 11:30:00', 'Public', NULL, 44),
(188, 11, 4, 'I’m excited to be part of the Web Development Bootcamp. Can’t wait to meet all the aspiring developers!', '2024-08-04 12:00:00', 'Private', NULL, 98),
(189, 12, 4, 'Web development is the future. Excited to attend this bootcamp and learn from the best!', '2024-08-05 09:00:00', 'Public', NULL, 23),
(190, 13, 5, 'Let’s make this charity gala a big success. See you all there!', '2024-09-14 18:30:00', 'Private', NULL, 72),
(191, 14, 5, 'Support this amazing cause. Let’s raise money for the children!', '2024-09-14 19:00:00', 'Public', NULL, 92),
(192, 15, 5, 'Excited for the charity gala tonight. Let’s make a difference together!', '2024-09-15 08:00:00', 'Public', NULL, 11),
(193, 16, 6, 'Get ready for the best music festival of the year!', '2024-06-01 09:00:00', 'Public', NULL, 13),
(194, 17, 6, 'Music festival starts today! Who’s ready to enjoy some great performances?', '2024-06-01 10:00:00', 'Public', NULL, 19),
(195, 18, 6, 'I’m so pumped for the music festival. Can’t wait to see all the performances!', '2024-06-01 11:00:00', 'Private', NULL, 18),
(196, 19, 7, 'Health & Wellness Summit is finally here. Let’s talk about living our best lives!', '2024-07-20 10:00:00', 'Public', NULL, 223),
(197, 20, 7, 'The health summit today is full of great speakers. Can’t wait to learn more!', '2024-07-20 11:00:00', 'Private', NULL, 665),
(202, 1, 1, 'Looking forward to seeing everyone at the AI conference next month! Get ready for a great session on machine learning.', '2024-04-01 09:00:00', 'Public', NULL, 42),
(203, 2, 1, 'Excited to attend the AI Trends 2024 event next month. Will be an incredible experience!', '2024-04-10 14:00:00', 'Public', NULL, 29),
(204, 3, 2, 'Excited for the marketing workshop tomorrow. Ready to learn some amazing strategies!', '2024-06-09 18:00:00', 'Public', NULL, 32),
(205, 4, 2, 'Can’t wait for the marketing strategies discussion tomorrow. It’s going to be insightful!', '2024-06-09 19:00:00', 'Private', NULL, 0),
(206, 5, 3, 'I am attending the product launch event next week. Can’t wait to see the new products!', '2024-07-19 14:00:00', 'Private', NULL, 203),
(207, 6, 3, 'Looking forward to the product launch event next week. I’ve heard a lot about the new features!', '2024-07-20 15:00:00', 'Public', NULL, 221),
(208, 7, 4, 'Looking forward to speaking at the Web Development Bootcamp. It’s going to be a great learning experience!', '2024-08-04 11:30:00', 'Public', NULL, 223),
(209, 8, 4, 'Web development is the future. Excited to attend this bootcamp and learn from the best!', '2024-08-05 09:00:00', 'Public', NULL, 234),
(210, 9, 5, 'Let’s make this charity gala a big success. See you all there!', '2024-09-14 18:30:00', 'Private', NULL, 54),
(211, 10, 5, 'Support this amazing cause. Let’s raise money for the children!', '2024-09-14 19:00:00', 'Public', NULL, 67),
(212, 11, 6, 'Get ready for the best music festival of the year!', '2024-06-01 09:00:00', 'Public', NULL, 76),
(213, 12, 6, 'Music festival starts today! Who’s ready to enjoy some great performances?', '2024-06-01 10:00:00', 'Public', NULL, 80),
(214, 13, 7, 'Health & Wellness Summit is finally here. Let’s talk about living our best lives!', '2024-07-20 10:00:00', 'Public', NULL, 90),
(215, 14, 7, 'The health summit today is full of great speakers. Can’t wait to learn more!', '2024-07-20 11:00:00', 'Private', NULL, 987),
(216, 15, 8, 'AI in Healthcare is transforming the way we diagnose and treat patients. Don’t miss the session!', '2024-08-02 13:00:00', 'Public', NULL, 112),
(217, 16, 8, 'Healthcare powered by AI is the future. Learn more about this transformative technology today!', '2024-08-02 15:00:00', 'Public', NULL, 132),
(218, 17, 9, 'Startup Pitching Event is just around the corner. Don’t miss out on hearing some innovative ideas!', '2024-09-14 09:00:00', 'Public', NULL, 87),
(219, 18, 9, 'Pitch your startup today and get feedback from top investors!', '2024-09-15 11:00:00', 'Public', NULL, 102),
(220, 19, 10, 'Photography exhibition is opening today! Come see incredible works from talented photographers.', '2024-10-01 10:00:00', 'Public', NULL, 201),
(221, 20, 10, 'If you love art, don’t miss the photography exhibition happening now.', '2024-10-01 18:00:00', 'Public', NULL, 354);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `regis`
--

CREATE TABLE `regis` (
  `RegistrationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `RegistrationDate` datetime NOT NULL,
  `Role` enum('Host') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `regis`
--

INSERT INTO `regis` (`RegistrationID`, `UserID`, `EventID`, `RegistrationDate`, `Role`) VALUES
(1, 1, 1, '2024-04-15 10:00:00', 'Host'),
(2, 2, 2, '2024-05-10 14:00:00', 'Host'),
(3, 3, 3, '2024-06-01 16:00:00', 'Host'),
(4, 4, 4, '2024-07-01 12:00:00', 'Host'),
(5, 5, 5, '2024-08-10 09:30:00', 'Host'),
(6, 6, 6, '2024-09-15 11:00:00', 'Host'),
(7, 7, 7, '2024-10-01 09:00:00', 'Host'),
(8, 8, 8, '2024-11-01 14:00:00', 'Host'),
(9, 9, 9, '2024-12-01 10:30:00', 'Host'),
(10, 10, 10, '2024-05-01 10:00:00', 'Host'),
(11, 11, 11, '2024-06-15 15:00:00', 'Host'),
(12, 12, 12, '2024-07-20 08:30:00', 'Host'),
(13, 13, 13, '2024-08-25 13:00:00', 'Host'),
(14, 14, 14, '2024-09-10 16:45:00', 'Host'),
(15, 15, 15, '2024-10-12 11:30:00', 'Host'),
(16, 16, 16, '2024-11-02 09:00:00', 'Host'),
(17, 17, 17, '2024-12-10 14:30:00', 'Host'),
(18, 18, 18, '2024-06-20 13:00:00', 'Host'),
(19, 19, 19, '2024-07-05 15:15:00', 'Host'),
(20, 20, 20, '2024-08-15 12:00:00', 'Host');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `ProfilePicture` varchar(255) DEFAULT NULL,
  `JoinDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`UserID`, `FullName`, `Email`, `PhoneNumber`, `username`, `password`, `DateOfBirth`, `ProfilePicture`, `JoinDate`) VALUES
(1, 'Nguyen Duc Anh', 'nguyen.anh@example.com', '0912345678', 'nguyen.anh', 'pass124', '2002-01-01', 'https://example.com/profile1.jpg', '2024-01-01 08:30:00'),
(2, 'Le Minh Tam', 'tam.le@example.com', '0987654321', 'le.tam', 'pass125', '1998-05-15', 'https://example.com/profile2.jpg', '2023-11-15 09:00:00'),
(3, 'Tran Thi Mai', 'mai.tran@example.com', '0976123456', 'tran.mai', 'pass126', '2000-07-23', 'https://example.com/profile3.jpg', '2023-08-01 10:15:00'),
(4, 'Phan Anh Tu', 'tu.phan@example.com', '0908765432', 'phan.tu', 'pass127', '2001-11-10', 'https://example.com/profile4.jpg', '2023-09-05 12:30:00'),
(5, 'Nguyen Minh Tu', 'tu.minh.nguyen@example.com', '0912123456', 'nguyen.tu', 'pass128', '1999-03-21', 'https://example.com/profile5.jpg', '2024-02-20 14:45:00'),
(6, 'Hoang Anh Duy', 'duy.hoang@example.com', '0933234567', 'hoang.duy', 'pass129', '1997-02-17', 'https://example.com/profile6.jpg', '2024-03-10 16:00:00'),
(7, 'Luu Minh Hoang', 'hoang.luu@example.com', '0943123456', 'luu.hoang', 'pass130', '2000-08-10', 'https://example.com/profile7.jpg', '2023-07-10 11:20:00'),
(8, 'Pham Thu Trang', 'trang.pham@example.com', '0956123456', 'pham.trang', 'pass131', '2003-05-20', 'https://example.com/profile8.jpg', '2023-12-25 17:30:00'),
(9, 'Le Thi Lan', 'lan.le@example.com', '0923123456', 'le.lan', 'pass132', '1998-12-15', 'https://example.com/profile9.jpg', '2024-04-02 09:50:00'),
(10, 'Viet Hoang', 'hoang.viet@example.com', '0967234567', 'viet.hoang', 'pass133', '2002-09-03', 'https://example.com/profile10.jpg', '2023-10-14 08:00:00'),
(11, 'Nguyen Quang Hieu', 'hieu.nguyen@example.com', '0912348765', 'nguyen.hieu', 'pass134', '2000-04-19', 'https://example.com/profile11.jpg', '2023-06-20 10:10:00'),
(12, 'Pham Hoang Minh', 'minh.pham@example.com', '0987876543', 'pham.minh', 'pass135', '1997-12-22', 'https://example.com/profile12.jpg', '2023-05-15 12:15:00'),
(13, 'Son Nguyen', 'son.nguyen2024@example.com', '0911222333', 'son.nguyen', 'pass136', '2001-02-14', 'https://example.com/profile13.jpg', '2024-05-01 10:00:00'),
(14, 'Nguyen Thi Lan Anh', 'lananh.nguyen@example.com', '0975432100', 'nguyen.lananh', 'pass137', '2002-11-12', 'https://example.com/profile14.jpg', '2024-02-10 12:00:00'),
(15, 'Tran Minh Hieu', 'hieu.tran@example.com', '0901234567', 'tran.hieu', 'pass138', '1998-06-22', 'https://example.com/profile15.jpg', '2023-12-01 14:20:00'),
(16, 'Nguyen Thi Mai', 'mai.nguyen@example.com', '0912345679', 'nguyen.mai', 'pass139', '2000-02-10', 'https://example.com/profile16.jpg', '2023-11-21 17:30:00'),
(17, 'Pham Quang Hieu', 'hieu.pham@example.com', '0932112233', 'pham.hieu', 'pass140', '1999-09-05', 'https://example.com/profile17.jpg', '2024-01-15 13:40:00'),
(18, 'Le Thi Lan Anh', 'lananh.le@example.com', '0923456789', 'le.lananh', 'pass141', '1997-07-10', 'https://example.com/profile18.jpg', '2023-10-25 11:00:00'),
(19, 'Viet Minh Tam', 'tam.viet@example.com', '0967812345', 'viet.tam', 'pass142', '2001-05-14', 'https://example.com/profile19.jpg', '2024-04-25 15:00:00'),
(20, 'Phan Thi Mai', 'mai.phan@example.com', '0978112233', 'phan.mai', 'pass143', '1999-08-03', 'https://example.com/profile20.jpg', '2023-09-10 09:20:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`UniqueID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `PostID` (`PostID`),
  ADD KEY `EventID` (`EventID`);

--
-- Chỉ mục cho bảng `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`EventID`),
  ADD KEY `event_fk_host` (`HostID`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`PostID`),
  ADD KEY `EventID` (`EventID`),
  ADD KEY `post_ibfk_1` (`UserID`);

--
-- Chỉ mục cho bảng `regis`
--
ALTER TABLE `regis`
  ADD PRIMARY KEY (`RegistrationID`),
  ADD KEY `regis_fk_user` (`UserID`),
  ADD KEY `regis_fk_event` (`EventID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `comment`
--
ALTER TABLE `comment`
  MODIFY `UniqueID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT cho bảng `event`
--
ALTER TABLE `event`
  MODIFY `EventID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `PostID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT cho bảng `regis`
--
ALTER TABLE `regis`
  MODIFY `RegistrationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`PostID`) REFERENCES `post` (`PostID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comment_ibfk_3` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_fk_host` FOREIGN KEY (`HostID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE,
  ADD CONSTRAINT `post_ibfk_2` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `regis`
--
ALTER TABLE `regis`
  ADD CONSTRAINT `regis_fk_event` FOREIGN KEY (`EventID`) REFERENCES `event` (`EventID`) ON DELETE CASCADE,
  ADD CONSTRAINT `regis_fk_user` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
