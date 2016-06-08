#!/bin/sh

rtl_fm -M wbfm -f $1 | sox -traw -r24k -es -b16 -c1 -V1 - -tmp3 - | socat -u - TCP-LISTEN:8080
