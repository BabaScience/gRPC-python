from flask import Flask, jsonify, request
import grpc
import helloworld_pb2
import helloworld_pb2_grpc

app = Flask(__name__)

@app.route('/hello', methods=['GET'])
def hello():
    name = request.args.get('name', 'World')
    with grpc.insecure_channel('localhost:50051') as channel:
        stub = helloworld_pb2_grpc.GreeterStub(channel)
        response = stub.SayHello(helloworld_pb2.HelloRequest(name=name))
    return jsonify({'message': response.message})

if __name__ == '__main__':
    app.run(port=5000)
