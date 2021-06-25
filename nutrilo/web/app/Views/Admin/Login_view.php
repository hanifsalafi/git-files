<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Internal Nutrilo</title>
  <?= csrf_meta() ?>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Favicon -->
  <!-- <link rel="shortcut icon" type="image/x-icon" href="https://res.cloudinary.com/sayurnesia-id/image/upload/v1589494782/asset/img/favicon_m5aipq.png"> -->
  <link rel="stylesheet" href="<?php echo base_url('user-assets/css/style-login.css'); ?>">
  <link rel="stylesheet" href="<?php echo base_url('user-assets/css/bootstrap.min.css'); ?>">
  <link rel="stylesheet" href="<?php echo base_url('user-assets/css/themify-icons.css'); ?>">
  <link rel="stylesheet" href="<?php echo base_url('user-assets/css/pe-icon-7-stroke.css'); ?>">
  <link rel="stylesheet" href="<?php echo base_url('user-assets/css/style.css'); ?>">
  <link rel="stylesheet" href="<?php echo base_url('user-assets/css/responsive.css'); ?>">
  <script src="<?php echo base_url('user-assets/js/modernizr-2.8.3.min.js'); ?>"></script>
  <script src="https://use.fontawesome.com/ca25d38124.js"></script>
</head>
<body>
  <div class="login-page">
    <div class="form">
      <form class="register-form" method="POST" action="<?php echo base_url('/admin/login/register/'); ?>">
        <input type="text" name="name" placeholder="nama" required/>
        <input type="text" name="username" placeholder="username" required/>
        <input type="text" name="email" placeholder="email" pattern="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}" required/>
        <input type="password" name="password" placeholder="password" required/>
        <button>Buat Akun</button>
        <p class="message">Sudah terdaftar? <a href="#">Silahkan login</a></p>
      </form>
      <form class="login-form" method="POST" action="<?php echo base_url('/admin/login/login_validation/'); ?>">
        <input type="text" name="username" placeholder="username" value="" required/>
        <input type="password" name="password" placeholder="password" value="" required/>
        <button>login</button>
      </form>
    </div>
  </div>
</body>
  <script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
  <script src="<?php echo base_url('user-assets/js/popper.js'); ?>"></script>
  <script src="<?php echo base_url('user-assets/js/bootstrap.min.js'); ?>"></script>
  <script src="<?php echo base_url('js/bootstrap-notify.js'); ?>"></script>
  
  <script>
    $('.message a').click(function(){
        $('form').animate({height: "toggle", opacity: "toggle"}, "slow");
    });

    <?php 
    if($error_code == 1) {
      echo '$("form").animate({height: "toggle", opacity: "toggle"}, "slow")';
    }
    ?>

    type = ['','info','success','warning','danger'];
    demo = {
        showNotification: function(message, from, align){
            color = Math.floor((Math.random() * 4) + 1);

            $.notify({
                icon: "pe-7s-bell",
                message: message
            },{
                type: type[1],
                timer: 500,
                placement: {
                    from: from,
                    align: align
                }
            });
        }
    };
    let status =<?php if($message != null){ echo "'".$message."'"; } else { echo null; } ?>;
    if(status != 'null') {
      demo.showNotification(<?php echo  "'".$message."'"; ?>, 'top','center');
    }
  </script>
</html>