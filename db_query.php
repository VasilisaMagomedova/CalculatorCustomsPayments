<?php
header('Access-Control-Allow-Origin: *');
$query_number = intval($_GET['q']);

$con = mysqli_connect('localhost','mysql','mysql','calc_customs_payments');
if (!$con) {
  die('Could not connect: ' . mysqli_error($con));
}

mysqli_select_db($con,"calc_customs_payments");

switch ($query_number) {
    case 1:
        $sql="SELECT distinct Transport_means FROM goods_categories WHERE Transport_means IS NOT NULL";
		$result = mysqli_query($con,$sql);
		$rownum = 0;
		while($row = mysqli_fetch_array($result)) {
				$rownum += 1;
		  echo "<option value='".$rownum."'>" . $row['Transport_means'] . "</option>";
		}
        break;
    case 2:
        $sql="SELECT distinct Import_way FROM goods_categories";
		$result = mysqli_query($con,$sql);
		$rownum = 0;
		while($row = mysqli_fetch_array($result)) {
				$rownum += 1;
		  echo "<option value='".$rownum."'>" . $row['Import_way'] . "</option>";
		}
        break;
    case 3:
        $sql="SELECT Currency_name FROM currency";
		$result = mysqli_query($con,$sql);
		$rownum = 0;
		while($row = mysqli_fetch_array($result)) {
				$rownum += 1;
		  echo "<option value='".$rownum."'>" . $row['Currency_name'] . "</option>";
		}
        break;
}

mysqli_close($con);
?>