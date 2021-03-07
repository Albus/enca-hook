#!/bin/sh -e
exec env /usr/bin/enca $@ -L `head --lines=1 $lang` $data