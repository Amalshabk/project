<?php
//insert
$servername = "localhost";
$username = "root";
$password = "";


// Create connection
$conn = mysqli_connect($servername, $username, $password);
// Check connection
if (!$conn) {
    die("Connection failed:" . mysqli_connect_error());
} 
echo "connected successfully";

 /* $sql="SELECT * FROM teacher";
  $results = mysqli_query($conn,$sql);
  if(mysqli_num_rows($result)> 0){
      while($row = mysqli_fetch_assoc($results)){
          echo "idTeach:" . $row["idTeach"]. "fnameTeach:" . $row["lnameTeach"]. "lnameTeach:" . $row["lnameTeach"]. "telnoTeach:" . $row["telnoTeach"]."addressTeach:" . $row["addressTeach"] . "<br>";
      }
  }
  else{
      echo " 0 results";
  }
  mysqli_close($conn);*/
?>