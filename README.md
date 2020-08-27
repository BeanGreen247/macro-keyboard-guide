# macro-keyboard-guide
a guide on setting up a secondary macro keyboard
```
sudo pacman -S xorg-xinput evtest xdotool
```
create a new udev file
```
sudo nano /etc/udev/hwdb.d/70-keyboard.hwdb
```
```
evdev:input:b*vXXXXpYYYYe*
```
vXXXX - vendor id

pYYYY - product id


run lsusb and look for the device

copy and paste but change into allcaps in the /etc/udev/hwdb.d/70-keyboard.hwdb file

example
```
command output
Bus 005 Device 002: ID 145f:0217 Trust GXT 890 Keyboard

what to type in
evdev:input:b*v145Fp0217e*
```
next we needto find the event number of our device

so do 
```
ls /dev/input/
```
those event files are virtual interfaces to the hardware itself
we need to figure out which one is mapped to our device
its easy to do with the by-id folder like so
```
ls /dev/input/by-id/
```
find your device

next run
```
ls -l /dev/input/by-id/
```
it will tell us where the file is locaded, because its a symbolic link

next we need the scan codes of the device

to do this we need to run an evtest on the event
```
sudo evtest /dev/input/eventXX
```
replace the Xs with your devices event

now press every button you want to remap

look for the value in MSC_SCAN

open the /etc/udev/hwdb.d/70-keyboard.hwdb

next add them like so
```
KEYBOARD_KEY_(NUMBER_FROM_MSC_SCAN_HERE)
```
70052 (up) in my case

this will make it so we can remap the keys we want to remap

you can set them to regular keys like so
```
KEYBOARD_KEY_(NUMBER_FROM_MSC_SCAN_HERE)=a
```
the file should look like this
```
evdev:input:b*v145Fp0217e*
 KEYBOARD_KEY_70013=f13
```
run these two commands to reload the devices 
```
sudo systemd-hwdb update
sudo udevadm trigger --verbose --sysname-match="event*"
```
now sending individual keys is cool and all, but lets talk macros

open the file /etc/udev/hwdb.d/70-keyboard.hwdb again and change the letters to uncommon keys like 13 to 24

explonation Function keys 13 - 24 are activated by pressing ctrl + shift + f1 - f12.
they are not visible or phisically present to the user, but they do exist in the scan interpretation software
we need those to execute keyboard shortcuts

we will do it using a script

run xinput test 

to figure out what key names you have to use with xdotoo run xev

video for reference

[one step closer to becoming a macro king](https://www.youtube.com/watch?v=GHMROmAZlUM&feature=youtu.be)
