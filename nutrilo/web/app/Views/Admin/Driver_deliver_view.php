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


        <div class="content">
            <div class="container-fluid">
                <div class="container-driving">
                    <h3 class="title">Pengiriman <?php if ($status == 'setup') { echo "Nutrilo"; } else { echo $delivery->driver_name; } ?></h3><hr>
                    <?php if ($status == 'setup') { ?>
                    <div class="form-inline form-driver">
                        <form action="<?php echo site_url("/admin/driver/startdriving"); ?>" method="POST">
                            <div class="row">
                                <input type="hidden" class="form-control" id="route" name="route" value="<?= $route ?>">
                                <input type="hidden" class="form-control" id="drivingTime" name="drivingTime" value="<?= json_encode($drivingTime) ?>">
                                <div class="col-xs-6 col-lg-2">
                                    <label for="driverName">Nama</label>
                                    <input type="text" class="form-control" id="driverName" name="driverName" placeholder="Nama Driver" required>
                                </div>
                                <div class="col-xs-6 col-lg-2">
                                    <label for="driverPhone">No. HP</label>
                                    <input type="number" class="form-control" id="driverPhone" name="driverPhone" placeholder="Nomor Handphone Driver" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-lg-4">
                                    <label for="btnSubmit"></label>
                                    <button class="btn btn-success btn-start-driving" data-toggle="confirm" data-title="Konfirmasi Pengiriman" data-message="Apakah Anda Sudah Siap Untuk Mengantar Makanan?" data-type="success">Mulai Antar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div>
                        <div id="qrcode"></div>
                    </div>
                    <?php }; ?>
                    <?php $idx = 0; $totalTimePerDriver = 0; $allCoordinate = "3.580994,98.662378"; $route = ""; ?>
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <td><button type="button" class="btn btn-default btn-circle origin"><i class="glyphicon glyphicon-home"></i></button></td>
                                    <td class="text-left"><b>NUTRILO</b></td>
                                    <td>
                                        <?php if ($status == "ontheway") { ?>
                                        <?php if ($delivery->start_delivered == "-") { ?>
                                        <span><button type="submit" class="btn btn-success" onclick="startDelivery()">Mulai Antar</button></span></td>
                                    <?php } else { ?>
                                        <span><button type="submit" class="btn btn-success"><i class="glyphicon glyphicon-ok"></i></button></span>
                                    <?php }; }; ?>
                                </tr>
                                <?php $haveOutRange = false; ?>
                                <?php  foreach ($drivers as $key => $val): ?>
                                    <?php
                                        $allCoordinate .= (string)"/".$val ;
                                        $totalTimePerDriver += (int)$drivingTime[$idx];
                                        $name = $orders[array_search($key, array_column($orders, 'id'))]->name;
                                        $phone = $orders[array_search($key, array_column($orders, 'id'))]->phone;
                                        $phone62 = '62'.substr(trim($phone), 1);
                                        $address = $orders[array_search($key, array_column($orders, 'id'))]->address;
                                        $isOutOfRange = $orders[array_search($key, array_column($orders, 'id'))]->is_out_of_range;
                                        $minute = round($drivingTime[$idx] / 60);
                                        $route .= (string)$key.",";
                                    ?>
                                    <tr>
                                        <td class="travel-time"><button type="button" class="btn btn-default btn-circle time"><i class="glyphicon glyphicon-arrow-down"></i></button></td>
                                        <td colspan="3" class="text-left travel-time">Waktu Tempuh: <?= $minute ?> Menit</td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" class="btn btn-default btn-circle destination"><?= $idx+1 ?></button></td>
                                        <td class="text-left">
                                            <span><b><?= $name ?></b> (<?= $phone ?>). <?= $address ?>
                                                <?php if ($isOutOfRange == true) { $haveOutRange = true; echo '<button type="button" class="btn btn-default btn-warning-point" data-toggle="tooltip" data-placement="right" title="Titik berada diluar jangkauan Nutrilo">!</button>'; } ?></span>
                                                <!-- <button type="button" class="btn btn-default btn-warning-point" data-toggle="tooltip" data-placement="right" title="Titik berada diluar jangkauan Nutrilo">!</button> -->
                                            <span><a href="https://api.whatsapp.com/send?phone=<?= $phone62 ?>" target="_blank">Telpon Customer</a></span></td>
                                        <td class="text-center">
                                            <?php if ($status == 'setup') { ?>
                                                <span><button type="submit" class="btn btn-success" onclick="changeRoute(<?= $key ?>)">Pindah</button></span>
                                            <?php } else { ?>
                                                <?php $point = $deliveryPoint[array_search($key, array_column($deliveryPoint, 'catering_order_detail_id'))]; ?>
                                                <?php $idPoint = $point->id; ?>
                                                <?php $status = $point->status; ?>
                                                <input type="hidden" class="point<?= $idPoint ?> detail<?= $key ?>" id="status<?= $idx ?>" value="<?= $status ?>">
                                                <?php if ($status == true) { ?>
                                                    <span><button type="submit" class="btn btn-success"><i class="glyphicon glyphicon-ok"></i></button></span>
                                                <?php } else { ?>
                                                    <?php if ($idx == count($drivers)-1) { ?>
                                                        <span><button type="submit" class="btn btn-success" onclick="lastFinishDelivery(<?= $idPoint ?>,'<?= $name ?>')">Pesanan Sampai</button></span>
                                                    <?php } else { ?>
                                                        <span><button type="submit" class="btn btn-success" onclick="finishDelivery(<?= $idPoint ?>,'<?= $name ?>')">Pesanan Sampai</button></span>
                                                    <?php } ?>  
                                                <?php } ?>    
                                            <?php } ?>
                                        </td>
                                    </tr>
                                <?php $idx++; endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td><button type="button" class="btn btn-default btn-circle finish"><i class="glyphicon glyphicon-flag"></i></button></td>
                                    <td colspan="3" class="text-left">
                                        <p>Selesai dalam <b><?= round($totalTimePerDriver / 60) ?> menit </b>.</p>
                                        <?php if ($status == 'setup') { ?>
                                            <p>Jarak tempuh <b><?= round($totalDistance / 1000) ?> km</b>, upah bensin <b>Rp. <?= round(round($totalDistance / 1000) * 400 / 1000) * 1000 ?></b>
                                            <?php if ($haveOutRange == true){ echo '+ upah tambahan <b>Rp. 5000</b>'; }; ?></p>
                                        <?php }; ?>
                                        <p>Klik <a href="https://www.google.es/maps/dir/<?= $allCoordinate; ?>" target="_blank">Link Berikut</a> Untuk Semua Rute. </p>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <!-- Modal Select Driver -->
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="change-route" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                    <h4 class="modal-title">Pindah Posisi</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label>Pindah Ke Posisi ?</label>
                            <select class="form-control" name="position_number" id="position_number">
                                <?php for ($i=0; $i < count($drivers); $i++) {  ?>
                                    <option value='<?= $i ?>'>
                                        <?= $i+1 ?>
                                    </option>
                                <?php }; ?>
                            </select>
                        </div>                       
                        <div class="form-group">
                            <button type="button" name="button" id="submit" class="btn btn-primary btn-change-route">Simpan</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- END Modal Tambah -->



<script type="text/javascript">

    var id_selected = 0;

    function changeRoute(id){
        id_selected = id;
        $('#change-route').modal('show');
    }

    $('.btn-change-route').click(function() {
        $('#change-route').modal('hide');
        var position = $('#position_number').val();

        var changeString = "";
        var change = getParameterByName('route');
        
        var splitChange = change.split(",");
        var routeArray = [];
        for (let i = 0; i < splitChange.length; i++) {
            const element = splitChange[i].split("@");
            routeArray.push(element);
        }
        
        function sortFunction(a, b) {
            if (a[1] === b[1]) {
                return 0;
            }
            else {
                return (a[1] < b[1]) ? -1 : 1;
            }
        }

        var oldPosition = 0;
        var changeData = [];
        for (let i = 0; i < routeArray.length; i++) {
            var element = routeArray[i];
            if (Number(element[0]) == id_selected){
                oldPosition = element[1];
                changeData = [String(element[0]), String(position)];
                break;
            }
        }

        routeArray.sort(sortFunction);
        var changeString = "";
        var newRoute = routeArray.slice();
        newRoute.splice(oldPosition, 1);

        Array.prototype.insert = function ( index, item ) {
            this.splice( index, 0, item );
        };

        for (let i = 0; i < newRoute.length; i++) {
            var element = newRoute[i];
            if (Number(element[1]) >= Number(position) && Number(element[1]) < Number(oldPosition)){
                var newPosition = Number(element[1])+1;
                newRoute[i][1] = String(newPosition);
            }

            if (Number(element[1]) <= Number(position) && Number(element[1]) > Number(oldPosition)){
                var newPosition = Number(element[1])-1;
                newRoute[i][1] = String(newPosition);
            }
        }

        newRoute.insert(position, changeData);

        var changeString = "";

        for (let i = 0; i < newRoute.length; i++) {
            const element = newRoute[i];
            changeString += element[0]+'@'+element[1]+',';
        }

        changeString = changeString.slice(0, -1);

        var str = window.location.search;
        str = replaceQueryParam('route', changeString, str);
        window.location = window.location.pathname + str;
    });

    function startDelivery(){
        <?php 
            $firstDeliveryKey = key($drivers);
            $name = $orders[array_search($firstDeliveryKey, array_column($orders, 'id'))]->name;
            $phone = $orders[array_search($firstDeliveryKey, array_column($orders, 'id'))]->phone;
            $minute = floor($drivingTime[0] / 60);
        ?>
        var name = "<?= $name ?>";
        var phone = "<?= $phone ?>";
        var minute = <?= $minute ?>;
        setTimeout(function(){
            $.ajax({
                type: 'POST',
                url:"<?=  base_url(); ?>/send-first-sms/"+name+"/"+phone+"/"+minute+"/<?= $delivery->id ?>",
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success:function(response)
                {
                    alert("Yuk antar pesanan kamu tepat waktu.");
                    console.log(response);
                    location.reload();
                },
                error: function(data){
                    console.log(data);
                }
            });
        }, 1000);
    }

    function finishDelivery(id, name){
        var element = document.getElementsByClassName('point'+id);
        var numb = element[0]['id'].match(/\d/g);
        var position = numb.join("");
        
        if (position > 0 && position < <?= count($drivers)-1 ?>) {
            var before = Number(position)-1;
            element = document.getElementById('status'+before);

            if (element['value'] == 0){
                alert("Selesaikan terlebih dulu pengiriman sebelumnya!!!");
            } else {
                setTimeout(function(){
                    $.ajax({
                        type: 'POST',
                        url:"<?=  base_url(); ?>/finish-delivery/"+id,
                        contentType: "application/json; charset=utf-8",
                        dataType: 'json',
                        success:function(response)
                        {
                            if (confirm("Apakah pesanan "+name+" telah sampai?")) {
                                var after = Number(position)+1;
                                var elementAfter = document.getElementById('status'+after);

                                var classId = elementAfter.className.split(" ")[1].match(/\d/g);
                                var detailId = classId.join("");

                                var custName = "";
                                var custPhone = "";
                                var time = "";

                                <?php  foreach ($drivers as $key => $val): ?>
                                if (detailId == <?= $key ?>) {
                                    custName = "<?= $orders[array_search($key, array_column($orders, 'id'))]->name ?>";
                                    custPhone = "<?= $orders[array_search($key, array_column($orders, 'id'))]->phone ?>";
                                    var drivingTime = <?= json_encode($drivingTime) ?>;
                                    time = Math.round(Number(drivingTime[after]) / 60);
                                }
                                <?php endforeach; ?>

                                console.log(custName+"/"+custPhone+"/"+time);
                                var nameClean = custName.split(" ");
                                $.ajax({
                                    type: 'POST',
                                    url:"<?=  base_url(); ?>/send-sms/"+nameClean[0]+"/"+custPhone+"/"+time,
                                    contentType: "application/json; charset=utf-8",
                                    dataType: 'json',
                                    success:function(response)
                                    {
                                        console.log(response);
                                        location.reload();
                                    },
                                    error: function(data){
                                        console.log(data);
                                    }
                                });
                            }
                        },
                        error: function(data){
                            console.log(data);
                        }
                    });
                }, 1000);
            }
        } else {
            setTimeout(function(){
                $.ajax({
                    type: 'POST',
                    url:"<?=  base_url(); ?>/finish-delivery/"+id,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success:function(response)
                    {
                        if (confirm("Apakah pesanan "+name+" telah sampai?")) {
                            var after = Number(position)+1;
                            var elementAfter = document.getElementById('status'+after);

                            var classId = elementAfter.className.split(" ")[1].match(/\d/g);
                            var detailId = classId.join("");
                            console.log(detailId);

                            var custName = "";
                            var custPhone = "";
                            var time = "";

                            <?php  foreach ($drivers as $key => $val): ?>
                                if (detailId == <?= $key ?>) {
                                    custName = "<?= $orders[array_search($key, array_column($orders, 'id'))]->name ?>";
                                    custPhone = "<?= $orders[array_search($key, array_column($orders, 'id'))]->phone ?>";
                                    var drivingTime = <?= json_encode($drivingTime) ?>;
                                    time = Math.round(Number(drivingTime[after]) / 60);
                                }
                            <?php endforeach; ?>

                            console.log(custName+"/"+custPhone+"/"+time);
                            var nameClean = custName.split(" ");
                            $.ajax({
                                type: 'POST',
                                url:"<?=  base_url(); ?>/send-sms/"+nameClean[0]+"/"+custPhone+"/"+time,
                                contentType: "application/json; charset=utf-8",
                                dataType: 'json',
                                success:function(response)
                                {
                                    console.log(response);
                                    location.reload();
                                },
                                error: function(data){
                                    console.log(data);
                                }
                            });
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            }, 1000);
        }
    }

    function lastFinishDelivery(id, name){
        var element = document.getElementsByClassName('point'+id);
        var numb = element[0]['id'].match(/\d/g);
        var position = numb.join("");
        
        var before = Number(position)-1;
        element = document.getElementById('status'+before);

        if (element['value'] == 0){
            alert("Selesaikan terlebih dulu pengiriman sebelumnya!!!");
        } else {
            setTimeout(function(){
                $.ajax({
                    type: 'POST',
                    url:"<?=  base_url(); ?>/last-finish-delivery/"+id,
                    contentType: "application/json; charset=utf-8",
                    dataType: 'json',
                    success:function(response)
                    {
                        if (confirm("Apakah pesanan "+name+" telah sampai?")) {
                            location.reload();
                        }
                    },
                    error: function(data){
                        console.log(data);
                    }
                });
            }, 1000);
        }
    }

    function replaceQueryParam(param, newval, search) {
        var regex = new RegExp("([?;&])" + param + "[^&;]*[;&]?");
        var query = search.replace(regex, "$1").replace(/&$/, '');

        return (query.length > 2 ? query + "&" : "?") + (newval ? param + "=" + newval : '');
    }

    function getParameterByName(name, url = window.location.href) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }

    function startDriving() {
        var name = $("#driverName").val();
        var phone = $("#driverPhone").val();
    
        alert()
    }


</script>

<script type="text/javascript">
 $(document).ready(function() {
    $('#qrcode canvas').remove();
        $('#qrcode').qrcode({
            render: 'canvas',
            text: window.location.href
    });

    $('[data-toggle="tooltip"]').tooltip();

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