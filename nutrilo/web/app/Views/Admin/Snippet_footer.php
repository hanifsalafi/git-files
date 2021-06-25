</div>
</body>

<!--   Core JS Files   -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script> -->
    <script src="<?php echo base_url('js/bootstrap.min.js?version=').filemtime('js/bootstrap.min.js'); ?>" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap.min.js" type="text/javascript"></script>
    
<!-- Datatables -->
    <script type="text/javascript">
        var smallScreen = window.matchMedia("(max-width: 767px)");
        if (smallScreen.matches){
            $(document).ready(function() {
                $('#example').DataTable({
                    aaSorting: [[ 0, "desc" ]],
                    "scrollX": true,
                    "pageLength": 100,
                    "pagingType": "full"
                });
            } );
        } else {
            $(document).ready(function() {
                $('#example').DataTable({
                    aaSorting: [[ 0, "desc" ]],
                    "pageLength": 100,
                    "scrollX": true,
                });
            } );
        }
    </script>

    
    
	<!--  Charts Plugin -->
	<script src="<?php echo base_url('js/chartist.min.js?version=').filemtime('js/chartist.min.js'); ?>"></script>

    <!--  QR Code Plugin -->
	<script src="<?php echo base_url('js/jquery-qrcode-0.18.0.min.js?version=').filemtime('js/jquery-qrcode-0.18.0.min.js'); ?>"></script>

    <!--  Notifications Plugin    -->
    <script src="<?php echo base_url('js/bootstrap-notify.js?version=').filemtime('js/bootstrap-notify.js'); ?>"></script>

    <!--  Google Maps Plugin    -->
    <!-- <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script> -->

    <!-- Light Bootstrap Table Core javascript and methods for Demo purpose -->
	<script src="<?php echo base_url('js/light-bootstrap-dashboard.js?version=').filemtime('js/light-bootstrap-dashboard.js'); ?>"></script>

	<!-- Light Bootstrap Table DEMO methods, don't include it in your project! -->
    <script src="<?php echo base_url('js/demo.js?version=').filemtime('js/demo.js'); ?>"></script>

    <script src="<?php echo base_url('js/custom.js?version=').filemtime('js/custom.js'); ?>"></script>
    
    <script src="<?php echo base_url('js/bootstrap.confirm.js?version=').filemtime('js/bootstrap.confirm.js'); ?>"></script>

    
</html>