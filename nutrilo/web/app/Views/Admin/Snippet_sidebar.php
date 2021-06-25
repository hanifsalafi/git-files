<div class="wrapper">
    <div class="sidebar" data-color="green" data-image="<?php echo base_url('img/sidebar-5.jpg'); ?>">

    <!--   you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple" -->

    	<div class="sidebar-wrapper">
            <div class="logo">
                <a href="<?php echo base_url('/'); ?>" class="simple-text">
                    Sayurnesia
                </a>
            </div>

            <ul class="nav">
                
                <li class="<?php if ($segment == 'dashboard'){ echo 'active'; } ?>">
                    <a href="<?php echo base_url('/admin'); ?>">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li class="<?php if ($segment == 'product'){ echo 'active'; } ?>">
                    <a href="<?php echo base_url('/admin/product'); ?>">
                        <i class="pe-7s-leaf"></i>
                        <p>Produk</p>
                    </a>
                </li>
                <li class="<?php if ($segment == 'transaction'){ echo 'active'; } ?>">
                    <a href="<?php echo base_url('/admin/transaction'); ?>">
                        <i class="pe-7s-cash"></i>
                        <p>Transaksi</p>
                    </a>
                </li>
                <li class="<?php if ($segment == 'product-history'){ echo 'active'; } ?>">
                    <a href="<?php echo base_url('/admin/product-history'); ?>">
                        <i class="pe-7s-note2"></i>
                        <p>Riwayat Produk</p>
                    </a>
                </li>
                <li class="<?php if ($segment == 'user'){ echo 'active'; } ?>">
                    <a href="<?php echo base_url('/admin/user/'); ?>">
                        <i class="pe-7s-user"></i>
                        <p>User</p>
                    </a>
                </li>
            </ul>
    	</div>
    </div>