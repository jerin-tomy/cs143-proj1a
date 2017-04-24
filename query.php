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

    <form method="get">
        <textarea name="comment" cols="60" rows="8"><?php echo $_GET['comment'];?></textarea><br />
        <input type="submit" value="Submit" />
    </form>

    <?php
        $mysql = mysql_connect("localhost", "cs143", "");
        mysql_select_db("CS143", $mysql);
        $result = mysql_query($comment,$mysql);

        echo '<table border=1 cellspacing=1 cellpadding=1>';

        echo "<tr>";
        for($i=0; $i<mysql_num_fields($result); $i++){
            $field = mysql_fetch_field($result, $i);
            echo '<th>'.$field->name.'</th>';
        }
        echo "</tr>";

        while ($row = mysql_fetch_assoc($result)){
            echo "<tr>";
            foreach ($row as $element){
                if (strlen($element) == 0){
                    echo "<td>N/A</td>";
                }
                else{
                    echo "<td>".$element."</td>";
                }
            }
            echo "</tr>";
        }
        echo '</table>';
    ?>

</body>
</html>

