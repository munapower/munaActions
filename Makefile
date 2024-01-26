
run: build
	docker run --rm keyword-release-action 

build:
	docker build --tag keyword-release-action .

test:
	./entrypoint.sh 
