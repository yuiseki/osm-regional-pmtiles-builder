mkdir -p ./tmp

curl -s -G -H "User-Agent: regional-pmtiles-builder" \
  -d format=jsonv2 \
  -d polygon_geojson=0 \
  --data-urlencode q=$1 \
  https://nominatim.openstreetmap.org/search \
  | jq .[0].osm_id > ./tmp/region.osm_id
