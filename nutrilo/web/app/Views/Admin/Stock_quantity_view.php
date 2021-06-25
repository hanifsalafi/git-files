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
                            <table id="example" class="table table-striped table-bordered table-stock" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nama Bahan</th>
                                        <th>Batas Bawah</th>
                                        <th>Stok Masuk</th>
                                        <th>Stok Keluar</th>
                                        <th>Stok Tersisa</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($data as $row):?>
                                    <tr>    
                                        <?php $in_val = 0; $out_val = 0; $unit; ?>
                                        <?php foreach ($units as $unit): ?>
                                        <?php if ($row['unit_id'] == $unit['id']) { $unit_name = $unit['name']; }; ?>
                                        <?php endforeach; ?>
                                        <td><?= $row['id'] ?></td>
                                        <td><?= $row['name'] ?></td>
                                        <td><span class="sl<?= $row['id'] ?>"><?= $row['stock_limit'] ?></span> (<?= $unit_name ?>)</td>
                                        <?php foreach($in_stock as $in): ?>
                                        <?php if($in->ingredient_id == $row['id']) { $in_val = $in->stock; }; ?>
                                        <?php endforeach; ?>
                                        <td><b class="stock-in"><?php if ($in_val == 0) { echo "0 (".$unit_name.")"; } else { echo $in_val." (".$unit_name.")"; }; ?></b></td>
                                        <?php foreach($out_stock as $out): ?>
                                        <?php if($out->ingredient_id == $row['id']) { $out_val = $out->stock; }; ?>
                                        <?php endforeach; ?>
                                        <td><b class="stock-out"><?php if ($out_val == 0) { echo "0 (".$unit_name.")"; } else { echo $out_val." (".$unit_name.")"; }; ?></b></td>
                                        <td id="rs<?= $row['id'] ?>"><b><span class="rs<?= $row['id'] ?>"><?php echo ($in_val-$out_val) ?></span><?php echo " (".$unit_name.")"; ?></b></td>
                                        <!-- <td>
                                        <a href="javascript:;"
                                            data-data-id="<?= $row['id'] ?>"
                                            data-name="<?= $row['name'] ?>"
                                            data-description="<?= $row['description'] ?>"
                                            data-category-id="<?= $row['category_id'] ?>"
                                            data-unit-id="<?= $row['unit_id'] ?>"
                                            data-purchase-price="<?= $row['purchase_price'] ?>"
                                            data-latest-price-date="<?= $row['latest_price_date'] ?>"
                                            data-toggle="modal" data-target="#edit-ingredient">
                                            <button data-toggle="modal" data-target="#ubah-bahan" class="btn btn-info">Edit</button>
                                        </a>
                                        <a href="/admin/stock/delete/<?= $row['id'] ?>" class="btn btn-delete">Delete</a> -->
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


<script type="text/javascript">
$(document).ready(function(){
    <?php foreach ($data as $row): ?>
        var stock = parseInt($('.rs<?= $row['id'] ?>').html());
        var stock_limit = parseInt($('.sl<?= $row['id'] ?>').html());
        console.log(stock, stock_limit);
        if (stock <= 0) {
            $('#rs<?= $row['id'] ?>').css("color", "white")
            $('#rs<?= $row['id'] ?>').css("background-color", "rgb(232 70 38 / 75%)")
        }
        if (stock>0){
            if (stock<=stock_limit) {
                $('#rs<?= $row['id'] ?>').css("color", "#000")
                $('#rs<?= $row['id'] ?>').css("background-color", "rgb(240 216 0 / 57%)")
            } else {
                $('#rs<?= $row['id'] ?>').css("color", "#000")
                $('#rs<?= $row['id'] ?>').css("background-color", "#fff")
            }
        }
    <?php endforeach; ?>
});

</script>