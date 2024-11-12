#install tilemaker https://github.com/systemed/tilemaker/blob/master/docs/INSTALL.md

mkdir -p coastline
cd coastline
wget https://osmdata.openstreetmap.de/download/water-polygons-split-4326.zip
unzip -o -j water*.zip
cd ..
# osmosis --rbf australia-latest.osm.pbf --bounding-box top=-26.249 left=151.853 bottom=-28.48 right=154.366 --wb file=seq.pbf
tilemaker australia-latest.osm.pbf --bbox 151.853,-28.48,154.366,-26.249 seq.mbtiles