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
                    <h3 class="title">Daftar Menu <?= $batch->name ?></h3><hr>
                    <div class="content">
                        <div class="container-fluid">
                            <a class="btn btn-add" style="float:right" href="javascript:;"
                                data-batch-id="<?= $batch->id; ?>"
                                data-toggle="modal" data-target="#add-menu">
                                <button data-toggle="modal" data-target="#tambah-menu" class="btn btn-info">Tambah Data</button>
                            </a>
                            <table id="example" class="table table-striped table-bordered" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Nama Menu</th>
                                        <th>Kategori</th>
                                        <th>Hari</th>
                                        <th>Waktu</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php foreach ($menus as $menu): ?>
                                    <tr>
                                        <td><?= $menu->id ?></td>
                                        <td><?= $menu->name ?></td>
                                        <td><?php foreach ($category as $ctg): ?>
                                            <?php if ($ctg['id'] == $menu->category_id) { echo $ctg['category_name']; } ?>
                                            <?php endforeach; ?></td>
                                        <td><?php foreach ($days as $day): ?>
                                            <?php if ($day['id'] == $menu->day_id) { echo $day['name']; } ?>
                                            <?php endforeach; ?></td>
                                        <td><?php if ($menu->time_id == 1) { echo 'Lunch'; } else { echo 'Dinner'; } ?></td>
                                        <td>
                                        <a href="javascript:;"
                                            data-menu-id="<?= $menu->id; ?>"
                                            data-menu-name="<?= $menu->name; ?>"
                                            data-category-id="<?= $menu->category_id; ?>"
                                            data-day-id="<?= $menu->day_id; ?>"
                                            data-time-id="<?= $menu->time_id; ?>"
                                            data-batch-id="<?= $batch->id; ?>"
                                            data-toggle="modal" data-target="#edit-menu">
                                            <button data-toggle="modal" data-target="#ubah-menu" class="btn btn-info">Edit</button>
                                        </a>
                                        <a href="/catering/menu/delete?id=<?= $menu->id ?>&batch=<?= $batch->id ?>" class="btn btn-delete" onclick="return confirm('Apakah anda yakin ingin menghapus data ini?')">Delete</a>
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


    

<!-- Modal Tambah -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="add-menu" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title"><?= $title ?> Menu</h4>
            </div>
            <div class="modal-body">
                <form action="<?php echo site_url('/admin/menu/save'); ?>" method="post">
                    <div class="form-group">
                        <input type="hidden" name="batch-id" id="batch-id" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Nama<span class="text-danger">*</span></label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="Masukkan nama menu" required>
                    </div>
                    <div class="form-group">
                        <label>Kategori<span class="text-danger">*</span></label>
                        <select class="form-control" name="category_id" id="category_id">
                            <?php foreach ($category as $ctg) : ?>
                                <option value='<?= $ctg["id"]; ?>'>
                                    <?= $ctg["category_name"]; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Hari<span class="text-danger">*</span></label>
                        <select class="form-control" name="day_id" id="day_id">
                            <?php foreach ($days as $day) : ?>
                                <option value='<?= $day["id"]; ?>'>
                                    <?= $day["name"]; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Waktu<span class="text-danger">*</span></label>
                        <select class="form-control" name="time_id" id="time_id">
                            <option value='1'>Lunch</option>
                            <option value='2'>Dinner</option>
                        </select>
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
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="edit-menu" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">Edit Menu</h4>
            </div>
            <div class="modal-body">
                <form action="<?php echo site_url('/admin/menu/update'); ?>" method="post">
                    <div class="form-group">
                        <input type="hidden" name="menu-id" id="menu-id" class="form-control">
                    </div>    
                    <div class="form-group">
                        <input type="hidden" name="batch-id" id="batch-id" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Nama<span class="text-danger">*</span></label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="Masukkan nama menu" required>
                    </div>
                    <div class="form-group">
                        <label>Kategori<span class="text-danger">*</span></label>
                        <select class="form-control" name="category_id" id="category_id">
                            <?php foreach ($category as $ctg) : ?>
                                <option value='<?= $ctg["id"]; ?>'>
                                    <?= $ctg["category_name"]; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Hari<span class="text-danger">*</span></label>
                        <select class="form-control" name="day_id" id="day_id">
                            <?php foreach ($days as $day) : ?>
                                <option value='<?= $day["id"]; ?>'>
                                    <?= $day["name"]; ?>
                                </option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Waktu<span class="text-danger">*</span></label>
                        <select class="form-control" name="time_id" id="time_id">
                            <option value='1'>Lunch</option>
                            <option value='2'>Dinner</option>
                        </select>
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