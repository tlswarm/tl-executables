#!/bin/bash
ssh -D 1081 $username@v-$(getrobotname $1).swarmfarm.com
