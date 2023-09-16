
OSM_ID=`cat ./tmp/region.osm_id`

curl -s --request POST \
    --url https://overpass-api.de/api/interpreter \
    --data "[out:json][timeout:30000]; nwr($OSM_ID); out geom;" \
    | jq -r . > ./tmp/region.osm.json
