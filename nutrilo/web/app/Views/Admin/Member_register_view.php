<div class="main-panel">
    <nav class="navbar navbar-default navbar-fixed">
        <div class="container-fluid">
            <div class="page-header">
                <a class="navbar-brand pull-left" href="/">
                    <img class="logo-brand" src="<?php echo base_url('img/logo_mitra_nutrilo.png'); ?>" alt="">
                </a>
                <a class="navbar-logout pull-right" href="/logout">
                    <img class="logo-brand" src="<?php echo base_url('img/sign-out.svg'); ?>" alt="">    
                </a>
            </div>
        </div>
    </nav>

    <div class="content">
        <div class="container-fluid">
            <div class="container-member">
                <h3 class="title">Pendaftaran Member</h3><hr>
                <form action="<?php echo base_url('/admin/member/update'); ?>" method="POST">
                    <table>
                        <tbody>
                            <tr>
                                <td class="title-row">Nama</td>
                                <td><input type="text" name="name" placeholder="Masukkan nama"></td>
                            </tr>
                            <tr>
                                <td class="title-row">No. HP</td>
                                <td><input type="text" name="phone" placeholder="Masukkan nomor HP"></td>
                            </tr>
                            <tr>
                                <td class="title-row">Scan Kartu</td>
                                <td><button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#camera-modal">Buka Kamera</button></td>
                            </tr>
                            <tr>
                                <td class="title-row">Nomor Kartu</td>
                                <td><input id="card-number-input" type="text" name="card_number" readonly></td>
                            </tr>
                            <tr>
                                <td colspan="2"><button type="submit" class="btn btn-success btn-fill btn-save">Simpan</button></td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>

<div id="camera-modal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Scan Kartu</h4>
            </div>
            <div class="modal-body">
                <div class="camera">
                    <div id="reader" style="width:300px"></div>
                    <p id="card-number"></p>
                    <!-- <button id="btn-scanner" onclick="start()"></button> -->
                    <button type="button" class="btn btn-primary btn-fill btn-scanner" id="load btn-scanner" data-loading-text="<i class='fa fa-spinner fa-spin '></i> Proses Scanning">Mulai Scan</button>
                    <button type="button" class="btn btn-success btn-fill btn-save-number" style="display:none;">Simpan</button>
                    <div id="scanned-result"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- <script src="https://raw.githubusercontent.com/mebjas/html5-qrcode/master/minified/html5-qrcode.min.js"></script> -->
<!-- <script src="<?php echo base_url('js/html5-qrcode.min.js?version=').filemtime('js/html5-qrcode.min.js'); ?>"></script> -->
<script src="<?php echo base_url('js/html5-qrcode.min.js?version=').filemtime('js/html5-qrcode2.min.js'); ?>"></script>
<!-- <script>
    function docReady(fn) {
        // see if DOM is already available
        if (document.readyState === "complete" || document.readyState === "interactive") {
            // call on next available tick
            setTimeout(fn, 1);
        } else {
            document.addEventListener("DOMContentLoaded", fn);
        }
    }
    docReady(function() {
        var results = document.getElementById('scanned-result');
        var lastMessage;
        var codesFound = 0;
        function onScanSuccess(qrCodeMessage) {
            if (lastMessage !== qrCodeMessage) {
                lastMessage = qrCodeMessage;
                ++codesFound;
                results.innerHTML += `<div>[${codesFound}] - ${qrCodeMessage}</div>`;
            }
        }
        console.log("NOmor", codesFound)
        var html5QrcodeScanner = new Html5QrcodeScanner(
            "reader", { fps: 10, qrbox: 250 }, /* verbose= */ true);
        html5QrcodeScanner.render(onScanSuccess);
    });
</script> -->
<script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
<script type="text/javascript">
    const html5QrCode = new Html5Qrcode("reader");
    var cameraId = 0;
    var cardNumber = 0;

    // FETCH CAMERA
    Html5Qrcode.getCameras().then(devices => {
        /**
     * devices would be an array of objects of type:
     * { id: "id", label: "label" }
     */
    if (devices && devices.length) {
        let isMobile = window.matchMedia("only screen and (max-width: 760px)").matches;

        if(isMobile) {
            cameraId = devices[1].id;
        } else {
            cameraId = devices[0].id;
        }
        
        // .. use this to start scanning.
        console.log(cameraId)
    }
    }).catch(err => {
    // handle err
        console.log(err)
    });

    $('.btn-scanner').on('click', function() {
        var $this = $(this);
        $this.button('loading');
        $("#card-number").hide();
        $(".btn-save-number").hide();

        start($this);
    });

    $('.btn-save-number').on('click', function() {
        $("#card-number-input").val( cardNumber ); 
        $("#card-number").hide(); 
        $(".btn-save-number").hide();
        $('#camera-modal').modal('hide');
    });

    $('.close').on('click', function() {
        $("#card-number").hide(); 
        $(".btn-save-number").hide();
        $(".btn-scanner").button('reset');
    });

    function start(event){
        html5QrCode.start(
        cameraId,
        {
            fps: 10,    // Optional frame per seconds for qr code scanning
            qrbox: 250  // Optional if you want bounded box UI
        },
        qrCodeMessage => {
            // do something when code is read
            console.log(qrCodeMessage);
            html5QrCode.stop().then(ignore => {
                // QR Code scanning is stopped.
                cardNumber = qrCodeMessage;
                $("#card-number").html('Nomor Kartu : '+ cardNumber);
                $("#card-number").show();
                $(".btn-save-number").show();

                event.button('reset');
            }).catch(err => {
            // Stop failed, handle it.
                console.log(err);
            });
        },
        errorMessage => {
            // parse error, ignore it.
            console.log(errorMessage);
        })
        .catch(err => {
        // Start failed, handle it.
            console.log(err);
        });
    }
</script>
