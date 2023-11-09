#!/bin/bash

checkupdates | wc -l | sed -r 's/^/ /;s/^ 0//'
