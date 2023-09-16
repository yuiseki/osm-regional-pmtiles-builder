
region: setup tmp/region.osm_id tmp/region.osm.json docs/region.geojson docs/region.pmtiles docs/style.json

clean:
	rm -f tmp/region.osm_id tmp/region.osm.json docs/region.geojson docs/region.pmtiles docs/style.json

.PHONY: setup
setup:
	npm ci

.PHONY: start
start:
	npx http-server docs

tmp/region.osm_id:
	./fetch-nominatim.sh $(filter-out $@ region,$(MAKECMDGOALS))

tmp/region.osm.json:
	./fetch-overpass-api.sh

docs/region.geojson:
	npx osmtogeojson ./tmp/region.osm.json > ./docs/region.geojson

docs/region.pmtiles:
	pmtiles extract https://tile.openstreetmap.jp/static/planet.pmtiles docs/region.pmtiles --region=./docs/region.geojson

docs/style.json:
	npx charites build style.yml docs/style.json

%:
	@:
