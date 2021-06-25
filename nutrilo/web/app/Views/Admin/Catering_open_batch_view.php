<div class="main-panel">
		<nav class="navbar navbar-default navbar-fixed">
            <div class="container-fluid">
                <div class="page-header">
                    <a class="navbar-brand pull-left" href="/">
                        <img class="logo-brand" src="<?php echo base_url('img/logo_nutrilo.png'); ?>" alt="">
                    </a>
                    <a class="navbar-logout pull-right" href="/logout">
                        <img class="logo-brand" src="<?php echo base_url('img/sign-out.svg'); ?>" alt="">    
                    </a>
                </div>
            </div>
        </nav>

        <div class="nav-menu" style="padding-top: 20px; padding-left: 20px;">
            <span class="nav-menu-item"><a href="/">Home</a></span>
            <i class="glyphicon glyphicon-chevron-right"></i>
            <span class="nav-menu-item"><a href="/catering">Catering</a></span>
        </div>

        <div class="content">
            <div class="container-fluid">
                <div class="container-batch">
                    <h3 class="title"><?= $batch->name ?></h3><hr>
                    <div class="menu-button">
                        <a class="one-line" href="/catering/menu?batch=<?= $batch->id ?>">Menu</a>
                        <a class="two-line" href="/catering/buyer?batch=<?= $batch->id ?>">Data Pemesan</a>
                        <a class="two-line" href="/catering/order?batch=<?= $batch->id ?>">Pesanan Harian</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
