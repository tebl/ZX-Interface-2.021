EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ZX Cartridge 2.021"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 "Extended ZX Spectrum 48k cartridge."
$EndDescr
$Comp
L power:GND #PWR01
U 1 1 604A4F46
P 6750 7400
F 0 "#PWR01" H 6750 7150 50  0001 C CNN
F 1 "GND" H 6755 7227 50  0000 C CNN
F 2 "" H 6750 7400 50  0001 C CNN
F 3 "" H 6750 7400 50  0001 C CNN
	1    6750 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 604C43E7
P 6750 7150
F 0 "C1" V 6800 7000 50  0000 L CNN
F 1 "100nF" V 6800 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6750 7150 50  0001 C CNN
F 3 "~" H 6750 7150 50  0001 C CNN
	1    6750 7150
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 604DD34F
P 6575 6725
F 0 "#PWR02" H 6575 6575 50  0001 C CNN
F 1 "VCC" H 6590 6898 50  0000 C CNN
F 2 "" H 6575 6725 50  0001 C CNN
F 3 "" H 6575 6725 50  0001 C CNN
	1    6575 6725
	1    0    0    -1  
$EndComp
$Comp
L zx_spectrum:cartridge J1
U 1 1 62BC72C2
P 7375 3400
F 0 "J1" V 6100 3400 50  0000 C CNN
F 1 "Cartridge" V 6175 3400 50  0000 C CNN
F 2 "zx_spectrum:ZX_Spectrum_Cartridge" H 7375 3400 50  0001 C CNN
F 3 "~" H 7375 3400 50  0001 C CNN
	1    7375 3400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0118
U 1 1 62C19B35
P 8725 3900
F 0 "#PWR0118" H 8725 3750 50  0001 C CNN
F 1 "VCC" H 8740 4073 50  0000 C CNN
F 2 "" H 8725 3900 50  0001 C CNN
F 3 "" H 8725 3900 50  0001 C CNN
	1    8725 3900
	1    0    0    -1  
$EndComp
Text Label 8025 4400 1    50   ~ 0
~ROM_0
Text Label 6625 2575 3    50   ~ 0
D0
Text Label 6525 2575 3    50   ~ 0
D1
Text Label 6425 2575 3    50   ~ 0
D2
Text Label 6325 4400 1    50   ~ 0
D3
Text Label 6425 4400 1    50   ~ 0
D4
Text Label 6525 4400 1    50   ~ 0
D5
Text Label 6625 4400 1    50   ~ 0
D6
Text Label 6725 4400 1    50   ~ 0
D7
Wire Wire Line
	6425 2900 6425 2550
Wire Wire Line
	6525 2900 6525 2550
Wire Wire Line
	6625 2900 6625 2550
Text Label 6725 2575 3    50   ~ 0
A0
Text Label 6825 2575 3    50   ~ 0
A1
Text Label 6925 2575 3    50   ~ 0
A2
Text Label 7025 2575 3    50   ~ 0
A3
Text Label 7125 2575 3    50   ~ 0
A4
Text Label 7225 2575 3    50   ~ 0
A5
Text Label 7425 2575 3    50   ~ 0
A6
Text Label 7525 2575 3    50   ~ 0
A7
Text Label 7425 4400 1    50   ~ 0
A8
Text Label 7225 4400 1    50   ~ 0
A9
Text Label 6925 4400 1    50   ~ 0
A10
Text Label 7125 4400 1    50   ~ 0
A11
Text Label 7625 2575 3    50   ~ 0
A12
Text Label 7525 4400 1    50   ~ 0
A13
Wire Wire Line
	7625 2550 7625 2900
Wire Wire Line
	7525 2550 7525 2900
Wire Wire Line
	7425 2550 7425 2900
Wire Wire Line
	7225 2550 7225 2900
Wire Wire Line
	7125 2550 7125 2900
Wire Wire Line
	7025 2550 7025 2900
Wire Wire Line
	6925 2550 6925 2900
Wire Wire Line
	6825 2550 6825 2900
Wire Wire Line
	6725 2550 6725 2900
Text Label 7925 4400 1    50   ~ 0
~ROM_OE
Wire Wire Line
	3500 3025 3850 3025
Wire Wire Line
	3500 3125 3850 3125
Wire Wire Line
	3500 3225 3850 3225
Wire Wire Line
	3500 3325 3850 3325
Wire Wire Line
	3500 3425 3850 3425
Wire Wire Line
	3500 3525 3850 3525
Wire Wire Line
	3500 3625 3850 3625
Wire Wire Line
	3500 3725 3850 3725
Wire Wire Line
	3500 3825 3850 3825
Wire Wire Line
	3500 3925 3850 3925
Wire Wire Line
	3500 4025 3850 4025
Wire Wire Line
	3500 4125 3850 4125
Wire Wire Line
	3500 4225 3850 4225
Wire Wire Line
	3500 4325 3850 4325
Wire Wire Line
	3500 4425 3850 4425
Wire Wire Line
	4650 3025 5000 3025
Wire Wire Line
	4650 3125 5000 3125
Wire Wire Line
	4650 3225 5000 3225
Wire Wire Line
	4650 3325 5000 3325
Wire Wire Line
	4650 3425 5000 3425
Wire Wire Line
	4650 3525 5000 3525
Wire Wire Line
	4650 3625 5000 3625
Wire Wire Line
	4650 3725 5000 3725
Wire Wire Line
	3850 4525 3500 4525
Wire Wire Line
	3850 4825 3500 4825
Wire Wire Line
	3500 4725 3850 4725
Text Label 3525 4725 0    50   ~ 0
~ROM_0
$Comp
L power:GND #PWR0113
U 1 1 61898CCB
P 4250 5025
F 0 "#PWR0113" H 4250 4775 50  0001 C CNN
F 1 "GND" H 4255 4852 50  0000 C CNN
F 2 "" H 4250 5025 50  0001 C CNN
F 3 "" H 4250 5025 50  0001 C CNN
	1    4250 5025
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0112
U 1 1 61898065
P 4250 2825
F 0 "#PWR0112" H 4250 2675 50  0001 C CNN
F 1 "VCC" H 4265 2998 50  0000 C CNN
F 2 "" H 4250 2825 50  0001 C CNN
F 3 "" H 4250 2825 50  0001 C CNN
	1    4250 2825
	1    0    0    -1  
$EndComp
Text Label 3525 4825 0    50   ~ 0
~ROM_OE
Text Label 1825 4525 0    50   ~ 0
BA15
$Comp
L Memory_EPROM:27C512 U1
U 1 1 60C63C55
P 4250 3925
F 0 "U1" H 4025 4975 50  0000 C CNN
F 1 "27C512" V 4250 3925 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket_LongPads" H 4250 3925 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 4250 3925 50  0001 C CNN
	1    4250 3925
	1    0    0    -1  
$EndComp
Text Label 1825 4425 0    50   ~ 0
BA14
Text Label 3525 4325 0    50   ~ 0
A13
Text Label 3525 4225 0    50   ~ 0
A12
Text Label 3525 4125 0    50   ~ 0
A11
Text Label 3525 4025 0    50   ~ 0
A10
Text Label 3525 3925 0    50   ~ 0
A9
Text Label 3525 3825 0    50   ~ 0
A8
Text Label 3525 3725 0    50   ~ 0
A7
Text Label 3525 3625 0    50   ~ 0
A6
Text Label 3525 3525 0    50   ~ 0
A5
Text Label 3525 3425 0    50   ~ 0
A4
Text Label 3525 3325 0    50   ~ 0
A3
Text Label 3525 3225 0    50   ~ 0
A2
Text Label 3525 3125 0    50   ~ 0
A1
Text Label 3525 3025 0    50   ~ 0
A0
Text Label 4975 3725 2    50   ~ 0
D7
Text Label 4975 3625 2    50   ~ 0
D6
Text Label 4975 3525 2    50   ~ 0
D5
Text Label 4975 3425 2    50   ~ 0
D4
Text Label 4975 3325 2    50   ~ 0
D3
Text Label 4975 3225 2    50   ~ 0
D2
Text Label 4975 3125 2    50   ~ 0
D1
Text Label 4975 3025 2    50   ~ 0
D0
Entry Wire Line
	6525 2450 6625 2550
Entry Wire Line
	6425 2450 6525 2550
Entry Wire Line
	6325 2450 6425 2550
Entry Wire Line
	6825 2450 6925 2550
Entry Wire Line
	6725 2450 6825 2550
Entry Wire Line
	6625 2450 6725 2550
Entry Wire Line
	7025 2450 7125 2550
Entry Wire Line
	6925 2450 7025 2550
Entry Wire Line
	8125 4525 8025 4425
Entry Wire Line
	8025 4525 7925 4425
Entry Wire Line
	7525 4525 7425 4425
Entry Wire Line
	7625 4525 7525 4425
Entry Wire Line
	7225 4525 7125 4425
Entry Wire Line
	7325 4525 7225 4425
Entry Wire Line
	7025 4525 6925 4425
Entry Wire Line
	6625 4525 6525 4425
Entry Wire Line
	6725 4525 6625 4425
Entry Wire Line
	6825 4525 6725 4425
Entry Wire Line
	6425 4525 6325 4425
Entry Wire Line
	6525 4525 6425 4425
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
	6325 2825 6325 2900
Wire Wire Line
	7725 3900 7725 3975
Wire Wire Line
	8725 3975 8725 3900
Wire Wire Line
	7925 3900 7925 4425
Wire Wire Line
	8025 3900 8025 4425
Wire Wire Line
	7525 3900 7525 4425
Wire Wire Line
	7425 3900 7425 4425
Wire Wire Line
	7225 3900 7225 4425
Wire Wire Line
	7125 3900 7125 4425
Wire Wire Line
	6925 3900 6925 4425
Wire Wire Line
	6725 3900 6725 4425
Wire Wire Line
	6625 3900 6625 4425
Wire Wire Line
	6525 3900 6525 4425
Wire Wire Line
	6425 3900 6425 4425
Wire Wire Line
	6325 3900 6325 4425
Entry Wire Line
	7525 2450 7625 2550
Entry Wire Line
	7425 2450 7525 2550
Entry Wire Line
	7325 2450 7425 2550
Entry Wire Line
	7125 2450 7225 2550
Wire Wire Line
	7725 2825 7725 2900
$Comp
L power:GND #PWR0101
U 1 1 61420F9D
P 6025 2900
F 0 "#PWR0101" H 6025 2650 50  0001 C CNN
F 1 "GND" H 6030 2727 50  0000 C CNN
F 2 "" H 6025 2900 50  0001 C CNN
F 3 "" H 6025 2900 50  0001 C CNN
	1    6025 2900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6025 2900 6025 2825
Wire Wire Line
	6025 2825 6325 2825
Wire Wire Line
	8425 2825 8425 2900
$Comp
L power:GND #PWR0102
U 1 1 615160B6
P 8725 2900
F 0 "#PWR0102" H 8725 2650 50  0001 C CNN
F 1 "GND" H 8730 2727 50  0000 C CNN
F 2 "" H 8725 2900 50  0001 C CNN
F 3 "" H 8725 2900 50  0001 C CNN
	1    8725 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8725 2900 8725 2825
Wire Wire Line
	8725 2825 8425 2825
Wire Wire Line
	8725 3975 7725 3975
Wire Wire Line
	6750 7250 6750 7325
$Comp
L power:VCC #PWR0103
U 1 1 6053A5CF
P 7725 2825
F 0 "#PWR0103" H 7725 2675 50  0001 C CNN
F 1 "VCC" H 7740 2998 50  0000 C CNN
F 2 "" H 7725 2825 50  0001 C CNN
F 3 "" H 7725 2825 50  0001 C CNN
	1    7725 2825
	1    0    0    -1  
$EndComp
NoConn ~ 6825 3900
NoConn ~ 7625 3900
NoConn ~ 7025 3900
NoConn ~ 8125 2900
NoConn ~ 8225 2900
NoConn ~ 8325 2900
Entry Wire Line
	3400 3725 3500 3625
Entry Wire Line
	3400 3825 3500 3725
Entry Wire Line
	3400 3925 3500 3825
Entry Wire Line
	3400 3425 3500 3325
Entry Wire Line
	3400 3525 3500 3425
Entry Wire Line
	3400 3625 3500 3525
Entry Wire Line
	3400 3225 3500 3125
Entry Wire Line
	3400 3325 3500 3225
Entry Wire Line
	3400 3125 3500 3025
Entry Wire Line
	3400 4625 3500 4525
Entry Wire Line
	3400 4925 3500 4825
Entry Wire Line
	3400 4825 3500 4725
Entry Wire Line
	3400 4325 3500 4225
Entry Wire Line
	3400 4425 3500 4325
Entry Wire Line
	3400 4525 3500 4425
Entry Wire Line
	3400 4125 3500 4025
Entry Wire Line
	3400 4225 3500 4125
Entry Wire Line
	3400 4025 3500 3925
Entry Wire Line
	5000 3625 5100 3525
Entry Wire Line
	5000 3725 5100 3625
Entry Wire Line
	5000 3325 5100 3225
Entry Wire Line
	5000 3425 5100 3325
Entry Wire Line
	5000 3525 5100 3425
Entry Wire Line
	5000 3125 5100 3025
Entry Wire Line
	5000 3225 5100 3125
Entry Wire Line
	5000 3025 5100 2925
Wire Bus Line
	3400 5375 5100 5375
NoConn ~ 8425 3900
NoConn ~ 8225 3900
NoConn ~ 8325 3900
Wire Wire Line
	1800 3025 2150 3025
Wire Wire Line
	1800 3125 2150 3125
Wire Wire Line
	1800 3225 2150 3225
Wire Wire Line
	1800 3325 2150 3325
Wire Wire Line
	1800 3425 2150 3425
Wire Wire Line
	1800 3525 2150 3525
Wire Wire Line
	1800 3625 2150 3625
Wire Wire Line
	1800 3725 2150 3725
Wire Wire Line
	1800 3825 2150 3825
Wire Wire Line
	1800 3925 2150 3925
Wire Wire Line
	1800 4025 2150 4025
Wire Wire Line
	1800 4125 2150 4125
Wire Wire Line
	1800 4225 2150 4225
Wire Wire Line
	1800 4325 2150 4325
Wire Wire Line
	1800 4425 2150 4425
Wire Wire Line
	2950 3025 3300 3025
Wire Wire Line
	2950 3125 3300 3125
Wire Wire Line
	2950 3225 3300 3225
Wire Wire Line
	2950 3325 3300 3325
Wire Wire Line
	2950 3425 3300 3425
Wire Wire Line
	2950 3525 3300 3525
Wire Wire Line
	2950 3625 3300 3625
Wire Wire Line
	2950 3725 3300 3725
Wire Wire Line
	2150 4525 1800 4525
Wire Wire Line
	2150 4825 1800 4825
Wire Wire Line
	1800 4725 2150 4725
Text Label 1825 4725 0    50   ~ 0
~ROM_1
$Comp
L power:GND #PWR0104
U 1 1 6072DF1D
P 2550 5025
F 0 "#PWR0104" H 2550 4775 50  0001 C CNN
F 1 "GND" H 2555 4852 50  0000 C CNN
F 2 "" H 2550 5025 50  0001 C CNN
F 3 "" H 2550 5025 50  0001 C CNN
	1    2550 5025
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0105
U 1 1 6072DF23
P 2550 2825
F 0 "#PWR0105" H 2550 2675 50  0001 C CNN
F 1 "VCC" H 2565 2998 50  0000 C CNN
F 2 "" H 2550 2825 50  0001 C CNN
F 3 "" H 2550 2825 50  0001 C CNN
	1    2550 2825
	1    0    0    -1  
$EndComp
Text Label 1825 4825 0    50   ~ 0
~ROM_OE
$Comp
L Memory_EPROM:27C512 U2
U 1 1 6072DF2B
P 2550 3925
F 0 "U2" H 2325 4975 50  0000 C CNN
F 1 "27C512" V 2550 3925 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_Socket_LongPads" H 2550 3925 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0015.pdf" H 2550 3925 50  0001 C CNN
	1    2550 3925
	1    0    0    -1  
$EndComp
Text Label 1825 4325 0    50   ~ 0
A13
Text Label 1825 4225 0    50   ~ 0
A12
Text Label 1825 4125 0    50   ~ 0
A11
Text Label 1825 4025 0    50   ~ 0
A10
Text Label 1825 3925 0    50   ~ 0
A9
Text Label 1825 3825 0    50   ~ 0
A8
Text Label 1825 3725 0    50   ~ 0
A7
Text Label 1825 3625 0    50   ~ 0
A6
Text Label 1825 3525 0    50   ~ 0
A5
Text Label 1825 3425 0    50   ~ 0
A4
Text Label 1825 3325 0    50   ~ 0
A3
Text Label 1825 3225 0    50   ~ 0
A2
Text Label 1825 3125 0    50   ~ 0
A1
Text Label 1825 3025 0    50   ~ 0
A0
Text Label 3275 3725 2    50   ~ 0
D7
Text Label 3275 3625 2    50   ~ 0
D6
Text Label 3275 3525 2    50   ~ 0
D5
Text Label 3275 3425 2    50   ~ 0
D4
Text Label 3275 3325 2    50   ~ 0
D3
Text Label 3275 3225 2    50   ~ 0
D2
Text Label 3275 3125 2    50   ~ 0
D1
Text Label 3275 3025 2    50   ~ 0
D0
Entry Wire Line
	1700 3725 1800 3625
Entry Wire Line
	1700 3825 1800 3725
Entry Wire Line
	1700 3925 1800 3825
Entry Wire Line
	1700 3425 1800 3325
Entry Wire Line
	1700 3525 1800 3425
Entry Wire Line
	1700 3625 1800 3525
Entry Wire Line
	1700 3225 1800 3125
Entry Wire Line
	1700 3325 1800 3225
Entry Wire Line
	1700 3125 1800 3025
Entry Wire Line
	1700 4625 1800 4525
Entry Wire Line
	1700 4925 1800 4825
Entry Wire Line
	1700 4825 1800 4725
Entry Wire Line
	1700 4325 1800 4225
Entry Wire Line
	1700 4425 1800 4325
Entry Wire Line
	1700 4525 1800 4425
Entry Wire Line
	1700 4125 1800 4025
Entry Wire Line
	1700 4225 1800 4125
Entry Wire Line
	1700 4025 1800 3925
Entry Wire Line
	3300 3625 3400 3525
Entry Wire Line
	3300 3725 3400 3625
Entry Wire Line
	3300 3325 3400 3225
Entry Wire Line
	3300 3425 3400 3325
Entry Wire Line
	3300 3525 3400 3425
Entry Wire Line
	3300 3125 3400 3025
Entry Wire Line
	3300 3225 3400 3125
Entry Wire Line
	3300 3025 3400 2925
Wire Bus Line
	1700 5375 3400 5375
Connection ~ 3400 5375
$Comp
L Device:C_Small C2
U 1 1 6073AC75
P 6575 7150
F 0 "C2" V 6625 7000 50  0000 L CNN
F 1 "100nF" V 6625 7200 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.7mm_W2.5mm_P5.00mm" H 6575 7150 50  0001 C CNN
F 3 "~" H 6575 7150 50  0001 C CNN
	1    6575 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 7325 6575 7325
Wire Wire Line
	6575 7325 6575 7250
Wire Wire Line
	6750 7325 6750 7400
Connection ~ 6750 7325
Wire Wire Line
	6575 6725 6575 6825
Wire Wire Line
	6575 6825 6750 6825
Connection ~ 6575 6825
Wire Wire Line
	6750 6825 6750 7050
Wire Wire Line
	6575 6825 6575 7050
Text Label 8125 4400 1    50   ~ 0
~ROM_1
Entry Wire Line
	8225 4525 8125 4425
Wire Wire Line
	8125 3900 8125 4425
Text Label 9475 2950 0    50   ~ 0
BA15
Text Label 9475 3650 0    50   ~ 0
BA14
Entry Wire Line
	9350 3550 9450 3650
Entry Wire Line
	9350 2850 9450 2950
Wire Wire Line
	10000 2950 9450 2950
Wire Wire Line
	10550 2725 10200 2725
Wire Wire Line
	10000 2875 10000 2950
$Comp
L power:VCC #PWR03
U 1 1 60482C7C
P 9725 2650
F 0 "#PWR03" H 9725 2500 50  0001 C CNN
F 1 "VCC" H 9740 2823 50  0000 C CNN
F 2 "" H 9725 2650 50  0001 C CNN
F 3 "" H 9725 2650 50  0001 C CNN
	1    9725 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9725 2725 9725 2650
Wire Wire Line
	9800 2725 9725 2725
$Comp
L solder_select:SolderJumper_3_Bridged12 JP1
U 1 1 60482C74
P 10000 2725
F 0 "JP1" H 10000 2930 50  0000 C CNN
F 1 "A15" H 10000 2839 50  0000 C CNN
F 2 "solder_bridge:select" H 10000 2725 50  0001 C CNN
F 3 "~" H 10000 2725 50  0001 C CNN
	1    10000 2725
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10000 3650 9450 3650
Wire Wire Line
	10000 3575 10000 3650
$Comp
L power:VCC #PWR04
U 1 1 6045383E
P 9725 3350
F 0 "#PWR04" H 9725 3200 50  0001 C CNN
F 1 "VCC" H 9740 3523 50  0000 C CNN
F 2 "" H 9725 3350 50  0001 C CNN
F 3 "" H 9725 3350 50  0001 C CNN
	1    9725 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9725 3425 9725 3350
Wire Wire Line
	9800 3425 9725 3425
$Comp
L solder_select:SolderJumper_3_Bridged12 JP2
U 1 1 60439B63
P 10000 3425
F 0 "JP2" H 10000 3630 50  0000 C CNN
F 1 "A14" H 10000 3539 50  0000 C CNN
F 2 "solder_bridge:select" H 10000 3425 50  0001 C CNN
F 3 "~" H 10000 3425 50  0001 C CNN
	1    10000 3425
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10550 2725 10550 2325
Wire Wire Line
	8025 2325 8025 2900
Wire Wire Line
	7925 2250 7925 2900
Wire Wire Line
	10200 3425 10650 3425
Wire Wire Line
	10650 2250 10650 3425
Wire Bus Line
	8900 2450 8900 4525
Wire Wire Line
	7925 2250 10650 2250
Wire Wire Line
	8025 2325 10550 2325
Wire Bus Line
	9350 2450 8900 2450
Connection ~ 8900 2450
Wire Notes Line
	9125 3800 10925 3800
Wire Notes Line
	10925 3800 10925 1275
Wire Notes Line
	10925 1275 9125 1275
Wire Notes Line
	9125 1275 9125 3800
Text Notes 9775 1375 0    50   ~ 0
EPROM Size
Text Notes 9225 1650 0    50   ~ 0
These jumpers  configure the size of\nEPROMs installed on the cartridge (pin 1\nwill be indicated by a square pad).
Text Notes 9950 1875 0    50   ~ 0
A15
Text Notes 10250 1875 0    50   ~ 0
A14
Text Notes 9550 1975 0    50   ~ 0
27C512
Text Notes 9550 2075 0    50   ~ 0
27C256
Text Notes 9550 2175 0    50   ~ 0
27C128
Text Notes 9925 1975 0    50   ~ 0
1-2
Text Notes 10225 2075 0    50   ~ 0
1-2
Text Notes 9925 2075 0    50   ~ 0
2-3
Text Notes 9925 2175 0    50   ~ 0
2-3
Text Notes 10225 2175 0    50   ~ 0
2-3
Text Notes 10225 1975 0    50   ~ 0
1-2
Text Label 3525 4525 0    50   ~ 0
BA15
Text Label 3525 4425 0    50   ~ 0
BA14
Wire Bus Line
	9350 2450 9350 3550
Wire Bus Line
	5100 2450 5100 5375
Wire Bus Line
	6425 4525 8900 4525
Wire Bus Line
	5100 2450 8900 2450
Wire Bus Line
	3400 2925 3400 5375
Wire Bus Line
	1700 3125 1700 5375
$EndSCHEMATC
