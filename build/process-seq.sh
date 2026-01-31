#install tilemaker https://github.com/systemed/tilemaker/blob/master/docs/INSTALL.md

# mkdir -p coastline
# cd coastline
# wget https://osmdata.openstreetmap.de/download/water-polygons-split-4326.zip
# unzip -o -j water*.zip
# cd ..

#southeast queensland
# docker run --rm --pull always -v $(pwd):/data -w /data \
#   ghcr.io/systemed/tilemaker:master \
#   australia-latest.pbf \
#   --bbox 151.853,-28.48,154.366,-26.249 \
#   --output seqtiles/

docker run --rm --pull always -v $(pwd):/data -w /data \
  ghcr.io/systemed/tilemaker:master \
  seq.pbf \
  --bbox 151.853,-28.48,154.366,-26.249 \
  --output seqtiles/

# Recursive multi-threaded brotli compression
TILE_COUNT=$(find seqtiles -type f -name "*.pbf" | wc -l | xargs)
echo "Compressing $TILE_COUNT tiles with Brotli (parallel)..."
find seqtiles -type f -name "*.pbf" -print0 | xargs -0 -n1 -P$(sysctl -n hw.ncpu) sh -c 'brotli -f --best --rm "$1"' --
echo "Done. Tiles reduced to $(du -sh seqtiles | cut -f1)."