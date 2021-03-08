EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ZX Diagnostic 2.021 (Faceplate)"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "It's just a faceplate, almost nothing to see here."
$EndDescr
$Comp
L mounting:Mounting_Pin M1
U 1 1 60454A53
P 10750 575
F 0 "M1" H 10750 675 50  0001 C CNN
F 1 "Mounting" H 10750 500 50  0001 C CNN
F 2 "mounting:M3_pin" H 10750 575 50  0001 C CNN
F 3 "~" H 10750 575 50  0001 C CNN
	1    10750 575 
	0    -1   -1   0   
$EndComp
$Comp
L mounting:Mounting_Pin M2
U 1 1 606CE890
P 10875 575
F 0 "M2" H 10875 675 50  0001 C CNN
F 1 "Mounting" H 10875 500 50  0001 C CNN
F 2 "mounting:M3_pin" H 10875 575 50  0001 C CNN
F 3 "~" H 10875 575 50  0001 C CNN
	1    10875 575 
	0    -1   -1   0   
$EndComp
$Comp
L mounting:Mounting_Pin M3
U 1 1 606CE51A
P 11000 575
F 0 "M3" H 11000 675 50  0001 C CNN
F 1 "Mounting" H 11000 500 50  0001 C CNN
F 2 "mounting:M3_pin" H 11000 575 50  0001 C CNN
F 3 "~" H 11000 575 50  0001 C CNN
	1    11000 575 
	0    -1   -1   0   
$EndComp
$Comp
L mounting:Mounting_Pin M4
U 1 1 606CE17C
P 11125 575
F 0 "M4" H 11125 675 50  0001 C CNN
F 1 "Mounting" H 11125 500 50  0001 C CNN
F 2 "mounting:M3_pin" H 11125 575 50  0001 C CNN
F 3 "~" H 11125 575 50  0001 C CNN
	1    11125 575 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10750 775  10750 850 
Wire Wire Line
	10750 850  10875 850 
Wire Wire Line
	11125 850  11125 775 
Wire Wire Line
	11000 775  11000 850 
Connection ~ 11000 850 
Wire Wire Line
	11000 850  11125 850 
Wire Wire Line
	10875 775  10875 850 
Connection ~ 10875 850 
Wire Wire Line
	10875 850  11000 850 
$EndSCHEMATC
