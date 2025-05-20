.PHONY: default build clean docs git-hook pretty lint test run

default: build

build: output

clean:
	rm --force --recursive node_modules output tsconfig.tsbuildinfo

docs:
	@echo "No documentation included by default."

git-hook:
	echo "make pretty" > .git/hooks/pre-commit; chmod +x .git/hooks/pre-commit

pretty: node_modules
	npm exec -- biome check --write --no-errors-on-unmatched
	npm pkg fix

lint: node_modules
	npm exec -- biome check .
	npm exec -- tsc --noEmit

test:
	@echo "This project has no tests."

run: clean
	npm exec -- vite serve


node_modules:
	npm install

output: node_modules
	npm exec -- vite build

preview: clean
	npm exec -- vite preview
