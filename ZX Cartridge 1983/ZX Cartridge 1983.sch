EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ZX Cartridge 1.983"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "A simple 16K cartridge, uses the same signals as original cartridges."
$EndDescr
$Comp
L power:GND #PWR01
U 1 1 604A4F46
P 6825 7400
F 0 "#PWR01" H 6825 7150 50  0001 C CNN
F 1 "GND" H 6830 7227 50  0000 C CNN
F 2 "" H 6825 7400 50  0001 C CNN
F 3 "" H 6825 7400 50  0001 C CNN
	1    6825 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 604C43E7
P 6825 7150
F 0 "C1" V 6875 7000 50  0000 L CNN
F 1 "100nF" V 6875 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6825 7150 50  0001 C CNN
F 3 "~" H 6825 7150 50  0001 C CNN
	1    6825 7150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 604DD34F
P 6650 6750
F 0 "#PWR02" H 6650 6600 50  0001 C CNN
F 1 "VCC" H 6665 6923 50  0000 C CNN
F 2 "" H 6650 6750 50  0001 C CNN
F 3 "" H 6650 6750 50  0001 C CNN
	1    6650 6750
	1    0    0    -1  
$EndComp
$Comp
L zx_spectrum:cartridge_original J1
U 1 1 62BC72C2
P 9075 1875
F 0 "J1" V 7800 1875 50  0000 C CNN
F 1 "Cartridge" V 7875 1875 50  0000 C CNN
F 2 "zx_spectrum:ZX_Spectrum_Cartridge_Original" H 9075 1875 50  0001 C CNN
F 3 "~" H 9075 1875 50  0001 C CNN
	1    9075 1875
	1    0    0    -1  
$EndComp
Text Label 8725 2875 1    50   ~ 0
~MREQ
Text Label 8325 1050 3    50   ~ 0
D0
Text Label 8225 1050 3    50   ~ 0
D1
Text Label 8125 1050 3    50   ~ 0
D2
Text Label 8025 2875 1    50   ~ 0
D3
Text Label 8125 2875 1    50   ~ 0
D4
Text Label 8225 2875 1    50   ~ 0
D5
Text Label 8325 2875 1    50   ~ 0
D6
Text Label 8425 2875 1    50   ~ 0
D7
Wire Wire Line
	8125 1375 8125 1025
Wire Wire Line
	8225 1375 8225 1025
Wire Wire Line
	8325 1375 8325 1025
Text Label 8425 1050 3    50   ~ 0
A0
Text Label 8525 1050 3    50   ~ 0
A1
Text Label 8625 1050 3    50   ~ 0
A2
Text Label 8725 1050 3    50   ~ 0
A3
Text Label 8825 1050 3    50   ~ 0
A4
Text Label 8925 1050 3    50   ~ 0
A5
Text Label 9125 1050 3    50   ~ 0
A6
Text Label 9225 1050 3    50   ~ 0
A7
Text Label 9125 2875 1    50   ~ 0
A8
Text Label 8925 2875 1    50   ~ 0
A9
Text Label 8625 2875 1    50   ~ 0
A10
Text Label 8825 2875 1    50   ~ 0
A11
Text Label 9325 1050 3    50   ~ 0
A12
Text Label 9225 2875 1    50   ~ 0
A13
Wire Wire Line
	9225 1025 9225 1375
Wire Wire Line
	9125 1025 9125 1375
Wire Wire Line
	8925 1025 8925 1375
Wire Wire Line
	8825 1025 8825 1375
Wire Wire Line
	8725 1025 8725 1375
Wire Wire Line
	8625 1025 8625 1375
Wire Wire Line
	8525 1025 8525 1375
Wire Wire Line
	8425 1025 8425 1375
Wire Wire Line
	5200 1175 5550 1175
Wire Wire Line
	5200 1275 5550 1275
Wire Wire Line
	5200 1375 5550 1375
Wire Wire Line
	5200 1475 5550 1475
Wire Wire Line
	5200 1575 5550 1575
Wire Wire Line
	5200 1675 5550 1675
Wire Wire Line
	5200 1775 5550 1775
Wire Wire Line
	5200 1875 5550 1875
Wire Wire Line
	5200 1975 5550 1975
Wire Wire Line
	5200 2075 5550 2075
Wire Wire Line
	5200 2175 5550 2175
Wire Wire Line
	5200 2275 5550 2275
Wire Wire Line
	5200 2375 5550 2375
Wire Wire Line
	5200 2475 5550 2475
Wire Wire Line
	6350 1175 6700 1175
Wire Wire Line
	6350 1275 6700 1275
Wire Wire Line
	6350 1375 6700 1375
Wire Wire Line
	6350 1475 6700 1475
Wire Wire Line
	6350 1575 6700 1575
Wire Wire Line
	6350 1675 6700 1675
Wire Wire Line
	6350 1775 6700 1775
Wire Wire Line
	6350 1875 6700 1875
$Comp
L power:GND #PWR0113
U 1 1 61898CCB
P 5950 3575
F 0 "#PWR0113" H 5950 3325 50  0001 C CNN
F 1 "GND" H 5955 3402 50  0000 C CNN
F 2 "" H 5950 3575 50  0001 C CNN
F 3 "" H 5950 3575 50  0001 C CNN
	1    5950 3575
	1    0    0    -1  
$EndComp
Text Label 5225 2475 0    50   ~ 0
A13
Text Label 5225 2375 0    50   ~ 0
A12
Text Label 5225 2275 0    50   ~ 0
A11
Text Label 5225 2175 0    50   ~ 0
A10
Text Label 5225 2075 0    50   ~ 0
A9
Text Label 5225 1975 0    50   ~ 0
A8
Text Label 5225 1875 0    50   ~ 0
A7
Text Label 5225 1775 0    50   ~ 0
A6
Text Label 5225 1675 0    50   ~ 0
A5
Text Label 5225 1575 0    50   ~ 0
A4
Text Label 5225 1475 0    50   ~ 0
A3
Text Label 5225 1375 0    50   ~ 0
A2
Text Label 5225 1275 0    50   ~ 0
A1
Text Label 5225 1175 0    50   ~ 0
A0
Text Label 6675 1875 2    50   ~ 0
D7
Text Label 6675 1775 2    50   ~ 0
D6
Text Label 6675 1675 2    50   ~ 0
D5
Text Label 6675 1575 2    50   ~ 0
D4
Text Label 6675 1475 2    50   ~ 0
D3
Text Label 6675 1375 2    50   ~ 0
D2
Text Label 6675 1275 2    50   ~ 0
D1
Text Label 6675 1175 2    50   ~ 0
D0
Entry Wire Line
	8225 925  8325 1025
Entry Wire Line
	8125 925  8225 1025
Entry Wire Line
	8025 925  8125 1025
Entry Wire Line
	8525 925  8625 1025
Entry Wire Line
	8425 925  8525 1025
Entry Wire Line
	8325 925  8425 1025
Entry Wire Line
	8725 925  8825 1025
Entry Wire Line
	8625 925  8725 1025
Entry Wire Line
	8825 3000 8725 2900
Entry Wire Line
	9225 3000 9125 2900
Entry Wire Line
	9325 3000 9225 2900
Entry Wire Line
	8925 3000 8825 2900
Entry Wire Line
	9025 3000 8925 2900
Entry Wire Line
	8725 3000 8625 2900
Entry Wire Line
	8325 3000 8225 2900
Entry Wire Line
	8425 3000 8325 2900
Entry Wire Line
	8525 3000 8425 2900
Entry Wire Line
	8125 3000 8025 2900
Entry Wire Line
	8225 3000 8125 2900
$Comp
L mounting:Mounting M4
U 1 1 606CE17C
P 11125 575
F 0 "M4" H 11125 675 50  0001 C CNN
F 1 "Mounting" H 11125 500 50  0001 C CNN
F 2 "mounting:M3_pin" H 11125 575 50  0001 C CNN
F 3 "~" H 11125 575 50  0001 C CNN
	1    11125 575 
	1    0    0    -1  
$EndComp
$Comp
L mounting:Mounting M3
U 1 1 606CE51A
P 11000 575
F 0 "M3" H 11000 675 50  0001 C CNN
F 1 "Mounting" H 11000 500 50  0001 C CNN
F 2 "mounting:M3_pin" H 11000 575 50  0001 C CNN
F 3 "~" H 11000 575 50  0001 C CNN
	1    11000 575 
	1    0    0    -1  
$EndComp
$Comp
L mounting:Mounting M2
U 1 1 606CE890
P 10875 575
F 0 "M2" H 10875 675 50  0001 C CNN
F 1 "Mounting" H 10875 500 50  0001 C CNN
F 2 "mounting:M3_pin" H 10875 575 50  0001 C CNN
F 3 "~" H 10875 575 50  0001 C CNN
	1    10875 575 
	1    0    0    -1  
$EndComp
$Comp
L mounting:Mounting M1
U 1 1 606CED63
P 10750 575
F 0 "M1" H 10750 675 50  0001 C CNN
F 1 "Mounting" H 10750 500 50  0001 C CNN
F 2 "mounting:M3_pin" H 10750 575 50  0001 C CNN
F 3 "~" H 10750 575 50  0001 C CNN
	1    10750 575 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8025 1300 8025 1375
Wire Wire Line
	9425 2375 9425 2450
Wire Wire Line
	8725 2375 8725 2900
Wire Wire Line
	9225 2375 9225 2900
Wire Wire Line
	9125 2375 9125 2900
Wire Wire Line
	8925 2375 8925 2900
Wire Wire Line
	8825 2375 8825 2900
Wire Wire Line
	8625 2375 8625 2900
Wire Wire Line
	8425 2375 8425 2900
Wire Wire Line
	8325 2375 8325 2900
Wire Wire Line
	8225 2375 8225 2900
Wire Wire Line
	8125 2375 8125 2900
Wire Wire Line
	8025 2375 8025 2900
Entry Wire Line
	9225 925  9325 1025
Entry Wire Line
	9125 925  9225 1025
Entry Wire Line
	9025 925  9125 1025
Entry Wire Line
	8825 925  8925 1025
Wire Wire Line
	9425 1300 9425 1375
$Comp
L power:VCC #PWR0103
U 1 1 6053A5CF
P 9550 1175
F 0 "#PWR0103" H 9550 1025 50  0001 C CNN
F 1 "VCC" H 9565 1348 50  0000 C CNN
F 2 "" H 9550 1175 50  0001 C CNN
F 3 "" H 9550 1175 50  0001 C CNN
	1    9550 1175
	1    0    0    -1  
$EndComp
Entry Wire Line
	5200 1775 5100 1675
Entry Wire Line
	5200 1875 5100 1775
Entry Wire Line
	5200 1975 5100 1875
Entry Wire Line
	5200 1475 5100 1375
Entry Wire Line
	5200 1575 5100 1475
Entry Wire Line
	5200 1675 5100 1575
Entry Wire Line
	5200 1275 5100 1175
Entry Wire Line
	5200 1375 5100 1275
Entry Wire Line
	5200 1175 5100 1075
Entry Wire Line
	5200 2375 5100 2275
Entry Wire Line
	5200 2175 5100 2075
Entry Wire Line
	5200 2275 5100 2175
Entry Wire Line
	5200 2075 5100 1975
Entry Wire Line
	6700 1775 6800 1675
Entry Wire Line
	6700 1875 6800 1775
Entry Wire Line
	6700 1475 6800 1375
Entry Wire Line
	6700 1575 6800 1475
Entry Wire Line
	6700 1675 6800 1575
Entry Wire Line
	6700 1275 6800 1175
Entry Wire Line
	6700 1375 6800 1275
Entry Wire Line
	6700 1175 6800 1075
Wire Wire Line
	6825 6825 6825 7050
$Comp
L solder_select:SolderJumper_3_Bridged12 JP2
U 1 1 60439B63
P 4400 4125
F 0 "JP2" H 4400 4330 50  0000 C CNN
F 1 "ROM_TYPE" H 4400 4239 50  0000 C CNN
F 2 "solder_bridge:select" H 4400 4125 50  0001 C CNN
F 3 "~" H 4400 4125 50  0001 C CNN
	1    4400 4125
	0    -1   -1   0   
$EndComp
Text Notes 2475 3150 0    50   ~ 0
27C512
Text Notes 2475 3250 0    50   ~ 0
27C256
Text Notes 2475 3350 0    50   ~ 0
27C128
Text Notes 3400 3250 0    50   ~ 0
2-3
Text Notes 3400 3350 0    50   ~ 0
2-3
Text Label 5225 2675 0    50   ~ 0
BA15
Text Label 5225 2575 0    50   ~ 0
BA14
Text Label 8525 2875 1    50   ~ 0
A14
Entry Wire Line
	8625 3000 8525 2900
Wire Wire Line
	8525 2375 8525 2900
Text Label 9325 2875 1    50   ~ 0
A15
Entry Wire Line
	9425 3000 9325 2900
Wire Wire Line
	9325 2375 9325 2900
Text Label 8750 3350 0    50   ~ 0
A14
Text Label 9550 3100 0    50   ~ 0
A15
$Comp
L Device:R_Small R1
U 1 1 606C9DA3
P 9850 3100
F 0 "R1" V 9654 3100 50  0000 C CNN
F 1 "680" V 9745 3100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 9850 3100 50  0001 C CNN
F 3 "~" H 9850 3100 50  0001 C CNN
	1    9850 3100
	0    -1   -1   0   
$EndComp
Text Label 9925 3000 0    50   ~ 0
~ROM_OE
Entry Wire Line
	8725 3100 8625 3000
Text Notes 2700 1925 0    50   ~ 0
(E)EPROM Size considerations
Text Notes 1950 2525 0    50   ~ 0
(E)EPROM chips of various size generally have a, sort of, compatible\npinout, but we need to make some changes according to what we\nare installing. Note that when installing chips smaller than 27c020,\nthe display will will count images from a non-zero number.\n\nYou could always short across the switches and resistors to\nhard code for a specific 16k image instead.
Wire Wire Line
	6825 7250 6825 7325
Wire Wire Line
	9425 2450 9550 2450
Connection ~ 9550 1300
Wire Wire Line
	9550 1300 9550 2450
Wire Wire Line
	9425 1300 9550 1300
Wire Wire Line
	9325 1025 9325 1375
Wire Wire Line
	9550 1175 9550 1300
Wire Wire Line
	7725 1300 8025 1300
Wire Wire Line
	7725 1375 7725 1300
$Comp
L power:GND #PWR0101
U 1 1 61420F9D
P 7725 1375
F 0 "#PWR0101" H 7725 1125 50  0001 C CNN
F 1 "GND" H 7730 1202 50  0000 C CNN
F 2 "" H 7725 1375 50  0001 C CNN
F 3 "" H 7725 1375 50  0001 C CNN
	1    7725 1375
	-1   0    0    -1  
$EndComp
$Comp
L 27c010:27C020 U1
U 1 1 607A138F
P 5950 2275
F 0 "U1" H 5725 3525 50  0000 C CNN
F 1 "27C020" V 5950 2275 50  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_Socket_LongPads" H 5950 2275 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/devicedoc/doc0570.pdf" H 5950 2275 50  0001 C CNN
	1    5950 2275
	1    0    0    -1  
$EndComp
Text Label 5225 2775 0    50   ~ 0
BA16
$Comp
L power:VCC #PWR0105
U 1 1 607C5EDC
P 5400 3100
F 0 "#PWR0105" H 5400 2950 50  0001 C CNN
F 1 "VCC" H 5415 3273 50  0000 C CNN
F 2 "" H 5400 3100 50  0001 C CNN
F 3 "" H 5400 3100 50  0001 C CNN
	1    5400 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3075 5475 3075
Wire Wire Line
	5475 3075 5475 3175
Wire Wire Line
	5475 3175 5550 3175
Wire Wire Line
	5550 3375 5200 3375
Wire Wire Line
	5200 3275 5550 3275
Text Label 5225 3375 0    50   ~ 0
~ROM_OE
Text Label 5225 3275 0    50   ~ 0
~MREQ
Entry Wire Line
	5100 3275 5200 3375
Entry Wire Line
	5100 3175 5200 3275
Text Notes 2475 3050 0    50   ~ 0
27C010
Text Notes 2850 3050 0    50   ~ 0
SW_DIP_x3
Text Notes 2850 3150 0    50   ~ 0
SW_DIP_x2
Text Notes 2850 3250 0    50   ~ 0
SW_DIP_x1
$Comp
L Display_Character:LTS-6980HR AFF1
U 1 1 6099624B
P 6500 4975
F 0 "AFF1" H 6500 5642 50  0000 C CNN
F 1 "LTS-6980HR" H 6500 5551 50  0000 C CNN
F 2 "Display_7Segment:7SegmentLED_LTS6760_LTS6780" H 6500 4375 50  0001 C CNN
F 3 "http://datasheet.octopart.com/LTS-6960HR-Lite-On-datasheet-11803242.pdf" H 6500 4975 50  0001 C CNN
	1    6500 4975
	1    0    0    -1  
$EndComp
$Comp
L mc14495p1:MC14495P1 U2
U 1 1 609A8BC1
P 5400 5175
F 0 "U2" H 5400 5350 50  0000 C CNN
F 1 "MC14495P1" H 5400 5275 31  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket_LongPads" H 5400 5175 50  0001 C CNN
F 3 "" H 5400 5175 50  0001 C CNN
	1    5400 5175
	1    0    0    -1  
$EndComp
NoConn ~ 7000 5275
Wire Wire Line
	7000 4575 7075 4575
Wire Wire Line
	7075 4575 7075 4675
Wire Wire Line
	7075 5650 5400 5650
Wire Wire Line
	5400 5650 5400 5575
Wire Wire Line
	7000 4675 7075 4675
Connection ~ 7075 4675
Wire Wire Line
	7075 4675 7075 5650
Wire Wire Line
	5850 5175 6000 5175
Wire Wire Line
	5850 5075 6000 5075
Wire Wire Line
	5850 4975 6000 4975
Wire Wire Line
	5850 4875 6000 4875
Wire Wire Line
	5850 4775 6000 4775
Wire Wire Line
	5850 4675 6000 4675
Wire Wire Line
	5850 4575 6000 4575
NoConn ~ 5850 5275
NoConn ~ 5850 5375
$Comp
L power:GND #PWR07
U 1 1 60A1EC6F
P 7075 5725
F 0 "#PWR07" H 7075 5475 50  0001 C CNN
F 1 "GND" H 7080 5552 50  0000 C CNN
F 2 "" H 7075 5725 50  0001 C CNN
F 3 "" H 7075 5725 50  0001 C CNN
	1    7075 5725
	1    0    0    -1  
$EndComp
Wire Wire Line
	7075 5725 7075 5650
Connection ~ 7075 5650
$Comp
L power:VCC #PWR05
U 1 1 60A2860D
P 5400 4375
F 0 "#PWR05" H 5400 4225 50  0001 C CNN
F 1 "VCC" H 5415 4548 50  0000 C CNN
F 2 "" H 5400 4375 50  0001 C CNN
F 3 "" H 5400 4375 50  0001 C CNN
	1    5400 4375
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 5375 4950 5375
Text Label 4625 5375 0    50   ~ 0
~MREQ
Entry Wire Line
	4500 5475 4600 5375
$Comp
L power:VCC #PWR06
U 1 1 60A60B08
P 5950 875
F 0 "#PWR06" H 5950 725 50  0001 C CNN
F 1 "VCC" H 5965 1048 50  0000 C CNN
F 2 "" H 5950 875 50  0001 C CNN
F 3 "" H 5950 875 50  0001 C CNN
	1    5950 875 
	1    0    0    -1  
$EndComp
Text Label 5225 2875 0    50   ~ 0
BA17
$Comp
L Switch:SW_DIP_x04 SW1
U 1 1 60AAA16A
P 2875 4775
F 0 "SW1" H 2875 5242 50  0000 C CNN
F 1 "ROM_SEL" H 2875 5151 50  0000 C CNN
F 2 "Button_Switch_THT:SW_DIP_SPSTx04_Slide_9.78x12.34mm_W7.62mm_P2.54mm" H 2875 4775 50  0001 C CNN
F 3 "~" H 2875 4775 50  0001 C CNN
	1    2875 4775
	1    0    0    -1  
$EndComp
Wire Wire Line
	3175 4575 3250 4575
Wire Wire Line
	3175 4675 3350 4675
Wire Wire Line
	3450 4775 3175 4775
Wire Wire Line
	3175 4875 3550 4875
Connection ~ 3550 4875
Connection ~ 3450 4775
Connection ~ 3350 4675
Connection ~ 3250 4575
Wire Wire Line
	2575 4575 2500 4575
Wire Wire Line
	2500 4575 2500 4675
Wire Wire Line
	2500 4875 2575 4875
Wire Wire Line
	2500 4775 2575 4775
Connection ~ 2500 4775
Wire Wire Line
	2500 4775 2500 4875
Wire Wire Line
	2500 4675 2575 4675
Connection ~ 2500 4675
Wire Wire Line
	2500 4675 2500 4775
Wire Wire Line
	3250 4575 3925 4575
Wire Wire Line
	3350 4675 4025 4675
Wire Wire Line
	3450 4775 4125 4775
Wire Wire Line
	5400 3100 5400 3175
Wire Wire Line
	5400 3175 5475 3175
Connection ~ 5475 3175
Wire Wire Line
	3925 2575 3925 4575
Connection ~ 3925 4575
Wire Wire Line
	4025 4675 4025 2675
Connection ~ 4025 4675
Wire Wire Line
	4125 4775 4125 2775
Connection ~ 4125 4775
Wire Wire Line
	3925 2575 5550 2575
Wire Wire Line
	4025 2675 5550 2675
Wire Wire Line
	4125 2775 5550 2775
Wire Wire Line
	3925 4575 4950 4575
Wire Wire Line
	4025 4675 4950 4675
Wire Wire Line
	4125 4775 4950 4775
Wire Wire Line
	3550 4875 4400 4875
Wire Wire Line
	4550 4125 4625 4125
Wire Wire Line
	4625 4125 4625 2875
Wire Wire Line
	4625 2875 5550 2875
Wire Wire Line
	4400 4325 4400 4875
Connection ~ 4400 4875
Wire Wire Line
	4400 4875 4950 4875
$Comp
L power:VCC #PWR0110
U 1 1 60D3105F
P 4400 3925
F 0 "#PWR0110" H 4400 3775 50  0001 C CNN
F 1 "VCC" H 4415 4098 50  0000 C CNN
F 2 "" H 4400 3925 50  0001 C CNN
F 3 "" H 4400 3925 50  0001 C CNN
	1    4400 3925
	1    0    0    -1  
$EndComp
Connection ~ 2500 4875
Wire Wire Line
	2500 4875 2500 4975
$Comp
L power:GND #PWR0106
U 1 1 60B3B202
P 2500 4975
F 0 "#PWR0106" H 2500 4725 50  0001 C CNN
F 1 "GND" H 2505 4802 50  0000 C CNN
F 2 "" H 2500 4975 50  0001 C CNN
F 3 "" H 2500 4975 50  0001 C CNN
	1    2500 4975
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 4875 3550 4450
Wire Wire Line
	3450 4450 3450 4775
Wire Wire Line
	3350 4675 3350 4450
Wire Wire Line
	3250 4450 3250 4575
$Comp
L power:VCC #PWR0109
U 1 1 60B42CF9
P 3250 4100
F 0 "#PWR0109" H 3250 3950 50  0001 C CNN
F 1 "VCC" H 3265 4273 50  0000 C CNN
F 2 "" H 3250 4100 50  0001 C CNN
F 3 "" H 3250 4100 50  0001 C CNN
	1    3250 4100
	1    0    0    -1  
$EndComp
Connection ~ 3250 4175
Wire Wire Line
	3250 4175 3250 4100
Connection ~ 3450 4175
Wire Wire Line
	3550 4175 3550 4250
Wire Wire Line
	3450 4175 3550 4175
Connection ~ 3350 4175
Wire Wire Line
	3450 4175 3450 4250
Wire Wire Line
	3350 4175 3450 4175
Wire Wire Line
	3350 4175 3250 4175
Wire Wire Line
	3350 4250 3350 4175
Wire Wire Line
	3250 4250 3250 4175
$Comp
L Device:R_Small R5
U 1 1 60AD4300
P 3550 4350
F 0 "R5" V 3500 4475 31  0000 C CNN
F 1 "4k7" V 3550 4350 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3550 4350 50  0001 C CNN
F 3 "~" H 3550 4350 50  0001 C CNN
	1    3550 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 60AD0167
P 3450 4350
F 0 "R4" V 3400 4475 31  0000 C CNN
F 1 "4k7" V 3450 4350 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3450 4350 50  0001 C CNN
F 3 "~" H 3450 4350 50  0001 C CNN
	1    3450 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 60ACBE7B
P 3350 4350
F 0 "R3" V 3300 4475 31  0000 C CNN
F 1 "4k7" V 3350 4350 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3350 4350 50  0001 C CNN
F 3 "~" H 3350 4350 50  0001 C CNN
	1    3350 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R2
U 1 1 60AC1EE4
P 3250 4350
F 0 "R2" V 3200 4475 31  0000 C CNN
F 1 "4k7" V 3250 4350 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 3250 4350 50  0001 C CNN
F 3 "~" H 3250 4350 50  0001 C CNN
	1    3250 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 60E2452E
P 6650 7150
F 0 "C2" V 6700 7000 50  0000 L CNN
F 1 "100nF" V 6700 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6650 7150 50  0001 C CNN
F 3 "~" H 6650 7150 50  0001 C CNN
	1    6650 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 7050 6650 6825
Wire Wire Line
	6650 6825 6825 6825
Wire Wire Line
	6650 6750 6650 6825
Connection ~ 6650 6825
Wire Wire Line
	6650 7250 6650 7325
Wire Wire Line
	6650 7325 6825 7325
Connection ~ 6825 7325
Wire Wire Line
	6825 7325 6825 7400
Wire Bus Line
	4500 5475 4500 6125
Wire Bus Line
	4500 6125 7550 6125
Entry Wire Line
	9900 3000 9800 2900
Wire Wire Line
	9750 3100 9525 3100
Entry Wire Line
	9525 3100 9425 3000
Wire Bus Line
	7550 3000 7550 6125
Wire Wire Line
	8725 3100 8725 3350
Wire Wire Line
	8725 3350 9025 3350
Wire Wire Line
	9225 3350 10325 3350
Wire Wire Line
	10325 3350 10325 3100
Wire Wire Line
	10325 3100 9950 3100
Wire Wire Line
	9900 3000 10325 3000
Wire Wire Line
	10325 3000 10325 3100
Connection ~ 10325 3100
$Comp
L Device:D_Small D1
U 1 1 606C6DE7
P 9125 3350
F 0 "D1" H 9125 3143 50  0000 C CNN
F 1 "1N4148" H 9125 3234 50  0000 C CNN
F 2 "Diode_THT:D_DO-35_SOD27_P7.62mm_Horizontal" V 9125 3350 50  0001 C CNN
F 3 "~" V 9125 3350 50  0001 C CNN
	1    9125 3350
	-1   0    0    -1  
$EndComp
Wire Notes Line
	4725 5225 4725 1825
Wire Notes Line
	1875 1825 4725 1825
Wire Notes Line
	4725 5225 1875 5225
Wire Notes Line
	1875 5225 1875 1825
Text Notes 2475 2950 0    50   ~ 0
27C020
Text Notes 2875 2850 0    50   ~ 0
ROM_SEL
Text Notes 2850 2950 0    50   ~ 0
SW_DIP_x4
Text Notes 3300 2850 0    50   ~ 0
ROM_TYPE
Text Notes 3400 2950 0    50   ~ 0
1-2
Text Notes 3400 3050 0    50   ~ 0
N/C
Text Notes 3400 3150 0    50   ~ 0
2-3
Entry Wire Line
	5200 2475 5100 2375
Wire Wire Line
	5950 875  5950 975 
Wire Bus Line
	5100 925  6800 925 
Connection ~ 6800 925 
Wire Bus Line
	9800 925  9800 3000
Wire Bus Line
	6800 925  6800 1775
Wire Bus Line
	7550 3000 9800 3000
Wire Bus Line
	6800 925  9800 925 
Wire Bus Line
	5100 925  5100 3275
$EndSCHEMATC
