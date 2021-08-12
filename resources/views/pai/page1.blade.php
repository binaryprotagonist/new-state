<html style="page-break-inside: avoid;"><style>p{font-size:12px;}.img{width:795px;height:1140px;overflow: hidden;}html,body{margin:0;padding:0;}</style><body>
    	<p style="position: fixed;top:170px;left:420px;width:280px;"><?php echo $patient->pai->diagnostics ?? ''; ?></p>

    <p style="position: fixed;top:310px;left:420px;width:280px;"><?php echo $patient->pai->intervencions ?? ''; ?></p>

    <p style="position: fixed;top:460px;left:420px;width:280px;"><?php echo $patient->pai->alergies ?? ''; ?></p>

	<p style="position: fixed;top:555px;left:420px;width:280px;"><?php echo $patient->pai->tractament ?? ''; ?></p>

    <p style="position: fixed;top:658px;left:420px;width:280px;"><?php echo $patient->pai->presa_medicacio ?? '' ;?></p>

    <p style="position: fixed;top:748px;left:420px;width:280px;"><?php echo $patient->pai->sap_expressar ?? '' ;?></p>



    <img class="img" src="img/contracts/pai/PAI2.jpg"></body></html>
