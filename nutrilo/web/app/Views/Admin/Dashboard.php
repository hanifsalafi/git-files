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


        <div class="content">
            <div class="container-fluid">
                <div class="container-dashboard">
                    <?php if ($user->user_status_id == 1) { ?>
                    <p class="title">Silahkan Lengkapi Form Berikut Untuk Proses Verifikasi Mitra</p><hr>
                    <form action="<?php echo base_url('/admin/user/verification'); ?>" method="POST">
                        <table>
                            <tbody>
                                <tr>
                                    <td colspan="2"><h5>Data Pemilik</h5><hr class="owner-line"></td>
                                </tr>
                                <tr>
                                    <td class="title-row">Nama</td>
                                    <td><input type="text" name="name" placeholder="Masukkan nama" value="<?= $user->fullname; ?>"></td>
                                </tr>
                                <tr>
                                    <td class="title-row">No. HP</td>
                                    <td><input type="text" name="phone" placeholder="Masukkan nomor HP"></td>
                                </tr>
                                <tr>
                                    <td class="title-row">Alamat</td>
                                    <td><textarea type="text" name="address" placeholder="Masukkan alamat" rows="4"></textarea>
                                </tr>
                                <tr>
                                    <td colspan="2"><h5>Data Usaha</h5><hr class="owner-line"></td>
                                </tr>
                                <tr>
                                    <td class="title-row">Nama Usaha</td>
                                    <td><input type="text" name="business_name" placeholder="Masukkan nama usaha" value=""></td>
                                </tr>
                                <tr>
                                    <td class="title-row">No. Telepon / HP</td>
                                    <td><input type="text" name="business_phone" placeholder="Masukkan kontak usaha"></td>
                                </tr>
                                <tr>
                                    <td class="title-row">Alamat</td>
                                    <td><textarea type="text" name="business_address" placeholder="Masukkan alamat usaha" rows="4"></textarea>
                                </tr>
                                <tr>
                                    <td class="title-row">Deskripsi Usaha</td>
                                    <td><textarea type="text" name="business_desc" placeholder="Masukkan deskripsi singkat usaha" rows="4"></textarea>
                                </tr>
                                <tr>
                                    <td colspan="2"><button type="submit" class="btn btn-success btn-fill btn-save">Simpan</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                    <?php } else { ?>
                    <p class="title">Mohon tunggu, data anda sedang dalam proses verifikasi.</p><hr>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
