<?php
session_start();
require_once "../../Config/configConnectDB.php";
require_once "../../Config/Cloudinary/configCloudinary.php";

if (isset($_SESSION["id_user"])) {
    $artist_id = $_SESSION["id_user"];
    $song_id = $_REQUEST["song_id"];
    $album_id = $_POST["album_id"];
    $title_song = trim($_POST["title_song"]);
    $title_artist = trim($_POST["title_artist"]);

    if (($_FILES["song_thumbnail"]["tmp_name"]) != "") {

        $thumbnail_file_name = $title_song . "in" . $album_id . "by" . $title_artist;
        $thumbnail_file_tmp =  $_FILES["song_thumbnail"]["tmp_name"];
        $song_thumbnail = getLinkMedia($cloudinary, $thumbnail_file_tmp, "song_thumbnail", $thumbnail_file_name);

        // Use prepared statements to avoid SQL injection
        $sql_up_song = $pdo->prepare("UPDATE song SET song_thumbnail = :song_thumbnail, title_artist = :title_artist, title_song = :title_song WHERE song_id = :song_id AND artist_id = :artist_id AND album_id = :album_id");
        $sql_up_song->bindParam(':song_thumbnail', $song_thumbnail, PDO::PARAM_STR);
        $sql_up_song->bindParam(':title_artist', $title_artist, PDO::PARAM_STR);
        $sql_up_song->bindParam(':title_song', $title_song, PDO::PARAM_STR);
        $sql_up_song->bindParam(':song_id', $song_id, PDO::PARAM_INT);
        $sql_up_song->bindParam(':artist_id', $artist_id, PDO::PARAM_INT);
        $sql_up_song->bindParam(':album_id', $album_id, PDO::PARAM_INT);

        $sql_up_song->execute();
    } else {

        // Use prepared statements to avoid SQL injection
        $sql_up_song = $pdo->prepare("UPDATE song SET title_artist = :title_artist, title_song = :title_song WHERE song_id = :song_id AND artist_id = :artist_id AND album_id = :album_id");
        $sql_up_song->bindParam(':title_artist', $title_artist, PDO::PARAM_STR);
        $sql_up_song->bindParam(':title_song', $title_song, PDO::PARAM_STR);
        $sql_up_song->bindParam(':song_id', $song_id, PDO::PARAM_INT);
        $sql_up_song->bindParam(':artist_id', $artist_id, PDO::PARAM_INT);
        $sql_up_song->bindParam(':album_id', $album_id, PDO::PARAM_INT);

        $sql_up_song->execute();
    }

    header("Location:" . "../UpdateListSong/UpdateListSong.php?album_id=" . $album_id);
} else {
    header("Location:" . "../Login/Login.php");
}
?>
