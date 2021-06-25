<!DOCTYPE html>
<html>
<head>
    <title><?= $date ?></title>
    <style>
        p {
            margin: 0;
        }
        .num-order {
            background-color: lightgray;
            border-radius: 6px;
            padding: 2px 10px;
            width: 53px;
            height: 30px;
            text-align: center;
            border: 1px solid gray;
            font-size: 14px;
        }
        .notes {
            padding: 0 34px;
            margin: 10px 0px;
        }
        .divider {

        }
        .total {
            border-radius: 10px;
            background: #d8d6d6;
            padding: 10px 15px 10px 15px;
        }
    </style>
    <link href="<?php echo base_url('css/styles.css?version=').filemtime('css/styles.css'); ?>" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
</head>
<body>
    <label class="switch">
        <input type="checkbox" id="checkbox">
        <span class="slider round"></span>
    </label>
    <br>
    <div class="container" style="width:220px">
        <div class="tampilan1">
            <br>
            <?php foreach ($orders as $item): ?>
                <p>(<?= $item->quantity; ?>)  <?=$item->food_name ?></p>
                <?php foreach ($buyerList as $buyer): ?>
                <?php if ($buyer->id == $item->buyer_id) { ?> 
                    <p><?= $buyer->name; ?> | <?= $item->phone; ?></p>
                <?php break; }; ?>
                <?php endforeach; ?>
                <p><?= $item->address; ?></p>
                <p><i><?= $item->driver_notes; ?></i></p>
                <!-- <p><?= $item->notes; ?></p> -->
                <p>---------------------------------</p>
            <?php endforeach; ?>
        </div>
        <div class="tampilan2">
            <h3><?php echo $batch->name ?> | <?php echo $day->name; ?> | <?php echo $time; ?></h3>
            <?php function searchColor($id, $array) {
                    foreach ($array as $key => $val) {
                        if ($val=== $id) {
                            return $key;
                        }
                    }
                    return null;
                };
            ?>
            <?php $menu_array = array(); ?>
            <?php $notes = array(); ?>
            <?php $background_color = array('lightgreen', 'yellow', 'yellowgreen', 'lightskyblue', 
                                'lightgray', 'lightpink', 'sandybrown', 'lightgoldenrodyellow', 
                                'gold', 'mistyrose', 'mediumaquamarine', 'burlywood',
                                'coral', 'cyan', 'darkkhaki', 'darksalmon',
                                'darkturquoise', 'lightblue', 'lightsteelblue', 'mediumpurple'); ?>
            <?php foreach ($orders as $item): ?>
                <?php foreach ($buyerList as $buyer): ?>
                    <?php if ($buyer->id == $item->buyer_id) { ?> 
                        <div>
                            <span class="num-order"><?= $item->quantity; ?></span>
                            <span class="food-name"><?=$item->food_name ?></span>
                            <span class="food-name"><b>(<?= $buyer->name; ?>)</b></span>
                            <?php
                            array_push($menu_array, [$item->food_name => $item->quantity]); 
                            ?>
                            <?php if (strlen($buyer->nutritional_needs) != 1 && $buyer->nutritional_needs != "") { ?>
                                <?php 
                                    $nutrition = strtolower($buyer->nutritional_needs);
                                    $backgroundSelected = 'fff';
                                    $searchNotes = isset($notes[$nutrition]) ? $notes[$nutrition] : null;
                                    if ($searchNotes == null){
                                        $backgroundSelected = $background_color[array_rand($background_color)];
                                        $checkColor = searchColor($backgroundSelected, $notes);
                                        if ($checkColor != null){
                                            $backgroundSelected = $background_color[array_rand($background_color)];
                                        };
                                        $notes += array($nutrition => $backgroundSelected);
                                    } else {
                                        $backgroundSelected = $searchNotes;
                                    }
                                ?>
                                <p class="notes" style="background-color: <?= $backgroundSelected ?>"><b><?= $nutrition ?></b></p>
                            <?php }; ?>
                        </div>
                    <?php break; }; ?>
                <?php endforeach; ?>
                <hr>
            <?php endforeach; ?>
            <div class="total">
                <h4 style="margin: 5px 0;">Total Order : </h4>
                <?php 
                $sumArray = array();
                foreach ($menu_array as $k => $subArray) {
                    foreach ($subArray as $id=>$value) {
                        $sumArray[$id]+=$value;
                    };
                };
                foreach ($sumArray as $key => $sum):
                ?>
                    <i><h4 style="margin: 5px 0;"><?= $key ?> (<?= $sum ?>)</h4></i>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
    <script>
     window.onload = function() { window.print(); }
    </script>
    <script type="text/javascript">
        $('.tampilan2').hide();
        $("input[type=checkbox]").on('change', function () {
            var self = $(this);
            if (self.is(":checked")) {
                $('.tampilan2').show();
                $('.tampilan1').hide();
                $('.container').css('width', '100%');
            } else {
                $('.tampilan1').show();
                $('.tampilan2').hide();
                $('.container').css('width', '220px');
            }
        });
    </script>
</body>
</html>