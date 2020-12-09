<html>
	<body>
	<style>
		table td 
		{
		width: 15px;
		text-align:center;
		}
	</style>
	
		<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
			<input type="text" name="number">
			<input type="submit" value="pattern" name="btn1">
		</form>
		
<?php
echo "<table>";
if (isset($_POST['btn1']))
{	
$n=$_POST['number'];
	if($n % 2 ==0)
	{
		echo "Only odd number allowed";
	}
	else
	{
		$n=intval(($n/2)+1);
		for($i=1;$i<=$n;$i++)
		{
			echo "<tr >";
			if($i % 2 == 0)
			{
						
				for($j=$n;$j>=$i;$j--)
				{
				echo "<td>&nbsp;</td>";
				}
				for($k=1;$k<=$i;$k++)
				{
					echo ("<td bgColor='#F1E5E2'>".$k."</td>");
				}
				for($l=$i-1;$l>=1;$l--)
				{
					echo ("<td bgColor='#F1E5E2'>".$l."</td>");
				}
			}
			else
			{
				for($j=$n;$j>=$i;$j--)
				{
				echo "<td>&nbsp;</td>";
				}
				for($k=1;$k<=$i;$k++)
				{
					echo ("<td bgColor='#F9F7F7'>".$k."</td>");
				}
				for($l=$i-1;$l>=1;$l--)
				{
					echo ("<td bgColor='#F9F7F7'>".$l."</td>");
				}
			}
			echo "</tr>";
		}
		for($i=$n-1;$i>=1;$i--)
		{
				echo "<tr >";
				
				if($i % 2 ==0)
				{
					for($j=$n;$j>=$i;$j--)
					{
						echo "<td>&nbsp;</td>";
					}
					for($k=1;$k<=$i;$k++)
					{
						echo ("<td bgColor='#F1E5E2'>" . $k . "</td>");
					}
					for($l=$i-1;$l>=1;$l--)
					{
						echo ("<td bgColor='#F1E5E2'>".$l."</td>");
					}
				}
				else
				{
					for($j=$n;$j>=$i;$j--)
					{
						echo "<td>&nbsp;</td>";
					}
					
					for($k=1;$k<=$i;$k++)
					{
						echo ("<td bgColor='#F9F7F7'>" . $k . "</td>");
					}
					for($l=$i-1;$l>=1;$l--)
					{
						echo ("<td bgColor='#F9F7F7'>".$l."</td>");
					}
				}
			echo "</tr>";
		}
	}
}
?>
		</table>
	</body>
</html>