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
            <span class="nav-menu-item"><a href="/shopping">Data Belanja</a></span>
            <i class="glyphicon glyphicon-chevron-right"></i>
            <span class="nav-menu-item"><a href="/shopping/data">Data Belanja</a></span>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="container-member">
                    <h3 class="title"><?= $title ?> Data</h3><hr>
                    <form action="<?php echo site_url('/admin/shopping/saveshoppinglist'); ?>" method="post">
                        <div class="form-group">
                            <input type="hidden" name="shopping_plan_id" id="shopping_plan_id" class="form-control" value="<?= $planData->id ?>">
                        </div>
                        <div class="form-group">
                            <label>Nama<span class="text-danger">*</span></label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Masukkan nama yang akan belanja" value="<?= $planData->name ?>" required>
                        </div>
                        <div class="form-group">
                            <label>Tanggal Belanja<span class="text-danger">*</span></label>
                            <input placeholder="Masukkan tanggal belanja" type="text" class="form-control" id="datepicker" name="shopping_date" value="<?= $planData->shopping_date ?>">
                        </div>
                        <div class="form-group">
                            <label>Tempat Belanja<span class="text-danger">*</span></label>
                            <input placeholder="Masukkan tempat belanja" type="text" class="form-control" id="shopping_place" name="shopping_place">
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label>Pembayaran<span class="text-danger"> *</span></label>
                                    <select class="form-control" name="payment_type" id="payment_type">
                                        <?php foreach ($payments as $payment) : ?>
                                            <option value='<?= $payment["id"]; ?>'>
                                                <?= $payment["name"]; ?>
                                            </option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-xs-6">
                                    <label>Sumber Dana<span class="text-danger">*</span></label>
                                    <input placeholder="Masukkan sumber dana belanja" type="text" class="form-control" id="money_source" name="money_source">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Catatan (Jika ada)</label>
                            <textarea cols="20" rows="3" name="other_info" id="other_info" class="form-control" placeholder="Masukkan keterangan lainnya (jika ada)" value="<?= $planData->other_info ?>"><?= $planData->other_info ?></textarea>
                        </div>
                        <div class="form-group">
                            <label>Daftar Belanja</label>
                            <div class="table-responsive shop-table">          
                                <table class="table" id="table-shopping">
                                    <thead>
                                        <tr>
                                            <th>Nama Bahan</th>
                                            <th>Jumlah</th>
                                            <th>Harga Satuan</th>
                                            <th>Total Harga</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i = 1; ?>
                                        <?php foreach ($planList as $item): ?>
                                        <tr id="row<?= $i ?>">
                                            <td>
                                                <select class="form-control ingredients<?= $i?>"  name="ingredients[]" id="ingredients" onchange="changeValue()">
                                                    <?php foreach ($ingredients as $ing) : ?>
                                                        <?php if ($ing['id'] == $item->ingredient_id) { ?>
                                                            <?php foreach($units as $unit): ?>
                                                                <?php if($unit['id'] == $ing['unit_id']) { $unit_name = $unit['name'] ; }; ?>
                                                            <?php endforeach; ?>
                                                            <option value='<?= $ing["id"]; ?>' selected>
                                                                <?= $ing["name"]." (".$unit_name.")" ?>
                                                                <?php $unit_price = $ing["purchase_price"]; ?>
                                                            </option>
                                                        <?php } else { ?>
                                                            <?php foreach($units as $unit): ?>
                                                                <?php if($unit['id'] == $ing['unit_id']) { $unit_name = $unit['name'] ; }; ?>
                                                            <?php endforeach; ?>
                                                            <option value='<?= $ing["id"]; ?>'>
                                                                <?= $ing["name"]." (".$unit_name.")" ?>
                                                            </option>
                                                        <?php }; ?>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                            <td id="qty"><input type="number" class="qty<?= $i ?>" name="quantity[]" id="quantity" class="form-control" placeholder="Masukkan jumlah" value="<?= $item->quantity ?>" onkeyup="setQty()" required></td>
                                            <td id="unit_price"><input type="number" class="up<?= $i ?>" name="unit_price[]" id="unit_price" class="form-control" placeholder="Masukkan harga satuan" value="<?= $unit_price ?>" onkeyup="setTotal()" required></td>
                                            <td id="total_price"><input type="number" class="tp<?= $i ?>" name="total_price[]" id="total_price" class="form-control" placeholder="Masukkan total harga" value="<?= $item->quantity * $unit_price ?>" onkeyup="setUnitPrice()" required></td>
                                            <?php if ($i != 1) { ?>
                                                <td><button class="delete-btn" type="submit" onclick="delete_row('<?php echo 'row'.$i; ?>')"><span class="glyphicon glyphicon-trash"></span></button></td>
                                            <?php }; ?>
                                        </tr>
                                        <?php $i++; ?>
                                        <?php endforeach;?>
                                    </tbody>
                                </table>
                                <input type="button" class='btn-add-row' onclick="add_row();" value="Tambah">
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Total Biaya</label>
                            <input placeholder="Masukkan total biaya belanja" type="text" class="form-control" id="total_costs" name="total_costs" value="<?php if($title = 'Tambah'){ echo 1000; } else { echo $data->total_costs; }; ?>" readonly >
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label>Biaya Lainnya</label>
                                    <input placeholder="Masukkan biaya lainnya" type="number" class="form-control" id="other_costs" name="other_costs" value="<?php if($title = 'Tambah'){ echo 0; } else { echo $data->other_costs; }; ?>">
                                </div>
                                <div class="col-xs-6">
                                    <label>Keterangan biaya</label>
                                    <input placeholder="Masukkan keterangan biaya" type="text" class="form-control" id="other_costs_detail" name="other_costs_detail" value="<?= $data->other_costs_detail ?>">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary submit-shop-list">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript">

    $(document).keypress(function (e) {
        if (e.which == 13) {
            e.preventDefault();
        }
    });

    updateTotalPrice();

    function add_row()
    {
        var classname = $('#table-shopping tr').last().attr('id');

        var numb = classname.match(/\d/g);
        id = numb.join("");

        // var rowno = $("#table-shopping tr").length;        
        var rowno = parseInt(id)+1;
        $("#table-shopping tr:last").after("<tr id='row"+rowno+"'><td><select class='form-control ingredients"+rowno+"' onchange='changeValue()' name='ingredients[]' id='ingredients'><?php foreach ($ingredients as $ing) : ?><?php foreach($units as $unit): ?><?php if($unit['id'] == $ing['unit_id']) { $unit_name = $unit['name'] ; }; ?><?php endforeach; ?><option value='<?= $ing["id"]; ?>'><?= $ing["name"]." (".$unit_name.")" ?></option><?php endforeach; ?></select></td><td id='qty'><input type='number' class='qty"+rowno+"' id='quantity' name='quantity[]' class='form-control' placeholder='1' value='1' onkeyup='setQty()'></td><td id='unit_price's><input type='number' class='up"+rowno+"' id='unit_price' name='unit_price[]' class='form-control' placeholder='1' value='<?= $ingredients[0]['purchase_price'] ?>' onkeyup='setTotal()'></td><td id='total_price'><input type='number' class='tp"+rowno+"' id='total_price' name='total_price[]' class='form-control' placeholder='1' value='<?= $ingredients[0]['purchase_price'] ?>' onkeyup='setUnitPrice()'></td><td><button class='delete-btn' type='submit' onclick=delete_row('row"+rowno+"')><span class='glyphicon glyphicon-trash'></span></button></td></tr>");
        
        updateTotalPrice()
    }
    function delete_row(rowno)
    {
        $('#'+rowno).remove();

        updateTotalPrice();
    }
    function setTotal(e) {
        e = e || window.event;
        var target = e.target || e.srcElement;
        var classname = $(target).attr('class');
        var targetVal = $(target).val();

        var numb = classname.match(/\d/g);
        id = numb.join("");

        var qty= $('.qty'+id).val();
        
        $('.tp'+id).val(targetVal*qty);

        updateTotalPrice();
    }

    function setQty(e) {
        e = e || window.event;
        var target = e.target || e.srcElement;
        var classname = $(target).attr('class');
        var targetVal = $(target).val();

        var numb = classname.match(/\d/g);
        id = numb.join("");

        var unitPrice= $('.up'+id).val();
        
        $('.tp'+id).val(targetVal*unitPrice);

        updateTotalPrice();
    }

    function setUnitPrice(e){
        e = e || window.event;
        var target = e.target || e.srcElement;
        var classname = $(target).attr('class');
        var targetVal = $(target).val();

        var numb = classname.match(/\d/g);
        id = numb.join("");

        var qty= $('.qty'+id).val();
        
        $('.up'+id).val(targetVal/qty);

        updateTotalPrice();
    }

    function updateTotalPrice(){
        var values = $("input[name='total_price[]']")
              .map(function(){return $(this).val();}).get();

        var total = 0;
        for (i = 0; i < values.length; i++) {
            total += parseInt(values[i]);
        }

        $('#total_costs').val(total);
    }

    function changeValue(e){
        e = e || window.event;
        var target = e.target || e.srcElement;
        var classname = $(target).attr('class');
        var targetId = $(target).val();

        var numb = classname.match(/\d/g);
        id = numb.join("");

        var qty = $('.qty'+id).val();

        var unit_price = 0;
        var total_price = 0;
        <?php foreach ($ingredients as $ing): ?>
            if (targetId == <?= $ing['id'] ?>) {
                unit_price = <?= $ing['purchase_price'] ?>;
                total_price = qty * unit_price;
            };
        <?php endforeach; ?>

        $('.up'+id).val(unit_price);
        $('.tp'+id).val(total_price);

        updateTotalPrice();
    }
</script>

<script type="text/javascript">
    $(function() {
        $( "#datepicker" ).datepicker({
        showOtherMonths: true,
        selectOtherMonths: true,
        dateFormat: "dd-mm-yy"
        });
    });
</script>