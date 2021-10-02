TAG := $(or $(TAG),latest)

build:
	docker build -t kphp-ffi .

build_app_locally: test.php
	docker run --rm -it -v $(shell pwd):/src kphp-ffi:latest --mode cli -o /src/test /src/test.php

build_app: test.php
	docker run --rm -it -v $(shell pwd):/src atercattus/kphp-ffi:latest --mode cli -o /src/test /src/test.php

push:
	docker tag kphp-ffi:latest atercattus/kphp-ffi:$(TAG)
	docker push atercattus/kphp-ffi:$(TAG)
