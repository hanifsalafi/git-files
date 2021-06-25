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
                    <h3 class="title">Pesan Driver</h3><hr>
           
                    <button class="accordion">Daftar Tujuan</button>
                    <div class="panel panel-driver-order">
                        <div class="route-container">
                            <div class="row">
                                <?php foreach ($orders as $order): ?>
                                <div class="col-xs-12 col-md-4 order_point">
                                    <div class="order_id_<?= $order->id ?>" id="order_id">
                                        <!-- <input type="hidden" name="item_id[]" id="item_id" value="<?= $order->id ?>" class="form-control"> -->
                                        
                                        <label class="container-checkbox"><p class="order-name"><?= $order->name ?> (<?php echo substr($order->address, 0, 12).".."; ?>)</p> 
                                            <input type="checkbox" name="order_group" id="order_group" class="order_group" value="<?= $order->id ?>" required>
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                                <?php endforeach; ?>
                            </div>
                        </div>
                        <button class="btn-success add-group-btn" style="width:100%;font-size:16px" >Add Group</button>
                    </div>
                    <button class="accordion">Order Group</button>
                    <div class="panel panel-order-group">
                        <div class="order-group-container">
                        </div>
                        <p><b class="total-price"></b></p>
                        <button class="btn-success submit-driver-order" style="width:100%;font-size:16px" >Pesan Diver</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="overlay"></div>
        <div class="spanner">
        <div class="loader"></div>
        <p>Mencari Driver ...</p>
    </div>


<script type="text/javascript">

    var groupCount = 0;      
    var group = [];  
    var groupArray = []; 
    var totalPrice = 0;                      
    
    // BUTUH TOMBOL BUTTON SIMPAN UNTUK PERUBAHAN POSISI
    $('.add-group-btn').click(function() {
        $('.panel-order-group>div').append("<div class='group' id='group-"+groupCount+"'><p class='group-title group-title-"+groupCount+"'>Grup "+Number(groupCount+1)+" <span></span></p><div class='group-member'><div class='row'><div class='order_point'></div></div></div></div>");
        group.forEach(element => {
            $("#group-"+groupCount+">.group-member>.row>.order_point").append( $('.order_id_'+element) );
        });
        groupArray.push(group);
        group = [];
        priceCalculation(groupCount, true);
        groupCount++;

        updateListPoint();
    });

    function updateListPoint(){
        var routeList = $('.panel-driver-order>.route-container>.row').children();
        routeList.each(function(idx, val) {
            if (!$(this).children().length > 0){
                $(this).remove();
            }
        });
    }

    function priceCalculation(id, isChecklist){
        id = id.toString();
        var orderIdString = "";
        var element = groupArray[id];

        var groupCountArr = []
        var all = $(".group-title").map(function() {
            groupCountArr.push(this.className.slice(24));
        }).get();
                
        if (groupCountArr.includes(id)) {
            if (typeof element == "undefined"){
                var index = groupCountArr.indexOf(id);
                element = groupArray[index];
            }
            for (let j = 0; j < element.length; j++) {
                if (j == element.length-1){
                    orderIdString += element[j];
                } else {
                    orderIdString += element[j]+",";
                }
            }

            var priceBefore = Number($('.group-title-'+id+'>span').text().slice(10));
            
            $.ajax({
                type: 'POST',
                url:"<?=  base_url(); ?>/price-calculation/"+orderIdString,
                contentType: "application/json; charset=utf-8",
                dataType: 'json',
                success:function(response)
                {   
                    var price = Number(response['price']);
                    $('.group-title-'+id+'>span').html("<b>| Price : "+price+"</b>");
                    updateTotalPrice();
                },
                error: function(data){
                    console.log(data);
                }
            }); 
        } else {
            updateTotalPrice();
        }
    }

    function updateTotalPrice(){
        var all = $(".group-title>span").map(function() {
            return this.innerText;
        }).get();

        var priceTot = 0;
        all.forEach(element => {
            var price = Number(element.slice(10));
            priceTot += price;
        });
        $('.total-price').text("Total Price : Rp "+priceTot);
    }

    $('input[type="checkbox"]').click(function(){
        if($(this).closest(".panel-order-group").length>0){

            var findGroupTitle = $(this).parentsUntil('.group-title')[5];
            var groupId = $($(findGroupTitle).children()[0]).attr('class').slice(24);

            if($(this).prop("checked") == false){
                $('.panel-driver-order>div>div').append($("<div class='col-xs-12 col-md-4 order_point'></div>").append( $('.order_id_'+$(this).val()) ));
                var newGroup = [];
                Array.prototype.remove = function (pos) {
                    this.splice(pos, 1);
                }

                for (let i = 0; i < groupArray.length; i++) {
                    for (let j = 0; j < groupArray[i].length; j++) {
                        var element = groupArray[i][j];
                        var groupFilter = groupArray[i]
                        if (element == $(this).val()){
                            var groupFilter = groupArray[i].filter(
                                item => item != element
                            );
                            groupArray[i] = groupFilter;
                        }
                    }
                }
                groupArray = groupArray.filter(
                    item => item.length != 0
                );

                checkGroupMember();
                if (groupArray.length != 0){
                    priceCalculation(groupId, false);
                } else {
                    $('.total-price').text("");
                    totalPrice = 0;
                }
            }
        } else {
            if ($(this).is(':checked')) {
                group.push($(this).val());
            } else {
                group = group.filter(
                    item => item != $(this).val()
                );
            }
        }
    });

    function checkGroupMember(){
        for (let i = 0; i < groupCount; i++) {
            if ($("#group-"+i).find("label.container-checkbox").length == 0){
                $("#group-"+i).remove();
            }
        }
        checkAllGroup();
    }

    function checkAllGroup(){
        if ($(".order-group-container").find("div.group").length == 0){
            groupCount = 0;
        }
    }

    $('.submit-driver-order').click(function() {
        var groupString = ""
        for (let i = 0; i < groupArray.length; i++) {
            var orderIdString = "";
            const element = groupArray[i];
            for (let j = 0; j < element.length; j++) {
                if (j == element.length-1){
                    orderIdString += element[j]+"@"+i;
                } else {
                    orderIdString += element[j]+"@"+i+",";
                }
            }
            if (i == groupArray.length-1){
                groupString += orderIdString;
            } else {
                groupString += orderIdString+",";
            }
        }
        console.log(groupString);

        $("div.spanner").addClass("show");
        $("div.overlay").addClass("show");

        $.ajax({
            type: 'POST',
            url:"<?=  base_url(); ?>/create-order/<?= $timeId ?>/"+groupArray.length+"/"+groupString,
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success:function(response)
            {
                if (response['success']){
                    if (confirm("Driver berhasil dipesan.")) {
                        window.location.replace("https://mrspeedy.co/cabinet")
                    }
                }
            },
            error: function(data){
                console.log(data);
                if (confirm("Pemesanan Driver Gagal, Silahkan Coba Lagi!")) {
                    location.reload();
                }
            }
        });
    });

    
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