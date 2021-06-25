<div class="main-panel">
    <nav class="navbar navbar-default navbar-fixed">
        <div class="container-fluid">
            <div class="page-header">
                <a class="navbar-brand pull-left" href="/">
                    <img class="logo-brand" src="<?php echo base_url('img/logo_nutrilo.png'); ?>" alt="">
                </a>
                <a class="navbar-logout pull-right" href="/logout">
                    <img class="logo-logout" src="<?php echo base_url('img/sign-out.svg'); ?>" alt="">    
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
            <div class="container-order">
                <h3 class="title">Daftar Pesanan <?= $batch->name ?></h3><hr>
                <div class="order-table">
                    <?php foreach($days as $day):?>
                    <div class="header-table"><h3 class="header-mon"><?= $day['name'] ?></h3></div>
                    <div class="row">
                        <div class="col-md-6">
                            <div>
                                <div class="caption-title lunch-title">
                                    <h3>Lunch</h3>
                                </div>
                                <div class="caption-button">
                                    <a 
                                        href="javascript:;"
                                        data-batch-id="<?= $batch->id; ?>"
                                        data-time-order="1"
                                        data-day-id="<?= $day['id']; ?>"
                                        data-toggle="modal" data-target="#add-order-data">
                                        <button  data-toggle="modal" data-target="#tambah-data" class="btn btn-info">Tambah</button>
                                    </a>
                                    <a href="/catering/print-order?batch=<?= $batch->id; ?>&day=<?= $day['id']; ?>&time=1" target="_blank" class="btn btn-warning">Print</a>
                                    <a href="/catering/driver?batch=<?= $batch->id; ?>&day=<?= $day['id']; ?>&time=1" target="_blank" class="btn btn-success">Driver</a>
                                </div>
                            </div>
                            <div class="table-wrapper">
                                <table id="thetable">
                                    <thead>
                                        <tr>
                                            <th>Nama</th>
                                            <th>HP</th>
                                            <th>Alamat</th>
                                            <th>Pesanan</th>
                                            <th class="action">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach($orders as $row):?>
                                        <?php if ($row->day_id == $day['id'] && $row->time_order == 1) {  ?>
                                   
                                        <tr>
                                            <td><?= $row->name; ?></td>
                                            <td><?= $row->phone; ?></td>
                                            <td><?= $row->address;?></td>
                                            <td>
                                            <?php $foodid= 0; $foodname = ""; $quantity = 0; ?>
                                            <?php foreach ($items as $item): 
                                                    if ($item->order_detail_id == $row->id) {
                                                    $foodid = $item->id;
                                                    $foodname = $item->food_name;
                                                    $foodmenu_id = $item->menu_id;
                                                    $quantity = $item->quantity;
                                                    echo "<b>(". $quantity .")</b>". $foodname ;
                                                    break;
                                                    }
                                                endforeach; ?>
                                            </td>
                                            <td style="text-align:center;" class="action"><a 
                                                    href="javascript:;"
                                                    data-order-id="<?= $row->id; ?>"
                                                    data-batch-id="<?= $batch->id; ?>"
                                                    data-address="<?= $row->address; ?>"
                                                    data-phone="<?= $row->phone; ?>"
                                                    data-latlong="<?= $row->latlong; ?>"
                                                    data-buyer-id="<?= $row->buyer_id; ?>"
                                                    data-food-id="<?= $foodid; ?>"
                                                    data-food-name="<?= $foodname; ?>"
                                                    data-menu-id="<?= $foodmenu_id; ?>"
                                                    data-quantity="<?= $quantity; ?>"
                                                    data-notes="<?= $row->notes; ?>"
                                                    data-driver-notes="<?= $row->driver_notes; ?>"
                                                    data-toggle="modal" data-target="#edit-order-data">
                                                    <button  data-toggle="modal" data-target="#ubah-data" class="btn btn-edit">Edit</button>
                                                </a>
                                                <a href="/catering/order/delete/<?= $batch->id ?>/<?= $row->id ?>" class="btn btn-delete" onclick="return confirm('Apakah anda yakin ingin menghapus data ini?')">Hapus</a></span></a></td>
                                        </tr>
                                        <?php } ?>
                                    <?php endforeach;?>
                                    </tbody>
                                    
                                </table>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div>
                                <div class="caption-title dinner-title">
                                    <h3>Dinner</h3>
                                </div>
                                <div class="caption-button">
                                    <a href="javascript:;"
                                        data-batch-id="<?= $batch->id; ?>"
                                        data-time-order="2"
                                        data-day-id="<?= $day['id']; ?>"
                                        data-toggle="modal" data-target="#add-order-data">
                                        <button  data-toggle="modal" data-target="#tambah-data" class="btn btn-info">Tambah</button>
                                    </a>
                                    <a href="/catering/print-order?batch=<?= $batch->id; ?>&day=<?= $day['id']; ?>&time=2" target="_blank" class="btn btn-warning">Print</i></a>
                                    <a href="/catering/driver?batch=<?= $batch->id; ?>&day=<?= $day['id']; ?>&time=2" target="_blank" class="btn btn-success">Driver</a>
                                </div>
                            </div>                       
                            <div class="table-wrapper">
                                <table id="thetable">
                                    <thead>
                                        <tr>
                                            <th>Nama</th>
                                            <th>HP</th>
                                            <th>Alamat</th>
                                            <th>Pesanan</th>
                                            <th class="action">Aksi</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach($orders as $row):?>
                                        <?php if ($row->day_id == $day['id'] && $row->time_order == 2) {  ?>
                                        <tr>
                                            <td><?= $row->name; ?></td>
                                            <td><?= $row->phone; ?></td>
                                            <td><?= $row->address;?></td>
                                            <td>
                                            <?php $foodid= 0; $foodname = ""; $quantity = 0; ?>
                                            <?php foreach ($items as $item): 
                                                    if ($item->order_detail_id == $row->id) {
                                                    $foodid = $item->id;
                                                    $foodname = $item->food_name;
                                                    $foodmenu_id = $item->menu_id;
                                                    $quantity = $item->quantity;
                                                    echo "<b>(". $quantity .")</b>". $foodname ;
                                                    break;
                                                    }
                                                endforeach; ?>
                                            </td>
                                            <td style="text-align:center;" class="action">
                                                <a href="javascript:;"
                                                    data-order-id="<?= $row->id; ?>"
                                                    data-batch-id="<?= $batch->id; ?>"
                                                    data-buyer-id="<?= $row->buyer_id; ?>"
                                                    data-address="<?= $row->address; ?>"
                                                    data-phone="<?= $row->phone; ?>"
                                                    data-latlong="<?= $row->latlong; ?>"
                                                    data-food-id="<?= $foodid; ?>"
                                                    data-food-name="<?= $foodname; ?>"
                                                    data-menu-id="<?= $foodmenu_id; ?>"
                                                    data-quantity="<?= $quantity; ?>"
                                                    data-notes="<?= $row->notes; ?>"
                                                    data-driver-notes="<?= $row->driver_notes; ?>"
                                                    data-toggle="modal" data-target="#edit-order-data">
                                                    <button  data-toggle="modal" data-target="#ubah-data" class="btn btn-edit">Edit</button>
                                                </a>
                                                <a href="/catering/order/delete/<?= $batch->id ?>/<?= $row->id ?>" class="btn btn-delete" onclick="return confirm('Apakah anda yakin ingin menghapus data ini?')">Hapus</a></span></a>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                        <?php endforeach;?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <?php endforeach;?>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Modal Tambah -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="add-order-data" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">Info Lengkap</h4>
            </div>
            <div class="modal-body">
                <form action="<?php echo site_url('/admin/catering_order/save'); ?>" method="post">
                    <div class="form-group">
                        <input type="hidden" name="batch-id" id="batch-id" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="time-order" id="time-order" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="day-id" id="day-id" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Pemesan<span class="text-danger">*</span></label>
                        <select class="form-control buyer_id" name="buyer_id" id="buyer_id">
                            <option value="">Pilih Pemesan</option>
                            <?php foreach ($buyerList as $buyer) : ?>
                                <option value='<?= $buyer->id; ?>'>
                                    <?= $buyer->name; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div id="editable-data-buyer">
                        <div class="form-group">
                            <label>No. HP<span class="text-danger">*</span></label>
                            <input type="number" name="phone" id="phone" class="form-control" placeholder="Masukkan nomor hp" value="" required>
                        </div>
                        <div class="form-group">
                            <label>Alamat<span class="text-danger">*</span></label>
                            <textarea cols="20" rows="3" name="address" id="address" class="form-control" placeholder="Masukkan alamat lengkap" value=""></textarea>
                        </div>
                        <div class="form-group">
                            <label>Latitude & Longitude</label>
                            <input type="text" name="latlong" id="latlong" class="form-control" placeholder="Masukkan latitude longitude" required>
                        </div>
                        <div class="form-group">
                            <label>Catatan</label>
                            <textarea cols="20" rows="3" name="notes" id="notes" class="form-control" placeholder="Masukkan catatan" value="" ></textarea>
                        </div>
                        <div class="form-group">
                            <label>Catatan Untuk Driver</label>
                            <textarea cols="20" rows="3" name="driver_notes" id="driver_notes" class="form-control" placeholder="Masukkan catatan untuk driver" value="" ></textarea>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label>Makanan Yang Dipesan<span class="text-danger">*</span></label>
                        <select class="form-control" name="menu_id" id="menu_id">
                            <option value="">Pilih Menu</option>
                            <?php foreach ($menus as $menu) : ?>
                                <option value='<?= $menu->id; ?>'>
                                    <?= $menu->name; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Jumlah<span class="text-danger">*</span></label>
                        <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Masukkan jumlah pesanan" value="1" required>
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
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="edit-order-data" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">Info Lengkap</h4>
            </div>
            <div class="modal-body">
                <form action="<?php echo site_url('/admin/catering_order/update'); ?>" method="post">
                    <div class="form-group">
                        <input type="hidden" name="order-id" id="order-id" class="form-control">
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="batch-id" id="batch-id" class="form-control">
                    </div>
                    <!-- <div class="form-group">
                        <input type="hidden" name="buyer-id" id="buyer-id" class="form-control">
                    </div> -->

                    <div class="form-group">
                        <label> Pemesan<span class="text-danger">*</span></label>
                        <select class="form-control buyer_id_edit" name="buyer_id" id="buyer_id">
                            <option value="">Pilih Pemesan</option>
                            <?php foreach ($buyerList as $buyer) : ?>
                            <option value='<?= $buyer->id; ?>'>
                                <?= $buyer->name; ?>
                            </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>No. HP<span class="text-danger">*</span></label>
                        <input type="number" name="phone" id="phone" class="form-control phone_edit" placeholder="Masukkan nomor hp" value="" required>
                    </div>
                    <div class="form-group">
                        <label>Alamat<span class="text-danger">*</span></label>
                        <textarea cols="20" rows="3" name="address" id="address" class="form-control address_edit" placeholder="Masukkan alamat lengkap" value="" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>Latitude & Longitude</label>
                        <textarea cols="20" rows="3" name="latlong" id="latlong" class="form-control latlong_edit" placeholder="Masukkan catatan" value="" ></textarea>
                    </div>
                    <div class="form-group">
                        <label>Catatan</label>
                        <textarea cols="20" rows="3" name="notes" id="notes" class="form-control notes_edit" placeholder="Masukkan catatan" value="" ></textarea>
                    </div>
                    <div class="form-group">
                        <label>Catatan Untuk Driver</label>
                        <textarea cols="20" rows="3" name="driver_notes" id="driver_notes" class="form-control driver_notes_edit" placeholder="Masukkan catatan untuk driver" value="" ></textarea>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="food-id" id="food-id" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Makanan Yang Dipesan<span class="text-danger">*</span></label>
                        <select class="form-control" name="menu_id" id="menu_id">
                            <option value="">Pilih Menu</option>
                            <?php foreach ($menus as $menu) : ?>
                                <option value='<?= $menu->id; ?>'>
                                    <?= $menu->name; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Jumlah<span class="text-danger">*</span></label>
                        <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Masukkan jumlah pesanan" required>
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

    $(document).ready(function() {

        $('#editable-data-buyer').hide();

        $('.buyer_id').on('change', function (e) {
            var optionSelected = $("option:selected", this);
            var valueSelected = this.value;

            if (valueSelected != "") {
                <?php foreach($buyerList as $buyer){ ?>
                if (valueSelected == <?php echo $buyer->id; ?>) {
                    $('#phone').val('<?php echo preg_replace('~[\r\n]+~', '. ',$buyer->phone); ?>');
                    $('#address').val('<?php echo preg_replace('~[\r\n]+~', '. ',$buyer->address); ?>');
                    $('#latlong').val('<?php echo $buyer->latlong; ?>');
                    $('#notes').val('<?php echo preg_replace('~[\r\n]+~', '. ',$buyer->notes); ?>');
                    $('#driver_notes').val('<?php echo preg_replace('~[\r\n]+~', '. ',$buyer->driver_notes); ?>');
                };
                <?php } ?>
                
                $('#editable-data-buyer').show();
            } else {
                $('#editable-data-buyer').hide();
            }
        });

        $('.buyer_id_edit').on('change', function (e) {
            var optionSelected = $("option:selected", this);
            var valueSelected = this.value;

            <?php foreach($buyerList as $buyer){ ?>
            if (valueSelected == <?php echo $buyer->id; ?>) {
                $('#notes').val('<?php echo $buyer->edited_notes; ?>');

                <?php if ($buyer->edited_phone == "") { ?>
                    $('.phone_edit').val('<?php echo preg_replace('~[\r\n]+~', '. ',$buyer->phone); ?>');
                <?php } else { ?>
                    $('.phone_edit').val('<?php echo preg_replace('~[\r\n]+~', '. ',$buyer->edited_phone); ?>');
                <?php } ?>

                <?php if ($buyer->edited_address == "") { ?>
                    $('.address_edit').val('<?php echo preg_replace('~[\r\n]+~', '. ',$buyer->address); ?>');
                <?php } else { ?>
                    $('.address_edit').val('<?php echo preg_replace('~[\r\n]+~', '. ',$buyer->edited_address); ?>');
                <?php } ?>

                <?php if ($buyer->edited_latlong == "") { ?>
                    $('.latlong_edit').val('<?php echo $buyer->latlong; ?>');
                <?php } else { ?>
                $('.latlong_edit').val('<?php echo $buyer->edited_latlong; ?>');
                <?php } ?>

                <?php if ($buyer->edited_notes == "") { ?>
                    $('.notes_edit').val('<?php echo preg_replace('~[\r\n]+~', '. ', $buyer->notes); ?>');
                <?php } else { ?>
                    $('.notes_edit').val('<?php echo preg_replace('~[\r\n]+~', '. ', $buyer->edited_notes); ?>');
                <?php } ?>

                <?php if ($buyer->edited_driver_notes == "") { ?>
                    $('.driver_notes_edit').val('<?php echo preg_replace('~[\r\n]+~', '. ', $buyer->driver_notes); ?>');
                <?php } else { ?>
                    $('.driver_notes_edit').val('<?php echo preg_replace('~[\r\n]+~', '. ', $buyer->edited_driver_notes); ?>');
                <?php } ?>

            };
            <?php } ?>
        });

        $('#edit-order-data').on('show.bs.modal', function (event) {
            var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
            var modal          = $(this)
        
            modal.find('#order-id').val(div.data('orderId'));
            modal.find('#batch-id').val(div.data('batchId'));
            modal.find('#phone').val(div.data('phone'));
            modal.find('#address').val(div.data('address'));
            modal.find('#latlong').val(div.data('latlong'));
            modal.find('#food-id').val(div.data('foodId'));
            modal.find('#food-name').val(div.data('foodIame'));
            modal.find('#menu_id').val(div.data('menuId'));
            modal.find('#quantity').val(div.data('quantity'));
            modal.find('#notes').val(div.data('notes'));
            modal.find('#driver_notes').val(div.data('driverNotes'));
            

            modal.find("#buyer_id").val(div.data('buyerId')).change();
        });
        
    });
</script>


<script type="text/javascript">
    $(document).ready(function(){
        $('.click').click(function(){
            $('.popup_box').css("display", "block");
        });
        $('.btn1').click(function(){
            $('.popup_box').css("display", "none");
        });
        $('.btn2').click(function(){
          $('.popup_box').css("display", "none");
          alert("Account Permanently Deleted.");
        });
    });

</script>
