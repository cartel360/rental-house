<?php

error_reporting(E_ALL);
ini_set('display_errors', 1);

include "conn.php";
include "connect.php";


function check($data)
{
  $data = trim($data);
  $data = htmlspecialchars($data);
  $data = stripslashes($data);
  return $data;
}

if (isset($_POST["submit"])) {

  $fname = check($_POST['FirstName']);
  $lname = check($_POST['LastName']);
  $prog = @check($_POST['programme']);
  $reg = @check($_POST['regno']);
  $occ = @check($_POST['occupation']);
  $pno1 = check($_POST['pno1']);
  $pno2 = check($_POST['pno2']);
  $postal = check($_POST['postal']);
  $city = check($_POST['city']);
  $region = check($_POST['region']);
  $uname = check($_POST['uname']);
  $pword = check($_POST['password']);
  $rpword = check($_POST['repeatPassword']);
  $price = $_POST['price'];
  $dur = $_POST['duration'];
  $dur1 = $dur - 1;
  $term = (int)$_POST['term'];
  $contract = $_POST['contract'];
  $house = $_POST['house'];
  $price = (int)$_POST['price'];
  $total_rent = $dur * $price;
  $rent_per_term = $total_rent / $term;
  $cpno1 = check($_POST['cpno1']);
  $cpno2 = check($_POST['cpno2']);
  $cpno3 = check($_POST['cpno3']);
  $cpno4 = check($_POST['cpno4']);
  $cfname1 = check($_POST['fname1']);
  $cfname2 = check($_POST['fname2']);
  $clname1 = check($_POST['lname1']);
  $clname2 = check($_POST['lname2']);
  $c_occu1 = check($_POST['occu1']);
  $c_occu2 = check($_POST['occu2']);
  $nature1 = check($_POST['nature1']);
  $nature2 = check($_POST['nature2']);
  $city1 = check($_POST['city1']);
  $city2 = check($_POST['city2']);
  $region1 = check($_POST['region1']);
  $region2 = check($_POST['region2']);
  $cemail1 = filter_var($_POST['email1'], FILTER_SANITIZE_EMAIL);
  $cemail2 = filter_var($_POST['email2'], FILTER_SANITIZE_EMAIL);
  $p_address1 = check($_POST['p_address1']);
  $p_address2 = check($_POST['p_address2']);
  if (date('d') < 27) {
    $end_date = date('Y-m-t', strtotime('+' . $dur1 . ' month'));
  } else {
    $end_date = date('Y-m-t', strtotime('+' . $dur1 . ' month'));
  }
  if ((date('d') < 27)) {
    $start_day = date('Y-m-01');
  } else {
    $start_day = date('Y-m-01', strtotime('+1 month'));
  }
  $date_reg = date('Y-m-d');
  $date_reg1 = date('Y-m-d H:i:s');
  $email = filter_var($_POST['email'], FILTER_SANITIZE_EMAIL);
  $stat = "Active";
  $status = 0;


  if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
    if (!ctype_alpha($fname)) {
      $fnameErr = "The name should only contain letters!";
      echo "<script> alert('$fnameErr');</script>";
    } elseif ((strlen($fname) < 3) || (strlen($fname) > 10)) {
      $fnameErr = "The name is either too short or too long";
      echo "<script> alert('$fnameErr');</script>";
    } else {
      if (!ctype_alpha($lname)) {
        $lnameErr = "The name should only contain letters!";
        echo "<script> alert('$lnameErr');</script>";
      } elseif ((strlen($lname) < 3) || (strlen($lname) > 10)) {
        $lnameErr = "The name is either too short or too long";
        echo "<script> alert('$lnameErr');</script>";
      } else {
        if ((ctype_digit($occ)) && !($occ == "")) {
          $occErr = "Your ocupation should only contain letters!";
          echo "<script> alert('$occErr');</script>";
        } else {
          if (!is_numeric($pno1))  {
            $pno1Err = "The phone number should not contain letters";
            echo "<script> alert('$pno1Err');</script>";
          } elseif (strlen($pno1) > 12) {
            $pno1Err = "The phone number is too long";
            echo "<script> alert('$pno1Err');</script>";
          } elseif (strlen($pno1) < 12) {
            $pno1Err = "The phone number is too short";
            echo "<script> alert('$pno1Err');</script>";
          } else {
            if ((!is_numeric($cpno1)) || (!is_numeric($cpno2))) {
              $cpno1Err = "The phone number should not contain letters";
              echo "<script> alert('$cpno1Err');</script>";
            } elseif ((strlen($cpno1) > 12) || (strlen($cpno2) > 12)) {
              $cpno1Err = "The phone number is too long";
              echo "<script> alert('$cpno1Err');</script>";
            } elseif ((strlen($cpno1) < 12) || (strlen($cpno2) < 12)) {
              $cpno1Err = "The phone number is too short";
              echo "<script> alert('$cpno1Err');</script>";
            } else {
                if ((!ctype_alpha($cfname1)) || (!ctype_alpha($cfname2)) || (!ctype_alpha($clname1)) || (!ctype_alpha($clname2))) {
                  $cfname1Err = "The name should only contain letters!";
                  echo "<script> alert('$cfname1Err');</script>";
                } elseif ((strlen($cfname1) < 3) || (strlen($cfname2) < 3)) {
                  $cfname1Err = "The name is too short";
                  echo "<script> alert('$cfname1Err');</script>";
                } elseif ((strlen($clname1) < 3) || (strlen($clname2) < 3)) {
                  $clname1Err = "The name is too short";
                  echo "<script> alert('$clname1Err');</script>";
                } elseif ((strlen($cfname1) > 10) || (strlen($cfname2) > 10)) {
                  $cfname1Err = "The name is too long";
                  echo "<script> alert('$cfname1Err');</script>";
                } elseif ((strlen($clname1) > 10) || (strlen($clname2) > 10)) {
                  $clname1Err = "The name is too long";
                  echo "<script> alert('$clname1Err');</script>";
                } else {
                  if ((ctype_digit($c_occu1)) || (ctype_digit($c_occu2))) {
                    $c_occ1Err = "The occupation should only contain letters!";
                    echo "<script> alert('$c_occ1Err');</script>";
                  } else {
                    if ((ctype_digit($nature1)) || (ctype_digit($nature2))) {
                      $nature1Err = "Nature of the relationship should only contain letters!";
                      echo "<script> alert('$nature1Err');</script>";
                    } else {
                      if (((!filter_var($cemail1, FILTER_VALIDATE_EMAIL)) && !($cemail1 == "")) || ((!filter_var($cemail2, FILTER_VALIDATE_EMAIL)) && !($cemail2 == ""))) {
                        $cemail1Err = "Invalid Email";
                        echo "<script> alert('$cemail1Err');</script>";
                      } else {

                        $sql4 = "SELECT * FROM tenant WHERE u_name = '$uname'";
                        $query = mysqli_query($con, $sql4);
                        if (mysqli_num_rows($query) > 0) {
                          echo "<script> alert('Username exists!!');</script>";
                        } else {
                          if ((strlen($pword) < 8) || (strlen($rpword) < 8)) {
                            echo "<script> alert('Password is too short');</script>";
                          } elseif ($pword == $rpword) {
                            if ($dur == 3) {
                              if (!($term == 1)) {
                                echo "<script> alert('3 months cannot have more than 1 term.');</script>";
                              } else {
                                $pword = md5($pword);
                                // $stmt = $con -> prepare("INSERT INTO tenant (fname, lname, programme, reg_no, occupation, p_no, pno1, e_address, p_address, city, region, u_name, p_word, day_reg, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )");
                                // echo $con->error;
                                // $stmt->bind_param("sssssiissssssss", $fname, $lname, $prog, $reg, $occ, $pno1, $pno2, $email, $postal, $city, $region, $uname, $pword,  $date_reg, $status);


                                // if ($stmt->execute()) { // exactly like this!
                                //   $success = true;
                                // }

                                $sql = "INSERT INTO `tenant`(`fname`, `lname`, `programme`, `reg_no`, `occupation`, `p_no`, `pno1`, `e_address`, `p_address`, `city`, `region`, `u_name`, `p_word`, `day_reg`, `status`) VALUES ('$fname','$lname','$prog','$reg','$occ','$pno1','$pno2','$email','$postal','$city','$region','$uname','$pword', '$date_reg', '$status')";
                                echo $con->error;

                                if (mysqli_query($con, $sql)) {
                                  echo "SUCCESS";
                                } else {
                                  echo "ERROR" . mysqli_error($con);
                                }

                                $last_id = mysqli_insert_id($con);

                                $sql2 = "INSERT INTO tenant_contacts (tenant_id, fname1, lname1, occupation1, nature1, pno1, pno2, e_address1, p_address1, city1, region1, fname2, lname2, occupation2, nature2, pno3, pno4, e_address2, p_address2, city2, region2) VALUES ('$last_id','$cfname1','$clname1','$c_occu1','$nature1','$cpno1','$cpno3','$cemail1','$p_address1','$city1','$region1','$cfname2','$clname2','$c_occu2','$nature2','$cpno2','$cpno4', '$cemail2', '$p_address2', '$city2', '$region2')";

                                mysqli_query($con, $sql2);

                                $sql1 = "INSERT INTO contract (tenant_id, house_id, duration_month, total_rent, terms, rent_per_term, start_day, end_day, date_contract_sign, status) VALUES ('$last_id', '$house','$dur','$total_rent','$term','$rent_per_term','$start_day', '$end_date', '$date_reg1', '$stat')";

                                mysqli_query($con, $sql1);

                                $sql3 = "UPDATE house SET status= '$contract' WHERE house_id = '$house'";
                                mysqli_query($con, $sql3);
                                mysqli_close($con);

                                $full_name = $fname . " " . $lname;
                                $pin = rand(1000, 9999);

                                $sql4 = "INSERT INTO `user`(`name`, `phone`, `email`, `pin_no`, `amount`) VALUES('$full_name', '$pno1', '$email', '$pin', '100000')";

                                if (mysqli_query($conn, $sql4)) {
                                  echo "SUCCESS YA PESA";
                                } else {
                                  echo "ERROR" . mysqli_error($conn);
                                }
                                mysqli_close($conn);


                                echo "<script type='text/javascript'>alert('Welcome $fname $lname! Your contract begins on $start_day and ends on $end_date.');</script>";
                                echo '<style>body{display:none;}</style>';
                                echo '<script>window.location.href = "login.php";</script>';


                              }
                            } elseif ($dur == 6) {
                              if ($term == 4) {
                                echo "<script> alert('6 months cannot have more than 2 term.');</script>";
                              } else {
                                $pword = md5($pword);
                                $sql = "INSERT INTO tenant (fname, lname, programme, reg_no, occupation, p_no, pno1, e_address, p_address, city, region, u_name, p_word, day_reg, status) VALUES ('$fname','$lname','$prog','$reg','$occ','$pno1','$pno2','$email','$postal','$city','$region','$uname','$pword', '$date_reg', '$status')";

                                mysqli_query($con, $sql);

                                $last_id = mysqli_insert_id($con);

                                $sql2 = "INSERT INTO tenant_contacts (tenant_id, fname1, lname1, occupation1, nature1, pno1, pno2, e_address1, p_address1, city1, region1, fname2, lname2, occupation2, nature2, pno3, pno4, e_address2, p_address2, city2, region2) VALUES ('$last_id','$cfname1','$clname1','$c_occu1','$nature1','$cpno1','$cpno3','$cemail1','$p_address1','$city1','$region1','$cfname2','$clname2','$c_occu2','$nature2','$cpno2','$cpno4', '$cemail2', '$p_address2', '$city2', '$region2')";

                                mysqli_query($con, $sql2);

                                $sql1 = "INSERT INTO contract (tenant_id, house_id, duration_month, total_rent, terms, rent_per_term, start_day, end_day, date_contract_sign, status) VALUES ('$last_id', '$house','$dur','$total_rent','$term','$rent_per_term','$start_day', '$end_date', '$date_reg1', '$stat')";

                                mysqli_query($con, $sql1);

                                $sql3 = "UPDATE house SET status= '$contract' WHERE house_id = '$house'";
                                mysqli_query($con, $sql3);
                                mysqli_close($con);

                                $full_name = $fname . " " . $lname;
                                $pin = rand(1000, 9999);

                                $sql4 = "INSERT INTO `user`(`name`, `phone`, `email`, `pin_no`, `amount`) VALUES('$full_name', '$pno1', '$email', '$pin', '100000')";

                                mysqli_query($conn, $sql4);
                                mysqli_close($conn);

                                echo "<script type='text/javascript'>alert('Welcome $fname $lname! Your contract begins on $start_day and ends on $end_date.');</script>";
                                echo '<style>body{display:none;}</style>';
                                echo '<script>window.location.href = "login.php";</script>';
                              }
                            } else {
                              $pword = md5($pword);
                              $sql = "INSERT INTO tenant (fname, lname, programme, reg_no, occupation, p_no, pno1, e_address, p_address, city, region, u_name, p_word, day_reg, status) VALUES ('$fname','$lname','$prog','$reg','$occ','$pno1','$pno2','$email','$postal','$city','$region','$uname','$pword', '$date_reg', '$status')";

                              if (mysqli_query($con, $sql)) {
                                echo "Success";
                              } else {
                                echo "Error";
                              }

                              $last_id = mysqli_insert_id($con);

                              $sql2 = "INSERT INTO tenant_contacts (tenant_id, fname1, lname1, occupation1, nature1, pno1, pno2, e_address1, p_address1, city1, region1, fname2, lname2, occupation2, nature2, pno3, pno4, e_address2, p_address2, city2, region2) VALUES ('$last_id','$cfname1','$clname1','$c_occu1','$nature1','$cpno1','$cpno3','$cemail1','$p_address1','$city1','$region1','$cfname2','$clname2','$c_occu2','$nature2','$cpno2','$cpno4', '$cemail2', '$p_address2', '$city2', '$region2')";

                              if (mysqli_query($con, $sql2)) {
                                echo "Success2";
                              } else {
                                echo "Error2";
                              }

                              $sql1 = "INSERT INTO contract VALUES (tenant_id, house_id, duration_month, total_rent, terms, rent_per_term, start_day, end_day, date_contract_sign, status) ('$last_id', '$house','$dur','$total_rent','$term','$rent_per_term','$start_day', '$end_date', '$date_reg1', '$stat')";

                              if (mysqli_query($con, $sql1)) {
                                echo "Success 3";
                              } else {
                                echo "Error 3";
                              }

                              $sql3 = "UPDATE house SET status= '$contract' WHERE house_id = '$house'";
                              mysqli_query($con, $sql3);
                              mysqli_close($con);

                              $full_name = $fname . " " . $lname;
                              $pin = rand(1000, 9999);

                              $sql4 = "INSERT INTO `user`(`name`, `phone`, `email`, `pin_no`, `amount`) VALUES('$full_name', '$pno1', '$email', '$pin', '100000')";

                              mysqli_query($conn, $sql4);
                              mysqli_close($conn);

                              echo "<script type='text/javascript'>alert('Welcome $fname $lname! Your contract begins on $start_day and ends on $end_date.');</script>";
                              echo '<style>body{display:none;}</style>';
                              echo '<script>window.location.href = "login.php";</script>';
                            }
                          } else {
                            echo "<script> alert('Password does not match');</script>";
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } else {
    $emailErr = "Invalid Email";
    echo "<script> alert('$emailErr');</script>";
  }

?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Rental House Management System</title>
  <link rel="icon" href="rent.ico">

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
  <script src="js/jquery.min.js"></script>

</head>

<body style="background-image: linear-gradient(white,#4e73dd,#4e73df); background-size: cover;">



  <div class="container">

    <div class="card o-hnameden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">

          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4"><b><b>TENANT REGISTRATION</b></b></h1>
              </div>
              <p><span style="color:#4e73df;"><b><b>PERSONAL PARTICULARS</b></b></span></p>
              <form class="user" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="FirstName" value="<?php echo @$fname; ?>" placeholder="First Name" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="LastName" value="<?php echo @$lname; ?>" placeholder="Last Name" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    Are you a student?&nbsp&nbsp&nbsp
                    <input type="radio" name="radio" value="Enable" required>Yes
                  </div>
                  <div class="col-sm-6">
                    <input type="radio" name="radio" value="Disable">No
                  </div>

                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="programme" value="<?php echo @$prog; ?>" placeholder="Programme e.g; BEDA" disabled>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="regno" value="<?php echo @$reg; ?>" placeholder="Registration Number" disabled>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="occupation" value="<?php echo @$occ; ?>" placeholder="Occupation" disabled>
                  </div>
                  <div class="col-sm-6">
                    <input type="number" class="form-control form-control-user" name="pno1" value="<?php echo @$pno1; ?>" placeholder="Phone Number 1 e.g; 254717******" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="number" class="form-control form-control-user" name="pno2" value="<?php echo @$pno2; ?>" placeholder="Phone Number 2 e.g; 254717******">
                  </div>
                  <div class="col-sm-6">
                    <input type="email" class="form-control form-control-user" name="email" value="<?php echo @$email; ?>" placeholder="Email Address" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="postal" value="<?php echo @$postal; ?>" placeholder="Postal Address" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="city" value="<?php echo @$city; ?>" placeholder="City" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="region" value="<?php echo @$region; ?>" placeholder="Region" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="uname" value="<?php echo @$uname; ?>" placeholder="Username" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" name="password" placeholder="Password" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" name="repeatPassword" placeholder="Repeat Password" required>
                  </div>
                </div>
                <hr>
                <p><span style="color:#4e73df;"><b><b>CONTRACT</b></b></span></p>
                <div class="form-group row" align="center">
                  <center>Please click the price of the house you want to rent:<br /></center>
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <?php
                    include('conn.php');
                    $query = mysqli_query($con, "SELECT DISTINCT rent_per_month FROM house");
                    while ($row = mysqli_fetch_array($query)) {
                      $rent = $row['rent_per_month'];
                    ?>
                      <input type="radio" name="price" value="<?php echo $rent; ?>" required>Kshs. <?php echo $rent; ?> &nbsp&nbsp&nbsp
                    <?php }

                    ?>
                  </div>
                </div>
                <div class="form-group row">
                House: &nbsp; &nbsp;
                  <select class="custom-select" name="house" id="values" style="width:200px;">

                  </select>
                </div>
                <div class="form-group row">
                  <p id="values">
                  </p>
                </div>

                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    Contract Duration:<br />
                    <select class="custom-select" name="duration" id="durations" style="width:300px;">
                      <option value="3">3 months</option>
                      <option value="6">6 months</option>
                      <option value="12">12 months</option>
                    </select>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    Payment Terms:<br />
                    <select class="custom-select" name="term" id="terms" style="width:300px;">
                      <option value="1" id="1">1 term</option>
                      <option value="2" id="2">2 terms</option>
                      <option value="4" id="4">4 terms</option>
                    </select>
                  </div>
                </div>
                <hr>
                <p>Please read the contract <span style="color:red;">CAREFULLY</span> and check "I agree" if you agree with the TERMS AND CONDITIONS stated.</p><br />
                <div class="form-group">
                  <iframe src="contract.pdf" width="1000px" height="400px" style="border: none;"></iframe>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="checkbox" name="contract" value="Occupied" required>I agree&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                  </div>
                </div>
                <hr>
                <p><span style="color:#4e73df;"><b><b>CONTACTS' INFORMATION</b></b></span></p>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="fname1" value="<?php echo @$cfname1; ?>" placeholder="First Name" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="fname2" value="<?php echo @$cfname2; ?>" placeholder="First Name" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="lname1" value="<?php echo @$clname1; ?>" placeholder="Last Name" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="lname2" value="<?php echo @$clname2; ?>" placeholder="Last Name" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="occu1" value="<?php echo @$c_occu1; ?>" placeholder="Occupation" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="occu2" value="<?php echo @$c_occu1; ?>" placeholder="Occupation" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="number" class="form-control form-control-user" name="cpno1" value="<?php echo @$cpno1; ?>" placeholder="Phone Number 1 e.g; 254717******" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="number" class="form-control form-control-user" name="cpno2" value="<?php echo @$cpno2; ?>" placeholder="Phone Number 1 e.g; 254717******" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="number" class="form-control form-control-user" name="cpno3" value="<?php echo @$cpno3; ?>" placeholder="Phone Number 2 e.g; 254717******">
                  </div>
                  <div class="col-sm-6">
                    <input type="number" class="form-control form-control-user" name="cpno4" value="<?php echo @$cpno4; ?>" placeholder="Phone Number 2 e.g; 254717******" minlength="12">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="nature1" value="<?php echo @$nature1; ?>" placeholder="Nature of the Relationship" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="nature2" value="<?php echo @$nature2; ?>" placeholder="Nature of the Relationship" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="city1" value="<?php echo @$city1; ?>" placeholder="City" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="city2" value="<?php echo @$city2; ?>" placeholder="City" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="region1" value="<?php echo @$region1; ?>" placeholder="Region" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="region2" value="<?php echo @$region2; ?>" placeholder="Region" required>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="email" class="form-control form-control-user" name="email1" value="<?php echo @$cemail1; ?>" placeholder="Email Address">
                  </div>
                  <div class="col-sm-6">
                    <input type="email" class="form-control form-control-user" name="email2" value="<?php echo @$cemail2; ?>" placeholder="Email Address">
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" name="p_address1" value="<?php echo @$p_address1; ?>" placeholder="Postal Address" required>
                  </div>
                  <div class="col-sm-6">
                    <input type="text" class="form-control form-control-user" name="p_address2" value="<?php echo @$p_address2; ?>" placeholder="Postal Address" required>
                  </div>
                </div>
                <hr>
                <center>

                  <input class="btn btn-primary btn-user btn-sm" type="submit" name="submit" value="Register Account">

                </center>

              </form>

              <div class="text-center">
                <a class="small" href="forgot-password.php">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="login.php">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
  <script type="text/javascript">
    $('input[name = "radio"]').on('change', function() {
      $('input[name = "programme"]').attr('disabled', this.value != "Enable");
      $('input[name = "regno"]').attr('disabled', this.value != "Enable");
      $('input[name = "occupation"]').attr('disabled', this.value != "Disable");
      $('input[name = "programme"]').attr('required', this.value == "Enable");
      $('input[name = "regno"]').attr('required', this.value == "Enable");
      $('input[name = "occupation"]').attr('required', this.value == "Disable");
    });
  </script>
  <script type="text/javascript">
    $("#durations").on('change', function() {
      $('#terms option[value = 2]').attr('disabled', this.value == 3);
      $('#terms option[value = 4]').attr('disabled', this.value == 3);
      $('#terms option[value = 4]').attr('disabled', this.value == 6);

    });
  </script>
  <script>
    $(document).ready(function() {
      $('input:checkbox').click(function() {
        $('input:checkbox').not(this).prop('checked', false);
      });
    });
  </script>
  <script type="text/javascript">
    $(document).ready(function() {
      $("input[name='price']").click(function() {
        var radioValue = $("input[name='price']:checked").val();
        if (radioValue == 8000) {
          var out = "<?php $con = mysqli_connect('localhost', 'root', '');
                      mysqli_select_db($con, 'rental_house');
                      $sql = "SELECT house_id,house_name FROM house WHERE rent_per_month = '8000' AND status = 'Empty'";
                      $res = mysqli_query($con, $sql);
                      $row = mysqli_fetch_assoc($res);
                      echo "<div class='col-sm-6 mb-3 mb-sm-0'>";
                      echo "<select class='custom-select' style='width:200px;' name = 'house'>";
                      do {
                        echo "<option value =' " . $row["house_id"] . "'>" . $row["house_name"] . "</option>";
                        $row = mysqli_fetch_assoc($res);
                      } while ($row);
                      echo "</select>";
                      echo "</div>";
                      ?>";
          document.getElementById("values").innerHTML = out;

        } else if (radioValue == 6000) {
          var out = "<?php $con = mysqli_connect('localhost', 'root', '');
                      mysqli_select_db($con, 'rental_house');
                      $sql = "SELECT house_id,house_name FROM house WHERE rent_per_month = '6000' AND status = 'Empty'";
                      $res = mysqli_query($con, $sql);
                      $row = mysqli_fetch_assoc($res);
                      echo "<div class='col-sm-6 mb-3 mb-sm-0'>";
                      echo "<select class='custom-select' style='width:200px;' name = 'house'>";
                      do {
                        echo "<option value =' " . $row["house_id"] . "'>" . $row["house_name"] . "</option>";
                        $row = mysqli_fetch_assoc($res);
                      } while ($row);
                      echo "</select>";
                      echo "</div>";
                      ?>";
          document.getElementById("values").innerHTML = out;
        } else if (radioValue == 7000) {
          var out = "<?php $con = mysqli_connect('localhost', 'root', '');
                      mysqli_select_db($con, 'rental_house');
                      $sql = "SELECT house_id,house_name FROM house WHERE rent_per_month = '7000' AND status = 'Empty'";
                      $res = mysqli_query($con, $sql);
                      $row = mysqli_fetch_assoc($res);
                      echo "<div class='col-sm-6 mb-3 mb-sm-0'>";
                      echo "<select class='custom-select' style='width:200px;' name = 'house'>";
                      do {
                        echo "<option value =' " . $row["house_id"] . "'>" . $row["house_name"] . "</option>";
                        $row = mysqli_fetch_assoc($res);
                      } while ($row);
                      echo "</select>";
                      echo "</div>";
                      ?>";
          document.getElementById("values").innerHTML = out;
        } else {
          var out = "<?php $con = mysqli_connect('localhost', 'root', '');
                      mysqli_select_db($con, 'rental_house');
                      $sql = "SELECT house_id,house_name FROM house WHERE rent_per_month = '10000' AND status = 'Empty'";
                      $res = mysqli_query($con, $sql);
                      $row = mysqli_fetch_assoc($res);
                      echo "<div class='col-sm-6 mb-3 mb-sm-0'>";
                      echo "<select class='custom-select' style='width:200px;' name = 'house'>";
                      do {
                        echo "<option value =' " . $row["house_id"] . "'>" . $row["house_name"] . "</option>";
                        $row = mysqli_fetch_assoc($res);
                      } while ($row);
                      echo "</select>";
                      echo "</div>";
                      ?>";
          document.getElementById("values").innerHTML = out;
        }
      });

    });
  </script>

  <script type="text/javascript">
    $(document).ready(function() {
      $("input[name='price']").click(function() {
        var radioValue = $("input[name='price']:checked").val();
        if (radioValue == 6000) {
          var out =
            "<?php $con = mysqli_connect('localhost', 'root', '');
              mysqli_select_db($con, 'rental_house');
              $sql = "SELECT house_id,house_name FROM house WHERE rent_per_month = '6000' AND status = 'Empty'";
              $res = mysqli_query($con, $sql);
              $row = mysqli_fetch_assoc($res);


              if (mysqli_num_rows($res) > 0) {

                do {

                  echo "<option value ='" . $row["house_id"] . "'>" . $row["house_name"] . "</option>";
                  $row = mysqli_fetch_assoc($res);
                } while ($row);
              } else {

                echo "<option selected disabled>No rooms available</option>";
              }


              ?>";
          document.getElementById("values").innerHTML = out;

        } else if (radioValue == 7000) {
          var out = "<?php $con = mysqli_connect('localhost', 'root', '');
                      mysqli_select_db($con, 'rental_house');
                      $sql = "SELECT house_id,house_name FROM house WHERE rent_per_month = '7000' AND status = 'Empty'";
                      $res = mysqli_query($con, $sql);
                      $row = mysqli_fetch_assoc($res);
                      if (mysqli_num_rows($res) > 0) {

                        do {

                          echo "<option value ='" . $row["house_id"] . "' selected>" . $row["house_name"] . "</option>";
                          $row = mysqli_fetch_assoc($res);
                        } while ($row);
                      } else {

                        echo "<option selected disabled>No rooms available</option>";
                      }

                      ?>";
          document.getElementById("values").innerHTML = out;
        } else if (radioValue == 8000) {
          var out = "<?php $con = mysqli_connect('localhost', 'root', '');
                      mysqli_select_db($con, 'rental_house');
                      $sql = "SELECT house_id,house_name FROM house WHERE rent_per_month = '8000' AND status = 'Empty'";
                      $res = mysqli_query($con, $sql);
                      $row = mysqli_fetch_assoc($res);

                      if (mysqli_num_rows($res) > 0) {

                        do {

                          echo "<option value ='" . $row["house_id"] . "'>" . $row["house_name"] . "</option>";
                          $row = mysqli_fetch_assoc($res);
                        } while ($row);
                      } else {

                        echo "<option selected disabled>No rooms available</option>";
                      }

                      ?>";
          document.getElementById("values").innerHTML = out;
        } else {
          var out = "<?php $con = mysqli_connect('localhost', 'root', '');
                      mysqli_select_db($con, 'rental_house');
                      $sql = "SELECT house_id,house_name FROM house WHERE rent_per_month = '10000' AND status = 'Empty'";
                      $res = mysqli_query($con, $sql);
                      $row = mysqli_fetch_assoc($res);

                      if (mysqli_num_rows($res) > 0) {

                        do {

                          echo "<option value ='" . $row["house_id"] . "'>" . $row["house_name"] . "</option>";
                          $row = mysqli_fetch_assoc($res);
                        } while ($row);
                      } else {

                        echo "<option selected disabled>No rooms available</option>";
                      }

                      ?>";
          document.getElementById("values").innerHTML = out;
        }
      });

    });
  </script>



  <script>
    if (window.history.replaceState) {
      window.history.replaceState(null, null, window.location.href);
    }
  </script>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="js/jquery-1.12.4.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>


</body>

</html>