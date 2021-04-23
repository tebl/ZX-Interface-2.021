@echo off
if not exist font_cga.bin sbasm.py font_cga.asm
if not exist font_cp850.bin sbasm.py font_cp850.asm
if not exist font_computer.bin sbasm.py font_computer.asm
if not exist font_msx.bin sbasm.py font_msx.asm
if not exist font_fant8.bin sbasm.py font_fant8.asm
if not exist font_tiny.bin sbasm.py font_tiny.asm
if not exist font_border.bin sbasm.py font_border.asm

sbasm.py selector.asm
type selector.list
sbasm.py loader.asm
type loader.list