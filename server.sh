#!/bin/bash

chmod +x ./inlets # grant execution permissions to all
./inlets server --disable-transport-wrapping --port=$PORT --token="$TOKEN" # run inlets server
