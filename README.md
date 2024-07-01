
# How to Run this python gPRC code

This project is an api made with gRPC and flask.

### 1. Install Dependencies

#### First create a virtual environment.

```
python -m venv venv
```

#### Then activate the virtual environment.

On Windows
```
./venv/Scripts/activate
```
On Linux or Mac 
```
source ./venv/bin/activate
```

##### And Finally install all the dependencies in the virtual environment.

```
pip install -r requirements.txt
```

### 2. Generate Python Code from the .proto File

Use the grpcio-tools to generate Python code from your .proto file:

```
python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. helloworld.proto
```


### 3. Run the gRPC server:

```
python grpc_server.py
```


### 4. Run the Flask app:

```
python flask_app.py
```