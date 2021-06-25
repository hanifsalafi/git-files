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
        </div>

        <div class="content">
            <div class="container-fluid">
                <div class="container-member">
                    <h3 class="title">Daftar Belanja</h3><hr>
                    <div class="content">
                        <div class="container-fluid">
                        <!-- <a href="#" class="notification">
                            <span>Daftar Yang Belum Dibelanjakan</span>
                            <span class="badge"><?= count($unrealized_plan) ?></span>
                        </a> -->
                        <?php if (count($unrealized_plan) != 0) { ?>
                            <button type="button" class="btn btn-info notification" data-toggle="collapse" data-target="#demo"><span>Daftar Yang Belum Dibelanjakan</span><span class="badge"><?= count($unrealized_plan) ?></span></button>
                        <?php } ?>
                        <div id="demo" class="collapse">
                            <table id="example2" class="table" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nama</th>
                                        <th>Tanggal</th>
                                        <th>Daftar Belanja</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($unrealized_plan as $plan):?>
                                    <tr>
                                        <?php $item_list = "";
                                        foreach ($unrealized_plan_item as $plan_item):
                                        $lastData = end($unrealized_plan_item);
                                            if ($plan_item->shopping_plan_id == $plan->id) {
                                                foreach ($ingredients as $ing):
                                                    if ($plan_item->ingredient_id == $ing['id']) {
                                                        foreach ($units as $unit):
                                                            if ($ing['unit_id'] == $unit['id']) {
                                                                if ($plan_item == $lastData) {
                                                                    $item_list .= $ing['name']."(".$plan_item->quantity.$unit['name'].")";
                                                                } else {
                                                                    $item_list .= $ing['name']."(".$plan_item->quantity.$unit['name']."), ";
                                                                }
                                        }; endforeach; }; endforeach; }; endforeach; ?>
                                        <td><?= $plan->id ?></td>
                                        <td><?= $plan->name ?></td>
                                        <td><?= $plan->shopping_date ?></td>
                                        <td><?= $item_list ?></td>
                                        <td>
                                            <a href="/shopping/data/add-plan?id=<?= $plan->id ?>" class="btn btn-edit"><span class="glyphicon glyphicon-shopping-cart"></span></a>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>
                                </tbody>
                            </table>
                        </div>
                        <a class="btn btn-info btn-add" href="/shopping/data/add" style="margin-bottom:8px;float:right;">Tambah Data</a>
                            <table id="example" class="table table-striped table-bordered table-shopping-plan" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Kode</th>
                                        <th>Nama</th>
                                        <th>Tanggal</th>
                                        <th>Tempat</th>
                                        <th>Total</th>
                                        <th class="action">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($shopping_list as $list): ?>
                                    <tr>
                                        <td><?= $list['id'] ?></td>
                                        <td><?= $list['number_reference'] ?></td>
                                        <td><?= $list['name'] ?></td>
                                        <td><?= $list['shopping_date'] ?></td>
                                        <td><?= $list['shopping_place'] ?></td>
                                        <td><?php echo number_format($list['total_costs'],0,',','.'); ?></td>
                                        <td class="action">
                                        <button  data-toggle="modal" data-target="#tampilkan-data" class="btn btn-info" onclick="showList(<?= $list['id'] ?>,<?= $list['total_costs'] ?>)" ><span class="glyphicon glyphicon-list-alt"></span></button>
                                        <a href="/shopping/data/edit?id=<?= $list['id'] ?>" class="btn btn-edit"><span class="glyphicon glyphicon-pencil"></span></a>
                                        <a href="/shopping/data/delete?id=<?= $list['id'] ?>" class="btn btn-delete"><span class="glyphicon glyphicon-trash"></span></a>
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

<!-- Modal View -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="show-list" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">List Belanja</h4>
            </div>
            <div class="modal-body">
                <table class="table table-bordered" id="table-list">
                    <thead></thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- END Modal View -->


<script type="text/javascript">
    function showList(listId, totalCosts) {
        var listItem = [];
        
        <?php foreach ($shopping_list_item as $item):?>
        if (listId == <?= $item['shopping_list_id'] ?>) {
            var quantity = Number(<?= $item['quantity'] ?>);
            var unit_price = Number(<?= $item['unit_price'] ?>);
            var total_price = Number(<?= $item['total_price'] ?>);
            <?php foreach ($ingredients as $ing):?> 
            if (<?= $item['ingredient_id'] ?> == <?= $ing['id'] ?>) {
                var ing_name = "<?= $ing['name'] ?>";
                var ing_unit_id = "<?= $ing['unit_id'] ?>";
                var ing_price = "<?= $ing['purchase_price'] ?>";
                var units = <?= json_encode($units); ?>;
                for (let i = 0; i < units.length; i++) {
                    const unit_id = units[i]['id'];
                    if (ing_unit_id == unit_id) {
                        var unit_name = units[i]['name'];
                        listItem.push([ing_name, unit_name, quantity, unit_price, total_price]);
                    }
                }
            };
            <?php endforeach; ?>
        };
        <?php endforeach; ?>
            
        $('#show-list').modal('show');
        
        $('#table-list tbody tr').remove();
        $('#table-list thead th').remove();

        $('#table-list thead').append("<th class='text-center'>Nama Bahan</th>");
        $('#table-list thead').append("<th class='text-center'>Satuan</th>");
        $('#table-list thead').append("<th class='text-center'>Jumlah</th>");
        $('#table-list thead').append("<th class='text-center'>Harga Satuan</th>");
        $('#table-list thead').append("<th class='text-center'>Harga Total</th>");

        var table = $('#table-list tbody');
        var row, cell;
        for(var i = 0; i < listItem.length; i++){
            row = $( '<tr>' );
            table.append(row);
            for(var j=0; j < listItem[i].length; j++){
                cell = $('<td>'+ listItem[i][j] + '</td>')
                row.append(cell);
            }
            row = $( '</tr>' );
            table.append(row);
        }

        var totalString =  totalCosts.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
        $('#table-list tbody tr:last-child').after('<tr><td colspan="4" class="total"><b>Total Biaya Belanja</b></td><td><b>'+totalString+'</b></td></tr>');

    }

</script>
