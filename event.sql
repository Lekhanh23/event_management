-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th6 01, 2025 lúc 06:42 AM
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
(21, 21, 184, 6, 'Looking forward to joining the event. Hope it will be as good as this post suggests.', '2024-08-04 13:30:00'),
(22, 22, 185, 11, 'I’ve already registered! Can’t wait for the event.', '2024-09-01 15:00:00'),
(23, 23, 185, 16, 'Great post! This is exactly the kind of event I’m looking for.', '2024-09-03 12:30:00'),
(24, 24, 185, 8, 'Looking forward to attending and learning from the experts!', '2024-09-05 09:45:00'),
(25, 25, 186, 3, 'Excited for the training session! Thanks for the update.', '2024-10-01 17:10:00'),
(26, 26, 186, 18, 'I’m really looking forward to networking at this event.', '2024-10-03 14:30:00'),
(27, 27, 186, 5, 'This event looks amazing! Can’t wait to participate.', '2024-10-05 16:00:00'),
(28, 28, 187, 7, 'This is going to be an incredible experience! Can’t wait.', '2024-11-01 12:30:00'),
(29, 29, 187, 20, 'I’m so excited to attend the event. This post has really helped!', '2024-11-02 14:10:00'),
(30, 30, 187, 10, 'Thanks for sharing! I’m registering today.', '2024-11-04 15:00:00'),
(31, 31, 188, 8, 'I’ve signed up! Looking forward to this event.', '2024-12-01 11:20:00'),
(32, 32, 188, 12, 'Can’t wait to meet others who are attending. Great post!', '2024-12-03 13:45:00'),
(33, 33, 188, 2, 'This post makes me even more excited to attend. Thanks!', '2024-12-05 14:00:00'),
(34, 34, 189, 4, 'This post is a great resource! I’ve marked the date on my calendar.', '2024-12-07 15:25:00'),
(35, 35, 189, 6, 'I’ll be attending! Thanks for the info.', '2024-12-09 16:40:00'),
(36, 36, 189, 19, 'Looking forward to the event. The speaker lineup is impressive.', '2024-12-11 18:00:00'),
(37, 37, 190, 15, 'I can already tell this event is going to be fantastic!', '2024-12-13 12:00:00'),
(38, 38, 190, 9, 'I’m very excited to be a part of this event. Can’t wait!', '2024-12-15 13:20:00'),
(39, 39, 190, 14, 'Thanks for the post! It helped me a lot in my planning.', '2024-12-17 10:30:00'),
(40, 40, 191, 17, 'Looking forward to learning from the experts at this event.', '2025-01-02 11:00:00'),
(41, 41, 191, 11, 'I’ve registered! Hope to see you all there.', '2025-01-04 13:30:00'),
(42, 42, 191, 4, 'This looks like it will be an amazing experience. Can’t wait!', '2025-01-06 14:20:00'),
(43, 43, 192, 5, 'Really glad I found this post. Can’t wait to attend!', '2025-01-08 15:50:00'),
(44, 44, 192, 13, 'Excited for the upcoming event! Thanks for sharing.', '2025-01-10 12:30:00'),
(45, 45, 192, 2, 'I’m ready to learn and grow from this event!', '2025-01-12 14:00:00'),
(46, 46, 193, 18, 'This event is just what I need for my professional growth.', '2025-01-14 11:45:00'),
(47, 47, 193, 16, 'I’ve been waiting for this! Looking forward to the training.', '2025-01-16 13:30:00'),
(48, 48, 193, 7, 'Can’t wait for the event. Hope it lives up to expectations.', '2025-01-18 12:10:00'),
(49, 49, 194, 10, 'I’ve already signed up for the event. See you all there!', '2025-01-20 15:00:00'),
(50, 50, 194, 14, 'Great event, looking forward to the speakers!', '2025-01-22 16:50:00'),
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
(105, 21, 184, 6, 'Looking forward to joining the event. Hope it will be as good as this post suggests.', '2024-08-04 13:30:00'),
(106, 22, 185, 11, 'I’ve already registered! Can’t wait for the event.', '2024-09-01 15:00:00'),
(107, 23, 185, 16, 'Great post! This is exactly the kind of event I’m looking for.', '2024-09-03 12:30:00'),
(108, 24, 185, 8, 'Looking forward to attending and learning from the experts!', '2024-09-05 09:45:00'),
(109, 25, 186, 3, 'Excited for the training session! Thanks for the update.', '2024-10-01 17:10:00'),
(110, 26, 186, 18, 'I’m really looking forward to networking at this event.', '2024-10-03 14:30:00'),
(111, 27, 186, 5, 'This event looks amazing! Can’t wait to participate.', '2024-10-05 16:00:00'),
(112, 28, 187, 7, 'This is going to be an incredible experience! Can’t wait.', '2024-11-01 12:30:00'),
(113, 29, 187, 20, 'I’m so excited to attend the event. This post has really helped!', '2024-11-02 14:10:00'),
(114, 30, 187, 10, 'Thanks for sharing! I’m registering today.', '2024-11-04 15:00:00'),
(115, 31, 188, 8, 'I’ve signed up! Looking forward to this event.', '2024-12-01 11:20:00'),
(116, 32, 188, 12, 'Can’t wait to meet others who are attending. Great post!', '2024-12-03 13:45:00'),
(117, 33, 188, 2, 'This post makes me even more excited to attend. Thanks!', '2024-12-05 14:00:00'),
(118, 34, 189, 4, 'This post is a great resource! I’ve marked the date on my calendar.', '2024-12-07 15:25:00'),
(119, 35, 189, 6, 'I’ll be attending! Thanks for the info.', '2024-12-09 16:40:00'),
(120, 36, 189, 19, 'Looking forward to the event. The speaker lineup is impressive.', '2024-12-11 18:00:00'),
(121, 37, 190, 15, 'I can already tell this event is going to be fantastic!', '2024-12-13 12:00:00'),
(122, 38, 190, 9, 'I’m very excited to be a part of this event. Can’t wait!', '2024-12-15 13:20:00'),
(123, 39, 190, 14, 'Thanks for the post! It helped me a lot in my planning.', '2024-12-17 10:30:00'),
(124, 40, 191, 17, 'Looking forward to learning from the experts at this event.', '2025-01-02 11:00:00'),
(125, 41, 191, 11, 'I’ve registered! Hope to see you all there.', '2025-01-04 13:30:00'),
(126, 42, 191, 4, 'This looks like it will be an amazing experience. Can’t wait!', '2025-01-06 14:20:00'),
(127, 43, 192, 5, 'Really glad I found this post. Can’t wait to attend!', '2025-01-08 15:50:00'),
(128, 44, 192, 13, 'Excited for the upcoming event! Thanks for sharing.', '2025-01-10 12:30:00'),
(129, 45, 192, 2, 'I’m ready to learn and grow from this event!', '2025-01-12 14:00:00'),
(130, 46, 193, 18, 'This event is just what I need for my professional growth.', '2025-01-14 11:45:00'),
(131, 47, 193, 16, 'I’ve been waiting for this! Looking forward to the training.', '2025-01-16 13:30:00'),
(132, 48, 193, 7, 'Can’t wait for the event. Hope it lives up to expectations.', '2025-01-18 12:10:00'),
(133, 19, 194, 4, 'I’ve signed up for this event! Can’t wait to attend.', '2025-03-03 12:30:00'),
(134, 20, 194, 9, 'Thanks for the great post. I’m so excited to attend this event!', '2025-03-05 13:30:00'),
(135, 21, 194, 11, 'Looking forward to meeting new people at this event!', '2025-03-07 14:45:00'),
(136, 22, 195, 17, 'This event looks fantastic! Can’t wait to join!', '2025-03-09 15:30:00'),
(137, 23, 195, 1, 'I registered! Hope to get valuable insights from this event.', '2025-03-11 16:00:00'),
(138, 24, 195, 12, 'This event seems like it’s going to be exactly what I need.', '2025-03-13 12:15:00'),
(139, 25, 196, 6, 'I’ve heard great things about this event. Can’t wait to see for myself!', '2025-03-15 13:00:00'),
(140, 26, 196, 4, 'Super excited to attend! Looking forward to learning a lot.', '2025-03-17 14:00:00'),
(141, 27, 196, 3, 'This event is going to be a great networking opportunity.', '2025-03-19 16:30:00'),
(142, 28, 197, 13, 'I’m really looking forward to this event! Thanks for posting!', '2025-03-21 10:15:00'),
(143, 29, 197, 7, 'This post has convinced me to register for the event. Excited!', '2025-03-23 11:40:00'),
(144, 30, 197, 5, 'Can’t wait for the event. I’m sure it will be a valuable experience.', '2025-03-25 13:50:00'),
(145, 31, 198, 11, 'I’ve already registered. Looking forward to attending the event!', '2025-03-27 10:20:00'),
(146, 32, 198, 19, 'This event looks amazing! Can’t wait to be a part of it.', '2025-03-29 12:00:00'),
(147, 33, 198, 9, 'Great post! Hope the event lives up to its potential.', '2025-03-31 14:10:00'),
(148, 43, 202, 5, 'I’ve been waiting for this! Can’t wait to join the event.', '2025-04-20 10:50:00'),
(149, 44, 202, 12, 'This event is going to be amazing. See you all there!', '2025-04-22 12:30:00'),
(150, 45, 202, 17, 'I’m excited to hear from the speakers. This post got me pumped!', '2025-04-24 14:00:00'),
(151, 46, 203, 9, 'This post has got me even more excited for the event!', '2025-04-26 13:10:00'),
(152, 47, 203, 14, 'I registered today! Looking forward to the event.', '2025-04-28 15:30:00'),
(153, 48, 203, 7, 'Can’t wait to see what’s in store at this event. Thanks for the post!', '2025-04-30 17:00:00'),
(154, 49, 204, 3, 'This event looks like it will be amazing. Hope to learn a lot!', '2025-05-02 10:30:00'),
(155, 50, 204, 10, 'I’ve signed up already! Can’t wait to join this event.', '2025-05-04 12:00:00'),
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
(198, 21, 7, 'Looking forward to the wellness activities this afternoon!', '2024-07-20 14:00:00', 'Public', NULL, 732),
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
(221, 20, 10, 'If you love art, don’t miss the photography exhibition happening now.', '2024-10-01 18:00:00', 'Public', NULL, 354),
(222, 21, 11, 'Blockchain Revolution is changing the way we think about decentralized finance. Join us!', '2024-11-10 10:00:00', 'Public', NULL, 79),
(223, 22, 11, 'Learn how blockchain will disrupt various industries at this exciting event.', '2024-11-10 12:00:00', 'Public', NULL, 21),
(224, 23, 12, 'Digital Marketing Trends 2024 will be covered in depth. Come join us!', '2024-12-01 09:00:00', 'Public', NULL, 43),
(225, 24, 12, 'I’m here at the Digital Marketing Trends event. Ready to learn from the best in the industry.', '2024-12-01 11:00:00', 'Public', NULL, 654),
(226, 25, 13, 'VR & AR are taking over business applications. Don’t miss this event!', '2025-01-05 14:00:00', 'Public', NULL, 998),
(227, 26, 13, 'If you’re not exploring VR & AR in your business yet, you’re missing out.', '2025-01-05 16:00:00', 'Public', NULL, 33),
(228, 27, 14, 'E-commerce Trends 2024 will shape the future of online shopping. Let’s dive in!', '2025-02-01 10:30:00', 'Public', NULL, 43),
(229, 28, 14, 'The future of e-commerce is mobile. Learn more about it at today’s event.', '2025-02-01 12:00:00', 'Public', NULL, 0),
(230, 29, 15, 'Excited to hear about new tech that is transforming the education sector. Don’t miss it!', '2025-03-01 10:00:00', 'Private', NULL, 0),
(231, 30, 15, 'Education technology is rapidly evolving. Looking forward to exploring these innovations!', '2025-03-01 11:00:00', 'Public', NULL, 554),
(232, 31, 16, 'AI for Good is a fantastic opportunity to see how AI can help solve social problems. Don’t miss it!', '2025-04-01 13:00:00', 'Public', NULL, 32),
(233, 32, 16, 'I’m learning so much at the AI for Good session. Amazing speakers!', '2025-04-01 15:00:00', 'Private', NULL, 45),
(234, 33, 17, 'The future of mobility is electric. Let’s learn about sustainable transportation at today’s event!', '2025-05-01 10:00:00', 'Public', NULL, 90),
(235, 34, 17, 'Electric vehicles are truly the future. This event is an eye-opener.', '2025-05-01 11:30:00', 'Private', NULL, 176),
(236, 35, 18, 'Join us for the Cybersecurity Summit! It’s crucial to stay ahead in the world of digital security.', '2025-06-01 09:00:00', 'Public', NULL, 289),
(237, 36, 18, 'Cyber threats are evolving. This summit offers valuable insights into staying secure.', '2025-06-01 10:30:00', 'Public', NULL, 337),
(238, 37, 19, 'The Smart Cities conference will explore how technology is reshaping urban living. Join us!', '2025-07-01 13:00:00', 'Public', NULL, 547),
(239, 38, 19, 'Smart cities are the future of sustainable living. This event showcases innovative ideas.', '2025-07-01 14:00:00', 'Public', NULL, 87),
(240, 39, 20, 'AI in Finance will show us how technology is transforming the financial world. Don’t miss it!', '2025-08-01 10:00:00', 'Public', NULL, 132),
(241, 40, 20, 'Finance powered by AI is efficient and innovative. Excited to learn more today.', '2025-08-01 11:30:00', 'Public', NULL, 91),
(242, 41, 1, 'Can’t wait for the next AI session. The discussions are super insightful.', '2024-04-02 09:30:00', 'Public', NULL, 786),
(243, 42, 2, 'Marketing insights from today’s workshop are top-notch. Kudos to the organizers!', '2024-06-10 18:00:00', 'Public', NULL, 131),
(244, 43, 3, 'The product demo was fantastic. Really innovative features coming up!', '2024-07-21 14:00:00', 'Private', NULL, 143),
(245, 44, 4, 'Web dev enthusiasts, this bootcamp is a must-attend. Highly recommended!', '2024-08-06 10:00:00', 'Public', NULL, 443),
(246, 45, 5, 'The charity gala was a heartwarming experience. Thanks to all the supporters!', '2024-09-15 20:00:00', 'Public', NULL, 321),
(247, 46, 6, 'Music lovers, the festival exceeded expectations. Stellar performances!', '2024-06-02 11:00:00', 'Private', NULL, 287),
(248, 47, 7, 'Health tips from today’s summit are so practical. I’m loving the experience!', '2024-07-21 11:30:00', 'Public', NULL, 77),
(249, 48, 8, 'AI healthcare is amazing! Great insights from the speakers today.', '2024-08-03 16:00:00', 'Public', NULL, 79),
(250, 49, 9, 'Startups showcased today are full of potential. Wishing them success!', '2024-09-16 12:00:00', 'Public', NULL, 23),
(251, 50, 10, 'The photography exhibition was breathtaking. Kudos to all the artists!', '2024-10-02 19:00:00', 'Public', NULL, 229);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `regis`
--

CREATE TABLE `regis` (
  `RegistrationID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `EventID` int(11) NOT NULL,
  `RegistrationDate` datetime NOT NULL,
  `Status` enum('Pending','Approved','Rejected') NOT NULL,
  `Role` enum('Host','Attendee','Speaker','Volunteer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `regis`
--

INSERT INTO `regis` (`RegistrationID`, `UserID`, `EventID`, `RegistrationDate`, `Status`, `Role`) VALUES
(1, 1, 1, '2024-04-15 10:00:00', 'Approved', 'Host'),
(2, 2, 2, '2024-05-10 14:00:00', 'Approved', 'Host'),
(3, 3, 3, '2024-06-01 16:00:00', 'Pending', 'Host'),
(4, 4, 4, '2024-07-01 12:00:00', 'Approved', 'Host'),
(5, 5, 5, '2024-08-10 09:30:00', 'Approved', 'Host'),
(6, 6, 6, '2024-09-15 11:00:00', 'Approved', 'Host'),
(7, 7, 7, '2024-10-01 09:00:00', 'Approved', 'Host'),
(8, 8, 8, '2024-11-01 14:00:00', 'Approved', 'Host'),
(9, 9, 9, '2024-12-01 10:30:00', 'Pending', 'Host'),
(10, 10, 10, '2024-05-01 10:00:00', 'Approved', 'Host'),
(11, 11, 11, '2024-06-15 15:00:00', 'Approved', 'Host'),
(12, 12, 12, '2024-07-20 08:30:00', 'Approved', 'Host'),
(13, 13, 13, '2024-08-25 13:00:00', 'Pending', 'Host'),
(14, 14, 14, '2024-09-10 16:45:00', 'Approved', 'Host'),
(15, 15, 15, '2024-10-12 11:30:00', 'Approved', 'Host'),
(16, 16, 16, '2024-11-02 09:00:00', 'Approved', 'Host'),
(17, 17, 17, '2024-12-10 14:30:00', 'Pending', 'Host'),
(18, 18, 18, '2024-06-20 13:00:00', 'Approved', 'Host'),
(19, 19, 19, '2024-07-05 15:15:00', 'Approved', 'Host'),
(20, 20, 20, '2024-08-15 12:00:00', 'Approved', 'Host'),
(21, 21, 1, '2024-05-01 14:00:00', 'Approved', 'Host'),
(22, 22, 2, '2024-06-10 10:00:00', 'Pending', 'Host'),
(23, 23, 3, '2024-07-01 09:45:00', 'Approved', 'Host'),
(24, 24, 4, '2024-08-10 11:30:00', 'Approved', 'Host'),
(25, 25, 5, '2024-09-20 08:15:00', 'Approved', 'Host'),
(26, 26, 6, '2024-10-15 16:30:00', 'Pending', 'Attendee'),
(27, 27, 7, '2024-11-05 13:00:00', 'Approved', 'Attendee'),
(28, 28, 8, '2024-12-20 10:00:00', 'Approved', 'Attendee'),
(29, 29, 9, '2024-04-10 15:00:00', 'Approved', 'Attendee'),
(30, 30, 10, '2024-05-05 12:30:00', 'Approved', 'Speaker'),
(31, 31, 11, '2024-06-20 09:00:00', 'Pending', 'Attendee'),
(32, 32, 12, '2024-07-10 08:00:00', 'Approved', 'Attendee'),
(33, 33, 13, '2024-08-01 14:30:00', 'Approved', 'Attendee'),
(34, 34, 14, '2024-09-15 11:30:00', 'Approved', 'Attendee'),
(35, 35, 15, '2024-10-01 09:15:00', 'Approved', 'Volunteer'),
(36, 36, 16, '2024-11-12 08:30:00', 'Pending', 'Attendee'),
(37, 37, 17, '2024-12-02 11:45:00', 'Approved', 'Attendee'),
(38, 38, 18, '2024-06-25 16:00:00', 'Approved', 'Speaker'),
(39, 39, 19, '2024-07-30 13:15:00', 'Approved', 'Attendee'),
(40, 40, 20, '2024-08-01 09:45:00', 'Approved', 'Attendee'),
(41, 41, 1, '2024-09-20 10:00:00', 'Approved', 'Speaker'),
(42, 42, 2, '2024-10-10 13:00:00', 'Approved', 'Attendee'),
(43, 43, 3, '2024-11-25 08:30:00', 'Approved', 'Volunteer'),
(44, 44, 4, '2024-12-15 14:00:00', 'Approved', 'Attendee'),
(45, 45, 5, '2024-06-01 12:00:00', 'Approved', 'Speaker'),
(46, 46, 6, '2024-07-01 10:30:00', 'Approved', 'Volunteer'),
(47, 47, 7, '2024-08-01 13:30:00', 'Approved', 'Attendee'),
(48, 48, 8, '2024-09-10 14:15:00', 'Approved', 'Attendee'),
(49, 49, 9, '2024-10-05 09:30:00', 'Pending', 'Attendee'),
(50, 50, 20, '2024-06-01 09:45:00', 'Approved', 'Attendee'),
(87, 1, 15, '2025-01-05 11:22:36', 'Pending', 'Attendee'),
(88, 1, 15, '2025-01-06 03:15:20', 'Pending', 'Attendee');

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
(20, 'Phan Thi Mai', 'mai.phan@example.com', '0978112233', 'phan.mai', 'pass143', '1999-08-03', 'https://example.com/profile20.jpg', '2023-09-10 09:20:00'),
(21, 'Hoang Thi Kim', 'kim.hoang@example.com', '0909876543', 'hoang.kim', 'pass144', '1998-03-07', 'https://example.com/profile21.jpg', '2023-12-18 16:00:00'),
(22, 'Nguyen Quang Hieu', 'quang.hieu.nguyen@example.com', '0922334455', 'nguyen.qhieu', 'pass145', '2000-11-30', 'https://example.com/profile22.jpg', '2024-01-08 08:30:00'),
(23, 'Pham Anh Minh', 'anhminh.pham@example.com', '0912554433', 'pham.anhminh', 'pass146', '2002-04-01', 'https://example.com/profile23.jpg', '2023-11-30 10:10:00'),
(24, 'Tran Thi Minh', 'minh.tran@example.com', '0961887654', 'tran.minh', 'pass147', '2001-10-17', 'https://example.com/profile24.jpg', '2023-12-22 12:20:00'),
(25, 'Nguyen Thi Thanh', 'thanh.nguyen@example.com', '0902345678', 'nguyen.thanh', 'pass148', '2000-12-30', 'https://example.com/profile25.jpg', '2023-09-25 15:40:00'),
(26, 'Hoang Thi Lan Anh', 'lananh.hoang@example.com', '0932123456', 'hoang.lananh', 'pass149', '2002-01-05', 'https://example.com/profile26.jpg', '2024-02-25 14:00:00'),
(27, 'Pham Thi Thanh', 'thanh.pham@example.com', '0969321345', 'pham.thanh', 'pass150', '1999-11-12', 'https://example.com/profile27.jpg', '2023-08-22 13:20:00'),
(28, 'Luu Thi Minh', 'minh.luu@example.com', '0919988776', 'luu.minh', 'pass151', '2001-03-14', 'https://example.com/profile28.jpg', '2024-03-20 10:30:00'),
(29, 'Nguyen Thi Lan', 'lan.nguyen@example.com', '0942345678', 'nguyen.lan', 'pass152', '1997-05-02', 'https://example.com/profile29.jpg', '2023-07-01 09:00:00'),
(30, 'Tran Thi Thu', 'thu.tran@example.com', '0954345678', 'tran.thu', 'pass153', '1998-09-10', 'https://example.com/profile30.jpg', '2023-06-18 14:10:00'),
(31, 'Pham Minh Tu', 'tu.pham@example.com', '0906432567', 'pham.tu', 'pass154', '2000-03-05', 'https://example.com/profile31.jpg', '2023-11-17 11:00:00'),
(32, 'Le Thi Thanh', 'thanh.le@example.com', '0922233445', 'le.thanh', 'pass155', '2001-01-15', 'https://example.com/profile32.jpg', '2023-08-28 10:50:00'),
(33, 'Viet Thi Mai', 'mai.viet@example.com', '0965000000', 'viet.mai', 'pass156', '1999-10-22', 'https://example.com/profile33.jpg', '2024-01-10 12:00:00'),
(34, 'Hoang Thi Lan Anh', 'lananh.hoangvit@example.com', '0934345678', 'hoang.lananh2', 'pass157', '1997-08-10', 'https://example.com/profile34.jpg', '2024-02-15 13:00:00'),
(35, 'Nguyen Thi Lan', 'lan.nguyen123@example.com', '0943425678', 'nguyen.lan2', 'pass158', '2002-07-01', 'https://example.com/profile35.jpg', '2023-10-15 15:30:00'),
(36, 'Pham Minh Thi', 'thi.pham@example.com', '0952123456', 'pham.thi', 'pass159', '2000-06-25', 'https://example.com/profile36.jpg', '2023-09-30 11:20:00'),
(37, 'Le Thi Kim', 'kim.le@example.com', '0943132345', 'le.kim', 'pass160', '1998-04-09', 'https://example.com/profile37.jpg', '2024-03-15 10:40:00'),
(38, 'Tran Thi Thao', 'thao.tran@example.com', '0934356789', 'tran.thao', 'pass161', '1997-11-12', 'https://example.com/profile38.jpg', '2024-01-22 12:50:00'),
(39, 'Nguyen Minh Tu', 'tu.nguyen3@example.com', '0911234568', 'nguyen.tu3', 'pass162', '2001-07-11', 'https://example.com/profile39.jpg', '2024-02-12 14:30:00'),
(40, 'Pham Thi Lan', 'lan.pham@example.com', '0921000000', 'pham.lan', 'pass163', '1999-02-03', 'https://example.com/profile40.jpg', '2023-12-10 08:30:00'),
(41, 'Hoang Anh Minh', 'minh.hoang@example.com', '0932125678', 'hoang.minh', 'pass164', '2002-05-17', 'https://example.com/profile41.jpg', '2024-03-12 16:40:00'),
(42, 'Luu Minh Thi', 'thi.luu@example.com', '0905432156', 'luu.thi', 'pass165', '2000-01-29', 'https://example.com/profile42.jpg', '2023-07-20 09:20:00'),
(43, 'Tran Thi Lan Anh', 'lananh.tran@example.com', '0934001234', 'tran.lananh', 'pass166', '2001-12-12', 'https://example.com/profile43.jpg', '2023-08-30 11:10:00'),
(44, 'Nguyen Minh Hieu', 'hieu.minh.nguyen@example.com', '0941234678', 'nguyen.hminh', 'pass167', '1998-11-05', 'https://example.com/profile44.jpg', '2023-09-25 15:50:00'),
(45, 'Pham Minh Thi', 'thi.pham2@example.com', '0922435567', 'pham.mthi', 'pass168', '2002-08-19', 'https://example.com/profile45.jpg', '2023-06-05 14:30:00'),
(46, 'Hoang Thi Lan', 'lan.hoang@example.com', '0935364567', 'hoang.lan', 'pass169', '1999-10-20', 'https://example.com/profile46.jpg', '2024-02-18 10:20:00'),
(47, 'Luu Quang Minh', 'minh.luu4@example.com', '0901234567', 'luu.minh2', 'pass170', '2000-01-06', 'https://example.com/profile47.jpg', '2023-10-10 12:40:00'),
(48, 'Nguyen Thi Thanh', 'thanh.nguyen12@example.com', '0953123456', 'nguyen.thanh2', 'pass171', '1998-11-15', 'https://example.com/profile48.jpg', '2023-08-10 13:50:00'),
(49, 'Le Thi Quyen', 'quyen.le@example.com', '0901237894', 'le.quyen', 'pass172', '1997-04-28', 'https://example.com/profile49.jpg', '2024-03-14 16:30:00'),
(50, 'Pham Thi Lan Anh', 'lananh.pham@example.com', '0924536123', 'pham.lananh', 'pass173', '2002-06-30', 'https://example.com/profile50.jpg', '2024-01-05 17:00:00');

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
