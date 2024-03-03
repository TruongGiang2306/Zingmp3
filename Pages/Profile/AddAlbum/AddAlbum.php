<?php session_start()?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <!-- favicon  -->
    <link rel="shortcut icon" href="../../Component/assets/logo_mobile.png" type="image/x-icon">
    <title>Thêm Album - Nhóm Phát Triển Ứng Dụng Web</title>
    <!-- import link css file component  -->
    <link rel="stylesheet" href="../../../GlobalStyle/style.css">
    <link rel="stylesheet" href="./AddAlbum.css">
</head>

<body>
    <div id="add-album--main">
        <?php require "../../../Component/Navbar/Navbar.php" ?>
        <div class="add-album--right">
            <div class="add-album--container">
                <h1>Tạo Album Mới</h1>
                <form action="./ProcessAddAlbum.php" method="POST" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="ten_album">Tên Album:</label>
                        <input type="text" id="ten_album" name="title_album" required>
                    </div>

                    <div class="form-group">
                        <label for="the_loai">Thể Loại:</label>
                        <input type="text" id="the_loai" name="kindof" required>
                    </div>

                    <div class="form-group">
                        <label for="thumbnail_album">Ảnh Album:</label>
                        <label for="thumbnail_album">
                            <div class="img-preview">
                                <img src="../../../Component/assets/upload_icon.png" alt="">
                            </div>
                        </label>
                        <input accept="image/*" hidden type="file" id="thumbnail_album" name="thumbnail_album" accept="image/*" required>
                    </div>

                    <div class="form-group">
                        <label for="name_artist">Tên Nghệ Sĩ:</label>
                        <input type="text" id="name_artist" name="name_artist" required>
                    </div>

                    <div class="form-group btn">
                        <input type="submit" value="Tạo Album">
                    </div>
                </form>
                <a href="../MyAlbum/MyAlbum.php"><button class="turn-back">Quay lại</button></a>
            </div>
        </div>

    </div>
    <script>
        const selectImageInput = document.querySelector("#thumbnail_album");
        const displayImage = document.querySelector(".img-preview > img");

        selectImageInput.addEventListener("change", function() {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    displayImage.src = e.target.result;
                };
                reader.readAsDataURL(file);
            } else {
                displayImage.src = "../../../Component/assets/upload_icon.png"; // Clear the image if no file is selected
            }
        });
    </script>
</body>

</html>