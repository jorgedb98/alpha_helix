mol new {step3_input.psf} type {psf} first 0 last -1 step 1 waitfor 1
mol addfile {step3_input.pdb} type {pdb} first 0 last -1 step 1 waitfor 1 0
mol addfile {step5_production.dcd} type {dcd} first 0 last -1 step 1 waitfor -1 0

set outfile [open pcts.txt w]

set sel [atomselect top "protein and name CA"]

#molinfo top set frame 0
animate goto start

set nf [molinfo top get numframes]

for { set i 0 } { $i < $nf } { incr i } {
 animate goto $i
 display update ui
 $sel frame $i
 mol ssrecalc top
 set secstruct [$sel get structure]
 puts $outfile "$secstruct"
}

close $outfile

quit
