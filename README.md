
# How to Run this python gPRC code

### 1. Generate Python Code from the .proto File

Use the grpcio-tools to generate Python code from your .proto file:

```
python -m grpc_tools.protoc -I. --python_out=. --grpc_python_out=. helloworld.proto
```


### 2. Run the gRPC server:

```
python grpc_server.py
```


### 3. Run the Flask app:

```
python flask_app.py
```