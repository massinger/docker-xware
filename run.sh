#!/bin/bash

/opt/xware/portal > /opt/xware/log 2>&1
tail -f /opt/xware/log
