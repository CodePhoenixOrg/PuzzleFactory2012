<center>
<?php    
	include_once 'menus_code.php';
	if($query=="SELECT") {
			$sql="select me_id, me_level from menus order by me_id";
			$dbgrid=create_pager_db_grid("menus", $sql, $id, "page.php", "&query=ACTION$curl_pager", "", true, true, $dialog, array(0, 400), 15, $grid_colors, $cs);
			//$dbgrid=table_shadow("menus", $dbgrid);
			echo "<br>".$dbgrid;
	} elseif($query=="ACTION") {
?>
<form method='POST' name='menusForm' action='page.php?id=18&lg=fr'>
	<input type='hidden' name='query' value='ACTION'>
	<input type='hidden' name='event' value='onRun'>
	<input type='hidden' name='pc' value='<?php    echo $pc?>'>
	<input type='hidden' name='sr' value='<?php    echo $sr?>'>
	<input type='hidden' name='me_id' value='<?php    echo $me_id?>'>
	<table border='1' bordercolor='<?php    echo $panel_colors["border_color"]?>' cellpadding='0' cellspacing='0' witdh='100%' height='1'>
		<tr>
			<td align='center' valign='top' bgcolor='<?php    echo $panel_colors["back_color"]?>'>
				<table>
				<tr>
					<td>me_id</td>
					<td>
						<?php    echo $me_id?>
					</td>
				</tr>
				<tr>
					<td>me_level</td>
					<td>
						<input type='text' name='me_level' value='<?php    echo $me_level?>'>
					</td>
				</tr>
				<tr>
					<td>me_target</td>
					<td>
						<input type='text' name='me_target' value='<?php    echo $me_target?>'>
					</td>
				</tr>
				<tr>
					<td>pa_id</td>
					<td>
						<select name='pa_id'>
						<?php    $sql='select pa_id, di_name from pages order by di_name';
						$options=create_options_from_query($sql, 0, 1, array(), $pa_id, false, $cs);
						echo $options["list"];?>
						</select>
					</td>
				</tr>
				<tr>
					<td>bl_id</td>
					<td>
						<select name='bl_id'>
						<?php    $sql='select bl_id, bl_column from blocks order by bl_column';
						$options=create_options_from_query($sql, 0, 1, array(), $bl_id, false, $cs);
						echo $options["list"];?>
						</select>
					</td>
				</tr>
				<tr>
					<td>di_name</td>
					<td>
						<select name='di_name'>
						<?php    $sql='select di_name, di_fr_short from dictionary order by di_fr_short';
						$options=create_options_from_query($sql, 0, 1, array(), $di_name, false, $cs);
						echo $options["list"];?>
						</select>
					</td>
				</tr>
				<tr>
					<td>grp_group</td>
					<td>
						<select name='grp_group'>
						<?php    $sql='select grp_group, grp_members_priv from groups order by grp_members_priv';
						$options=create_options_from_query($sql, 0, 1, array(), $grp_group, false, $cs);
						echo $options["list"];?>
						</select>
					</td>
				</tr>
				<tr>
					<td>me_charset</td>
					<td>
						<input type='text' name='me_charset' value='<?php    echo $me_charset?>'>
					</td>
				</tr>
					<tr>
						<td align='center' colspan='2'>
							<input type='submit' name='action' value='<?php    echo $action?>'>
							<?php    if($action!="Ajouter") { ?>
								<input type='submit' name='action' value='Supprimer'>
							<?php    } ?>
							<input type='reset' name='action' value='Annuler'>
							<input type='submit' name='action' value='Retour'>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<?php    	} ?>
</center>
