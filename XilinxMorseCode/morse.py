# Instantiate classes to use buttons, load base overlay

from pynq.overlays.base import BaseOverlay

base = BaseOverlay("base.bit")

print("Init complete")

g_button_status = [0, 0]



import asyncio

#

async def flash_led(num):
    print("Init pushbutton ",num)
    while True:
        await base.buttons[num].wait_for_value_async(1)
        while base.buttons[num].read():
            base.leds[num].toggle()
            g_button_status[num] = 1
            await asyncio.sleep(0.2)
        base.leds[num].off()    
        
tasks = [asyncio.ensure_future(flash_led(i)) for i in range(2)]


import psutil

# dict source: https://www.geeksforgeeks.org/morse-code-translator-python/#
MORSE_CODE_DICT = { 'A':'.-', 'B':'-...',
                    'C':'-.-.', 'D':'-..', 'E':'.',
                    'F':'..-.', 'G':'--.', 'H':'....',
                    'I':'..', 'J':'.---', 'K':'-.-',
                    'L':'.-..', 'M':'--', 'N':'-.',
                    'O':'---', 'P':'.--.', 'Q':'--.-',
                    'R':'.-.', 'S':'...', 'T':'-',
                    'U':'..-', 'V':'...-', 'W':'.--',
                    'X':'-..-', 'Y':'-.--', 'Z':'--..',
                    '1':'.----', '2':'..---', '3':'...--',
                    '4':'....-', '5':'.....', '6':'-....',
                    '7':'--...', '8':'---..', '9':'----.',
                    '0':'-----', ', ':'--..--', '.':'.-.-.-',
                    '?':'..--..', '/':'-..-.', '-':'-....-',
                    '(':'-.--.', ')':'-.--.-'}

# reverse dict to look-up char from code
MORSE_CODE_DICT = {v: k for k, v in MORSE_CODE_DICT.items()}


async def morse_code():
    print("Starting Morse Code loop")
    
    morse_string = ""
    
    # time to wait for symbol to be 'complete'
    delay_count = 0
    
    while True:
        #print(delay_count)
        
        # handle . press
        if (g_button_status[0] == 1):
            print(".", end=" ")
            g_button_status[0] = 0
            morse_string = morse_string + "."
            delay_count = 0
            
        # handle - press
        elif (g_button_status[1] == 1):
            print("-", end=" ")
            g_button_status[1] = 0
            morse_string = morse_string + "-"
            delay_count = 0
            
        # handle completed symbol after delay
        if (delay_count >= 10):
            delay_count = 0
            if (len(morse_string) > 6):
                print(" -> 1 char at a time please")       
            elif (len(morse_string) > 0):
                try:
                    character = MORSE_CODE_DICT[morse_string]
                    print(" -> ", MORSE_CODE_DICT[morse_string])
                except KeyError:
                    print(" -> ?")
            morse_string = ""   
        
        delay_count = delay_count + 1
        await asyncio.sleep(0.1)
        
tasks.append(asyncio.ensure_future(morse_code()))




if base.switches[0].read():
    print("Please set switch 0 low before running")
else:
    base.switches[0].wait_for_value(1)


[t.cancel() for t in tasks]


base.switches[0].wait_for_value(0)



