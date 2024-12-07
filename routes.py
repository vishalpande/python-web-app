from flask import request, jsonify

def setup_routes(app):

    # Endpoint 1: "Hello World"
    @app.route('/')
    def hello_world():
        return "Hello World", 200

    # Endpoint 2: "Bad Request" error
    @app.route('/bad_request')
    def bad_request():
        app.logger.error("This is a bad request error!")
        return jsonify({"error": "Bad Request"}), 400
