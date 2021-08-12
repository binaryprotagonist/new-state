<html style="padding:0;margin:0;page-break-inside: avoid;"><style>.img{width:795px;height:1140px;overflow: hidden;}</style><body style="padding:0;margin:0">
	<p style="position: fixed;top:158px;left:247px"><?php echo date('j') . ' /'; ?></p>
	<p style="position: fixed;top:158px;left:280px"><?php echo date('m'); ?></p>
	<p style="position: fixed;top:158px;left:380px"><?php echo date('Y'); ?></p>

	<p style="position: fixed;top:276px;left:225px;"><?php echo $patient->residence_entity->name; ?></p>

	<p style="position: fixed;top:295px;left:355px"><?php echo $patient->legal_name; ?></p>
	<p style="position: fixed;top:314px;left:410px"><?php echo $patient->residence_entity->address ; ?></p>


	<p style="position: fixed;top:314px;left:166px"><?php echo $patient->legal_dni; ?></p>
	<p style="position: fixed;top:333px;left:295px"><?php echo $patient->name . ' ' . $patient->last_name; ?></p>


	<p style="position: fixed;top:520px;left:176px"><?php echo $patient->residence_entity->name ; ?></p>
	<p style="position: fixed;top:539px;left:156px"><?php echo $patient->residence_entity->address ; ?></p>

	<p style="position: fixed;top:558px;left:170px"><?php echo $patient->name . ' ' . $patient->last_name; ?></p>
	<p style="position: fixed;top:558px;left:483px"><?php echo $patient->dni; ?></p>

	<p style="position: fixed;top:765px;left:163px"><?php echo $patient->name . ' ' . $patient->last_name; ?></p>
	<img class="img" src="img/contracts/client/page3.jpg"></body></html>
