<?php session_start() ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- cdn fontawesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- favicon  -->
    <link rel="shortcut icon" href="../../../Component/assets/logo_mobile.png" type="image/x-icon">
    <title>Đăng bài hát - Nhóm Phát Triển Ứng Dụng Web</title>
    <!-- import link css file component  -->
    <link rel="stylesheet" href="../../../GlobalStyle/style.css">
    <link rel="stylesheet" href="./AddSong.css">
</head>

<body>
    <div id="add-song--main">
        <?php require "../../../Component/Navbar/Navbar.php" ?>
        <div class="add-song--right">
            <div class="add-song--container">
                <h1>Đăng Bài Hát</h1>
                <form action="./ProcessAddSong.php" method="POST" enctype="multipart/form-data">
                    <input type="text" id="album_id" hidden name="album_id" value="<?php echo $_REQUEST['album_id'] ?>">
                    <div class="form-group">
                        <label for="title_song">Tên Bài Hát:</label>
                        <input type="text" id="title_song" name="title_song" required>
                    </div>
                    <div class="form-group">
                        <label for="title_artist">Tên Nghệ Sĩ:</label>
                        <input type="text" id="title_artist" name="title_artist" required>
                    </div>

                    <div class="form-group">
                        <label for="mp3_link">Đăng bài hát:</label>
                        <input type="file" accept=".mp3" id="mp3_link" name="mp3_link" required>
                        <input type="text" id="duration" name="duration" hidden>
                    </div>

                    <div class="form-group">
                        <label for="song_thumbnail">Ảnh Bìa:</label>
                        <label for="song_thumbnail">
                            <div class="img-preview">
                                <img src="../../../Component/assets/upload_icon.png" alt="">
                            </div>
                        </label>
                        <input accept="image/*" hidden type="file" id="song_thumbnail" name="song_thumbnail" accept="image/*" required>
                    </div>


                    <div class="form-group">
                        <input type="submit" value="Đăng bài hát">
                    </div>
                </form>
                <a href="../MyAlbum/MyAlbum.php"><button class="turn-back">Quay lại</button></a>
            </div>
        </div>

    </div>
    <script>
        //xác định thời lượng bài hát
        const fileMp3 = document.getElementById('mp3_link');

        function formatTime(time) {
            const minutes = Math.floor(time / 60);
            const seconds = Math.floor(time % 60);
            return `${minutes}:${seconds < 10 ? "0" : ""}${seconds}`;
        }

        function getAudioDuration() {
            const audioFile = fileMp3.files[0];

            if (audioFile) {
                const audio = new Audio();
                audio.src = URL.createObjectURL(audioFile);

                audio.onloadedmetadata = function() {
                    const duration = audio.duration;

                    document.getElementById('duration').value = formatTime(duration);
                };
            }
        }
        fileMp3.addEventListener("change", () => {
            getAudioDuration();
        })


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
                displayImage.src = "../../../Component/assets/upload_icon.png"; // Clear the image if no file is selected
            }
        });
    </script>
</body>

</html>