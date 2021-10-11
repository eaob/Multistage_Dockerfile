PROJECT = "Node.js project"


all: install test server

lint: ;@echo "Syntax checks at ${PROJECT}....."; \
        test:lint

test: ;@echo "Testing ${PROJECT}....."; \
        npm run test

server: ;@echo "Starting ${PROJECT}....."; \
        npm start

install: ;@echo "Installing ${PROJECT}....."; \
        npm install

clean: ;
        rm -rf ./*


.PHONY: test server install clean

