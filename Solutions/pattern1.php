
<html>
	<body>
		<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
			<input type="text" name="number">
			<input type="submit" value="pattern" name="btn1">
		</form>
	</body>
</html>


<?php

if (isset($_POST['btn1']))
{
	
$n=$_POST['number'];

	for($i=1;$i<=$n;$i++)
	{
		for($j=$n;$j>=$i;$j--)
		{
			echo "&nbsp;&nbsp;";
		}
		for($k=1;$k<=$i;$k++)
		{
			echo ($k);
		}
		for($l=$i-1;$l>=1;$l--)
		{
			echo ($l);
		}
		echo "<br>";
	}

}

?>