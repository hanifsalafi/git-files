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
                    <h3 class="title">Daftar Rencana Belanja</h3><hr>
                    <div class="content">
                        <div class="container-fluid">
                        <a class="btn btn-info btn-add" href="/shopping/plan/add" style="margin-bottom:8px;float:right;">Tambah Data</a>
                            <table id="example" class="table table-striped table-bordered table-shopping-plan" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nama Pembelanja</th>
                                        <th>Tanggal</th>
                                        <th>Status</th>
                                        <th class="action">Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($shopping_plan as $row):?>
                                    <tr>
                                        <td><?= $row['id'] ?></td>
                                        <td><?= $row['name'] ?></td>
                                        <td><?= $row['shopping_date'] ?></td>
                                        <td><?php if ($row['status'] == 1) { echo "Belum dibelanjakan"; } else { echo "Sudah dibelanjakan"; } ?></td>
                                        <td class="action">
                                        <button  data-toggle="modal" data-target="#tampilkan-data" class="btn btn-info" onclick="showList(<?= $row['id'] ?>)" ><span class="glyphicon glyphicon-list-alt"></span></button>
                                        <a href="/shopping/plan/edit?id=<?= $row['id'] ?>" class="btn btn-edit"><span class="glyphicon glyphicon-pencil"></span></a>
                                        <a href="/shopping/plan/delete?id=<?= $row['id'] ?>" class="btn btn-delete"><span class="glyphicon glyphicon-trash"></span></a>
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
                <table class="table table-bordered" id="table-plan">
                    <thead></thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- END Modal View -->


<script type="text/javascript">

    function showList(planId) {
        var planList = [];
        var total = 0;

        <?php foreach ($shopping_plan_list as $item):?>
        if (planId == <?= $item['shopping_plan_id'] ?>) {
            var quantity = Number(<?= $item['quantity'] ?>);
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
                        var subtotal = ing_price*quantity;
                        total += subtotal;
                        planList.push([ing_name, quantity, unit_name, subtotal]);
                    }
                }
            };
            <?php endforeach; ?>
        };
        <?php endforeach; ?>
        
        $('#show-list').modal('show');
        
        $('#table-plan tbody tr').remove();
        $('#table-plan thead th').remove();

        $('#table-plan thead').append("<th class='text-left'>Nama Bahan</th>");
        $('#table-plan thead').append("<th class='text-left'>Jumlah</th>");
        $('#table-plan thead').append("<th class='text-left'>Satuan</th>");
        $('#table-plan thead').append("<th class='text-left'>Harga Total</th>");

        var table = $('#table-plan tbody');
        var row, cell;
        for(var i = 0; i < planList.length; i++){
            row = $( '<tr>' );
            table.append(row);
            for(var j=0; j < planList[i].length; j++){
                cell = $('<td>'+ planList[i][j] + '</td>')
                row.append(cell);
            }
            row = $( '</tr>' );
            table.append(row);
        }

        var totalString =  total.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1.");
        $('#table-plan tbody tr:last-child').after('<tr><td colspan="3" class="total"><b>Perkiraan Biaya Belanja</b></td><td><b>'+totalString+'</b></td></tr>');

    }

</script>
