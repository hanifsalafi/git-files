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
            <span class="nav-menu-item"><a href="/catering/buyer?batch=<?= $batch->id ?>"><?= $batch->name ?></a></span>
        </div>


        <div class="content">
            <div class="container-fluid">
                <div class="container-member">
                    <h3 class="title"><?= $title ?> Data</h3><hr>
                    <?php if ($title == 'Edit') { ?>
                        <form action="<?php echo site_url('/admin/catering_buyer/update'); ?>" method="post">
                    <?php } else { ?>
                        <form action="<?php echo site_url('/admin/catering_buyer/save'); ?>" method="post">
                    <?php } ?>
                        <div class="form-group">
                            <input type="hidden" name="buyer_id" id="buyer_id" value="<?= $buyer->id; ?>" class="form-control">
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="batch_id" id="batch_id" value="<?= $batch->id; ?>" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Nama<span class="text-danger">*</span></label>
                            <input type="text" name="name" id="name" class="form-control" placeholder="Masukkan nama" value="<?= $buyer->name; ?>" required>
                            <ul class="search-dropdown" id="search-dropdown"></ul>
                        </div>
                        <div class="form-group">
                            <label>Nomor HP<span class="text-danger">*</span></label>
                            <input type="number" name="phone" id="phone" class="form-control" placeholder="Masukkan nomor HP" value="<?= $buyer->phone; ?>" required>
                        </div>
                        <div class="form-group">
                            <label>Alamat (Default)<span class="text-danger">*</span></label>
                            <textarea cols="20" rows="3" name="address" id="address" class="form-control" placeholder="Masukkan alamat lengkap" onchange="cleanInput()" value="<?= $buyer->address; ?>" ><?= $buyer->address; ?></textarea>
                        </div>
                        <div class="form-group">
                            <label>Longitude & Latitude<span class="text-danger">*</span></label>
                            <input type="text" name="latlong" id="latlong" class="form-control" placeholder="Masukkan langitude & longitude" value="<?= $buyer->latlong; ?>" required>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label>Paket Yang Dipesan<span class="text-danger">*</span></label>
                                    <select class="form-control" name="order_package" id="order_package">
                                        <?php foreach ($packages as $package) : ?>
                                            <?php if ($buyer->order_package_id == $package['id']) { ?>
                                                <option value='<?= $package["id"]; ?>' selected>
                                                    <?= $package["name"]; ?>
                                                </option>
                                            <?php } else { ?>
                                                <option value='<?= $package["id"]; ?>'>
                                                    <?= $package["name"]; ?>
                                                </option>
                                            <?php } ?>
                                            <?php ?>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-xs-6">
                                    <label>Jumlah<span class="text-danger">*</span></label>
                                    <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Masukkan jumlah pesanan" value="<?= $buyer->quantity; ?>" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label>Tujuan Transfer<span class="text-danger">*</span></label>
                                    <select class="form-control" name="payment_to" id="payment_to">
                                        <?php foreach ($payments as $payment) : ?>
                                            <?php if ($buyer->payment_to == $payment['id']) { ?>
                                                <option value='<?= $payment["id"]; ?>' selected>
                                                    <?= $payment["name"]; ?>
                                                </option>
                                            <?php } else { ?>
                                                <option value='<?= $payment["id"]; ?>'>
                                                    <?= $payment["name"]; ?>
                                                </option>
                                            <?php } ?>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-xs-6">
                                    <label>Jumlah Transfer<span class="text-danger">*</span></label>
                                    <input type="number" name="payment_amount" id="payment_amount" class="form-control" placeholder="Masukkan jumlah transfer" value="<?= $buyer->payment_amount; ?>" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Tanggal Transfer <span>(Kosongkan Jika Belum Lunas)</span></label>
                            <input placeholder="Masukkan tanggal transfer" type="text" class="form-control" id="datepicker" name="payment_date" value="<?= $buyer->payment_date ?>">
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label>Mulai Berlangganan<span class="text-danger">*</span></label>
                                    <select class="form-control" name="batch_start_id" id="batch_start_id">
                                        <?php foreach ($batchs as $batchRow) : ?>
                                            <?php if ($buyer->batch_start_id == $batchRow['id']) { ?>
                                                <option value='<?= $batchRow['id']; ?>' selected>
                                                    <?= $batchRow['name']; ?>
                                                </option>
                                            <?php } else { ?>
                                                <option value='<?= $batchRow['id']; ?>'>
                                                    <?= $batchRow['name']; ?>
                                                </option>
                                            <?php } ?>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-xs-6">
                                    <label>Hari Ke-<span class="text-danger">*</span></label>
                                    <select class="form-control" name="day_start" id="day_start">
                                        <?php for ($i=1; $i < 7; $i++) { ?>
                                            <?php if ($buyer->day_start == $i) { ?>
                                                <option value='<?= $i; ?>' selected>
                                                    <?= $i; ?>
                                                </option>
                                            <?php } else { ?>
                                                <option value='<?= $i; ?>'>
                                                    <?= $i; ?>
                                                </option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <label>Selesai Berlangganan<span class="text-danger">*</span></label>
                                    <select class="form-control" name="batch_end_id" id="batch_end_id">
                                        <?php foreach ($batchs as $batchRow) : ?>
                                            <?php if ($buyer->batch_end_id == $batchRow['id']) { ?>
                                                <option value='<?= $batchRow['id']; ?>' selected>
                                                    <?= $batchRow['name']; ?>
                                                </option>
                                            <?php } else { ?>
                                                <option value='<?= $batchRow['id']; ?>'>
                                                    <?= $batchRow['name']; ?>
                                                </option>
                                            <?php } ?>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="col-xs-6">
                                    <label>Hari Ke-<span class="text-danger">*</span></label>
                                    <select class="form-control" name="day_end" id="day_end">
                                        <?php for ($i=1; $i < 7; $i++) { ?>
                                            <?php if ($buyer->day_end == $i) { ?>
                                                <option value='<?= $i; ?>' selected>
                                                    <?= $i; ?>
                                                </option>
                                            <?php } else { ?>
                                                <option value='<?= $i; ?>'>
                                                    <?= $i; ?>
                                                </option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Kebutuhan Nutrisi</label>
                            <textarea cols="20" rows="3" name="nutrition_need" id="nutrition_need" class="form-control" placeholder="Masukkan kebutuhan nutrisi" onchange="cleanInput()" value="<?= $buyer->nutritional_needs; ?>"><?= $buyer->nutritional_needs; ?></textarea>
                        </div>
                        <div class="form-group">
                            <label>Catatan</label>
                            <textarea cols="20" rows="3" name="notes" id="notes" class="form-control" placeholder="Masukkan catatan" onchange="cleanInput()" value="<?= $buyer->notes; ?>"><?= $buyer->notes; ?></textarea>
                        </div>
                        <div class="form-group">
                            <label>Catatan Untuk Driver</label>
                            <textarea cols="20" rows="3" name="driver_notes" id="driver_notes" class="form-control" placeholder="Masukkan catatan untuk driver" onchange="cleanInput()" value="<?= $buyer->driver_notes; ?>"><?= $buyer->driver_notes; ?></textarea>
                        </div>
                        <div class="form-group">
                            <button type="submit" name="submit" value="submit" id="submit" class="btn btn-primary">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


<script>

    $(document).keypress(function (e) {
        if (e.which == 13) {
            e.preventDefault();
        }
    });

    $('#search-dropdown').css({
        "opacity":"0",
        "visibility": "hidden",
        "padding": "0",
    });

    $('#name').on('input', function() {
        if ($(this).val() != "") {
            $('#search-dropdown').css({
                opacity:1,
                visibility: "visible",
                padding: "10px 30px"
            });
            let keyword = $(this).val();
            setTimeout(function(){
                $.ajax({
                    type: 'GET',
                    url:"<?=  base_url(); ?>/name-search/"+keyword,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success:function(response)
                    {
                        $('.search-dropdown').empty();
                        let data = response['data'];
                        for (let i = 0; i < data.length; i++) {
                            let li = '<li class="single-product-search"><h5><button class="name-suggest" type="button" onclick="add_row('+ data[i]['id']+')" >' + data[i]['name'] +'</button></h5></li>'
                            $('.search-dropdown').append(li);
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            }, 1000);
        } else {
            $('#search-dropdown').css({
                "opacity":"0",
                "visibility": "hidden",
                "padding": "0",
            });
        }
    });


    function add_row(id){
        id = typeof id !== 'undefined' ? id : 0;
        console.log(id);
        if (id != 0) {
            <?php foreach($buyers as $buyer): ?>
            if (id == <?= $buyer['id'] ?>) {
                $('#name').val("<?= $buyer['name'] ?>");
                $('#phone').val("<?= $buyer['phone'] ?>");
                $('#address').val("<?= $buyer['address'] ?>");
                $('#latlong').val("<?= $buyer['latlong'] ?>");
                $('#order_package').val("<?= $buyer['order_package_id'] ?>");
                $('#quantity').val("<?= $buyer['quantity'] ?>");
                $('#payment_to').val("<?= $buyer['payment_to'] ?>");
                $('#payment_amount').val("<?= $buyer['payment_amount'] ?>");
                $('#batch_start_id').val("<?= $buyer['batch_start_id'] ?>");
                $('#day_start').val("<?= $buyer['day_start'] ?>");
                $('#batch_end_id').val("<?= $buyer['batch_end_id'] ?>");
                $('#day_end').val("<?= $buyer['day_end'] ?>");
                $('#nutrition_need').val("<?= $buyer['nutritional_needs'] ?>");
                $('#notes').val("<?= $buyer['notes'] ?>");
                $('#driver_notes').val("<?= $buyer['driver_notes'] ?>");

                $('#search-dropdown').empty()
                $('#search-dropdown').css({
                    "opacity":"0",
                    "visibility": "hidden",
                    "padding": "0",
                });
            }
            <?php endforeach; ?>
        }
        
    }

    function cleanInput(e){
        e = e || window.event;
        var target = e.target || e.srcElement;
        var idname = $(target).attr('id');
        var targetVal = $(target).val();
        var str = targetVal.replace(/[\r\n]/g, '. ').trim();
        $('#'+idname).val(str);
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