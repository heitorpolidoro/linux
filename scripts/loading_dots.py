import atexit
import os
import sys
import time
from argparse import ArgumentParser


def convert(bin):
    """
    00010000 -> 00000001
    """
    new_bin = ['0'] * 8
    # 10000000 -> 01000000
    new_bin[1] = bin[0]

    # 01000000 -> 00000100
    new_bin[5] = bin[1]

    # 00100000 -> 00000010
    new_bin[6] = bin[2]

    # 00010000 -> 00000001
    new_bin[7] = bin[3]

    # 00001000 -> 00001000
    new_bin[4] = bin[4]

    # 00000100 -> 00010000
    new_bin[3] = bin[5]

    # 00000010 -> 00100000
    new_bin[2] = bin[6]

    # 00000001 -> 10000000
    new_bin[0] = bin[7]

    return chr(int(''.join(new_bin), 2) + 0x2800)


def rotate(s, left=False):
    try:
        while True:
            print(convert(s), end='\r')
            s = rotate_left(s) if left else rotate_right(s)
            time.sleep(0.5)
    except KeyboardInterrupt:
        pass


def rotate_left(s):
    return s[1:] + s[0]


def rotate_right(s):
    return s[-1] + s[:-1]


def print_dots(s, left=False):
    for i in range(8):
        print(convert(s), end='')
        s = rotate_left(s) if left else rotate_right(s)

os.system('setterm -cursor off')


atexit.register(lambda : os.system('setterm -cursor on'))
parser = ArgumentParser()
parser.add_argument('bin', nargs='*')
parser.add_argument('--rotate', nargs=1)
parser.add_argument('--print', nargs=1)
parser.add_argument('--left', action='store_true')

args = parser.parse_args()
if args.rotate:
    rotate(args.rotate[0], args.left)
elif args.print:
    print_dots(args.print[0], args.left)
else:
    for arg in args.bin:
        print(convert(arg))

