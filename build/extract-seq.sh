#!/bin/bash
# Extract a sub-region using Osmosis
# Bounding box: 151.853,-28.48,154.366,-26.249

osmosis \
  --read-pbf file="australia-latest.pbf" \
  --bounding-box \
    top=-26.249 \
    left=151.853 \
    bottom=-28.48 \
    right=154.366 \
    completeWays=yes \
    completeRelations=yes \
  --write-pbf file="seq.pbf"
