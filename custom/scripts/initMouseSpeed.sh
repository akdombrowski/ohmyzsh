#!/bin/bash

# from /var/log/syslog:
#
# {...from initial connection...}
# 2024-11-28T17:15:45.367337-06:00 dom-nixbox kernel: input: ERGO M575 Mouse as /devices/virtual/misc/uhid/0005:046D:B027.0005/input/input28
# 2024-11-28T17:15:45.367373-06:00 dom-nixbox kernel: hid-generic 0005:046D:B027.0005: input,hidraw3: BLUETOOTH HID v0.09 Mouse [ERGO M575] on b0:19:21:e3:b5:8e
#
# {...disconnected then reconnected mouse...}
#
# 2024-11-28T17:16:59.364316-06:00 dom-nixbox kernel: input: ERGO M575 Mouse as /devices/virtual/misc/uhid/0005:046D:B027.0006/input/input30
# 2024-11-28T17:16:59.364342-06:00 dom-nixbox kernel: hid-generic 0005:046D:B027.0006:
# input,hidraw3: BLUETOOTH HID v0.09 Mouse [ERGO M575] on b0:19:21:e3:b5:8e
