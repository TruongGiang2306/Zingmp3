create database zingmusic;

use zingmusic;

-- Tạo bảng user
CREATE TABLE nhom03 (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    account_name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    avatar_link VARCHAR(1000) DEFAULT "https://static2.yan.vn/YanNews/2167221/202003/dan-mang-du-trend-thiet-ke-avatar-du-kieu-day-mau-sac-tu-anh-mac-dinh-b0de2bad.jpg",
    favorite_list_id int
);

-- Tạo bảng album
CREATE TABLE album (
    album_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_id INT,
    title_album VARCHAR(1000),
    thumbnail_album VARCHAR(1000),
    kindof varchar(255) not null default "Tự do",
    name_artist varchar(255) -- phần này viết lên tiêu đề thôi
);

-- Tạo bảng song
CREATE TABLE song (
    song_id INT AUTO_INCREMENT PRIMARY KEY,
    album_id INT not null,
    artist_id INT not null,
    title_artist varchar(255) not null,
    title_song varchar(255) not null,
    song_thumbnail VARCHAR(1000) not null,
    mp3_link VARCHAR(1000) not null,
    release_date DATETIME not null,
    duration varchar(20),
    listen_count INT DEFAULT 0,
    like_count INT DEFAULT 0
);

-- Tạo bảng favorite_list
CREATE TABLE favorite_list (
    favorite_list_id INT AUTO_INCREMENT PRIMARY KEY,
    song_id INT,
    user_id int
);

-- Thêm ràng buộc ngoại cho bảng song
ALTER TABLE
    song
ADD
    FOREIGN KEY (album_id) REFERENCES album(album_id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD
    FOREIGN KEY (artist_id) REFERENCES user(id_user) ON DELETE CASCADE ON UPDATE CASCADE;

-- Thêm ràng buộc khóa ngoại cho bảng user
ALTER TABLE
    user
ADD
    FOREIGN KEY (favorite_list_id) REFERENCES favorite_list(favorite_list_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- Thêm ràng buộc ngoại cho bảng album
ALTER TABLE
    album
ADD
    FOREIGN KEY (artist_id) REFERENCES user(id_user) ON DELETE CASCADE ON UPDATE CASCADE;

-- Thêm ràng buộc ngoại cho bảng favorite_list
ALTER TABLE
    favorite_list
ADD
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE
    favorite_list
ADD
    FOREIGN KEY (song_id) REFERENCES song(song_id) ON DELETE CASCADE ON UPDATE CASCADE;