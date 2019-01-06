#!/bin/bash

sudo rmmod xpad

sudo xboxdrv \
    --daemon \
    --silent \
    --dbus session \
    --controller-slot 0 \
    --trigger-as-button \
    --ui-axismap x2=ABS_Z,y2=ABS_RZ \
    --ui-buttonmap A=BTN_B,B=BTN_X,X=BTN_A,TR=BTN_THUMBL,TL=BTN_MODE,GUIDE=BTN_THUMBR \
    --next-controller \
    --trigger-as-button \
    --ui-axismap x2=ABS_Z,y2=ABS_RZ \
    --ui-buttonmap A=BTN_B,B=BTN_X,X=BTN_A,TR=BTN_THUMBL,TL=BTN_MODE,GUIDE=BTN_THUMBR

