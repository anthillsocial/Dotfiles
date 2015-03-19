#!/bin/bash
ssh -D 1080 tom@theanthillsocial.co.uk
# Then in firefox set the web proxy to:
#  manual
#  SOCKS Host: localhost
#  PORT: 1080
#  SOCKSv5, Remote DNS
