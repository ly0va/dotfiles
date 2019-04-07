#!/usr/bin/env python3

'''USAGE: i3-controller.py move|go prev|next'''

import subprocess
import sys
import json

def get_workspace():
    handle = subprocess.Popen(["i3-msg","-t","get_workspaces"], stdout=subprocess.PIPE)
    output = handle.communicate()[0]
    data = json.loads(output.decode())
    for ws in data:
        if ws['focused']:
            return ws['num']

def move_to(num):
    subprocess.Popen(["i3-msg","move container to workspace "+str(num)], stdout=subprocess.PIPE)

def go_to(num):
    subprocess.Popen(["i3-msg","workspace "+str(num)], stdout=subprocess.PIPE)


if __name__ == '__main__':

    if len(sys.argv) < 3:
        print(__doc__)
        exit(1)

    what = sys.argv[1]
    where = sys.argv[2]

    if what not in ['move', 'go'] or \
       where not in ['next', 'prev']:
           print(__doc__)
           exit(1)
    
    current = get_workspace()

    if where == 'next':
        to = current % 9 + 1
    elif where == 'prev':
        to = (current + 7) % 9 + 1

    if what == 'move':
        move_to(to)
    go_to(to)


