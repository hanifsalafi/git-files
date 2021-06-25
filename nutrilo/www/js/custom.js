
$('#disc_number').on('input', function() {
    disc = $('#disc_number').val();
    selling_price = $('#selling_price').val();
    total_with_disc = Number(selling_price)-Number(disc)
    $('#sell_price_with_disc').val(total_with_disc);
});

$('#purchase_price').on('input', function() {
    purchase_price = $('#purchase_price').val();
    profit = 20
    selling_price_recommend = parseInt(purchase_price)+parseInt(purchase_price*profit/100)
    $('#selling_price').attr("placeholder", "Harga rekomendasi (+20%) : "+selling_price_recommend);
});



$(document).ready(function() {
    
    function stringTruncateFromCenter(str, maxLength) {
        const midChar = "…";      // character to insert into the center of the result
        var left, right;
        if (str.length <= maxLength) return str;
        // length of beginning part      
        left = Math.ceil(maxLength / 2);
        // start index of ending part   
        right = str.length - Math.floor(maxLength / 2) + 1;   
        return str.substr(0, left) + midChar + str.substring(right);
    }

    // show data
    $('#show-data').on('show.bs.modal', function (event) {
        var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
        var modal          = $(this)
    
        modal.find('.name').html(div.data('name'));
        modal.find('.phone').html(div.data('phone'));
        modal.find('.address').html(div.data('address'));
        modal.find('.latlong').html(div.data('latlong'));
        modal.find('.package-name').html(div.data('packageName'));
        modal.find('.quantity').html(div.data('quantity'));
        modal.find('.payment-to').html(div.data('paymentTo'));
        modal.find('.payment-amount').html(div.data('paymentAmount'));
        modal.find('.payment-date').html(div.data('paymentDate'));
        modal.find('.batch-start').html(div.data('batchStart'));
        modal.find('.day-start').html(div.data('dayStart'));
        modal.find('.batch-end').html(div.data('batchEnd'));
        modal.find('.day-end').html(div.data('dayEnd'));
        modal.find('.nutrition').html(div.data('nutrition'));
        modal.find('.notes').html(div.data('notes'));
        modal.find('.driver-notes').html(div.data('driverNotes'));
        // modal.find('.').html(div.data(''));
    });

     // Untuk nambah data
     $('#add-order-data').on('show.bs.modal', function (event) {
        var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
        var modal          = $(this)
    
        modal.find('#batch-id').val(div.data('batch-id'));
        modal.find('#day-id').val(div.data('day-id'));
        modal.find('#time-order').val(div.data('time-order'));
    });

    // Untuk ubah data
    $('#edit-order-data').on('show.bs.modal', function (event) {
        var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
        var modal          = $(this)
    
        modal.find('#order-id').val(div.data('orderId'));
        modal.find('#batch-id').val(div.data('batchId'));
        modal.find('#buyer-id').val(div.data('buyerId'));
        modal.find('#phone').val(div.data('phone'));
        modal.find('#address').val(div.data('address'));
        modal.find('#latlong').val(div.data('latlong'));
        modal.find('#food-id').val(div.data('foodId'));
        modal.find('#food-name').val(div.data('foodIame'));
        modal.find('#menu_id').val(div.data('menuId'));
        modal.find('#quantity').val(div.data('quantity'));
        modal.find('#notes').val(div.data('notes'));
        modal.find('#driver_notes').val(div.data('driverNotes'));
    });

    // Untuk ubah data
    $('#add-menu').on('show.bs.modal', function (event) {
        var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
        var modal          = $(this)
    
        modal.find('#batch-id').val(div.data('batch-id'));
    });

    // Untuk ubah data
    $('#edit-menu').on('show.bs.modal', function (event) {
        var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
        var modal          = $(this)
        
        modal.find('#menu-id').val(div.data('menu-id'));
        modal.find('#name').val(div.data('menu-name'));
        modal.find('#category_id').val(div.data('category-id'));
        modal.find('#day_id').val(div.data('day-id'));
        modal.find('#time_id').val(div.data('time-id'));
        modal.find('#batch-id').val(div.data('batch-id'));
    });

    $('#edit-ingredient').on('show.bs.modal', function (event) {
        var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
        var modal          = $(this)
        
        modal.find('#data-id').val(div.data('dataId'));
        modal.find('#name').val(div.data('name'));
        modal.find('#description').val(div.data('description'));
        modal.find('#category_id').val(div.data('categoryId'));
        modal.find('#unit_id').val(div.data('unitId'));
        modal.find('#stock_limit').val(div.data('stockLimit'));
        modal.find('#purchase_price').val(div.data('purchasePrice'));
        modal.find('#datepicker2').val(div.data('latestPriceDate'));
    });


});
