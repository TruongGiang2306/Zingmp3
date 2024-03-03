<?php session_start() ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <!-- favicon  -->
    <link rel="shortcut icon" href="../../Component/assets/logo_mobile.png" type="image/x-icon">
    <title>Kết quả tìm kiếm - Nhóm Phát Triển Ứng Dụng Web</title>
    <!-- import css file component  -->
    <link rel="stylesheet" href="../../GlobalStyle/style.css">
    <link rel="stylesheet" href="./ResultSearch.css">
</head>

<body>
    <div id="search-main">
        <?php require '../../Component/Navbar/Navbar.php' ?>
        <?php require_once "../../Config/configConnectDB.php" ?>

        <div class="right-search">
            <?php require '../../Component/Header/HeaderLayout.php' ?>
            <div class="search-container">


                <?php
                $keyword = $_GET["keyword"];

                $sql_search = $pdo->prepare("SELECT s.*
                                            FROM song s
                                            INNER JOIN album a ON s.album_id = a.album_id
                                            INNER JOIN user u ON s.artist_id = u.id_user
                                            WHERE 
                                                s.title_song LIKE :keyword OR
                                                a.title_album LIKE :keyword OR
                                                a.kindof LIKE :keyword OR
                                                s.title_artist LIKE :keyword OR
                                                u.user_name LIKE :keyword
                                                ");
                $sql_search->bindValue(':keyword', "%$keyword%", PDO::PARAM_STR);
                $sql_search->execute();

                // Lấy kết quả tìm kiếm
                $results_search = $sql_search->fetchAll(PDO::FETCH_ASSOC);
                ?>
                <h1 class="title-item--home">
                    <i class="fa-solid fa-magnifying-glass"></i>Có <?php echo count($results_search) ?> kết quả tìm kiếm cho: "<?php echo $keyword ?>"
                </h1>
                <ul class="search-list">
                    <?php
                    for ($i = 0; $i < count($results_search); $i++) {
                    ?>
                        <a href="../ListSongPages/ListSongPages.php?album_id=<?php echo $results_search[$i]['album_id'] ?>&song_id=<?php echo $results_search[$i]['song_id'] ?>">
                            <li class="search-list--item">
                                <div class="song-info">
                                    <div class="img-thumbnail">
                                        <img src="<?php echo $results_search[$i]['song_thumbnail'] ?>" alt="">
                                        <i class="fa-solid fa-circle-play"></i>
                                    </div>
                                    <div class="info-song">
                                        <div class="name-song"><?php echo $results_search[$i]['title_song'] ?></div>
                                        <div class="author-song"><?php echo $results_search[$i]['title_artist'] ?></div>
                                        <div class="heart-quantity">
                                            <p><i class="fa-solid fa-headphones-simple"></i><?php echo $results_search[$i]['listen_count'] ?> <i class="fa-solid fa-heart"></i><?php echo $results_search[$i]['like_count'] ?></p>

                                        </div>
                                    </div>
                                </div>
                                <span>
                                    <p class="song-duration"><?php echo $results_search[$i]['duration'] ?></p>
                                </span>
                            </li>
                        </a>
                    <?php } ?>
                </ul>
            </div>
        </div>
</body>

</html>