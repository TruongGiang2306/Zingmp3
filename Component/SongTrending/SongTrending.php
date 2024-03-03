  <!DOCTYPE html>
  <html lang="en">

  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="/ZingMP3/Component/SongTrending/SongTrending.css">
  </head>

  <body>
      <!-- Thịnh hành -->
      <div class="trending-container">
          <h3 class="title-item--home">
              Trending
          </h3>
          <ul class="trending-list">
              <?php
                $sql_song_trending = $pdo->prepare("SELECT * FROM song ORDER BY listen_count DESC, like_count DESC LIMIT 10;");
                $sql_song_trending->execute();
                $list_song_trending = $sql_song_trending->fetchAll(PDO::FETCH_ASSOC);
                for ($i = 0; $i < count($list_song_trending); $i++) {
                ?>
                  <a href="../ListSongPages/ListSongPages.php?album_id=<?php echo $list_song_trending[$i]['album_id'] ?>&song_id=<?php echo $list_song_trending[$i]['song_id'] ?>">
                      <li class="trending-list--item">
                          <div class="song-info">
                              <div class="img-thumbnail">
                                  <img src="<?php echo $list_song_trending[$i]['song_thumbnail'] ?>" alt="">
                                  <i class="fa-solid fa-circle-play"></i>
                              </div>
                              <div class="info-song">
                                  <div class="name-song"><?php echo $list_song_trending[$i]['title_song'] ?></div>
                                  <div class="author-song"><?php echo $list_song_trending[$i]['title_artist'] ?></div>
                                  <div class="heart-quantity">
                                      <p><i class="fa-solid fa-headphones-simple"></i><?php echo $list_song_trending[$i]['listen_count'] ?> <i class="fa-solid fa-heart"></i><?php echo $list_song_trending[$i]['like_count'] ?></p>

                                  </div>
                              </div>
                          </div>
                          <span>
                              <p class="song-duration">5:22</p>

                          </span>
                      </li>
                  </a>

              <?php } ?>
          </ul>


      </div>

  </body>

  </html>