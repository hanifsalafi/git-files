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

    <div class="nav-menu" style="padding-top: 20px; padding-left: 20px;">
        <span class="nav-menu-item"><a href="/">Home</a></span>
        <i class="glyphicon glyphicon-chevron-right"></i>
    </div>

    <div class="content">
        <div class="container-fluid">
            <div class="container-batch">
                <h3 class="title">Batch</h3><hr>
                <div class="order-table">
                    <table >
                        <thead>
                            <th colspan="3">
                                <a href="javascript:;"
                                    data-toggle="modal" data-target="#add-batch">
                                    <button style="width: 100%" data-toggle="modal" data-target="#tambah-batch" class="btn btn-info">Tambah</button>
                                </a>
                            </ht>
                        </thead>
                        <tbody>
                            <?php foreach($batchs as $batch):?>
                            <tr>
                                <td><?= $batch['name'] ?></td>
                                <td><?= $batch['duration'] ?></td>
                                <td><a style="width: 100%;" href="/catering/batch?batch=<?= $batch['id'] ?>" class="btn btn-success">Buka</a></th></td>
                            </tr>
                        </tbody>
                        
                        <?php endforeach; ?>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- Modal Tambah -->
<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="add-batch" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                <h4 class="modal-title">Info Lengkap</h4>
            </div>
            <div class="modal-body">
                <form action="<?php echo site_url('/admin/catering_batch/save'); ?>" method="post">
                    <div class="form-group">
                        <label>Nama<span class="text-danger">*</span></label>
                        <input type="text" name="name" id="name" class="form-control" placeholder="Masukkan nama batch" required>
                    </div>
                    <div class="form-group">
                        <label>Durasi<span class="text-danger">*</span></label>
                        <input type="text" name="duration" id="duration" class="form-control" placeholder="Masukkan durasi batch" required>
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

