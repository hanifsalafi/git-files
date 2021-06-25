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
            <span class="nav-menu-item"><a href="/shopping/plan">Rencana Belanja</a></span>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="container-member">
                    <h3 class="title"><?= $title ?> Data</h3><hr>
                    <?php if ($title == 'Edit') { ?>
                        <form action="<?php echo site_url('/admin/shopping/updateshoppingplan'); ?>" method="post">
                    <?php } else { ?>
                        <form action="<?php echo site_url('/admin/shopping/saveshoppingplan'); ?>" method="post">
                    <?php } ?>
                        <div class="form-group">
                            <input type="hidden" name="plan_id" id="plan_id" value="<?= $plan->id ?>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Nama<span class="text-danger">*</span></label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Masukkan nama yang akan belanja" value="<?= $plan->name ?>" required>
                        </div>
                        <div class="form-group">
                            <label>Tanggal Belanja<span class="text-danger">*</span></label>
                            <input placeholder="Masukkan tanggal belanja" type="text" class="form-control" id="datepicker" name="shopping_date" value="<?= $plan->shopping_date ?>">
                        </div>
                        <div class="form-group">
                            <label>Keterangan (Jika ada)</label>
                            <textarea cols="20" rows="3" name="other_info" id="other_info" class="form-control" placeholder="Masukkan keterangan lainnya (jika ada)" value="<?= $plan->other_info ?>" ><?= $plan->other_info ?></textarea>
                        </div>
                        <div class="form-group">
                            <label>Daftar Belanja</label>
                            <div class="table-responsive">          
                                <table class="table" id="table-plan">
                                    <thead>
                                        <tr>
                                            <th>Nama Bahan</th>
                                            <th>Jumlah</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php $i = 1; ?>
                                        <?php foreach ($item_list as $item) : ?>
                                        <tr id="row<?= $i ?>">
                                            <td>
                                                <select class="form-control" name="ingredients[]" id="ingredients">
                                                    <?php foreach ($ingredients as $ing) : ?>
                                                        <?php if ($ing['id'] == $item->ingredient_id) { ?>
                                                            <?php foreach($units as $unit): ?>
                                                                <?php if($unit['id'] == $ing['unit_id']) { $unit_name = $unit['name'] ; }; ?>
                                                            <?php endforeach; ?>
                                                            <option value='<?= $ing["id"]; ?>' selected>
                                                                <?= $ing["name"]." (".$unit_name.")" ?>
                                                            </option>
                                                        <?php } else { ?>
                                                            <?php foreach($units as $unit): ?>
                                                                <?php if($unit['id'] == $ing['unit_id']) { $unit_name = $unit['name'] ; }; ?>
                                                            <?php endforeach; ?>
                                                            <option value='<?= $ing["id"]; ?>'>
                                                                <?= $ing["name"]." (".$unit_name.")" ?>
                                                            </option>
                                                    <?php }; endforeach; ?>
                                                </select>
                                            </td>
                                            <td id="qty<?= $i ?>"><input type="number" name="quantity[]" id="quantity" class="form-control" placeholder="Masukkan jumlah" value="<?= $item->quantity ?>" required></td>
                                        </tr>
                                        <?php $i++; ?>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                                <input type="button" class='btn-add-row' onclick="add_row();" value="Tambah">
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


<script type="text/javascript">
    $(document).keypress(function (e) {
        if (e.which == 13) {
            e.preventDefault();
        }
    });

    function add_row()
    {
        $rowno = $("#table-plan tr").length;
        $rowno = $rowno+1;
        $("#table-plan tr:last").after("<tr id='row"+$rowno+"'><td><select class='form-control' name='ingredients[]' id='ingredients'><?php foreach ($ingredients as $ing) : ?><?php foreach($units as $unit): ?><?php if($unit['id'] == $ing['unit_id']) { $unit_name = $unit['name'] ; }; ?><?php endforeach; ?><option value='<?= $ing["id"]; ?>'><?= $ing["name"]." (".$unit_name.")" ?></option><?php endforeach; ?></select></td><td id='qty'><input type='number' id='quantity' name='quantity[]' class='form-control' placeholder='1' value='1'></td><td><button class='delete-btn' type='submit' onclick=delete_row('row"+$rowno+"')><span class='glyphicon glyphicon-trash'></span></button></td></tr>");
    }
    function delete_row(rowno)
    {
        $('#'+rowno).remove();
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