<?php session_start() ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- cdn fontawesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- favicon  -->
    <link rel="shortcut icon" href="../../Component/assets/logo_mobile.png" type="image/x-icon">
    <title>Chỉnh sửa bài hát - Nhóm Phát Triển Ứng Dụng Web</title>
    <!-- import link css file component  -->
    <link rel="stylesheet" href="../../GlobalStyle/style.css">
    <link rel="stylesheet" href="./UpdateSong.css">
</head>

<body>
    <?php require_once "../../Config/configConnectDB.php" ?>
    <?php

    $artist_id = $_SESSION["id_user"];
    $album_id = $_REQUEST["album_id"];
    $song_id = $_REQUEST["song_id"];
    $sql_song = $pdo->prepare("SELECT * FROM song WHERE song_id = $song_id");
    $sql_song->execute();
    $info_song = $sql_song->fetch(PDO::FETCH_ASSOC);

    ?>
    <div id="update-song--main">
        <?php require "../../Component/Navbar/Navbar.php" ?>
        <div class="update-song--right">
            <div class="update-song--container">
                <h1>Chính sửa Bài Hát</h1>
                <form action="./ProcessUpdateSong.php?song_id=<?=$song_id ?>" method="POST" enctype="multipart/form-data">
                    <input type="text" id="album_id" hidden name="album_id" value="<?php echo $_REQUEST['album_id'] ?>">
                    <div class="form-group">
                        <label for="title_song">Tên Bài Hát:</label>
                        <input type="text" id="title_song" name="title_song" value="<?= $info_song['title_song']?>" required>
                    </div>
                    <div class="form-group">
                        <label for="title_artist">Tên Nghệ Sĩ:</label>
                        <input type="text" id="title_artist" name="title_artist" value="<?= $info_song['title_artist']?>" required>
                    </div>

                    <div class="form-group">
                        <label for="mp3_link">Đăng bài hát:</label>
                        <input style="cursor: not-allowed;" title="Không thể thay thế bài hát đã đăng" type="text" id="mp3_link" value="<?= $info_song['mp3_link']?>" disabled name="mp3_link" required>
                    </div>

                    <div class="form-group">
                        <label for="song_thumbnail">Ảnh Bìa:</label>
                        <label for="song_thumbnail">
                            <div class="img-preview">
                                <img src="<?= $info_song['song_thumbnail']?>" alt="">
                            </div>
                        </label>
                        <input accept="image/*" hidden type="file" id="song_thumbnail" name="song_thumbnail" accept="image/*">
                    </div>


                    <div class="form-group">
                        <input type="submit" value="Cập nhật bài hát">
                    </div>
                </form>
                <a href="../UpdateListSong/UpdateListSong.php?album_id=<?=$album_id?>"><button class="turn-back">Quay lại</button></a>
            </div>
        </div>

    </div>
    <script>
               //Chọn và hiện ảnh review
        const selectImageInput = document.querySelector("#song_thumbnail");
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
                displayImage.src = "<?= $info_song['song_thumbnail']?>"; // Clear the image if no file is selected
            }
        });
    </script>
</body>

</html>