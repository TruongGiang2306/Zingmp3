<?php session_start()?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- cdn fontawesome  -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

  <!-- favicon  -->
  <link rel="shortcut icon" href="../../../Component/assets/logo_mobile.png" type="image/x-icon" />
  <title>Thông tin tài khoản - Nhóm Phát Triển Ứng Dụng Web</title>
  <!-- import link css file component  -->
  <link rel="stylesheet" href="../../../GlobalStyle/style.css" />
  <link rel="stylesheet" href="../Profile.css" />
  <link rel="stylesheet" href="./InfoUser.css" />

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
            <img src="<?php echo $info_user["avatar_link"]?>" alt="" />
          </div>
          <div class="profile-name"><?php echo $info_user["user_name"]?></div>
        </div>

        <ul class="profile-navbar">
          <a href="../MyHeart/MyHeart.php">
            <li>Yêu thích</li>
          </a>
          <a href="../MyAlbum/MyAlbum.php">
            <li>Album</li>
          </a>
          <a href="../InfoUser/InfoUser.php">
            <li class="active">Cá nhân</li>
          </a>
        </ul>
      </div>
      <div class="profile-content">
        <h2 class="update-infor-title">Chỉnh sửa thông tin cá nhân</h2>
        <form action="./ProcessUpdateInfoUser.php" method="post" enctype="multipart/form-data">
          <div class="infor-user-content">
            <div class="infor-text">
              <div class="infor-text-detail">
                <label for="account_name">Tên tài khoản</label><input id="account_name" name="account_name" type="text" class="form-control account_name" value='<?php echo $info_user["account_name"]?>' placeholder="Tên tài khoản..." />
              </div>
              <div class="infor-text-detail">
                <label for="user_name">Tên người dùng</label><input id="user_name" name="user_name" type="text" class="form-control user_name" value='<?php echo $info_user["user_name"]?>' placeholder="Tên người dùng..." />
              </div>
              <div class="infor-text-detail">
                <label for="password">Mật khẩu</label><input id="password" name="password" type="text" class="form-control password" value='<?php echo $info_user["password"]?>' placeholder="Mật khẩu..." />
              </div>
            </div>
            <div class="infor-avt">
              <div class="form-group">
                <label for="anh_album">Ảnh đại diện:</label>
                <label for="anh_album">
                  <div class="img-preview">
                    <img src="../../../Component/assets/upload_icon.png" alt="">
                  </div>
                </label>
                <input accept="image/*" hidden="" type="file" id="anh_album" name="avatar_link" required="">
              </div>
            </div>
          </div>
          <div class="btn-submit"><button class="btn-login" type="submit">Cập Nhật</button></div>

        </form>
      </div>
    </div>
  </div>
  <script>
    const selectImageInput = document.querySelector("#anh_album");
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