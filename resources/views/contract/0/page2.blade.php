<html style="padding:0;margin:0;page-break-inside: avoid;"><style>.img{width:795px;height:1140px;overflow: hidden;}</style><body style="padding:0;margin:0">
	<p style="position: fixed;top:208px;left:260px"><?php echo date('j') ?></p>
	<p style="position: fixed;top:208px;left:310px"><?php echo date('m'); ?></p>
	<p style="position: fixed;top:208px;left:390px"><?php echo date('y'); ?></p>


	<p style="position: fixed;top:469px;left:300px"><?php echo $patient->name . ' ' . $patient->last_name; ?></p>
	<p style="position: fixed;top:489px;left:548px"><?php echo $patient->dni; ?></p>

	<!--<p style="position: fixed;top:520px;left:176px"><?php echo $patient->residence_entity->name ; ?></p>
	<p style="position: fixed;top:539px;left:156px"><?php echo $patient->residence_entity->address ; ?></p>

	<p style="position: fixed;top:558px;left:170px"><?php echo $patient->name . ' ' . $patient->last_name; ?></p>
	<p style="position: fixed;top:558px;left:483px"><?php echo $patient->dni; ?></p>-->

	<p style="position: fixed;top:754px;left:233px"><?php echo $patient->residence_entity->name ; ?></p>
	<p style="position: fixed;top:790px;left:196px"><?php echo $patient->residence_entity->address; ?></p>
	<p style="position: fixed;top:810px;left:170px"><?php echo $patient->name . ' ' . $patient->last_name; ?></p>
	<img class="img" src="img/contracts/client/0/page3.jpg"></body></html>
