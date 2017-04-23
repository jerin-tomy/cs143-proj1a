<html>
<head>
<?php $title = "Web Query Interface" ?>
<title><?php print "$title"; ?></title>
</head>

<body bgcolor=white>
<?php 
	$comment = "";
	if (empty($_POST["comment"])) {
    $comment = "";
  } else {
    $comment = trim($_POST["comment"]);
  }

?>

<h1><?php print "$title"; ?></h1>

<textarea name="comment" cols="60" rows="8"><?php echo $comment;?></textarea><br />
<input type="submit" value="Submit" />
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