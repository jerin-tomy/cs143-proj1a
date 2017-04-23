<html>
<head>
<?php $title = "Web Query Interface" ?>
<title><?php print "$title"; ?></title>
</head>

<body bgcolor=white>
<?php 
	$comment = "";
	if (empty($_GET["comment"])) {
    $comment = "";
  } else {
    $comment = trim($_GET["comment"]);
  }

?>

<h1><?php print "$title"; ?></h1>

<form method="get" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>"
<textarea name="comment" cols="60" rows="8"><?php echo $comment;?></textarea><br />
<input type="submit" value="Submit" />
</form>

<table> 
<?php
	
  $mysqli = new mysqli("localhost:1438", "cs143", "", "CS143");
  $result = $mysqli->query($comment);
  while ($row = $result->fetch_assoc()){
	echo "<tr>";
	foreach ($row as $element){
		echo "<td>".$element."</td>";
	}
	echo "</tr>";
  }
  


?>

</table>
</body>
</html>