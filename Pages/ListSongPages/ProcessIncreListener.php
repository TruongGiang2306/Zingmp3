<?php
require_once "../../Config/configConnectDB.php";
$song_id = $_REQUEST["song_id"];
$sql_incre_listener = $pdo->prepare("UPDATE song SET listen_count = listen_count + 1 WHERE song_id = $song_id");
$sql_incre_listener->execute();
?>