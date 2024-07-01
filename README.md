Here's the updated documentation with the Makefile commands included:

# How to Run this Python gRPC Code

This project is an API made with gRPC and Flask.

### 1. Install Dependencies

#### First create a virtual environment.

```sh
python -m venv venv
```

#### Then activate the virtual environment.

On Windows:
```sh
./venv/Scripts/activate
```
On Linux or Mac:
```sh
source ./venv/bin/activate
```

#### And finally install all the dependencies in the virtual environment.

```sh
pip install -r requirements.txt
```

### 2. Generate Python Code from the .proto Files

Use the grpcio-tools to generate Python code from your `.proto` files:

```sh
python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. proto/helloworld.proto
```

Or use the Makefile command:

```sh
make generate
```

### 3. Run the gRPC Server

```sh
python grpc_server.py
```

Or use the Makefile command:

```sh
make run-grpc
```

### 4. Run the Flask App

```sh
python flask_app.py
```

Or use the Makefile command:

```sh
make run-flask
```

### 5. Run Both the gRPC Server and Flask App Together

Use the Makefile command:

```sh
make run
```

### 6. Clean Generated Files and Virtual Environment

To clean up the generated files and the virtual environment, use the Makefile command:

```sh
make clean
```

### 7. Running Tests

To run tests, you can use the Makefile command:

```sh
make test
```

### Using the Makefile

The Makefile simplifies the setup and running of the project. Below are the available Makefile targets:

- **Setup the project**:

  ```sh
  make setup
  ```

- **Generate gRPC code**:

  ```sh
  make generate
  ```

- **Run the gRPC server**:

  ```sh
  make run-grpc
  ```

- **Run the Flask app**:

  ```sh
  make run-flask
  ```

- **Run both servers**:

  ```sh
  make run
  ```

- **Clean up**:

  ```sh
  make clean
  ```

- **Run tests**:

  ```sh
  make test
  ```

This documentation now includes the Makefile commands to help streamline the workflow for setting up and running the gRPC and Flask project.