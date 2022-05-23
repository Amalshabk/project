<?php

require_once ("db.php");
     
     if(isset($_POST['insert']))
     {
         if(empty($_POST['id']) || empty($_POST ['fname']) || empty($_POST ['lname']) || empty($_POST ['tel']) || empty($_POST ['address']))
         {
             echo "please fill in the blants";
         }
         else
         {
             $id = $_POST['id'];
             $fname=$_POST ['fname'];
             $lname=$_POST ['lname'];
             $tel=$_POST ['tel'];
             $address=$_POST ['address'];
             $query="insert into records (id,fname,lname,tel,address) values('$id','$fname','$lname','$tel','$address')";
             $result = mysqli_query($conn,$query);
             if($result)
               {
                header("location:SQL/view.php");
               }
                 else
                 {
                     echo "please checkn your Query";
                 }
            }

     }
     else{
         header("location:SQL/index1.php");
     }
?>
