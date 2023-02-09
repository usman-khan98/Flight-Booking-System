<!DOCTYPE html>
<html>
<html lang="en">

<head>
  <title>Search Flights</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="shortcut icon" type="image/x-icon" href="https://lh3.googleusercontent.com/-HtZivmahJYI/VUZKoVuFx3I/AAAAAAAAAcM/thmMtUUPjbA/Blue_square_A-3.PNG" />
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="forcompany.css">
  <link rel="stylesheet" href="homepage.css">
  <link rel="stylesheet" href="AdminSignin.css">
  <script src="login.js"> </script>
  <link rel="stylesheet" type="text/css" href="Search.css">
  <script src="notavailable.js"></script>
</head>

<body>

  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="homepage.html"><span class="glyphicon glyphicon-home"></span> Home</a>
      </div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown" id="new">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user"> Sign in&nbsp;</span><span class="caret"></span>
            </a>
            <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
              <li><a href="signup.html">Register</a></li>

              <li class="dropdown-submenu">
                <a tabindex="-1" href="#">Sign in</a>
                <ul class="dropdown-menu">
                  <li><a tabindex="-1" href="Adminpage.html">Manager Sign in</a></li>
                  <li><a href="customersignin.html">Customer Sign in</a></li>


              </li>
            </ul>
          </li>

        </ul>
        </li>
        <li class="dropdown" id="old">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user" id="wuser">Welcom!</span>
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
            <li><a href="showhistory.php">History</a></li>
            <li><a href="#" id="logout">Sign out</a></li>
          </ul>
        </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="jumbotron text-center">
    <h1>Airprice.com</h1>
    <p>We specialize in your air plan!</p>
  </div>


  <div class="container-fluid text-center">
    <div class="row content">
      <div class="col-sm-2 sidenav">

      </div>
      <div class="col-sm-8 text-left">
        <h1>Search Results</h1>



<?php

$pass = true;
if($_SERVER["REQUEST_METHOD"] == "POST"){

    if(!empty($_POST["from"])){
        $from = sanitize($_POST["from"]);
        if(!preg_match("/^[a-zA-Z\s]*$/", $from)){
            $pass = false;
        }
    }
    if(!empty($_POST["to"])){
        $to = sanitize($_POST["to"]);
        if(!preg_match("/^[a-zA-Z\s]*$/", $to)){
            $pass = false;
        }
    }

    $depart = $_POST["depart"];
    $return = $_POST["return"];
    $class = $_POST["class"];
    $stop = $_POST["stop"];

    if($pass == true){
        global $sql,$sql2;
        include_once 'dbconnect2.php';
        //search by code only, non-stop
        $sql = "SELECT FL.number AS FLnumber, company, type, departure, d_time, arrival, a_time, C.name AS classname, capacity, price
                FROM flight FL,  class C, airplane AP , airport A
                WHERE (FL.number = C.number) AND (FL.airplane_id = AP.ID) AND C.name = '$class' AND
                ((departure = '$from') AND (arrival = '$to'))
                GROUP BY FL.number            
                ORDER BY FL.number";
        $result = mysqli_query($con,$sql);

        $rowcount = mysqli_num_rows($result);

        //search return flight

        $sql2 = "SELECT FL.number AS FLnumber, company, type, departure, d_time, arrival, a_time, C.name AS classname, capacity, price
                FROM flight FL,  class C, airplane AP , airport A
                WHERE (FL.number = C.number) AND (FL.airplane_id = AP.ID) AND C.name = '$class' AND
                ((departure = '$to') AND (arrival = '$from'))
                GROUP BY FL.number            
                ORDER BY FL.number";
        $result2 = mysqli_query($con,$sql2);

        $rowcount2 = mysqli_num_rows($result2);

        $rowtotal = $rowcount*$rowcount2;

        if($rowtotal == 0){
            echo "<div class='alert alert-info'><strong>Search Result: </strong>".$rowtotal." result</div>";
        }
        else{
            echo "<div class='alert alert-info'><strong>Search Result: </strong>".$rowtotal." result(s)</div>";
        
            echo "<table class='table table-bordered table-striped table-hover'>
                  <thead>
                  <tr>
                    <th>Flight</th>
                    <th>Aircraft</th>
                    <th>Date</th>
                    <th>Departure</th>
                    <th>Departure Time</th>
                    <th>Arrival</th>
                    <th>Arrival Time</th>
                    <th>Class</th>
                    <th>Capacity</th>
                    <th>Price</th>
                  </tr>
                  </thead>";
            while($row = mysqli_fetch_array($result)){
                echo "<tbody>";
            
                if($rowcount2>0){
                    while($row2 = mysqli_fetch_array($result2)){
        
                        echo "<tr>";
                        echo "<td>" . $row['FLnumber'] . "</td>";
                        echo "<td>" . $row['company']." ".$row['type']. "</td>";
                        echo "<td>" . $depart . "</td>";
                        echo "<td>" . $row['departure'] . "</td>";
                        echo "<td>" . $row['d_time'] . "</td>";
                        echo "<td>" . $row['arrival'] . "</td>";
                        echo "<td>" . $row['a_time'] . "</td>";
                        echo "<td>" . $row['classname'] . "</td>";
                        echo "<td>" . $row['capacity'] . "</td>";
                        echo "<td>" . $row['price'] . "</td>";
                        echo "<td></td>";
                        echo "</tr>";
                
                        echo "<tr>";
                        echo "<td>" . $row2['FLnumber'] . "</td>";
                        echo "<td>" . $row2['company']." ".$row2['type']. "</td>";
                        echo "<td>" . $return . "</td>";
                        echo "<td>" . $row2['departure'] . "</td>";
                        echo "<td>" . $row2['d_time'] . "</td>";
                        echo "<td>" . $row2['arrival'] . "</td>";
                        echo "<td>" . $row2['a_time'] . "</td>";
                        echo "<td>" . $row2['classname'] . "</td>";
                        echo "<td>" . $row2['capacity'] . "</td>";
                        echo "<td>" . $row2['price'] . "</td>";
                        echo "</tr>";
            
                    } 
                }
            }
            echo " </tbody></table>";
        }
    }
}

function sanitize($data){
    $data = trim($data);
    $data = stripcslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}

mysqli_close($con);
?>