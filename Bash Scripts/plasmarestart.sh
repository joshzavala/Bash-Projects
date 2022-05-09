# small script with commands to kill plasmashell and restart it if plasma was acting slow or buggy.

#!/bin/bash

# kills all plasmashell processes running
killall plasmashell

sleep 1

# starts all plasmshell processes fresh again
kstart5 plasmashell
