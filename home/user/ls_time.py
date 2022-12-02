#!/usr/bin/python

import sys
import subprocess
import re
from datetime import datetime

a = sys.argv
if len(a) < 1 or len(a) > 3:
    print("Missing or too much arguments, use : $python3 ls_time.py [<ls_options>] [<path_to_dir>]")
    exit()

# =====================================================
# USE : python3 ls_time.py [ls_args]
#
# ALIAS .bashrc : alias lt="python3 ~/ls_time.py"
#
# EXAMPLES :
# $lt
# $lt -alh
# $lt ..
# $lt -alh /path/to/folder
# =====================================================

def format_timestamp(filename):
    for j in [(13, 1000), (10, 1)]:
        n = j[0]
        ratio = j[1]
        reg = re.compile(r'.*([0-9]{%d}).*' % n)
        match = reg.match(filename)
        if match:
            g = int(match.groups()[0])
            dt = datetime.fromtimestamp(g / ratio).strftime("| %d/%m/%Y %H:%M:%S |")
            filename = re.sub(r'([0-9]{%d})' % n, dt, filename)
    return filename


l = subprocess.run(["ls", *a[1:]], text=True, stdout=subprocess.PIPE).stdout.splitlines()
for i in range(len(l)):
    l[i] = format_timestamp(l[i])

print("\n".join(l))
