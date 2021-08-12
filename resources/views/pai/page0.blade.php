<html style="page-break-inside: avoid;"><style>p.small{font-size:12px;}.img{width:795px;height:1140px;overflow: hidden;}html,body{margin:0;padding:0;}</style><body>
	<p style="position: fixed;top:170px;left:250px"><?php echo $patient->name ?? '' ;?></p>

    <p style="position: fixed;top:195px;left:250px"><?php echo $patient->birth_date ?? '' ;?></p>

    <p style="position: fixed;top:218px;left:250px"><?php echo $patient->poblacio ?? ' ' . ' ' . $patient->cp ?? '' ;?></p>

    <p style="position: fixed;top:240px;left:250px"><?php echo $patient->province ?? ''; ?></p>

	<p style="position: fixed;top:265px;left:250px"><?php echo $patient->address ?? '' ;?></p>

    <p style="position: fixed;top:288px;left:250px"><?php echo $patient->phone ?? '' ;?></p>

	<p style="position: fixed;top:310px;left:250px"><?php echo $patient->referent ?? '' ;?></p>

	{{-- ///////////////////////////////////////////////////////////////////////////////////// --}}


	<p class="small" style="position: fixed;top:460px;left:420px;width:280px;"><?php echo $patient->pai->background ?? '' ;?></p>

	<p class="small" style="position: fixed;top:530px;left:420px;width:280px;"><?php echo $patient->pai->hypertension ?? '';?></p>

	<p class="small" style="position: fixed;top:640px;left:420px;width:280px;"><?php echo $patient->pai->diabetes ?? '' ;?></p>






    <img class="img" src="img/contracts/pai/PAI1.jpg"></body></html>
