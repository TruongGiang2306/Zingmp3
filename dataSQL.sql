CREATE DATABASE IF NOT EXISTS `zingmusic`
/*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */
/*!80016 DEFAULT ENCRYPTION='N' */
;

USE `zingmusic`;

-- MySQL dump 10.13  Distrib 8.1.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zingmusic
-- ------------------------------------------------------
-- Server version	8.1.0
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!50503 SET NAMES utf8 */
;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */
;

/*!40103 SET TIME_ZONE='+00:00' */
;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */
;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */
;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */
;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */
;

--
-- Table structure for table `album`
--
DROP TABLE IF EXISTS `album`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `album` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `artist_id` int DEFAULT NULL,
  `title_album` varchar(1000) DEFAULT NULL,
  `thumbnail_album` varchar(1000) DEFAULT NULL,
  `kindof` varchar(255) NOT NULL DEFAULT 'Tự do',
  `name_artist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `album_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `album`
--
LOCK TABLES `album` WRITE;

/*!40000 ALTER TABLE `album` DISABLE KEYS */
;

INSERT INTO
  `album`
VALUES
  (
    1,
    1,
    'Nhạc EDM Gây Nghiện 2023',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695528767/thumbnail_album/bia.jpg.jpg',
    'Tự do',
    'Nhiều nghệ sỹ'
  ),
(
    2,
    1,
    'Born Pink',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695531217/thumbnail_album/Born_Pink_Digital.jpeg.jpg',
    'Tự do',
    'BLACKPINK'
  ),
(
    3,
    1,
    'Nhạc Trẻ Vinahouse',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695634462/thumbnail_album/9e8c67c23bace04d5e0e99b850ced883.jpg.jpg',
    'Tự do',
    'Nhiều nghệ sỹ'
  ),
(
    4,
    2,
    'Nhạc Lofi Chill Gây Nghiện',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695694280/thumbnail_album/45493e859cde749c75fb4377c14d0db3.jpg.jpg',
    'Tự do',
    'Nhiều nghệ sỹ'
  ),
(
    5,
    3,
    'Những bài hát tạo động lực',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695695595/thumbnail_album/maxresdefault%20%281%29.jpg.jpg',
    'Tự do',
    'Nhiều nghệ sỹ'
  ),
(
    6,
    1,
    'Nhạc TikTok Remix Mới Nhất',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696476935/thumbnail_album/a7eff06ffdc4981ebd498674c5502220.jpgNh%E1%BA%A1c%20TikTok%20Remix%20M%E1%BB%9Bi%20Nh%E1%BA%A5tNhi%E1%BB%81u%20ngh%E1%BB%87%20s%E1%BB%B9.jpg',
    'Tự do',
    'Nhiều nghệ sỹ'
  ),
(
    7,
    1,
    'Tổng Hợp Những Bài Hát Âu Mỹ',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696483899/thumbnail_album/tong-hop-ca-bai-hat-au-my-moi-nhat.jpgT%E1%BB%95ng%20H%E1%BB%A3p%20Nh%E1%BB%AFng%20B%C3%A0i%20H%C3%A1t%20%C3%82u%20M%E1%BB%B9Nhi%E1%BB%81u%20ngh%E1%BB%87%20s%E1%BB%B9.jpg',
    'Tự do',
    'Nhiều nghệ sỹ'
  ),
(
    8,
    1,
    'Tổng Hợp Rap Việt Remix',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1700647662/thumbnail_album/be5bd5a5cea11d317318a6c51a1ea072.jpgT%E1%BB%95ng%20H%E1%BB%A3p%20Rap%20Vi%E1%BB%87t%20RemixNhi%E1%BB%81u%20ngh%E1%BB%87%20s%E1%BB%B9.jpg',
    'Tự do',
    'Nhiều nghệ sỹ'
  );

/*!40000 ALTER TABLE `album` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `favorite_list`
--
DROP TABLE IF EXISTS `favorite_list`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `favorite_list` (
  `favorite_list_id` int NOT NULL AUTO_INCREMENT,
  `song_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`favorite_list_id`),
  KEY `song_id` (`song_id`),
  CONSTRAINT `favorite_list_ibfk_1` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_list_ibfk_2` FOREIGN KEY (`song_id`) REFERENCES `song` (`song_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 33 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `favorite_list`
--
LOCK TABLES `favorite_list` WRITE;

/*!40000 ALTER TABLE `favorite_list` DISABLE KEYS */
;

INSERT INTO
  `favorite_list`
VALUES
  (18, 12, 1),
(19, 14, 1),
(20, 1, 1),
(21, 20, 1),
(22, 15, 1),
(23, 4, NULL),
(24, 8, 3),
(25, 4, 1),
(26, 38, 1),
(28, 65, NULL),
(29, 42, 1),
(30, 65, NULL),
(31, 65, NULL),
(32, 65, 1);

/*!40000 ALTER TABLE `favorite_list` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `song`
--
DROP TABLE IF EXISTS `song`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `song` (
  `song_id` int NOT NULL AUTO_INCREMENT,
  `album_id` int NOT NULL,
  `artist_id` int NOT NULL,
  `title_artist` varchar(255) NOT NULL,
  `title_song` varchar(255) NOT NULL,
  `song_thumbnail` varchar(1000) NOT NULL,
  `mp3_link` varchar(1000) NOT NULL,
  `release_date` datetime NOT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `listen_count` int DEFAULT '0',
  `like_count` int DEFAULT '0',
  PRIMARY KEY (`song_id`),
  KEY `album_id` (`album_id`),
  KEY `artist_id` (`artist_id`),
  CONSTRAINT `song_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `album` (`album_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `song_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 73 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `song`
--
LOCK TABLES `song` WRITE;

/*!40000 ALTER TABLE `song` DISABLE KEYS */
;

INSERT INTO
  `song`
VALUES
  (
    1,
    1,
    1,
    'BT REMIX',
    'The Hills x Where Have You Been Thereon Remix',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695859316/song_thumbnail/thehill_ge28vv.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695528882/audio/y2mate.com%20-%20The%20Hills%20x%20Where%20Have%20You%20Been%20Thereon%20Remix%20%20Nh%E1%BA%A1c%20Xu%20H%C6%B0%E1%BB%9Bng%20Tiktok%20G%E1%BA%A7n%20%C4%90%C3%A2y.mp3.mp3',
    '2023-09-24 06:14:43',
    '4:09',
    39,
    1
  ),
(
    2,
    1,
    1,
    'THEREON REMIX',
    'LIGHT IT UP X RISE THEREON REMIX',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695528928/song_thumbnail/1686051523405_640.jpg.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695528934/audio/y2mate.com%20-%20LIGHT%20IT%20UP%20X%20RISE%20THEREON%20REMIX%20NH%E1%BA%A0C%20HOT%20TREND%20TIKTOK%20M%E1%BB%9AI%20NH%E1%BA%A4T%202023.mp3.mp3',
    '2023-09-24 06:15:34',
    '4:32',
    41,
    0
  ),
(
    3,
    1,
    1,
    'THEREON REMIX',
    'Dadada - Thereon Remix Nhạc Hot Tiktok 2023',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695529051/song_thumbnail/artworks-000549583251-iylikg-t500x500.jpg.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695529055/audio/y2mate.com%20-%20Dadada%20%20Thereon%20Remix%20%20Nh%E1%BA%A1c%20Hot%20Tiktok%202023.mp3.mp3',
    '2023-09-24 06:17:35',
    '3:24',
    30,
    0
  ),
(
    4,
    1,
    1,
    'Exclusive Team',
    'Grow Up - Guhancci Remix Exclusive Team',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695529134/song_thumbnail/glowup.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695529138/audio/y2mate.com%20-%20Grow%20Up%20%20Guhancci%20Remix%20%20Exclusive%20Team%20%20Nh%E1%BA%A1c%20N%E1%BB%81n%20G%E1%BA%ADy%20Nghi%E1%BB%87n%20Hot%20Tik%20Tok%20Vi%E1%BB%87t%20Nam%20.mp3.mp3',
    '2023-09-24 06:18:59',
    '4:23',
    60,
    1
  ),
(
    5,
    2,
    1,
    'BLACKPINK',
    'BLACKPINK - ‘Yeah Yeah Yeah’ (Official Audio)',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1699889206/song_thumbnail/BLACKPINK%20-%20%E2%80%98Yeah%20Yeah%20Yeah%E2%80%99%20%28Official%20Audio%29in2byBLACKPINK.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695531299/audio/y2mate.com%20-%20BLACKPINK%20%20Yeah%20Yeah%20Yeah%20Official%20Audio_320kbps.mp3.mp3',
    '2023-09-24 06:55:00',
    '2:59',
    7,
    0
  ),
(
    6,
    2,
    1,
    'BLACKPINK ',
    'Pink Venom · BLACKPINK',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695531366/song_thumbnail/blackbink%204.png.png',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695531370/audio/y2mate.com%20-%20Pink%20Venom.mp3.mp3',
    '2023-09-24 06:56:11',
    '3:07',
    4,
    0
  ),
(
    7,
    2,
    1,
    'BLACKPINK ',
    'BLACKPINK X PUBG MOBILE Ready For Love',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695531483/song_thumbnail/default.webp.webp',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695531487/audio/y2mate.com%20-%20BLACKPINK%20X%20PUBG%20MOBILE%20%20Ready%20For%20Love%20MV.mp3.mp3',
    '2023-09-24 06:58:07',
    '3:06',
    4,
    0
  ),
(
    8,
    1,
    1,
    'SLEX REMIX',
    'HILK HILK REMIX',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695869363/song_thumbnail/hilkhilk.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695631905/audio/y2mate.com%20-%20Hik%20Hik%20Slex%20Remix%20nhactre2023%20kunzmusic%20hottrend2023%20nhachaymoingay_320kbps.mp3.mp3',
    '2023-09-25 10:51:47',
    '4:59',
    10,
    1
  ),
(
    9,
    1,
    1,
    'KORDHELL',
    'KORDHELL - MURDER PLOT',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695869416/song_thumbnail/multerplot.png',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695632253/audio/y2mate.com%20-%20KORDHELL%20%20MURDER%20PLOT_320kbps.mp3.mp3',
    '2023-09-25 10:57:35',
    '2:06',
    6,
    0
  ),
(
    10,
    1,
    1,
    'TVT REMIX',
    'NEVADA ft. LANTERNS - TVT REMIX',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695632496/song_thumbnail/artworks-aCw4bkY7YE8h9xS3-NVQIyA-t500x500.jpg.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695632501/audio/y2mate.com%20-%20Nevada%20x%20Lantern%20%20TvT%20Remix%20%20%20Nh%E1%BA%A1c%20Hot%20tiktok%20Bu%C3%B4ng%20H%C3%A0ng_320kbps.mp3.mp3',
    '2023-09-25 11:01:43',
    '4:30',
    2,
    0
  ),
(
    12,
    3,
    1,
    'TBynz Remix',
    'Lừa Dối - TBynz Remix',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695859767/song_thumbnail/luadoi_thaihoangremix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695634915/audio/y2mate.com%20-%20L%E1%BB%ABa%20D%E1%BB%91i%20TBynz%20Remix%20%20Nh%E1%BA%A1c%20Hot%20Trending%20Tik%20Tok%20Th%C3%A1i%20Ho%C3%A0ng%20Remix_320kbps.mp3.mp3',
    '2023-09-25 11:41:56',
    '1:23',
    571,
    1
  ),
(
    14,
    3,
    1,
    'NAMINO REMIX',
    'Cho Em Gần Anh Thêm Chút Nữa Remix ',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695635279/song_thumbnail/artworks-000311128110-1x9wq1-t500x500.jpg.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695635654/audio/df.mp3.mp3',
    '2023-09-25 11:54:16',
    '3:44',
    12,
    1
  ),
(
    15,
    3,
    1,
    'MR T X YANBI X HẰNG BINGBOONG ft. NIN HOÀNG & BIBO REMIX',
    'Thu Cuối Remix',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695860557/song_thumbnail/thucuoi.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695635972/audio/y2mate.com%20-%20MR%20T%20X%20YANBI%20X%20H%E1%BA%B0NG%20BINGBOONG%20%20THU%20CU%E1%BB%90I%20REMIX%20NIN%20HO%C3%80NG%20%20BIBO%20%20TIK%20TOK_320kbps.mp3.mp3',
    '2023-09-25 11:59:34',
    '3:27',
    14,
    1
  ),
(
    17,
    3,
    1,
    'Hieii Remix ft.Thomas Xynh',
    'Về Đây Em Lo Remix',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695860788/song_thumbnail/vedayemlo.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695637068/audio/y2mate.com%20-%20V%E1%BB%81%20%C4%90%C3%A2y%20Em%20Lo%20Hieii%20remix%20HOT%20TIKTOK_320kbps.mp3.mp3',
    '2023-09-25 12:17:49',
    '1:08',
    497,
    0
  ),
(
    19,
    3,
    1,
    'Dunghoangpham & Exclusive Music',
    'Mật Ngọt (Nam Con Remix)',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695637508/song_thumbnail/artworks-uLUnnW6h3gKIFXpc-pF0p5w-t500x500.jpg.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695637515/audio/g.mp3.mp3',
    '2023-09-25 12:25:17',
    '4:24',
    313,
    0
  ),
(
    20,
    3,
    1,
    'KAIZ ft. ATOM | Thanh Phong Remix',
    'Thời Gian Sẽ Trả Lời',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695637697/song_thumbnail/ab67616d0000b273607bfeb85b5550baf7b2a908.jfif.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695637701/audio/y2mate.com%20-%20Th%E1%BB%9Di%20Gian%20S%E1%BA%BD%20Tr%E1%BA%A3%20L%E1%BB%9Di%20Remix%20%20Thanh%20Phong%20Ft%20EDM%20Hot%20Tik%20Tok_320kbps.mp3.mp3',
    '2023-09-25 12:28:22',
    '1:10',
    218,
    1
  ),
(
    21,
    4,
    2,
    'JanK x Quanvrox',
    'Gió JanK x Quanvrox Lofi Ver Official',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695694451/song_thumbnail/5c78fdcb42026e83776a322a6b856697.jpg.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695694457/audio/y2mate.com%20-%20Gi%C3%B3%20%20JanK%20x%20QuanvroxLofi%20Ver%20Official%20Lyrics%20Video.mp3.mp3',
    '2023-09-26 04:14:19',
    '4:24',
    1,
    0
  ),
(
    22,
    4,
    2,
    'PHAN DUY ANH',
    'VÔ CÙNG ( VÌ ANH THƯƠNG EM ) - PHAN DUY ANH',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695694568/song_thumbnail/7f1c0611c731eea322b0c3f9291df3ac.jpg.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695694620/audio/d.mp3.mp3',
    '2023-09-26 04:17:02',
    '4:02',
    1,
    0
  ),
(
    23,
    4,
    2,
    'Hùng Quân x H2O',
    'Tiếng Pháo Tiễn Người (Lofi Lyrics)',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695694839/song_thumbnail/tiengphaotiennguoi.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695694843/audio/t.mp3.mp3',
    '2023-09-26 04:20:44',
    '3:52',
    1,
    0
  ),
(
    24,
    4,
    2,
    'K-ICM FT. APJ',
    'AI MANG CÔ ĐƠN ĐI',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695694994/song_thumbnail/aimangcodondi.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695694998/audio/y2mate.com%20-%20AI%20MANG%20C%C3%94%20%C4%90%C6%A0N%20%C4%90I%20%20KICM%20FT%20APJ%20%20OFFICIAL%20AUDIO.mp3.mp3',
    '2023-09-26 04:23:20',
    '3:36',
    0,
    0
  ),
(
    25,
    4,
    2,
    'Doãn Hiếu',
    'Tình Sầu Thiên Thu Muôn Lối',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695695286/song_thumbnail/ab67616d00001e02e332e36ce6d4ade27f0227dd.jfif.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695695290/audio/dd.mp3.mp3',
    '2023-09-26 04:28:12',
    '4:21',
    1,
    0
  ),
(
    26,
    4,
    2,
    'K-ICM x JACK ',
    'SÓNG GIÓ',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695695435/song_thumbnail/836cf31f036fb8f89b78cfd07cd77477.jpg.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695695439/audio/y2mate.com%20%20OFFICIAL%20MUSIC%20VIDEO.mp3.mp3',
    '2023-09-26 04:30:40',
    '5:50',
    1,
    0
  ),
(
    27,
    5,
    3,
    'JAPANDEE REMIX',
    'TINH VỆ (精卫) - JAPANDEE REMIX',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695695810/song_thumbnail/1691046071506_640.jpg.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695695816/audio/y2mate.com%20-%20TINH%20V%E1%BB%86%20%E7%B2%BE%E5%8D%AB%20%20JAPANDEE%20REMIX.mp3.mp3',
    '2023-09-26 04:36:57',
    '4:17',
    0,
    0
  ),
(
    28,
    5,
    3,
    'TranAnh REMIX',
    'HEATHENS REMIX TIKTOK',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695695930/song_thumbnail/heathen.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695695934/audio/fd.mp3.mp3',
    '2023-09-26 04:38:55',
    '3:46',
    1,
    0
  ),
(
    29,
    5,
    3,
    ' HL Harvey Remix',
    'DYNASTY x FICTION',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695696148/song_thumbnail/hqdefault.jpg.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695696152/audio/fff.mp3.mp3',
    '2023-09-26 04:42:34',
    '4:56',
    1,
    0
  ),
(
    30,
    5,
    3,
    'JAPAN Remix',
    'Set Fire To The Rain x Fake Love ',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695696254/song_thumbnail/setfiretotherain.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695696258/audio/hh.mp3.mp3',
    '2023-09-26 04:44:20',
    '4:48',
    0,
    0
  ),
(
    31,
    5,
    3,
    'VINZ REMIX',
    'STAR SKY REMIX',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695696371/song_thumbnail/starsky.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695696375/audio/gfd.mp3.mp3',
    '2023-09-26 04:46:17',
    '4:50',
    1,
    0
  ),
(
    32,
    5,
    3,
    'JAPAN Remix ',
    'Wolves Remix',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695696489/song_thumbnail/volve_remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695696494/audio/sda.mp3.mp3',
    '2023-09-26 04:48:15',
    '4:53',
    0,
    0
  ),
(
    34,
    5,
    3,
    'Xomu x QTrung',
    'Lanterns Remix TikTok',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695696759/song_thumbnail/xomu_lentern.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695696764/audio/fdsfdfd.mp3.mp3',
    '2023-09-26 04:52:45',
    '2:28',
    1,
    0
  ),
(
    35,
    5,
    3,
    'Nick Phoenix',
    'VICTORY - Nick Phoenix',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695697027/song_thumbnail/victory_remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695697031/audio/y2mate.com%20-%20VICTORY%20%20ANH%20VU%20REMIX.mp3.mp3',
    '2023-09-26 04:57:12',
    '1:04',
    0,
    0
  ),
(
    36,
    5,
    3,
    'Silver Smoke',
    'Giày Cao Gót Màu Đỏ Remix - 紅色高跟鞋',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695697193/song_thumbnail/giaycaogotmaudo.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695697197/audio/sads.mp3.mp3',
    '2023-09-26 04:59:58',
    '5:56',
    3,
    0
  ),
(
    37,
    5,
    3,
    'Gabry Ponte, LUM!X, Prezioso',
    'Thunder - BASS REMIX',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695696645/song_thumbnail/thunder.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695697487/audio/fgdgdfgfdgdfgdfg.mp3.mp3',
    '2023-09-26 05:04:48',
    '2:40',
    7,
    0
  ),
(
    38,
    3,
    1,
    'Diệu Khiên x AN Remix',
    'THUYỀN QUYÊN X DIỆU KIÊN',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695861616/song_thumbnail/THUY%E1%BB%80N%20QUY%C3%8AN%20X%20DI%E1%BB%86U%20KI%C3%8ANin3byDi%E1%BB%87u%20Khi%C3%AAn%20x%20AN%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695861624/audio/thuyenquem.mp3byDi%E1%BB%87u%20Khi%C3%AAn%20x%20AN%20Remixin3.mp3',
    '2023-09-28 02:40:26',
    '2:13',
    814,
    1
  ),
(
    39,
    3,
    1,
    'TBynz Remix',
    'Quá Khứ Anh Không Thể Quên Remix',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695861840/song_thumbnail/Qu%C3%A1%20Kh%E1%BB%A9%20Anh%20Kh%C3%B4ng%20Th%E1%BB%83%20Qu%C3%AAn%20Remixin3byTBynz%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695861852/audio/dd.mp3byTBynz%20Remixin3.mp3',
    '2023-09-28 02:44:14',
    '3:14',
    3,
    0
  ),
(
    40,
    3,
    1,
    'Frexs Remix',
    'Anh Sẽ Đợi Remix (Frexs Remix)',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695864362/song_thumbnail/Anh%20S%E1%BA%BD%20%C4%90%E1%BB%A3i%20Remix%20%28Frexs%20Remix%29in3byFrexs%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695864369/audio/y2mate.com%20-%20Anh%20S%E1%BA%BD%20%C4%90%E1%BB%A3i%20Remix%20Frexs%20Remix%20B%E1%BA%A3n%20Violin%20TikTok%20Anh%20Nguy%E1%BB%87n%20C%E1%BA%A7u%20Ng%C3%A0y%20Mai%20N%E1%BA%AFng%20L%C3%AAn%20R%E1%BB%93i%20Ta%20S%E1%BA%BD%20Quay%20V%E1%BB%81.mp3byFrexs%20Remixin3.mp3',
    '2023-09-28 03:26:11',
    '6:08',
    369,
    0
  ),
(
    41,
    3,
    1,
    'Frexs Remix',
    'Tiếng Pháo Tiễn Người',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695865832/song_thumbnail/Ti%E1%BA%BFng%20Ph%C3%A1o%20Ti%E1%BB%85n%20Ng%C6%B0%E1%BB%9Diin3byFrexs%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695865838/audio/SaveTik.co_7124570327274884354.mp3byFrexs%20Remixin3.mp3',
    '2023-09-28 03:50:39',
    '1:07',
    6,
    0
  ),
(
    42,
    3,
    1,
    'Orange - (KAIFO Remix)',
    'Em Hát Ai Nghe ',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695866226/song_thumbnail/Em%20H%C3%A1t%20Ai%20Nghe%20in3byOrange%20-%20%28KAIFO%20Remix%29.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695866230/audio/SaveTik.co_7261266180290153733.mp3byOrange%20-%20%28KAIFO%20Remix%29in3.mp3',
    '2023-09-28 03:57:12',
    '1:07',
    959,
    1
  ),
(
    43,
    3,
    1,
    'Quyền Hải Phòng X Tuấn Hưng Remix',
    'Phải Chia Tay Thôi',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695866432/song_thumbnail/Ph%E1%BA%A3i%20Chia%20Tay%20Th%C3%B4iin3byQuy%E1%BB%81n%20H%E1%BA%A3i%20Ph%C3%B2ng%20X%20Tu%E1%BA%A5n%20H%C6%B0ng%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695866436/audio/SaveTik.co_7243109707798301957.mp3byQuy%E1%BB%81n%20H%E1%BA%A3i%20Ph%C3%B2ng%20X%20Tu%E1%BA%A5n%20H%C6%B0ng%20Remixin3.mp3',
    '2023-09-28 04:00:38',
    '0:59',
    430,
    0
  ),
(
    44,
    3,
    1,
    'Bình Hồ Remix',
    'Đông Phai Mờ Dáng Ai',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695866778/song_thumbnail/%C4%90%C3%B4ng%20Phai%20M%E1%BB%9D%20D%C3%A1ng%20Aiin3byB%C3%ACnh%20H%E1%BB%93%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695866781/audio/SaveTik.co_7051442003841682689.mp3byB%C3%ACnh%20H%E1%BB%93%20Remixin3.mp3',
    '2023-09-28 04:06:23',
    '0:58',
    813,
    0
  ),
(
    45,
    3,
    1,
    'Thùy Chi (DANGLING)',
    'Quê Tôi',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695867819/song_thumbnail/Qu%C3%AA%20T%C3%B4iin3byTh%C3%B9y%20Chi%20%28DANGLING%29.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695867826/audio/y2mate.com%20-%20QU%C3%8A%20T%C3%94I%20%20Th%C3%B9y%20Chi%20DANGLING%20Qu%C3%AA%20T%C3%B4i%20C%C3%B3%20C%C3%A1nh%20Di%E1%BB%81u%20Vi%20Vu%20Remix%20Hot%20Tiktok%202021.mp3byTh%C3%B9y%20Chi%20%28DANGLING%29in3.mp3',
    '2023-09-28 04:23:48',
    '2:57',
    1484,
    0
  ),
(
    46,
    3,
    1,
    'DJ Thái Hoàng',
    'HẠNH PHÚC ĐÓ EM KHÔNG CÓ REMIX',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695867965/song_thumbnail/H%E1%BA%A0NH%20PH%C3%9AC%20%C4%90%C3%93%20EM%20KH%C3%94NG%20C%C3%93%20REMIXin3byDJ%20Th%C3%A1i%20Ho%C3%A0ng.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1695867969/audio/SaveTik.co_7243647277456248069.mp3byDJ%20Th%C3%A1i%20Ho%C3%A0ngin3.mp3',
    '2023-09-28 04:26:11',
    '1:07',
    375,
    0
  ),
(
    47,
    3,
    1,
    'MrSiro - Nb Remix',
    'Một Bước Yêu Vạn Dặm Đau ',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696167627/song_thumbnail/M%E1%BB%99t%20B%C6%B0%E1%BB%9Bc%20Y%C3%AAu%20V%E1%BA%A1n%20D%E1%BA%B7m%20%C4%90au%20in3byMrSiro%20-%20Nb%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696167630/audio/ssstik.io_1696167183757.mp3byMrSiro%20-%20Nb%20Remixin3.mp3',
    '2023-10-01 15:40:31',
    '1:00',
    192,
    0
  ),
(
    49,
    1,
    1,
    'Alan Walker Remix',
    'Move Your Body',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696167964/song_thumbnail/Move%20Your%20Bodyin1byAlan%20Walker%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696167967/audio/SaveTik.co_7259741386021309703.mp3byAlan%20Walker%20Remixin1.mp3',
    '2023-10-01 15:46:09',
    '1:15',
    1,
    0
  ),
(
    50,
    7,
    1,
    'Alec Benjamin',
    'Let Me Down Slowly',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696484007/song_thumbnail/Let%20Me%20Down%20Slowlyin7byAlec%20Benjamin.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696484011/audio/0000.mp3byAlec%20Benjaminin7.mp3',
    '2023-10-05 07:33:32',
    '2:49',
    3,
    0
  ),
(
    51,
    7,
    1,
    'Hozier, Olivia Rodrigo',
    'Drivers License x Take Me To Church',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696484175/song_thumbnail/Drivers%20License%20x%20Take%20Me%20To%20Churchin7byHozier%2C%20Olivia%20Rodrigo.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696484179/audio/0001.mp3byHozier%2C%20Olivia%20Rodrigoin7.mp3',
    '2023-10-05 07:36:20',
    '4:04',
    0,
    0
  ),
(
    52,
    7,
    1,
    'Heat Waves',
    'Glass Animals ',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696484283/song_thumbnail/Glass%20Animals%20in7byHeat%20Waves.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696484287/audio/0002.mp3byHeat%20Wavesin7.mp3',
    '2023-10-05 07:38:08',
    '4:40',
    0,
    0
  ),
(
    53,
    7,
    1,
    'Against The Current',
    'Legends Never Die - Worlds 2017 - League of Legends',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696484380/song_thumbnail/Legends%20Never%20Die%20-%20Worlds%202017%20-%20League%20of%20Legendsin7byAgainst%20The%20Current.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696484384/audio/0003.mp3byAgainst%20The%20Currentin7.mp3',
    '2023-10-05 07:39:45',
    '2:59',
    1,
    0
  ),
(
    54,
    7,
    1,
    'Sam Smith',
    'Naughty Boy - La la la',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696484455/song_thumbnail/Naughty%20Boy%20-%20La%20la%20lain7bySam%20Smith.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696484460/audio/0004.mp3bySam%20Smithin7.mp3',
    '2023-10-05 07:41:01',
    '4:03',
    0,
    0
  ),
(
    55,
    7,
    1,
    'Miia',
    'Dynasty',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696484601/song_thumbnail/Dynastyin7byMiia.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696484605/audio/0005.mp3byMiiain7.mp3',
    '2023-10-05 07:43:27',
    '3:15',
    3,
    0
  ),
(
    56,
    7,
    1,
    'SAINt JHN',
    'Roses',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696484720/song_thumbnail/Rosesin7bySAINt%20JHN.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696484724/audio/0006.mp3bySAINt%20JHNin7.mp3',
    '2023-10-05 07:45:25',
    '1:41',
    0,
    0
  ),
(
    57,
    7,
    1,
    'Sapientdream',
    'Sapientdream - Pastlives (Lyrics) Slowed + Reverb',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696484863/song_thumbnail/Sapientdream%20-%20Pastlives%20%28Lyrics%29%20Slowed%20%2B%20Reverbin7bySapientdream.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696484867/audio/0007.mp3bySapientdreamin7.mp3',
    '2023-10-05 07:47:48',
    '2:50',
    0,
    0
  ),
(
    58,
    7,
    1,
    'Shalom Margaret',
    'Shalom Margaret - Viva La Vida (Lofi Remix)',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696484948/song_thumbnail/Shalom%20Margaret%20-%20Viva%20La%20Vida%20%28Lofi%20Remix%29in7byShalom%20Margaret.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696484952/audio/0008.mp3byShalom%20Margaretin7.mp3',
    '2023-10-05 07:49:13',
    '2:33',
    0,
    0
  ),
(
    59,
    7,
    1,
    'Angie',
    'The Nights',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696485056/song_thumbnail/The%20Nightsin7byAngie.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696485060/audio/0009.mp3byAngiein7.mp3',
    '2023-10-05 07:51:01',
    '2:40',
    0,
    0
  ),
(
    60,
    7,
    1,
    'Ember Island - Matte Remix',
    'Umbrella',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696485123/song_thumbnail/Umbrellain7byEmber%20Island%20-%20Matte%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696485128/audio/0010.mp3byEmber%20Island%20-%20Matte%20Remixin7.mp3',
    '2023-10-05 07:52:09',
    '4:44',
    0,
    0
  ),
(
    61,
    7,
    1,
    'Sia',
    'Unstoppable',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696485205/song_thumbnail/Unstoppablein7bySia.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696485209/audio/0011.mp3bySiain7.mp3',
    '2023-10-05 07:53:30',
    '4:11',
    1,
    0
  ),
(
    62,
    6,
    1,
    'HƯNG BOBI FT NAM CON REMIX',
    'GUCCI BAD',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696485350/song_thumbnail/GUCCI%20BADin6byH%C6%AFNG%20BOBI%20FT%20NAM%20CON%20REMIX.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696485355/audio/0000.mp3byH%C6%AFNG%20BOBI%20FT%20NAM%20CON%20REMIXin6.mp3',
    '2023-10-05 07:55:56',
    '4:39',
    13476,
    0
  ),
(
    63,
    6,
    1,
    'THEREON REMIX',
    'DIOR ft. PANDA',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696485394/song_thumbnail/DIOR%20ft.%20PANDAin6byTHEREON%20REMIX.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696485398/audio/0001.mp3byTHEREON%20REMIXin6.mp3',
    '2023-10-05 07:56:40',
    '5:39',
    7,
    0
  ),
(
    64,
    6,
    1,
    'TBYNZ REMIX',
    'GOODIES REMIX',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696485453/song_thumbnail/GOODIES%20REMIXin6byTBYNZ%20REMIX.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696485457/audio/0002.mp3byTBYNZ%20REMIXin6.mp3',
    '2023-10-05 07:57:39',
    '4:30',
    131,
    0
  ),
(
    65,
    6,
    1,
    'HARVEY Remix',
    'GOODIES Remix Ver 2 + Trích Tiên',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696485670/song_thumbnail/GOODIES%20Remix%20Ver%202%20%2B%20Tr%C3%ADch%20Ti%C3%AAn%20in6byHARVEY%20REMIX.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696485674/audio/0003.mp3byHARVEY%20REMIXin6.mp3',
    '2023-10-05 08:01:16',
    '3:05',
    1561,
    1
  ),
(
    67,
    1,
    1,
    'Hensonn',
    'Sahara',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1696487936/song_thumbnail/Saharain1byHensonn.png',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1696487756/audio/mix.mp3byHensonnin1.mp3',
    '2023-10-05 08:39:02',
    '0:58',
    4,
    0
  ),
(
    68,
    8,
    1,
    'Dế Choắt ft. ThaiHoang Remix',
    'THẬP TỨ CÔ NƯƠNG - CỐ NHÂN TÌNH',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1700648410/song_thumbnail/TH%E1%BA%ACP%20T%E1%BB%A8%20C%C3%94%20N%C6%AF%C6%A0NG%20-%20C%E1%BB%90%20NH%C3%82N%20T%C3%8CNHin8byD%E1%BA%BF%20Cho%E1%BA%AFt%20ft.%20ThaiHoang%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1700648414/audio/ssstik.io_1700648238307.mp3byD%E1%BA%BF%20Cho%E1%BA%AFt%20ft.%20ThaiHoang%20Remixin8.mp3',
    '2023-11-22 11:20:15',
    '0:59',
    6,
    0
  ),
(
    69,
    8,
    1,
    'DH ft. Remix Version by 1 9 6 7',
    'Breakfast',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1700649477/song_thumbnail/Breakfastin8byDH%20ft.%20Remix%20Version%20by%201%209%206%207.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1700649481/audio/break.mp3byDH%20ft.%20Remix%20Version%20by%201%209%206%207in8.mp3',
    '2023-11-22 11:38:02',
    '0:33',
    2,
    0
  ),
(
    70,
    8,
    1,
    'Tommy Tèo, RPT MCK',
    'Alaba Trap',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1700649929/song_thumbnail/Alaba%20Trapin8byTommy%20T%C3%A8o%2C%20RPT%20MCK.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1700649932/audio/dsad.mp3byTommy%20T%C3%A8o%2C%20RPT%20MCKin8.mp3',
    '2023-11-22 11:45:33',
    '0:19',
    0,
    0
  ),
(
    71,
    8,
    1,
    'Young Milo「TvT Remix',
    'Sang Xịn Mịn ft Buông Hàng',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1700650248/song_thumbnail/Sang%20X%E1%BB%8Bn%20M%E1%BB%8Bn%20ft%20Bu%C3%B4ng%20H%C3%A0ngin8byYoung%20Milo%E3%80%8CTvT%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1700650251/audio/bh.mp3byYoung%20Milo%E3%80%8CTvT%20Remixin8.m4a',
    '2023-11-22 11:50:52',
    '1:00',
    0,
    0
  ),
(
    72,
    8,
    1,
    'RPT Phongkhin Remix',
    'Thủ Đô Cypher (Remix)',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1700650980/song_thumbnail/Th%E1%BB%A7%20%C4%90%C3%B4%20Cypher%20%28Remix%29in8byRPT%20Phongkhin%20Remix.jpg',
    'https://res.cloudinary.com/dnhps1jbn/video/upload/v1700650983/audio/ssstik.io_1700621210829.mp3byRPT%20Phongkhin%20Remixin8.mp3',
    '2023-11-22 12:03:04',
    '1:00',
    4,
    0
  );

/*!40000 ALTER TABLE `song` ENABLE KEYS */
;

UNLOCK TABLES;

--
-- Table structure for table `user`
--
DROP TABLE IF EXISTS `user`;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!50503 SET character_set_client = utf8mb4 */
;

CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `account_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar_link` varchar(1000) DEFAULT 'https://static2.yan.vn/YanNews/2167221/202003/dan-mang-du-trend-thiet-ke-avatar-du-kieu-day-mau-sac-tu-anh-mac-dinh-b0de2bad.jpg',
  `favorite_list_id` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `favorite_list_id` (`favorite_list_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`favorite_list_id`) REFERENCES `favorite_list` (`favorite_list_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */
;

--
-- Dumping data for table `user`
--
LOCK TABLES `user` WRITE;

/*!40000 ALTER TABLE `user` DISABLE KEYS */
;

INSERT INTO
  `user`
VALUES
  (
    1,
    'Dương Văn Mạnh',
    'manhduong2953',
    'manhme62',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695528696/avatar_link/Hinh-anh-chan-dung-nam-dep-nghe-thuat-400x600.jpg.jpg',
    NULL
  ),
(
    2,
    'Trần Thúy Lan',
    'locnguyen99',
    '123',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695694118/avatar_link/Hinh-anh-chan-dung-nu-400x600.jpg.jpg',
    NULL
  ),
(
    3,
    'Trần Đức Vỹ',
    'ducvy123',
    '123',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1695695553/avatar_link/Hinh-anh-chan-dung-nam-400x600.jpg.jpg',
    NULL
  ),
(
    4,
    'Tiêu Công Cường',
    'tieucuong123',
    '123123',
    'https://res.cloudinary.com/dnhps1jbn/image/upload/v1700828957/avatar_link/Ti%C3%AAu%20C%C3%B4ng%20C%C6%B0%E1%BB%9Dngtieucuong123.jpg',
    NULL
  );

/*!40000 ALTER TABLE `user` ENABLE KEYS */
;

UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */
;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */
;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */
;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */
;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */
;

-- Dump completed on 2023-11-24 19:31:40