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

        <div class="nav-menu">
            <span class="nav-menu-item"><a href="/">Home</a></span>
            <i class="glyphicon glyphicon-chevron-right"></i>
            <span class="nav-menu-item"><a href="/stock">Stok</a></span>
        </div>

        <div class="content">
            <div class="container-fluid">
                <div class="container-member">
                    <h3 class="title">Daftar Stok Keluar</h3><hr>
                    <div class="content">
                        <div class="container-fluid">
                            <a class="btn btn-info btn-add" href="/stock/out-stock/add" style="margin-bottom:8px;float:right;">Tambah Data</a>
                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nama Barang</th>
                                        <th>Tanggal Keluar</th>
                                        <th>Jumlah Terpakai</th>
                                        <th>Pemakai</th>
                                        <th>Alasan Dikeluarkan</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach($stocks as $stock): ?>
                                    <tr>
                                        <?php
                                            foreach($ingredients as $ing){ 
                                                if ($ing['id'] == $stock['ingredient_id']) {
                                                    foreach($units as $unit) { 
                                                        if ($unit['id'] == $ing['unit_id']) {
                                                            $unit_tag = $unit['name']; break;
                                                        };
                                                    };
                                                    break;
                                                };
                                            };
                                        ?>
                                        <?php foreach($ingredients as $ing): ?>
                                        <?php if($stock['ingredient_id'] == $ing['id']) { $ing_name = $ing['name'];} ?>
                                        <?php endforeach; ?>
                                        <?php foreach($reasons as $reason): ?>
                                        <?php if($stock['reason_out_stock_id'] == $reason['id']) { $reason_stock = $reason['name'];} ?>
                                        <?php endforeach; ?>
                                        <td><?= $stock['id'] ?></td>
                                        <td><?= $ing_name ?></td>
                                        <td><?= $stock['out_date'] ?></td>
                                        <td><?= $stock['quantity']." @ ".$unit_tag ?></td>
                                        <td><?= $stock['consumer_name'] ?></td>
                                        <td><?= $reason_stock ?></td>
                                        <td>
                                        <!-- <a href="javascript:;"
                                            data-name="<?= $buyer->name; ?>"
                                            data-toggle="modal" data-target="#show-data">
                                            <button  data-toggle="modal" data-target="#tampilkan-data" class="btn btn-info">Info</button>
                                        </a> -->
                                        <a href="/stock/out-stock/edit?id=<?= $stock['id'] ?>" class="btn btn-edit">Edit</a>
                                        <a href="/stock/out-stock/delete?id=<?= $stock['id'] ?>" class="btn btn-delete">Delete</a>
                                    </tr>     
                                    <?php endforeach; ?>                               
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

