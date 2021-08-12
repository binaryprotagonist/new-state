<html style="padding:0;margin:0;page-break-inside: avoid;"><style>.img{width:795px;height:1140px;overflow: hidden;}</style><body style="padding:0;margin:0">

		<p style="position: fixed;top:765px;left:120px"><?php // echo "$patient->name"; ?></p>
		<p style="position: fixed;top:785px;left:220px"><?php // echo "$patient->name"; ?></p>

	<p style="position: fixed;top:742px;left:140px"><?php echo $patient->residence_entity->name; ?></p>
	<p style="position: fixed;top:760px;left:140px"><?php echo $patient->residence_entity->address; ?></p>
	<p style="position: fixed;top:780px;left:140px"><?php echo $patient->residence_entity->cp . '- ' .  $patient->residence_entity->province; ?></p>

	<p style="position: fixed;top:799px;left:230px"><?php echo $patient->legal_name; ?></p>
	<p style="position: fixed;top:818px;left:184px"><?php echo $patient['email']; ?></p>




	<img class="img" src="img/contracts/client/page6.jpg"></body></html>
