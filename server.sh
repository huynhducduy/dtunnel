#!/bin/bash

chmod +x ./inlets # grant execution permissions to all
./inlets server --port=$PORT --token="$TOKEN" # run inlets server
