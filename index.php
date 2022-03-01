<html>
  <head>
  <title>CSP key install </title>
  </head>
  <body>
  <form action="#" method="post" enctype="multipart/form-data">
<!--  Type Folder Name:<input type="text" name="foldername" /><br/><br/> -->
  Выбрать директорию с подписью: <input type="file" name="files[]" id="files" multiple directory="" webkitdirectory="" moxdirectory="" />
  <input type="Submit" value="Загрузить" name="upload" />
  </form>
   <form method="post">
   <p>
 <button name="button">Установить ключ</button>
   </p>
 </form>
  </body>
  </html>

<?php
if(isset($_POST['upload']))
{
if($_POST['foldername'] != "uploads")
{
//              $foldername=$_POST['foldername'];
$foldername='uploads';
if(!is_dir($foldername)) mkdir($foldername);
foreach($_FILES['files']['name'] as $i => $name)
{
if(strlen($_FILES['files']['name'][$i]) > 1)
{  move_uploaded_file($_FILES['files']['tmp_name'][$i],$foldername."/".$name);
}
}
echo "Folder is successfully uploaded";
}
else
echo "Upload folder name is empty";
}
?>


<?php
if (isset($_POST['button']))
{
exec('/key.sh');
}
?>
