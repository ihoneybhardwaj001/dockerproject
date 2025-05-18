from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route('/submit', methods=['POST'])
def submit():
    data = request.json
    # Example: just echo back the received data
    name = data.get('name')
    email = data.get('email')
    # Process as needed
    return jsonify({'message': f'Received data for {name} with email {email}'}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5002)
