#!/bin/bash
file=$1
nvim $file && rm $file
