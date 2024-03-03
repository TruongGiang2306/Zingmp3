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
    <title>Album của tôi - Nhóm Phát Triển Ứng Dụng Web</title>
    <!-- import link css file component  -->
    <link rel="stylesheet" href="../../../GlobalStyle/style.css">
    <link rel="stylesheet" href="../Profile.css">
    <link rel="stylesheet" href="./MyAlbum.css">
</head>

<body>
    <div id="profile-main">
        <?php require_once "../../../Component/Navbar/Navbar.php" ?>
        <?php require_once "../../../Config/configConnectDB.php" ?>

        <?php
        // Hiện thông tin người dùng 
        $id_user = $_SESSION["id_user"];
        $statement = $pdo->prepare("SELECT * FROM user WHERE id_user = '$id_user'");
        $statement->execute();
        $info_user = $statement->fetch(PDO::FETCH_ASSOC);
        // print_r($info_user);

        ?>
        <div class="profile-right">
            <?php require "../../../Component/Header/HeaderLayout.php" ?>
            <div class="container-profile">
                <div class="profile-header">
                    <div class="img-container">
                        <img src="<?php echo $info_user["avatar_link"] ?>" alt="" />
                    </div>
                    <div class="profile-name"><?php echo $info_user["user_name"] ?></div>
                </div>

                <ul class="profile-navbar">
                    <a href="../MyHeart/MyHeart.php">
                        <li>Yêu thích</li>
                    </a>
                    <a href="../MyAlbum/MyAlbum.php">
                        <li class="active">Album</li>
                    </a>
                    <a href="../InfoUser/InfoUser.php">
                        <li>Cá nhân</li>
                    </a>
                </ul>
            </div>
            <div class="profile-content">
                <h3>Album của bạn</h3>
                <ul class="list-my--album">

                    <?php
                    $sql_my_album = $pdo->prepare("SELECT * FROM album WHERE artist_id = $id_user");
                    $sql_my_album->execute();
                    $my_album = $sql_my_album->fetchAll(PDO::FETCH_ASSOC);
                    ?>

                    <?php for ($i = 0; $i < count($my_album); $i++) { ?>
                        <a href="../../UpdateListSong/UpdateListSong.php?album_id=<?php echo $my_album[$i]["album_id"]?>">
                            <li class="item-my--album">
                                <i class="fa-regular fa-circle-play"></i><img src="<?php echo $my_album[$i]["thumbnail_album"]?>" alt="Ảnh thumbnail Album">
                            </li>
                            <p class="title-author"><?php echo $my_album[$i]["title_album"]?>
                            </p>
                            <p class="name-author">
                            <?php echo $my_album[$i]["name_artist"]?>
                            </p>
                        </a>
                    <?php } ?>

                    <a href="../AddAlbum/AddAlbum.php" class="add-album">
                        <i class="fa-solid fa-circle-plus"></i>
                    </a>
                </ul>
            </div>
        </div>

    </div>
</body>

</html>