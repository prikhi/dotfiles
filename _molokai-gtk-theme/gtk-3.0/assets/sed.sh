#!/bin/sh
sed -i \
         -e 's/#1b1d1e/rgb(0%,0%,0%)/g' \
         -e 's/#f8f8f0/rgb(100%,100%,100%)/g' \
    -e 's/#232526/rgb(50%,0%,0%)/g' \
     -e 's/#fd971f/rgb(0%,50%,0%)/g' \
     -e 's/#f8f8f0/rgb(50%,0%,50%)/g' \
     -e 's/#272822/rgb(0%,0%,50%)/g' \
	"$@"