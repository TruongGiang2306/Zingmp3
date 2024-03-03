<?php
require "../../../zingmp3/Config/configConnectDB.php";
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
                                                u.user_name LIKE :keyword");
$sql_search->bindValue(':keyword', "%$keyword%", PDO::PARAM_STR);
$sql_search->execute();

// Lấy kết quả tìm kiếm
$results_search = $sql_search->fetchAll(PDO::FETCH_ASSOC);
echo json_encode($results_search);
