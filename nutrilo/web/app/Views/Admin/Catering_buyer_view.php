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
            <span class="nav-menu-item"><a href="/catering">Catering</a></span>
            <i class="glyphicon glyphicon-chevron-right"></i>
            <span class="nav-menu-item"><a href="/catering/batch?batch=<?= $batch->id ?>"><?= $batch->name ?></a></span>
        </div>

        <div class="content">
            <div class="container-fluid">
                <div class="container-member">
                    <h3 class="title">Daftar Pemesan <?= $batch->name ?> </h3><hr>
                    <div class="content">
                        <div class="container-fluid">
                            <a class="btn btn-info btn-add" href="/catering/buyer/add?batch=<?= $batch->id ?>" style="margin-bottom:8px;float:right;">Tambah Data</a>
                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nama</th>
                                        <th>Nomor HP</th>
                                        <th>Alamat</th>
                                        <th>Paket Yang Dipesan</th>
                                        <th>Jumlah</th>
                                        <th>Kebutuhan Nutrisi</th>
                                        <th>Catatan</th>
                                        <th>Catatan Driver</th>
                                        <th>Mulai Berlangganan</th>
                                        <th>Hari Ke-</th>
                                        <th>Selesai Berlangganan</th>
                                        <th>Hari Ke-</th>
                                        <th>Tujuan Transfer</th>
                                        <th>Jumlah Transfer</th>
                                        <th>Tanggal Transfer</th>
                                        <th>Aktif/Tidak Aktif</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($buyerList as $buyer): ?>
                                    <tr>
                                    <?php foreach($package as $row): ?>
                                        <?php if($row['id'] == $buyer->order_package_id) { $package_name = $row['name'] ; } ?>
                                        <?php endforeach; ?>
                                        <?php foreach($allBatch as $rowBatch): ?>
                                        <?php if($rowBatch['id'] == $buyer->batch_start_id) { $batch_start = $rowBatch['name'] ; }; ?>
                                        <?php if($rowBatch['id'] == $buyer->batch_end_id) { $batch_end = $rowBatch['name'] ; }; ?>
                                        <?php endforeach; ?>
                                        <?php foreach($days as $day): ?>
                                        <?php if($day['id'] == $buyer->day_start) { $day_start = $day['name'] ; }; ?>
                                        <?php if($day['id'] == $buyer->day_end) { $day_end = $day['name'] ; }; ?>
                                        <?php endforeach; ?>
                                        <?php foreach($payments as $payment): ?>
                                        <?php if($payment['id'] == $buyer->payment_to) { $payment_to = $payment['name'] ; }; ?>
                                        <?php endforeach; ?>
                                        
                                        <td><?= $buyer->id ?></td>
                                        <td><?= $buyer->name ?></td>
                                        <td><?= $buyer->phone ?></td>
                                        <td><?= $buyer->address ?></td>
                                        <td><?= $package_name ?></td>
                                        <td><?= $buyer->quantity ?></td>
                                        <td><?= $buyer->nutritional_needs ?></td>
                                        <td><?= $buyer->notes ?></td>
                                        <td><?= $buyer->driver_notes ?></td>
                                        <td><?= $batch_start ?></td>
                                        <td><?= $day_start ?></td>
                                        <td><?= $batch_end ?></td>
                                        <td><?= $day_end ?></td>
                                        <td><?= $payment_to ?></td>
                                        <td><?= $buyer->payment_amount ?></td>
                                        <td><?= $buyer->payment_date ?></td>
                                        <td>
                                            <label class="switch">
                                                <?php if ($buyer->is_active == true) { ?>
                                                    <input type="checkbox" id="checkbox" class="checkbox<?= $buyer->id ?>" checked>
                                                <?php } else { ?>
                                                    <input type="checkbox" id="checkbox" class="checkbox<?= $buyer->id ?>">
                                                <?php }; ?>
                                                <span class="slider round"></span>
                                            </label>
                                        </td>
                                        <td>
                                        <a href="javascript:;"
                                            data-name="<?= $buyer->name; ?>"
                                            data-phone="<?= $buyer->phone; ?>"
                                            data-address="<?= $buyer->address; ?>"
                                            data-latlong="<?= $buyer->latlong; ?>"
                                            data-package-name="<?= $package_name; ?>"
                                            data-quantity="<?= $buyer->quantity; ?>"
                                            data-payment-to="<?= $payment_to; ?>"
                                            data-payment-amount="<?= $buyer->payment_amount; ?>"
                                            data-payment-date="<?= $buyer->payment_date; ?>"
                                            data-batch-start="<?= $batch_start; ?>"
                                            data-day-start="<?= $day_start; ?>"
                                            data-batch-end="<?= $batch_end; ?>"
                                            data-day-end="<?= $day_end; ?>"
                                            data-nutrition="<?= $buyer->nutritional_needs; ?>"
                                            data-notes="<?= $buyer->notes; ?>"
                                            data-driver-notes="<?= $buyer->driver_notes; ?>"
                                            data-toggle="modal" data-target="#show-data">
                                            <button  data-toggle="modal" data-target="#tampilkan-data" class="btn btn-info">Info</button>
                                        </a>
                                        <a href="/catering/buyer-edit?id=<?= $buyer->id ?>" class="btn btn-edit">Edit</a>
                                        <a href="/catering/buyer-delete?id=<?= $buyer->id ?>&batch=<?= $batch->id ?>" class="btn btn-delete" onclick="return confirm('Apakah anda yakin ingin menghapus data ini?')">Delete</a>
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


<!-- Modal SHOW DATA -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="show-data" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">Data Lengkap</h4>
            </div>
            <div class="modal-body">
                <table class="table">
                    <tbody>
                        <tr>
                            <td class="text-left">Nama</td>
                            <td class="text-left"><b><div class="name"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Nomor HP</td>
                            <td class="text-left"><b><div class="phone"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Alamat</td>
                            <td class="text-left"><b><div class="address"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Latitude & Longitude</td>
                            <td class="text-left"><b><div class="latlong"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Paket Yang Dipesan</td>
                            <td class="text-left"><b><div class="package-name"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Jumlah</td>
                            <td class="text-left"><b><div class="quantity"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Tujuan Transfer</td>
                            <td class="text-left"><b><div class="payment-to"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Jumlah Transfer</td>
                            <td class="text-left"><b><div class="payment-amount"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Tanggal Transfer</td>
                            <td class="text-left"><b><div class="payment-date"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Mulai Berlangganan</td>
                            <td class="text-left"><b><div class="batch-start"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Hari Ke-</td>
                            <td class="text-left"><b><div class="day-start"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Selesai Berlangganan</td>
                            <td class="text-left"><b><div class="batch-end"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Hari Ke-</td>
                            <td class="text-left"><b><div class="day-end"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Kebutuhan Nutrisi</td>
                            <td class="text-left"><b><div class="nutrition"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Catatan</td>
                            <td class="text-left"><b><div class="notes"></div></b></td>
                        </tr>
                        <tr>
                            <td class="text-left">Catatan Untuk Driver</td>
                            <td class="text-left"><b><div class="driver-notes"></div></b></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!-- END Modal SHOW DATA -->


<script type="text/javascript">

    $("input[type=checkbox]").on('change', function () {
        var self = $(this);
        var classname = self.attr('class');
        var numb = classname.match(/\d/g);
        id = numb.join("");
        if (self.is(":checked")) {
            setTimeout(function(){
                $.ajax({
                    type: 'POST',
                    url:"<?=  base_url(); ?>/active-buyer/"+id,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success:function(response)
                    {
                        console.log(id+" is active")
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            }, 1000);
        } else {
            setTimeout(function(){
                $.ajax({
                    type: 'POST',
                    url:"<?=  base_url(); ?>/inactive-buyer/"+id,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success:function(response)
                    {
                        console.log(id+" is inactive")
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            }, 1000);
        }
    });
</script>


