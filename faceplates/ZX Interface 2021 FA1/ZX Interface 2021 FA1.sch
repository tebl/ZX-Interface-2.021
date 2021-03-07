EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "ZX Interface 2.021 (Faceplate A1)"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "It's just a faceplate, almost nothing to see here!"
$EndDescr
$Comp
L mounting:Mounting_Pin M6
U 1 1 606CD125
P 15975 550
F 0 "M6" H 15975 650 50  0001 C CNN
F 1 "Mounting" H 15975 475 50  0001 C CNN
F 2 "mounting:M3_pin" H 15975 550 50  0001 C CNN
F 3 "~" H 15975 550 50  0001 C CNN
	1    15975 550 
	0    -1   -1   0   
$EndComp
$Comp
L mounting:Mounting_Pin M5
U 1 1 606CDCFB
P 15850 550
F 0 "M5" H 15850 650 50  0001 C CNN
F 1 "Mounting" H 15850 475 50  0001 C CNN
F 2 "mounting:M3_pin" H 15850 550 50  0001 C CNN
F 3 "~" H 15850 550 50  0001 C CNN
	1    15850 550 
	0    -1   -1   0   
$EndComp
$Comp
L mounting:Mounting_Pin M4
U 1 1 606CE17C
P 15725 550
F 0 "M4" H 15725 650 50  0001 C CNN
F 1 "Mounting" H 15725 475 50  0001 C CNN
F 2 "mounting:M3_pin" H 15725 550 50  0001 C CNN
F 3 "~" H 15725 550 50  0001 C CNN
	1    15725 550 
	0    -1   -1   0   
$EndComp
$Comp
L mounting:Mounting_Pin M3
U 1 1 606CE51A
P 15600 550
F 0 "M3" H 15600 650 50  0001 C CNN
F 1 "Mounting" H 15600 475 50  0001 C CNN
F 2 "mounting:M3_pin" H 15600 550 50  0001 C CNN
F 3 "~" H 15600 550 50  0001 C CNN
	1    15600 550 
	0    -1   -1   0   
$EndComp
$Comp
L mounting:Mounting_Pin M2
U 1 1 606CE890
P 15475 550
F 0 "M2" H 15475 650 50  0001 C CNN
F 1 "Mounting" H 15475 475 50  0001 C CNN
F 2 "mounting:M3_pin" H 15475 550 50  0001 C CNN
F 3 "~" H 15475 550 50  0001 C CNN
	1    15475 550 
	0    -1   -1   0   
$EndComp
$Comp
L mounting:Mounting_Pin M1
U 1 1 606CED63
P 15350 550
F 0 "M1" H 15350 650 50  0001 C CNN
F 1 "Mounting" H 15350 475 50  0001 C CNN
F 2 "mounting:M3_pin" H 15350 550 50  0001 C CNN
F 3 "~" H 15350 550 50  0001 C CNN
	1    15350 550 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	15350 750  15350 825 
Wire Wire Line
	15350 825  15475 825 
Wire Wire Line
	15975 825  15975 750 
Wire Wire Line
	15850 750  15850 825 
Connection ~ 15850 825 
Wire Wire Line
	15850 825  15975 825 
Wire Wire Line
	15725 750  15725 825 
Connection ~ 15725 825 
Wire Wire Line
	15725 825  15850 825 
Wire Wire Line
	15600 750  15600 825 
Connection ~ 15600 825 
Wire Wire Line
	15600 825  15725 825 
Wire Wire Line
	15475 750  15475 825 
Connection ~ 15475 825 
Wire Wire Line
	15475 825  15600 825 
$EndSCHEMATC
