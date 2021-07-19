#!/bin/sh
rm ./digger
mkdir -p bin/x86_64-linux
fpc -MObjFPC -Scghi -Cg -O1 -g -gl -l \
    -vewnhibq -Filib/x86_64-linux \
    -Fu/usr/share/lazarus/2.0.12/lcl/units/x86_64-linux/gtk2 \
    -Fu/usr/share/lazarus/2.0.12/lcl/units/x86_64-linux \
    -Fu/usr/share/lazarus/2.0.12/components/lazutils/lib/x86_64-linux \
    -Fu/usr/share/lazarus/2.0.12/packager/units/x86_64-linux \
    -Fu. -FUbin/x86_64-linux -FE. -odigger -dLCL -dLCLgtk2 \
    src/launcher.pas
./digger
