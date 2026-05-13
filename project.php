
<?php
include("connection.php");
$result = [];

?>

<?php
	if(isset($_POST['searchdata']))
	{
		$search = $_POST['search'];

		$query = "SELECT * FROM project WHERE id = '$search' ";
		$data = mysqli_query($conn, $query);

		$result = mysqli_fetch_assoc($data);

		if($result)
    {
                $name = $result['emp_name'];
    }
    else
    {
        echo "<script>alert('No Record Found')</script>";
        $result = [];
    }

	}

	if(isset($_POST['clear']))
{
    $result = [];
    header("Location: ".$_SERVER['PHP_SELF']);
    exit();
}

?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Software Development</title>

	<link rel="stylesheet" type="text/css" href="style.css">
	
</head>

<body>
	<div class="center">
		<form action="#" method="POST">

		<h1>Employee Data Entry Automation Software</h1>

		<div class="form">
			<input type="text" name="search" class="textfield" placeholder="Search ID"
			value="<?php echo isset($result['id']) ? $result['id'] : ''; ?>">
			<input type="text" name="name" class="textfield" placeholder="Employee Name"value="<?php echo isset($result['emp_name']) ? $result['emp_name'] : ''; ?>">



			<select class="textfield" name="gender">
				<option value="Not Selected">Select Gender</option>
				<option value="Male" <?php if(isset($result['emp_gender']) && $result['emp_gender'] == 'Male') echo 'selected'; ?>>Male</option>
<option value="Female" <?php if(isset($result['emp_gender']) && $result['emp_gender'] == 'Female') echo 'selected'; ?>>Female</option>
<option value="Other" <?php if(isset($result['emp_gender']) && $result['emp_gender'] == 'Other') echo 'selected'; ?>>Other</option>
				

			</select>


			<input type="text" name="email" class="textfield" placeholder="Email Address" value="<?php echo isset($result['emp_email']) ? $result['emp_email'] : ''; ?>">
			
			<select class="textfield" name="department">
				<option value="Not Selected">Select Department</option>
				<option value="IT"
				<?php 
				if(isset($result['emp_department']) && $result['emp_department'] == 'IT')
				{
				 echo "selected";
				}
				?>
				>IT</option>

				<option value="ACCOUNTS"
				<?php 
				if(isset($result['emp_department']) && $result['emp_department'] == 'ACCOUNTS')
				{
				 echo "selected";
				}
				?>
				>ACCOUNTS</option>

				<option value="SALES"
				<?php 
				if(isset($result['emp_department']) && $result['emp_department'] == 'SALES')
				{
				 echo "selected";
				}
				?>
				>SALES</option>

				<option value="HR"
				<?php 
				if(isset($result['emp_department']) && $result['emp_department'] == 'HR')
				{
				 echo "selected";
				}
				?>
				>HR</option>

				<option value="BUSINESS DEVELOPMENT"
				<?php 
				if(isset($result['emp_department']) && $result['emp_department'] == 'BUSINESS DEVELOPMENT')
				{
				 echo "selected";
				}
				?>
				>BUSINESS DEVELOPMENT</option>

				<option value="MARKETING"
				<?php 
				if(isset($result['emp_department']) && $result['emp_department'] == 'MARKETING')
				{
				 echo "selected";
				}
				?>
				>MARKETING</option>

			</select>

			<textarea placeholder="Address" name="address"><?php echo isset($result['emp_address']) ? $result['emp_address'] : ''; ?>
				
			</textarea>

			<input type="Submit" value="Search" name="searchdata" class="btn">

			<input type="Submit" name="save" value="Save" class="btn" style="background-color: green;">

			<input type="Submit" value="Update" name="update" class="btn"style="background-color: orange;">

			<input type="Submit" value="Delete" name="delete" class="btn"style="background-color: red;" onclick="return checkdelete()">

			<input type="Submit" value="Clear" name="" class="btn"style="background-color: blue;">



		</div>
		
	</div>
	</form>


</body>

</html>

<script>
	function checkdelete() 
	{
		return confirm('Are you sure you want to delete this record?')
	}
		
</script>



<?php
	if(isset($_POST['save']))
	{
		$name       = $_POST['name'];
		$gender     = $_POST['gender'];
		$email      = $_POST['email'];
		$department = $_POST['department'];
		$address    = $_POST['address'];

		$query = "INSERT INTO project(emp_name,emp_gender,emp_email,emp_department,emp_address) VALUES('$name','$gender','$email','$department','$address')";

		$data = mysqli_query($conn,$query);

		if($data)
		{
			echo "<script> alert('Data saved into Database') </script>";
		}

		else
		{
			echo "<script> alert ('failed to save data') <script>";
		}

	}
?>




<?php

    if(isset($_POST['delete']))
	{
		$id = $_POST['search'];

	    echo $id;

	$query = "DELETE FROM project WHERE id = '$id' ";
	
	$data = mysqli_query($conn, $query);

	if($data)
	{
		echo "<script> alert('Record deleted') </script>";
	}
	else
	{
		echo "<script> alert('Faild to deleted') </script>";
	}

  }

?>


<?php 

if(isset($_POST['update']))
{
        $id         = $_POST['search'];
        $name       = $_POST['name'];
		$gender     = $_POST['gender'];
		$email      = $_POST['email'];
		$department = $_POST['department'];
		$address    = $_POST['address'];

		$query = "UPDATE project SET emp_name = '$name',emp_gender = '$gender',emp_email = '$email',emp_department = '$department',emp_address = '$address' WHERE id = '$id' ";


	$data = mysqli_query($conn, $query);

	if($data)
	{
		echo "<script> alert('Record Updated') </script>";
	}
	else
	{
		echo "<script> alert('Faild to Update') </script>";
	}

}


?>






