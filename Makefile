setup:
	bin/setup

start:
	bin/rails s

guard:
	bundle exec guard

test:
	bin/rails test

.PHONY: test
