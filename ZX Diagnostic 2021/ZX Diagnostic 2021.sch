EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ZX Diagnostic 2.021"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Extended ZX Spectrum 48k diagnostic cartridge."
$EndDescr
Text Label 8500 3850 0    50   ~ 0
BA15
Text Label 8500 4550 0    50   ~ 0
BA14
Entry Wire Line
	8375 4450 8475 4550
Entry Wire Line
	8375 3750 8475 3850
Wire Wire Line
	9025 3850 8475 3850
Wire Wire Line
	9575 3625 9225 3625
Wire Wire Line
	9025 3775 9025 3850
$Comp
L power:VCC #PWR03
U 1 1 60482C7C
P 8750 3550
F 0 "#PWR03" H 8750 3400 50  0001 C CNN
F 1 "VCC" H 8765 3723 50  0000 C CNN
F 2 "" H 8750 3550 50  0001 C CNN
F 3 "" H 8750 3550 50  0001 C CNN
	1    8750 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3625 8750 3550
Wire Wire Line
	8825 3625 8750 3625
$Comp
L solder_select:SolderJumper_3_Bridged12 JP1
U 1 1 60482C74
P 9025 3625
F 0 "JP1" H 9025 3830 50  0000 C CNN
F 1 "A15" H 9025 3739 50  0000 C CNN
F 2 "solder_bridge:select" H 9025 3625 50  0001 C CNN
F 3 "~" H 9025 3625 50  0001 C CNN
	1    9025 3625
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9025 4550 8475 4550
Wire Wire Line
	9025 4475 9025 4550
$Comp
L power:VCC #PWR04
U 1 1 6045383E
P 8750 4250
F 0 "#PWR04" H 8750 4100 50  0001 C CNN
F 1 "VCC" H 8765 4423 50  0000 C CNN
F 2 "" H 8750 4250 50  0001 C CNN
F 3 "" H 8750 4250 50  0001 C CNN
	1    8750 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 4325 8750 4250
Wire Wire Line
	8825 4325 8750 4325
$Comp
L solder_select:SolderJumper_3_Bridged12 JP2
U 1 1 60439B63
P 9025 4325
F 0 "JP2" H 9025 4530 50  0000 C CNN
F 1 "A14" H 9025 4439 50  0000 C CNN
F 2 "solder_bridge:select" H 9025 4325 50  0001 C CNN
F 3 "~" H 9025 4325 50  0001 C CNN
	1    9025 4325
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9575 3625 9575 3225
Wire Wire Line
	9225 4325 9675 4325
Wire Wire Line
	9675 3150 9675 4325
Wire Wire Line
	6950 3150 9675 3150
Wire Wire Line
	7050 3225 9575 3225
Wire Notes Line
	8150 4700 9950 4700
Wire Notes Line
	9950 4700 9950 2175
Wire Notes Line
	9950 2175 8150 2175
Wire Notes Line
	8150 2175 8150 4700
Text Notes 8800 2275 0    50   ~ 0
EPROM Size
Text Notes 8250 2550 0    50   ~ 0
These jumpers  configure the size of\nEPROMs installed on the cartridge (pin 1\nwill be indicated by a square pad).
Text Notes 8975 2775 0    50   ~ 0
A15
Text Notes 9275 2775 0    50   ~ 0
A14
Text Notes 8575 2875 0    50   ~ 0
27C512
Text Notes 8575 2975 0    50   ~ 0
27C256
Text Notes 8575 3075 0    50   ~ 0
27C128
Text Notes 8950 2875 0    50   ~ 0
1-2
Text Notes 9250 2975 0    50   ~ 0
1-2
Text Notes 8950 2975 0    50   ~ 0
2-3
Text Notes 8950 3075 0    50   ~ 0
2-3
Text Notes 9250 3075 0    50   ~ 0
2-3
Text Notes 9250 2875 0    50   ~ 0
1-2
$Comp
L power:GND #PWR01
U 1 1 60454A4D
P 6800 7400
F 0 "#PWR01" H 6800 7150 50  0001 C CNN
F 1 "GND" H 6805 7227 50  0000 C CNN
F 2 "" H 6800 7400 50  0001 C CNN
F 3 "" H 6800 7400 50  0001 C CNN
	1    6800 7400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 60454A4E
P 6625 6750
F 0 "#PWR02" H 6625 6600 50  0001 C CNN
F 1 "VCC" H 6640 6923 50  0000 C CNN
F 2 "" H 6625 6750 50  0001 C CNN
F 3 "" H 6625 6750 50  0001 C CNN
	1    6625 6750
	1    0    0    -1  
$EndComp
$Comp
L zx_spectrum:cartridge J1
U 1 1 62BC72C2
P 6400 4300
F 0 "J1" V 5125 4300 50  0000 C CNN
F 1 "Cartridge" V 5200 4300 50  0000 C CNN
F 2 "zx_spectrum:ZX_Spectrum_Cartridge" H 6400 4300 50  0001 C CNN
F 3 "~" H 6400 4300 50  0001 C CNN
	1    6400 4300
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0118
U 1 1 62C19B35
P 7750 4800
F 0 "#PWR0118" H 7750 4650 50  0001 C CNN
F 1 "VCC" H 7765 4973 50  0000 C CNN
F 2 "" H 7750 4800 50  0001 C CNN
F 3 "" H 7750 4800 50  0001 C CNN
	1    7750 4800
	1    0    0    -1  
$EndComp
Text Label 7050 5300 1    50   ~ 0
~ROM_0
Text Label 5650 3475 3    50   ~ 0
D0
Text Label 5550 3475 3    50   ~ 0
D1
Text Label 5450 3475 3    50   ~ 0
D2
Text Label 5350 5300 1    50   ~ 0
D3
Text Label 5450 5300 1    50   ~ 0
D4
Text Label 5550 5300 1    50   ~ 0
D5
Text Label 5650 5300 1    50   ~ 0
D6
Text Label 5750 5300 1    50   ~ 0
D7
Wire Wire Line
	5450 3800 5450 3450
Wire Wire Line
	5550 3800 5550 3450
Wire Wire Line
	5650 3800 5650 3450
Text Label 5750 3475 3    50   ~ 0
A0
Text Label 5850 3475 3    50   ~ 0
A1
Text Label 5950 3475 3    50   ~ 0
A2
Text Label 6050 3475 3    50   ~ 0
A3
Text Label 6150 3475 3    50   ~ 0
A4
Text Label 6250 3475 3    50   ~ 0
A5
Text Label 6450 3475 3    50   ~ 0
A6
Text Label 6550 3475 3    50   ~ 0
A7
Text Label 6450 5300 1    50   ~ 0
A8
Text Label 6250 5300 1    50   ~ 0
A9
Text Label 5950 5300 1    50   ~ 0
A10
Text Label 6150 5300 1    50   ~ 0
A11
Text Label 6650 3475 3    50   ~ 0
A12
Text Label 6550 5300 1    50   ~ 0
A13
Wire Wire Line
	6650 3450 6650 3800
Wire Wire Line
	6550 3450 6550 3800
Wire Wire Line
	6450 3450 6450 3800
Wire Wire Line
	6250 3450 6250 3800
Wire Wire Line
	6150 3450 6150 3800
Wire Wire Line
	6050 3450 6050 3800
Wire Wire Line
	5950 3450 5950 3800
Wire Wire Line
	5850 3450 5850 3800
Wire Wire Line
	5750 3450 5750 3800
Text Label 6950 5300 1    50   ~ 0
~ROM_OE
Wire Wire Line
	3675 3925 4025 3925
Wire Wire Line
	3675 4025 4025 4025
Wire Wire Line
	3675 4125 4025 4125
Wire Wire Line
	3675 4225 4025 4225
Wire Wire Line
	3675 4325 4025 4325
Wire Wire Line
	3675 4425 4025 4425
Wire Wire Line
	3675 4525 4025 4525
Wire Wire Line
	3675 4625 4025 4625
Text Label 2550 5625 0    50   ~ 0
~ROM_0
$Comp
L power:GND #PWR0113
U 1 1 61898CCB
P 3275 5925
F 0 "#PWR0113" H 3275 5675 50  0001 C CNN
F 1 "GND" H 3280 5752 50  0000 C CNN
F 2 "" H 3275 5925 50  0001 C CNN
F 3 "" H 3275 5925 50  0001 C CNN
	1    3275 5925
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0112
U 1 1 61898065
P 3275 3725
F 0 "#PWR0112" H 3275 3575 50  0001 C CNN
F 1 "VCC" H 3290 3898 50  0000 C CNN
F 2 "" H 3275 3725 50  0001 C CNN
F 3 "" H 3275 3725 50  0001 C CNN
	1    3275 3725
	1    0    0    -1  
$EndComp
Text Label 2550 5725 0    50   ~ 0
~ROM_OE
Text Label 2550 5425 0    50   ~ 0
BA15
$Comp
L Memory_EPROM:27C512 U1
U 1 1 60C63C55
P 3275 4825
F 0 "U1" H 3050 5875 50  0000 C CNN
F 1 "27C512" V 3275 4825 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket_LongPads" H 3275 4825 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 3275 4825 50  0001 C CNN
	1    3275 4825
	1    0    0    -1  
$EndComp
Text Label 2550 5325 0    50   ~ 0
BA14
Text Label 2550 5225 0    50   ~ 0
A13
Text Label 2550 5125 0    50   ~ 0
A12
Text Label 2550 5025 0    50   ~ 0
A11
Text Label 2550 4925 0    50   ~ 0
A10
Text Label 2550 4825 0    50   ~ 0
A9
Text Label 2550 4725 0    50   ~ 0
A8
Text Label 2550 4625 0    50   ~ 0
A7
Text Label 2550 4525 0    50   ~ 0
A6
Text Label 2550 4425 0    50   ~ 0
A5
Text Label 2550 4325 0    50   ~ 0
A4
Text Label 2550 4225 0    50   ~ 0
A3
Text Label 2550 4125 0    50   ~ 0
A2
Text Label 2550 4025 0    50   ~ 0
A1
Text Label 2550 3925 0    50   ~ 0
A0
Text Label 4000 4625 2    50   ~ 0
D7
Text Label 4000 4525 2    50   ~ 0
D6
Text Label 4000 4425 2    50   ~ 0
D5
Text Label 4000 4325 2    50   ~ 0
D4
Text Label 4000 4225 2    50   ~ 0
D3
Text Label 4000 4125 2    50   ~ 0
D2
Text Label 4000 4025 2    50   ~ 0
D1
Text Label 4000 3925 2    50   ~ 0
D0
Entry Wire Line
	5550 3350 5650 3450
Entry Wire Line
	5450 3350 5550 3450
Entry Wire Line
	5350 3350 5450 3450
Entry Wire Line
	5850 3350 5950 3450
Entry Wire Line
	5750 3350 5850 3450
Entry Wire Line
	5650 3350 5750 3450
Entry Wire Line
	6050 3350 6150 3450
Entry Wire Line
	5950 3350 6050 3450
Entry Wire Line
	7150 5425 7050 5325
Entry Wire Line
	7050 5425 6950 5325
Entry Wire Line
	6550 5425 6450 5325
Entry Wire Line
	6650 5425 6550 5325
Entry Wire Line
	6250 5425 6150 5325
Entry Wire Line
	6350 5425 6250 5325
Entry Wire Line
	6050 5425 5950 5325
Entry Wire Line
	5650 5425 5550 5325
Entry Wire Line
	5750 5425 5650 5325
Entry Wire Line
	5850 5425 5750 5325
Entry Wire Line
	5450 5425 5350 5325
Entry Wire Line
	5550 5425 5450 5325
Wire Wire Line
	5350 3725 5350 3800
Wire Wire Line
	6750 4800 6750 4875
Wire Wire Line
	7750 4875 7750 4800
Wire Wire Line
	6950 4800 6950 5325
Wire Wire Line
	7050 4800 7050 5325
Wire Wire Line
	6550 4800 6550 5325
Wire Wire Line
	6450 4800 6450 5325
Wire Wire Line
	6250 4800 6250 5325
Wire Wire Line
	6150 4800 6150 5325
Wire Wire Line
	5950 4800 5950 5325
Wire Wire Line
	5750 4800 5750 5325
Wire Wire Line
	5650 4800 5650 5325
Wire Wire Line
	5550 4800 5550 5325
Wire Wire Line
	5450 4800 5450 5325
Wire Wire Line
	5350 4800 5350 5325
Entry Wire Line
	6550 3350 6650 3450
Entry Wire Line
	6450 3350 6550 3450
Entry Wire Line
	6350 3350 6450 3450
Entry Wire Line
	6150 3350 6250 3450
Wire Bus Line
	7925 3350 7925 5425
Wire Wire Line
	6750 3725 6750 3800
$Comp
L power:GND #PWR0101
U 1 1 61420F9D
P 5050 3800
F 0 "#PWR0101" H 5050 3550 50  0001 C CNN
F 1 "GND" H 5055 3627 50  0000 C CNN
F 2 "" H 5050 3800 50  0001 C CNN
F 3 "" H 5050 3800 50  0001 C CNN
	1    5050 3800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5050 3800 5050 3725
Wire Wire Line
	5050 3725 5350 3725
Wire Wire Line
	7450 3725 7450 3800
$Comp
L power:GND #PWR0102
U 1 1 615160B6
P 7750 3800
F 0 "#PWR0102" H 7750 3550 50  0001 C CNN
F 1 "GND" H 7755 3627 50  0000 C CNN
F 2 "" H 7750 3800 50  0001 C CNN
F 3 "" H 7750 3800 50  0001 C CNN
	1    7750 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3800 7750 3725
Wire Wire Line
	7750 3725 7450 3725
Wire Wire Line
	7750 4875 6750 4875
$Comp
L power:VCC #PWR0103
U 1 1 60454A4F
P 6750 3725
F 0 "#PWR0103" H 6750 3575 50  0001 C CNN
F 1 "VCC" H 6765 3898 50  0000 C CNN
F 2 "" H 6750 3725 50  0001 C CNN
F 3 "" H 6750 3725 50  0001 C CNN
	1    6750 3725
	1    0    0    -1  
$EndComp
NoConn ~ 5850 4800
NoConn ~ 6650 4800
NoConn ~ 6050 4800
NoConn ~ 7150 3800
NoConn ~ 7250 3800
NoConn ~ 7350 3800
Entry Wire Line
	2250 4625 2350 4525
Entry Wire Line
	2250 4725 2350 4625
Entry Wire Line
	2250 4825 2350 4725
Entry Wire Line
	2250 4325 2350 4225
Entry Wire Line
	2250 4425 2350 4325
Entry Wire Line
	2250 4525 2350 4425
Entry Wire Line
	2250 4125 2350 4025
Entry Wire Line
	2250 4225 2350 4125
Entry Wire Line
	2250 4025 2350 3925
Entry Wire Line
	2250 5525 2350 5425
Entry Wire Line
	2250 5825 2350 5725
Entry Wire Line
	2250 5725 2350 5625
Entry Wire Line
	2250 5225 2350 5125
Entry Wire Line
	2250 5325 2350 5225
Entry Wire Line
	2250 5425 2350 5325
Entry Wire Line
	2250 5025 2350 4925
Entry Wire Line
	2250 5125 2350 5025
Entry Wire Line
	2250 4925 2350 4825
Entry Wire Line
	4025 4525 4125 4425
Entry Wire Line
	4025 4625 4125 4525
Entry Wire Line
	4025 4225 4125 4125
Entry Wire Line
	4025 4325 4125 4225
Entry Wire Line
	4025 4425 4125 4325
Entry Wire Line
	4025 4025 4125 3925
Entry Wire Line
	4025 4125 4125 4025
Entry Wire Line
	4025 3925 4125 3825
NoConn ~ 7250 4800
NoConn ~ 7350 4800
$Comp
L Device:C_Small C2
U 1 1 60454A54
P 6625 7150
F 0 "C2" V 6675 7000 50  0000 L CNN
F 1 "100nF" V 6675 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6625 7150 50  0001 C CNN
F 3 "~" H 6625 7150 50  0001 C CNN
	1    6625 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6625 7325 6625 7250
Wire Wire Line
	7450 4800 7450 4950
Text GLabel 7450 4950 3    50   Output ~ 0
OUT_63
Wire Wire Line
	2700 2600 2775 2600
Text GLabel 2700 2600 0    50   Input ~ 0
OUT_63
$Comp
L power:VCC #PWR0105
U 1 1 607BB8F4
P 1875 2425
F 0 "#PWR0105" H 1875 2275 50  0001 C CNN
F 1 "VCC" H 1890 2598 50  0000 C CNN
F 2 "" H 1875 2425 50  0001 C CNN
F 3 "" H 1875 2425 50  0001 C CNN
	1    1875 2425
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 607B1F3F
P 3275 3000
F 0 "#PWR05" H 3275 2750 50  0001 C CNN
F 1 "GND" H 3280 2827 50  0000 C CNN
F 2 "" H 3275 3000 50  0001 C CNN
F 3 "" H 3275 3000 50  0001 C CNN
	1    3275 3000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HCT374 U2
U 1 1 607A4A1E
P 3275 2200
F 0 "U2" H 3050 2850 50  0000 C CNN
F 1 "74HCT374" V 3275 2200 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket_LongPads" H 3275 2200 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74hct373.pdf" H 3275 2200 50  0001 C CNN
	1    3275 2200
	1    0    0    -1  
$EndComp
Entry Wire Line
	2350 1800 2250 1900
Entry Wire Line
	2350 1700 2250 1800
Entry Wire Line
	2350 2100 2250 2200
Entry Wire Line
	2350 2000 2250 2100
Entry Wire Line
	2350 1900 2250 2000
Entry Wire Line
	2350 2300 2250 2400
Entry Wire Line
	2350 2200 2250 2300
Entry Wire Line
	2350 2400 2250 2500
Text Label 2375 1700 0    50   ~ 0
D0
Text Label 2375 1800 0    50   ~ 0
D1
Text Label 2375 1900 0    50   ~ 0
D2
Text Label 2375 2000 0    50   ~ 0
D3
Text Label 2375 2100 0    50   ~ 0
D4
Text Label 2375 2200 0    50   ~ 0
D5
Text Label 2375 2300 0    50   ~ 0
D6
Text Label 2375 2400 0    50   ~ 0
D7
Wire Wire Line
	2350 2400 2775 2400
Wire Wire Line
	2350 2300 2775 2300
Wire Wire Line
	2350 2200 2775 2200
Wire Wire Line
	2350 2100 2775 2100
Wire Wire Line
	2350 2000 2775 2000
Wire Wire Line
	2350 1900 2775 1900
Wire Wire Line
	2350 1800 2775 1800
Wire Wire Line
	2350 1700 2775 1700
Wire Wire Line
	2350 5425 2875 5425
Wire Wire Line
	2350 5725 2875 5725
Wire Wire Line
	2350 5625 2875 5625
Wire Wire Line
	2350 5025 2875 5025
Wire Wire Line
	2350 5125 2875 5125
Wire Wire Line
	2350 5225 2875 5225
Wire Wire Line
	2350 5325 2875 5325
Wire Wire Line
	2350 4625 2875 4625
Wire Wire Line
	2350 4725 2875 4725
Wire Wire Line
	2350 4825 2875 4825
Wire Wire Line
	2350 4925 2875 4925
Wire Wire Line
	2350 4225 2875 4225
Wire Wire Line
	2350 4325 2875 4325
Wire Wire Line
	2350 4425 2875 4425
Wire Wire Line
	2350 4525 2875 4525
Wire Wire Line
	2350 3925 2875 3925
Wire Wire Line
	2350 4025 2875 4025
Wire Wire Line
	2350 4125 2875 4125
Wire Bus Line
	2250 6275 4125 6275
$Comp
L power:VCC #PWR0106
U 1 1 6084B610
P 3275 1400
F 0 "#PWR0106" H 3275 1250 50  0001 C CNN
F 1 "VCC" H 3290 1573 50  0000 C CNN
F 2 "" H 3275 1400 50  0001 C CNN
F 3 "" H 3275 1400 50  0001 C CNN
	1    3275 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 6084E9FD
P 4300 1700
F 0 "R1" V 4250 1575 31  0000 C CNN
F 1 "330" V 4300 1700 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4300 1700 50  0001 C CNN
F 3 "~" H 4300 1700 50  0001 C CNN
	1    4300 1700
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D1
U 1 1 608512AD
P 3950 1700
F 0 "D1" H 4050 1650 31  0000 C CNN
F 1 "LED0" H 3800 1650 31  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" V 3950 1700 50  0001 C CNN
F 3 "~" V 3950 1700 50  0001 C CNN
	1    3950 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3775 1700 3850 1700
Wire Wire Line
	4050 1700 4200 1700
$Comp
L Device:R_Small R2
U 1 1 60877DF9
P 4300 1800
F 0 "R2" V 4250 1675 31  0000 C CNN
F 1 "330" V 4300 1800 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4300 1800 50  0001 C CNN
F 3 "~" H 4300 1800 50  0001 C CNN
	1    4300 1800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3775 1800 3850 1800
Wire Wire Line
	4050 1800 4200 1800
$Comp
L Device:R_Small R3
U 1 1 6087ABBC
P 4300 1900
F 0 "R3" V 4250 1775 31  0000 C CNN
F 1 "330" V 4300 1900 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4300 1900 50  0001 C CNN
F 3 "~" H 4300 1900 50  0001 C CNN
	1    4300 1900
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 6087ABC2
P 3950 1900
F 0 "D3" H 4050 1850 31  0000 C CNN
F 1 "LED2" H 3800 1850 31  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" V 3950 1900 50  0001 C CNN
F 3 "~" V 3950 1900 50  0001 C CNN
	1    3950 1900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3775 1900 3850 1900
Wire Wire Line
	4050 1900 4200 1900
Wire Wire Line
	3775 2000 3850 2000
Wire Wire Line
	3775 2100 3850 2100
Wire Wire Line
	3775 2200 3850 2200
Wire Wire Line
	3775 2300 3850 2300
Wire Wire Line
	3775 2400 3850 2400
$Comp
L Device:LED_Small D2
U 1 1 60877DFF
P 3950 1800
F 0 "D2" H 4050 1750 31  0000 C CNN
F 1 "LED1" H 3800 1750 31  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" V 3950 1800 50  0001 C CNN
F 3 "~" V 3950 1800 50  0001 C CNN
	1    3950 1800
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 608A07B0
P 4300 2000
F 0 "R4" V 4250 1875 31  0000 C CNN
F 1 "330" V 4300 2000 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4300 2000 50  0001 C CNN
F 3 "~" H 4300 2000 50  0001 C CNN
	1    4300 2000
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D4
U 1 1 608A07B6
P 3950 2000
F 0 "D4" H 4050 1950 31  0000 C CNN
F 1 "LED3" H 3800 1950 31  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" V 3950 2000 50  0001 C CNN
F 3 "~" V 3950 2000 50  0001 C CNN
	1    3950 2000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 2000 4200 2000
$Comp
L Device:R_Small R5
U 1 1 608A3E76
P 4300 2100
F 0 "R5" V 4250 1975 31  0000 C CNN
F 1 "330" V 4300 2100 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4300 2100 50  0001 C CNN
F 3 "~" H 4300 2100 50  0001 C CNN
	1    4300 2100
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D5
U 1 1 608A3E7C
P 3950 2100
F 0 "D5" H 4050 2050 31  0000 C CNN
F 1 "LED4" H 3800 2050 31  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" V 3950 2100 50  0001 C CNN
F 3 "~" V 3950 2100 50  0001 C CNN
	1    3950 2100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 2100 4200 2100
$Comp
L Device:R_Small R6
U 1 1 608A70D5
P 4300 2200
F 0 "R6" V 4250 2075 31  0000 C CNN
F 1 "330" V 4300 2200 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4300 2200 50  0001 C CNN
F 3 "~" H 4300 2200 50  0001 C CNN
	1    4300 2200
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D6
U 1 1 608A70DB
P 3950 2200
F 0 "D6" H 4050 2150 31  0000 C CNN
F 1 "LED5" H 3800 2150 31  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" V 3950 2200 50  0001 C CNN
F 3 "~" V 3950 2200 50  0001 C CNN
	1    3950 2200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 2200 4200 2200
$Comp
L Device:R_Small R7
U 1 1 608AA4FA
P 4300 2300
F 0 "R7" V 4250 2175 31  0000 C CNN
F 1 "330" V 4300 2300 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4300 2300 50  0001 C CNN
F 3 "~" H 4300 2300 50  0001 C CNN
	1    4300 2300
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D7
U 1 1 608AA500
P 3950 2300
F 0 "D7" H 4050 2250 31  0000 C CNN
F 1 "LED6" H 3800 2250 31  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" V 3950 2300 50  0001 C CNN
F 3 "~" V 3950 2300 50  0001 C CNN
	1    3950 2300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 2300 4200 2300
$Comp
L Device:R_Small R8
U 1 1 608ADEAE
P 4300 2400
F 0 "R8" V 4250 2275 31  0000 C CNN
F 1 "330" V 4300 2400 31  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4300 2400 50  0001 C CNN
F 3 "~" H 4300 2400 50  0001 C CNN
	1    4300 2400
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_Small D8
U 1 1 608ADEB4
P 3950 2400
F 0 "D8" H 4050 2350 31  0000 C CNN
F 1 "LED7" H 3800 2350 31  0000 C CNN
F 2 "LED_THT:LED_D5.0mm" V 3950 2400 50  0001 C CNN
F 3 "~" V 3950 2400 50  0001 C CNN
	1    3950 2400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 2400 4200 2400
Wire Wire Line
	4400 1700 4475 1700
Wire Wire Line
	4400 1800 4475 1800
Wire Wire Line
	4400 1900 4475 1900
Wire Wire Line
	4475 1700 4475 1800
Connection ~ 4475 1800
Wire Wire Line
	4475 1800 4475 1900
Connection ~ 4475 1900
Wire Wire Line
	4475 1900 4475 2000
Wire Wire Line
	4475 2000 4400 2000
Wire Wire Line
	4475 2000 4475 2100
Wire Wire Line
	4475 2100 4400 2100
Connection ~ 4475 2000
Wire Wire Line
	4475 2100 4475 2200
Wire Wire Line
	4475 2200 4400 2200
Connection ~ 4475 2100
Wire Wire Line
	4475 2200 4475 2300
Wire Wire Line
	4475 2300 4400 2300
Connection ~ 4475 2200
Wire Wire Line
	4475 2300 4475 2400
Wire Wire Line
	4475 2400 4400 2400
Connection ~ 4475 2300
Wire Wire Line
	4475 2400 4475 2475
Connection ~ 4475 2400
$Comp
L power:GND #PWR0104
U 1 1 60913E6B
P 4475 2475
F 0 "#PWR0104" H 4475 2225 50  0001 C CNN
F 1 "GND" H 4480 2302 50  0000 C CNN
F 2 "" H 4475 2475 50  0001 C CNN
F 3 "" H 4475 2475 50  0001 C CNN
	1    4475 2475
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 6091A360
P 6800 7150
F 0 "C1" V 6850 7000 50  0000 L CNN
F 1 "100nF" V 6850 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6800 7150 50  0001 C CNN
F 3 "~" H 6800 7150 50  0001 C CNN
	1    6800 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 7050 6800 6825
Wire Wire Line
	6625 7325 6800 7325
Wire Wire Line
	6800 7325 6800 7250
Wire Wire Line
	6800 7400 6800 7325
Connection ~ 6800 7325
Wire Wire Line
	6800 6825 6625 6825
Wire Wire Line
	6625 6825 6625 7050
Wire Wire Line
	6625 6825 6625 6750
Connection ~ 6625 6825
$Comp
L mounting:Mounting M1
U 1 1 60454A53
P 10750 575
F 0 "M1" H 10750 675 50  0001 C CNN
F 1 "Mounting" H 10750 500 50  0001 C CNN
F 2 "mounting:M3_pin" H 10750 575 50  0001 C CNN
F 3 "~" H 10750 575 50  0001 C CNN
	1    10750 575 
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
Wire Bus Line
	8375 3350 7925 3350
Connection ~ 7925 3350
Wire Wire Line
	6950 3150 6950 3800
Wire Wire Line
	7050 3225 7050 3800
NoConn ~ 7150 4800
$Comp
L Jumper:Jumper_2_Bridged JP3
U 1 1 6062B03B
P 1600 2700
F 0 "JP3" H 1600 2895 50  0000 C CNN
F 1 "LED_EN" H 1600 2804 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 1600 2700 50  0001 C CNN
F 3 "~" H 1600 2700 50  0001 C CNN
	1    1600 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R9
U 1 1 606A4D3F
P 1875 2525
F 0 "R9" H 1934 2571 50  0000 L CNN
F 1 "10k" H 1934 2480 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 1875 2525 50  0001 C CNN
F 3 "~" H 1875 2525 50  0001 C CNN
	1    1875 2525
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2700 1875 2700
Wire Wire Line
	1875 2625 1875 2700
Connection ~ 1875 2700
Wire Wire Line
	1400 2700 1325 2700
Wire Wire Line
	1325 2700 1325 2775
$Comp
L power:GND #PWR0107
U 1 1 606D1BD3
P 1325 2775
F 0 "#PWR0107" H 1325 2525 50  0001 C CNN
F 1 "GND" H 1330 2602 50  0000 C CNN
F 2 "" H 1325 2775 50  0001 C CNN
F 3 "" H 1325 2775 50  0001 C CNN
	1    1325 2775
	1    0    0    -1  
$EndComp
Wire Wire Line
	1875 2700 2775 2700
Wire Bus Line
	8375 3350 8375 4450
Wire Bus Line
	4125 3350 4125 6275
Wire Bus Line
	5450 5425 7925 5425
Wire Bus Line
	4125 3350 7925 3350
Wire Bus Line
	2250 1800 2250 6275
$EndSCHEMATC
