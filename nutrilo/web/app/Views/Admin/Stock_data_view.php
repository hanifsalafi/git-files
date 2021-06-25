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
            <span class="nav-menu-item"><a href="/stock">Stock</a></span>
        </div>

        <div class="content">
            <div class="container-fluid">
                <div class="container-member">
                    <h3 class="title">Daftar Bahan</h3><hr>
                    <div class="content">
                        <div class="container-fluid">
                            <a class="btn btn-add" style="float:right" href="javascript:;"
                                data-batch-id="<?= $batch->id; ?>"
                                data-toggle="modal" data-target="#add-ingredient">
                                <button data-toggle="modal" data-target="#tambah-bahan" class="btn btn-info">Tambah Data</button>
                            </a>
                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nama Bahan</th>
                                        <th>Kategori</th>
                                        <th>Satuan</th>
                                        <th>Harga</th>
                                        <th>Terakhir Diupdate</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($data as $row):?>
                                    <tr>
                                        <td><?= $row['id'] ?></td>
                                        <td><?= $row['name'] ?></td>
                                        <?php foreach($category as $ctg): ?>
                                        <?php if($ctg['id'] == $row['category_id']) { $category_name = $ctg['name'] ; }; ?>
                                        <?php endforeach; ?>
                                        <td><?= $category_name ?></td>
                                        <?php foreach($unit as $unt): ?>
                                        <?php if($unt['id'] == $row['unit_id']) { $unit_name = $unt['name'] ; }; ?>
                                        <?php endforeach; ?>
                                        <td><?= $unit_name ?></td>
                                        <td><?= $row['purchase_price'] ?></td>
                                        <td><?= $row['latest_price_date'] ?></td>
                                        <td>
                                        <a href="javascript:;"
                                            data-data-id="<?= $row['id'] ?>"
                                            data-name="<?= $row['name'] ?>"
                                            data-description="<?= $row['description'] ?>"
                                            data-category-id="<?= $row['category_id'] ?>"
                                            data-unit-id="<?= $row['unit_id'] ?>"
                                            data-purchase-price="<?= $row['purchase_price'] ?>"
                                            data-latest-price-date="<?= $row['latest_price_date'] ?>"
                                            data-stock-limit="<?= $row['stock_limit'] ?>"
                                            data-toggle="modal" data-target="#edit-ingredient">
                                            <button data-toggle="modal" data-target="#ubah-bahan" class="btn btn-info">Edit</button>
                                        </a>
                                        <a href="/admin/stock/delete/<?= $row['id'] ?>" class="btn btn-delete">Delete</a>
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


    

<!-- Modal Tambah -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="add-ingredient" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">Tambah Bahan</h4>
            </div>
            <div class="modal-body">
                <form action="<?php echo site_url('/admin/stock/save'); ?>" method="post">
                    <div class="form-group">
                        <label>Nama<span class="text-danger">*</span></label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="Masukkan nama bahan" value="" required>
                    </div>
                    <div class="form-group">
                        <label>Description<span class="text-danger">*</span></label>
                        <textarea cols="20" rows="3" name="description" id="description" class="form-control" placeholder="Masukkan deskripsi bahan" value=""></textarea>
                    </div>
                    <div class="form-group">
                        <label>Kategori<span class="text-danger">*</span></label>
                        <select class="form-control" name="category_id" id="category_id" value="" >
                            <?php foreach ($category as $ctg) : ?>
                                <option value='<?= $ctg['id']; ?>'>
                                    <?= $ctg['name']; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Satuan<span class="text-danger">*</span></label>
                        <select class="form-control" name="unit_id" id="unit_id" value="" >
                            <?php foreach ($unit as $unt) : ?>
                                <option value='<?= $unt['id']; ?>'>
                                    <?= $unt['name']; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-6">
                                <label>Harga Bahan<span class="text-danger">*</span></label>
                                <input type="number" name="purchase_price" id="purchase_price" class="form-control" placeholder="Masukkan harga bahan" required>
                            </div>
                            <div class="col-xs-6">
                                <label>Pada Tanggal<span class="text-danger">*</span></label>
                                <input placeholder="Masukkan tanggal saat harga dibuat" type="text" class="form-control" id="datepicker1" name="latest_date">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Batas Stok<span class="text-danger">*</span></label>
                        <input type="number" name="stock_limit" id="stock_limit" class="form-control" placeholder="Masukkan jumlah batas bawah bahan" value="" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- END Modal Tambah -->


<!-- Modal Edit -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="edit-ingredient" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">Edit Bahan</h4>
            </div>
            <div class="modal-body">
                <form action="<?php echo site_url('/admin/stock/update'); ?>" method="post">
                    <div class="form-group">
                        <input type="hidden" name="data-id" id="data-id" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Nama<span class="text-danger">*</span></label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="Masukkan nama bahan" required>
                    </div>
                    <div class="form-group">
                        <label>Description<span class="text-danger">*</span></label>
                        <textarea cols="20" rows="3" name="description" id="description" class="form-control" placeholder="Masukkan deskripsi bahan" value=""></textarea>
                    </div>
                    <div class="form-group">
                        <label>Kategori<span class="text-danger">*</span></label>
                        <select class="form-control" name="category_id" id="category_id">
                            <?php foreach ($category as $ctg) : ?>
                                <option value='<?= $ctg["id"]; ?>'>
                                    <?= $ctg["name"]; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Satuan<span class="text-danger">*</span></label>
                        <select class="form-control" name="unit_id" id="unit_id">
                            <?php foreach ($unit as $unt) : ?>
                                <option value='<?= $unt["id"]; ?>'>
                                    <?= $unt["name"]; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-xs-6">
                                <label>Harga Bahan<span class="text-danger">*</span></label>
                                <input type="number" name="purchase_price" id="purchase_price" class="form-control" placeholder="Masukkan harga bahan" required>
                            </div>
                            <div class="col-xs-6">
                                <label>Pada Tanggal<span class="text-danger">*</span></label>
                                <input placeholder="Masukkan tanggal saat harga dibuat" type="text" class="form-control" id="datepicker2" name="latest_date">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Batas Stok<span class="text-danger">*</span></label>
                        <input type="number" name="stock_limit" id="stock_limit" class="form-control" placeholder="Masukkan jumlah batas bawah bahan" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- END Modal Edit -->


<script type="text/javascript">
    $(document).keypress(function (e) {
        if (e.which == 13) {
            e.preventDefault();
        }
    });

    $(function() {
        $( "#datepicker1" ).datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: "dd-mm-yy"
        });
    });

    $(function() {
        $( "#datepicker2" ).datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: "dd-mm-yy"
        });
    });
</script>