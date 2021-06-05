<?php
$conn = @mysqli_connect("localhost", "root", "", "rental_house_pesa");
if(!$conn){
  echo "Connection failed!".@mysqli_error($conn);
}
?>
