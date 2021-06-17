mol new {step3_input.psf} type {psf} first 0 last -1 step 1 waitfor 1
mol addfile {step3_input.pdb} type {pdb} first 0 last -1 step 1 waitfor 1 0

set sel [atomselect top "protein"]
$sel writepdb step3_input.pdb
$sel writepsf step3_input.psf
exit
