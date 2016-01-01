imagename = gae-swift-example
containername = gae-swift-example

build:
	docker build -t $(imagename) --rm .

run: build
	docker run -d -p 8080:8080 --name $(imagename) $(containername)

attach:
	docker exec -it $(containername) bash

logs:
	docker logs -f $(containername)

clean:
	docker stop $(containername); docker rm $(containername)

deploy:
	gcloud preview app deploy app.yaml
