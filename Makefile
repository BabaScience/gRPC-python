# Variables
PROTO_DIR=. #proto
OUT_DIR=. #pb2
VENV_DIR=venv
# For Windows
PYTHON=$(VENV_DIR)/Scripts/python 
PIP=$(VENV_DIR)/Scripts/pip
# For Linux or MacOS
# PYTHON=$(VENV_DIR)/bin/python
# PIP=$(VENV_DIR)/bin/pip

PROTO_FILES= helloworld.proto #$(wildcard $(PROTO_DIR)/*.proto)

echo:
	@echo $(PROTO_FILES)


# Default target
.PHONY: all
all: install generate run

# Create virtual environment
$(VENV_DIR):
	python3 -m venv $(VENV_DIR)

# Install dependencies
.PHONY: install
install: $(VENV_DIR)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Generate gRPC code from proto files
.PHONY: generate
generate: $(PROTO_FILES)
	$(PYTHON) -m grpc_tools.protoc -I=$(PROTO_DIR) --python_out=$(OUT_DIR) --grpc_python_out=$(OUT_DIR) $(PROTO_FILES)

# Run gRPC server
.PHONY: run-grpc
run-grpc:
	$(PYTHON) grpc_server.py

# Run Flask app
.PHONY: run-flask
run-flask:
	$(PYTHON) flask_app.py

# Run both servers
.PHONY: run
run: run-grpc run-flask

# Clean generated files
.PHONY: clean
clean:
	rm -rf $(OUT_DIR)/*_pb2.py $(OUT_DIR)/*_pb2_grpc.py
	rm -rf $(VENV_DIR)

# Setup
.PHONY: setup
setup:  $(VENV_DIR) install generate

# Test (you can expand this section based on your testing framework)
.PHONY: test
test:
	$(PYTHON) -m unittest discover tests

