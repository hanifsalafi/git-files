<!DOCTYPE html>
<html>
<head>
    <title>SIMPLE CRUD</title>
</head>
<body>

<?php
// --- koneksi ke database
$koneksi = mysqli_connect("mysql-server","root","admin","testdb") or die(mysqli_error());
// --- Fngsi tambah data (Create)
function tambah($koneksi){
    
    if (isset($_POST['btn_simpan'])){
        $name = $_POST['name'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        
        if(!empty($name) && !empty($email) && !empty($phone)){
            $sql = "INSERT INTO user (name, email, phone) VALUES('".$name."','".$email."','".$phone."')";
            $simpan = mysqli_query($koneksi, $sql);
            if($simpan && isset($_GET['aksi'])){
                if($_GET['aksi'] == 'create'){
                    header('location: index.php');
                }
            }
        } else {
            $pesan = "Tidak dapat menyimpan, data belum lengkap!";
        }
    }
    ?> 
        <form action="" method="POST">
            <fieldset>
                <legend><h2>Tambah data</h2></legend>
                <label>Nama<input type="text" name="name" /></label> <br>
                <label>Email<input type="text" name="email" /></label><br>
                <label>No. HP<input type="number" name="phone" /></label> <br>
                <br>
                <label>
                    <input type="submit" name="btn_simpan" value="Simpan"/>
                    <input type="reset" name="reset" value="Besihkan"/>
                </label>
                <br>
                <p><?php echo isset($pesan) ? $pesan : "" ?></p>
            </fieldset>
        </form>
    <?php
}
// --- Tutup Fngsi tambah data
// --- Fungsi Baca Data (Read)
function tampil_data($koneksi){
    $sql = "SELECT * FROM user";
    $query = mysqli_query($koneksi, $sql);
    
    echo "<fieldset>";
    echo "<legend><h2>Data User</h2></legend>";
    
    echo "<table border='1' cellpadding='10'>";
    echo "<tr>
            <th>ID</th>
            <th>Nama</th>
            <th>Email</th>
            <th>No. HP</th>
            <th>Tindakan</th>
          </tr>";
    
    while($data = mysqli_fetch_array($query)){
        ?>
            <tr>
                <td><?php echo $data['id']; ?></td>
                <td><?php echo $data['name']; ?></td>
                <td><?php echo $data['email']; ?></td>
                <td><?php echo $data['phone']; ?></td>
                <td>
                    <a href="index.php?aksi=update&id=<?php echo $data['id']; ?>&name=<?php echo $data['name']; ?>&email=<?php echo $data['email']; ?>&phone=<?php echo $data['phone']; ?>">Ubah</a> |
                    <a href="index.php?aksi=delete&id=<?php echo $data['id']; ?>">Hapus</a>
                </td>
            </tr>
        <?php
    }
    echo "</table>";
    echo "</fieldset>";
}
// --- Tutup Fungsi Baca Data (Read)
// --- Fungsi Ubah Data (Update)
function ubah($koneksi){
    // ubah data
    if(isset($_POST['btn_ubah'])){
        $id = $_POST['id'];
        $name = $_POST['name'];
        $email = $_POST['email'];
        $phone = $_POST['phone'];
        
        if(!empty($name) && !empty($email) && !empty($phone)){
            $perubahan = "name='".$name."',email='".$email."',phone=".$phone;
            $sql_update = "UPDATE user SET ".$perubahan." WHERE id=$id";
            $update = mysqli_query($koneksi, $sql_update);
            if($update && isset($_GET['aksi'])){
                if($_GET['aksi'] == 'update'){
                    header('location: index.php');
                }
            }
        } else {
            $pesan = "Data tidak lengkap!";
        }
    }
    
    // tampilkan form ubah
    if(isset($_GET['id'])){
        ?>
            <a href="index.php"> &laquo; Home</a> | 
            <a href="index.php?aksi=create"> (+) Tambah Data</a>
            <hr>
            
            <form action="" method="POST">
            <fieldset>
                <legend><h2>Ubah data</h2></legend>
                <input type="hidden" name="id" value="<?php echo $_GET['id'] ?>"/>
                <label>Nama<input type="text" name="name" value="<?php echo $_GET['name'] ?>"/></label> <br>
                <label>Email<input type="text" name="email" value="<?php echo $_GET['email'] ?>"/></label><br>
                <label>No. HP<input type="number" name="phone" value="<?php echo $_GET['phone'] ?>"/></label> <br>
                <br>
                <label>
                    <input type="submit" name="btn_ubah" value="Simpan Perubahan"/> atau <a href="index.php?aksi=delete&id=<?php echo $_GET['id'] ?>"> (x) Hapus data ini</a>!
                </label>
                <br>
                <p><?php echo isset($pesan) ? $pesan : "" ?></p>
                
            </fieldset>
            </form>
        <?php
    }
    
}
// --- Tutup Fungsi Update
// --- Fungsi Delete
function hapus($koneksi){
    if(isset($_GET['id']) && isset($_GET['aksi'])){
        $id = $_GET['id'];
        $sql_hapus = "DELETE FROM user WHERE id=" . $id;
        $hapus = mysqli_query($koneksi, $sql_hapus);
        
        if($hapus){
            if($_GET['aksi'] == 'delete'){
                header('location: index.php');
            }
        }
    }
    
}
// --- Tutup Fungsi Hapus
// ===================================================================
// --- Program Utama
if (isset($_GET['aksi'])){
    switch($_GET['aksi']){
        case "create":
            echo '<a href="index.php"> &laquo; Home</a>';
            tambah($koneksi);
            break;
        case "read":
            tampil_data($koneksi);
            break;
        case "update":
            ubah($koneksi);
            tampil_data($koneksi);
            break;
        case "delete":
            hapus($koneksi);
            break;
        default:
            echo "<h3>Aksi <i>".$_GET['aksi']."</i> tidaka ada!</h3>";
            tambah($koneksi);
            tampil_data($koneksi);
    }
} else {
    tambah($koneksi);
    tampil_data($koneksi);
}
?>
</body>
</html>