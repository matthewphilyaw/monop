build: 
	@mkdir -p js
	coffee -bc -o js *.coffee 

test: build
	node ./js/test

clean:
	@rm -r ./js
