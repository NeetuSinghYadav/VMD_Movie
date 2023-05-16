
if { $argc != 2 } {
        puts "The tcl script requires two numbers to be inputed."
        puts "Please try again."
	puts "The arguments passed are: $argc"
    } else {
	running
        #puts "argv0 $argv 0"
        }

set PDB     [lindex $argv 0]
set TRAJ    [lindex $argv 1]


puts $TOP
set ID 1

color Display Background white
display backgroundgradient off
display depthcue 0
display projection Orthographic
#display height 1
axes location Off

mol load pdb $PDB
mol addfile $TRAJ waitfor all

source cg_bonds.tcl

cg_bonds -top ALK1_vmd.top -topoltype "martini"


mol material AOChalky
mol representation VDW
mol addrep top
pbc box
scale by 1.05

color change rgb red 0.9 0.45 0.33
color change rgb blue 0.27 0.52 0.9

set sel [atomselect top all]
set ALA [atomselect top "resname ALA"]
set GLU [atomselect top "resname GLU"]
set LYS [atomselect top "resname LYS"]

$ALA set name A
$GLU set name E
$LYS set name K

color Name A green	
color Name E blue
color Name K red
