all:
	lsc -c -o lib src -d --const && npm start
build:
	lsc -c -o lib src -d --const
run:
	node lib/app.js --harmony
