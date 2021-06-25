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
            <i class="glyphicon glyphicon-chevron-right"></i>
            <span class="nav-menu-item"><a href="/stock/out-stock">Stok Keluar</a></span>
        </div>

        <div class="content">
            <div class="container-fluid">
                <div class="container-member">
                    <h3 class="title"><?= $title ?> Barang Keluar</h3><hr>
                    <?php if ($title == 'Edit') { ?>
                        <form action="<?php echo site_url('/admin/stock_in_out/updateoutstock'); ?>" method="post">
                    <?php } else { ?>
                        <form action="<?php echo site_url('/admin/stock_in_out/saveoutstock'); ?>" method="post">
                    <?php } ?>
                        <div class="form-group">
                            <input type="hidden" name="stock_id" id="stock_id" value="<?= $stock->id ?>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Nama Barang<span class="text-danger"> *</span></label>
                            <select class="form-control" name="ingredient_id" id="ingredient_id">
                                <option value="">Pilih Bahan</option>
                                <?php foreach ($ingredients as $ingredient) : ?>
                                    <?php if ($stock->ingredient_id == $ingredient['id']) { ?>
                                        <option value='<?= $ingredient["id"]; ?>' selected>
                                            <?= $ingredient["name"]; ?>
                                        </option>
                                    <?php } else { ?>
                                        <option value='<?= $ingredient["id"]; ?>'>
                                            <?= $ingredient["name"]; ?>
                                        </option>
                                    <?php } ?>
                                    <?php ?>
                                <?php endforeach; ?>
                            </select>
                        </div>
                         <div class="form-group">
                            <label>Tanggal Keluar<span class="text-danger"> *</span></label>
                            <input placeholder="Masukkan tanggal masuk barang" type="text" class="form-control" id="datepicker" name="out_date" value="<?= $stock->out_date ?>">
                        </div>
                        <div class="form-group">
                            <label>Jumlah Terpakai @ <span class="unit_tag"></span> <span class="text-danger">*</span></label>
                            <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Masukkan jumlah pesanan" value="<?php if ($title == 'Edit') { echo $stock->quantity; } else { echo 1; } ?>" required>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label>Pemakai<span class="text-danger"> *</span></label>
                                    <input type="text" name="consumer_name" id="consumer_name" class="form-control" placeholder="Masukkan nama pemakai" value="<?= $stock->consumer_name ?>" required>
                                </div>
                                <div class="col-xs-6">
                                    <label>Kontak Pemakai</label>
                                    <input type="number" name="consumer_phone" id="consumer_phone" class="form-control" placeholder="Masukkan nomor HP pemakai" value="<?= $stock->consumer_phone ?>" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Alasan Dikeluarkan<span class="text-danger"> *</span></label>
                            <select class="form-control" name="reason_out_stock" id="reason_out_stock">
                                <?php foreach ($reasons as $reason) : ?>
                                    <?php if ($stock->reason_out_stock_id == $reason['id']) { ?>
                                        <option value='<?= $reason["id"]; ?>' selected>
                                            <?= $reason["name"]; ?>
                                        </option>
                                    <?php } else { ?>
                                        <option value='<?= $reason["id"]; ?>'>
                                            <?= $reason["name"]; ?>
                                        </option>
                                    <?php } ?>
                                    <?php ?>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Keterangan Lainnya</label>
                            <textarea cols="20" rows="3" name="other_info" id="other_info" class="form-control" placeholder="Masukkan keterangan lainnya (jika ada)" value="<?= $stock->other_info ?>" ><?= $stock->other_info ?></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript">
    $(function(){
    $("#datepicker").datepicker({
        format: 'dd-mm-yyyy',
        autoclose: true,
        todayHighlight: true,
    });
    });
</script>


<script type="text/javascript">
    $(document).keypress(function (e) {
        if (e.which == 13) {
            e.preventDefault();
        }
    });
    $(document).ready(function() {

        $('#ingredient_id').on('change', function (e) {
            var optionSelected = $("option:selected", this);
            var valueSelected = this.value;
            var dataSelected = [];

            if (valueSelected != "") {
                <?php foreach($ingredients as $ing): ?>
                if (<?= $ing['id'] ?> == valueSelected) {
                    dataSelected = <?php echo json_encode($ing); ?>;
                }
                <?php endforeach; ?>

                <?php foreach($units as $unit): ?>
                if (<?= $unit['id'] ?> == dataSelected['unit_id']) {
                    $('.unit_tag').html("<?= $unit['name'] ?>")
                }
                <?php endforeach; ?> 
            };
        });
    });
</script>