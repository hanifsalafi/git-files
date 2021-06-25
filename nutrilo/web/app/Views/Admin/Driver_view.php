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
                <div class="container-report">
                    <h3 class="title">Pengiriman <?= $timeName ?> (<?= $day->name ?>)</h3><hr>
                    <!-- <button class="btn-success update-driver-btn" >Pesan Driver</button> -->
                    <a href="/driver/driver-order?batch=<?= $batchId ?>&day=<?= $dayId ?>&time=<?= $timeId ?>" class="btn-success update-driver-btn" target="_blank" >Pesan Driver</a>
                    

                    <button class="accordion">Daftar Rute</button>
                    <div class="panel panel-driver">
                    <?php $idx = 0; $totalTimePerDriver = 0; $allCoordinate = "3.580994,98.662378"; $route = ""; ?>
                        <table class="table table-striped">
                            <tbody>
                                <tr>
                                    <td><button type="button" class="btn btn-default btn-circle origin"><i class="glyphicon glyphicon-home"></i></button></td>
                                    <td colspan="2" class="text-left"><b>NUTRILO</b></td>
                                </tr>
                                <?php foreach ($drivers[0] as $key => $val) { ?>
                                    <?php 
                                        $allCoordinate .= (string)"/".$val ;
                                        $totalTimePerDriver += (int)$drivingTime[0][$idx];
                                        $name = $orders[array_search($key, array_column($orders, 'id'))]->name;
                                        $phone = $orders[array_search($key, array_column($orders, 'id'))]->phone;
                                        $phone62 = '62'.substr(trim($phone), 1);
                                        $address = $orders[array_search($key, array_column($orders, 'id'))]->address;
                                        $minute = round($drivingTime[0][$idx] / 60);
                                        $route .= (string)$key."@".$idx.",";
                                    ?>
                                    <tr>
                                        <td class="travel-time"><button type="button" class="btn btn-default btn-circle time"><i class="glyphicon glyphicon-arrow-down"></i></button></td>
                                        <td colspan="2" class="text-left travel-time">Waktu Tempuh: <?= $minute ?> Menit</td>
                                    </tr>
                                    <tr>
                                        <td><button type="button" class="btn btn-default btn-circle destination"><?= $idx+1 ?></button></td>
                                        <td class="text-left">
                                            <span><b><?= $name ?></b> (<?= $phone ?>). <?= $address ?></span>
                                            <span><a href="https://api.whatsapp.com/send?phone=<?= $phone62 ?>" target="_blank">Telpon Customer</a></span>
                                        </td>

                                        <!-- <td><span><a href="http://www.google.com/maps/place/<?= $val; ?>" target="_blank">Link Maps</a></span></td> -->
                                        
                                    </tr>
                                <?php $idx++; }; ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td><button type="button" class="btn btn-default btn-circle finish"><i class="glyphicon glyphicon-flag"></i></button></td>
                                    <td colspan="3" class="text-left">
                                        <b><span>Selesai dalam <?= round($totalTimePerDriver / 60) ?> menit.</span>
                                        <span class="link-maps">Klik <a href="https://www.google.es/maps/dir/<?= $allCoordinate; ?>" target="_blank">Link Berikut</a> Untuk Semua Rute. </span>
                                        <!-- <a class="start-deliver-btn" href="/delivery?route=<?= substr_replace($route , "", -1) ?>" target="_blank">Antar Pesanan</a> -->
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    <button class="accordion">Daftar Pengiriman</button>
                    <div class="panel panel-driver">
                        <table class="table table-striped">
                            <tbody>
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript">

    var id_selected = 0;
    var driverChange = [];
    var destinationOut = [];

    $(document).ready(function() {

        function checkLimitChange(change, driverDest){

            if (change != null) {
                var driver = $('#driverLimit').val();
                var splitChange = change.split(",");
                var changeString = "";
                var changeArr = [];
                for(var i = 0; i < driver; i++) {
                    changeArr.push([]);
                };
                for (let i = 0; i < splitChange.length; i++) {
                    var element = splitChange[i];
                    var elementClean = element.split("@");
                    for (let j = 0; j < driver; j++) {
                        if (elementClean[1] == j && elementClean.length == 2){
                            changeArr[j].push(elementClean);
                        }
                    }
                };
                if (changeArr[driverDest].length == <?= $deliveryLimit ?>){
                    return true;
                } else {
                    return false;
                };
            }
            return false;
        };
        
        $('.btn-change-driver').click(function() {
            $('#change-driver').modal('hide');
            var driver = $('#driver_number').val();

            var changeString = "";
            var change = getParameterByName('change');

            // var isFull = checkLimitChange(change, driver);

            // if (isFull){
            //     var driverInt = parseInt(driver)+1;
            //     alert("Driver Ke-"+(driverInt)+" sudah penuh!!! Pindahkan ke driver lain atau keluarkan sebagian dari Driver Ke-"+(driverInt)+".");
            // } else {
            if (change == null) {
                changeString = id_selected+'@'+driver;
            } else {
                if (!change.includes(id_selected)) {
                    changeString = change+','+id_selected+'@'+driver;
                } else {
                    var splitChange = change.split(",");
                    var changeString = "";
                    for (let i = 0; i < splitChange.length; i++) {
                        var element = splitChange[i];
                        if (element.includes(id_selected)){
                            element = id_selected+'@'+driver;
                        } 
                        if (i == splitChange.length-1){
                            changeString += element;
                        } else {
                            changeString += element+',';
                        }
                    }
                }
            }

            var str = window.location.search;
            str = replaceQueryParam('change', changeString, str);
            window.location = window.location.pathname + str;
        });
        
    });
    
    // function changeDriver(id){
    //     id_selected = id;
    //     $('#change-driver').modal('show');
    // }

    function changeDriver(id, old_driver){
        var new_driver = $('.select_driver'+id).val();

        if (new_driver == <?= $driverLimit ?>){
            destinationOut.push(id);
        } else {
            if (Number(old_driver) != Number(new_driver)){
                driverChange.push(id+'@'+new_driver);
            }
        }
    };

    
    // BUTUH TOMBOL BUTTON SIMPAN UNTUK PERUBAHAN POSISI
    $('.update-driver-btn').click(function() {
        var changeString = "";
        var change = getParameterByName('change');

        if (change == null) {
            for (let i = 0; i < driverChange.length; i++) {
                var element = driverChange[i];
                changeString += element+',';
            }
        } else {
            var splitChange = change.split(",");
            for (let i = 0; i < driverChange.length; i++) {
                var element = driverChange[i];
                changeString += element+',';
            }

            for (let i = 0; i < splitChange.length; i++) {
                var idElement = splitChange[i].split('@');
            
                if (destinationOut.includes(Number(idElement[0])) == false){
                    if (changeString.includes(idElement[0]) == false) {
                        changeString += splitChange[i]+',';
                    }   
                }
            }
        }
        changeString = changeString.slice(0, -1);

        var outString = "";
        for (let i = 0; i < destinationOut.length; i++) {
            var element = destinationOut[i];
            outString += element+',';
        }
        outString = outString.slice(0, -1);

        var str = window.location.search
        str = replaceQueryParam('change', changeString, str)
        str = replaceQueryParam('out', outString, str)
        window.location = window.location.pathname + str
    });

    function changeTimeAndDriverLimit() {
        var time = $("#timeLimit").val();
        var driver = $("#driverLimit").val();

        var str = window.location.search
        str = replaceQueryParam('limit', time, str)
        str = replaceQueryParam('driver', driver, str)
        window.location = window.location.pathname + str;
    };

    function replaceQueryParam(param, newval, search) {
        var regex = new RegExp("([?;&])" + param + "[^&;]*[;&]?");
        var query = search.replace(regex, "$1").replace(/&$/, '');

        return (query.length > 2 ? query + "&" : "?") + (newval ? param + "=" + newval : '');
    };

    function setFirstDestination(id){
        var str = window.location.search
        str = replaceQueryParam('first', id, str)
        window.location = window.location.pathname + str
    };

    function getParameterByName(name, url = window.location.href) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    };

    function setDestinationOut(id){
        var outString = "";
        var out = getParameterByName('out');
        if (out == null) {
            outString = id;
        } else {
            outString = out+","+id
        }   
        
        var change = getParameterByName('change');
        var splitChange = change.split(",");
        var changeString = "";
        if (change != null){
            for (let i = 0; i < splitChange.length; i++) {
                var element = splitChange[i];
                var elementClean = element.split("@");
                if (elementClean[0] != id){
                    if (i == splitChange.length-1){
                        changeString += element;
                    } else {
                        changeString += element+',';
                    }
                }
            };           
        }
        
        var str = window.location.search
        str = replaceQueryParam('out', outString, str)
        str = replaceQueryParam('change', changeString, str)
        window.location = window.location.pathname + str
    };

    function setDestinationIn(id){
        var outString = "";
        var out = getParameterByName('out');
        var outClean = out.split(',');

        var inClean = "";

        for (i = 0; i < outClean.length; i++) {
            if (outClean[i] != id) {
                if (inClean == "") {
                    inClean = outClean[i];
                } else {
                    inClean += ","+outClean[i];
                }
            }
        }

        var str = window.location.search
        str = replaceQueryParam('out', inClean, str)
        window.location = window.location.pathname + str;
    };
    
</script>

<script type="text/javascript">
 $(document).ready(function() {
    $('#qrcode canvas').remove();
    $('#qrcode').qrcode({
        render: 'canvas',
        text: window.location.href
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

<script type="text/javascript">
function add_row()
{
 $rowno=$("#driver_table tr").length;
 $rowno=$rowno+1;
 $("#driver_table tr:last").after("<tr id='row"+$rowno+"'><td><input type='text' name='name[]' placeholder='Masukkan nama'></td><td><input type='text' name='package[]' placeholder='Paket yang diantar'></td><td><input type='button' value='Hapus' onclick=delete_row('row"+$rowno+"')></td></tr>");
}
function delete_row(rowno)
{
 $('#'+rowno).remove();
}
</script>