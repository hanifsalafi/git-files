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
                    <h3 class="title">Daftar Belanja Untuk Dimasukkan</h3><hr>
                    <div class="content">
                        <div class="container-fluid">
                            <form action="<?php echo site_url('/admin/stock_in_out/saveitemtostock'); ?>" method="post">
                                <div class="form-group">
                                    <label>Pilih produk yang akan dimasukkan <span class="text-danger">*</span></label>
                                    
                                    <?php foreach ($group_item_not_in_stock as $group): ?>
                                        <button type="button" class="accordion">Belanja <b><?= $group->name ?></b>, tanggal <b><?= $group->shopping_date ?></b></button>
                                        <div class="panel">
                                            <input type="hidden" name="shopping_list_id" value="<?= $group->shopping_list_id ?>">
                                            <?php foreach ($item_not_in_stock as $item): ?>
                                                <?php if ($group->shopping_list_id == $item->shopping_list_id){ ?>
                                                    <table class="table table-stripped item-stock">
                                                        <tbody>
                                                            <tr>
                                                                <td>
                                                                    <?php foreach($ingredients as $ing){ 
                                                                        if ($ing['id'] == $item->ingredient_id) {
                                                                            $name = $ing['name'];
                                                                            foreach($units as $unit) { 
                                                                                if ($unit['id'] == $ing['unit_id']) {
                                                                                    $unit_tag = $unit['name']; break;
                                                                                };
                                                                            };
                                                                            break;
                                                                        };
                                                                    }; ?>
                                                                    <div class="group-stock">
                                                                        <input type="hidden" name="item_id[]" id="item_id" value="<?= $item->id ?>" class="form-control">
                                                                        <!-- <input type="checkbox" class="item-stock-check" name="ingredient_id[]" id="ingredient_id" value="<?= $item->ingredient_id ?>"> -->
                                                                        <label class="container-checkbox"><p class="item-stock-name"><?= $name ?></p> 
                                                                            <input type="checkbox" name="ingredient_id[]" id="ingredient_id" value="<?= $item->ingredient_id ?>" required>
                                                                            <span class="checkmark"></span>
                                                                        </label>
                                                                        
                                                                    </div>   
                                                                </td>
                                                                <td class="item-quantity-unit">
                                                                    <input type="number" class="item-stock-quantity" name="quantity[]" id="quantity" value="<?= $item->quantity ?>" required>
                                                                    <label class="item-stock-unit" ><?= $unit_tag ?></label>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                <?php }; ?>
                                            <?php endforeach; ?>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                                <div class="form-group">
                                    <label>Tanggal Masuk <span class="text-danger">*</span></label>
                                    <input placeholder="Masukkan tanggal masuk barang" type="text" class="form-control" id="datepicker" name="entry_date" value="<?= $stock->entry_date ?>" required>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <label>Pemasok <span class="text-danger"> *</span></label>
                                            <input type="text" name="supplier_name" id="supplier_name" class="form-control" placeholder="Masukkan nama pemasok (pengisi stok)" value="<?= $stock->supplier_name ?>" required>
                                        </div>
                                        <div class="col-xs-6">
                                            <label>Kontak Pemasok <span class="text-danger"> *</span></label>
                                            <input type="number" name="supplier_phone" id="supplier_phone" class="form-control" placeholder="Masukkan nomor HP pemasok" value="<?= $stock->supplier_phone ?>" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Simpan</button>
                                </div>
                            </form>
                        </div>
                    </div>
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
   var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
    acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight) {
        panel.style.maxHeight = null;
        } else {
        panel.style.maxHeight = panel.scrollHeight + "px";
        } 
    });
    }
</script>

<script>
    $(function(){
        var requiredCheckboxes = $('.container-checkbox :checkbox[required]');
        requiredCheckboxes.change(function(){
            if(requiredCheckboxes.is(':checked')) {
                requiredCheckboxes.removeAttr('required');
            } else {
                requiredCheckboxes.attr('required', 'required');
            }
        });
    });
</script>