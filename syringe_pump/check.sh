#!/bin/bash
KEY = "jmp"
grep $KEY led.s | wc -l  
grep KEY LiquidCrystal.s | wc -l 
grep KEY syringePump_orig.s | wc -l 
grep KEY util.s | wc -l  