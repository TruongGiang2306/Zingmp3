#### DỰ ÁN BÀI TẬP LỚN MÔN PHÁT TRIỂN ỨNG DỤNG WEB
## THÀNH VIÊN THANH GIA GỒM:
1. Dương Văn Mạnh (2121051081)
2. Quách Trường Giang (2121051072) (NEWSONG, SIGNUP, LOGIN)
3. Hồ Viết Trà (2121051113)
4. Đoàn Thị Thùy Linh (2121051094)


Tất cả các thành viên trong dự án đều đảm nhận những nhiệm vụ cụ thể:
- **Đoàn Thị Thùy Linh (2121051094):**
   + Thiết kế giao diện, thiết kế cơ sở dữ liệu
   + Code trang nhạc yêu thích (MyHeart)

- **Quách Trường Giang (2121051072):**
   + Code giao diện trang: Nhạc mới (NewSongs), đăng nhập (Login), đăng kí (Signup)

- **Hồ Viết Trà (2121051113):**
   + Code giao diện trang: Bảng xếp hạng thịnh hành (TopSong), trang tìm kiếm (ResultSearch)

- **Dương Văn Mạnh (2121051081):**LEADER
   + Code giao diện trang: Trang Khám phá (Home), Trang Chơi nhạc (ListSongPages), Trang Cá nhân (InfoUser), Trang Album của bạn (MyAlbum), Trang Chỉnh Sửa Album (UpdateListSong), Trang Thêm Album (AddAlbum), Trang Thêm Bài Hát (AddSong)
   
## MÔ TẢ DỰ ÁN
- DỰ ÁN ĐƯỢC XÂY DỰNG TRÊN WEB SERVER APACHE 

- FRONT END: 
    + GIAO DIỆN:
        * TRANG LOGIN, SIGNUP, LOGOUT
        * TRANG CÁ NHÂN, KHÁM PHÁ, NHẠC MỚI, TOP BÀI HÁT
        * TRANG BÀI HÁT YÊU THÍCH, ALBUM CỦA TÔI, TRANG CÁ NHÂN
        * TRANG THÊM ALBUM, THÊM BÀI HÁT, XÓA ALBUM, XÓA BÀI HÁT
        * TRANG PHÁT NHẠC THEO ALBUM: PHÁT LẶP LẠI, PHÁT NGẪU NHIÊN, CHUYỂN BÀI, TUA BÀI HÁT, ĐIỀU CHỈNH ÂM LƯỢNG, THÊM VÀO DANH SÁCH YÊU THÍCH
        * TRANG TÌM KIẾM THEO TÊN NGHỆ SỸ, TÊN BÀI HÁT, TÊN ALBUM, THỂ LOẠI
    + NGÔN NGỮ SỬ DỤNG: 
        * HTML, CSS & JavaScript
        * THƯ VIỆN: FRONTAWESOME, FONTGOOGLE, SLICK
- BACKEND:
    + NGÔN NGỮ SỬ DỤNG:
        * PHP
        * MySQL
    + CÔNG NGHỆ:
        * CLOUDINARY

* CHỨC NĂNG CHÍNH:
    - ĐĂNG NHẬP, ĐĂNG KÍ, ĐĂNG XUẤT
    - SỬA XÓA THÔNG TIN NGƯỜI DÙNG
    - THÊM XÓA ALBUM, BÀI HÁT
    - THÊM DANH SÁCH YÊU THÍCH
    - TOP THỊNH HÀNH THEO LƯỢT NGHE, LƯỢT LIKE
    - TĂNG LƯỢT GHE SAU 20s
    - PHÁT NGẪU NHIÊN, PHÁT VÒNG LẶP (SỬ DỤNG LOCALSTORAGE VÀ SESSION)



## Hướng dẫn chạy dự án:
- Bật XAMPP, khởi động web server APACHE và MySQL
- Truy cập localhost trên máy với cổng của apache (mặc định là 8080)
- Trên phpMyAdmin tạo cơ sở dữ liệu và bảng với câu truy vấn trong file query.sql
- Cấu hình lại file configConnectDB.php 
- Lấy data từ file data.sql
- Chạy lại dự án trên localhost

