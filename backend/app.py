from flask import Flask, request, jsonify
from pymongo import MongoClient
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Allow cross-origin requests from frontend

# MongoDB Atlas connection (replace <...> with your connection string)
client = MongoClient("mongodb+srv://honey:999026264a@cluster0.hvfslcb.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")
db = client.mydb
collection = db.users

@app.route('/submit', methods=['POST'])
def submit():
    data = request.get_json()
    name = data.get('name')
    email = data.get('email')

    if not name or not email:
        return jsonify({"message": "Name and email are required"}), 400

    try:
        collection.insert_one({"name": name, "email": email})
        return jsonify({"message": "Data submitted successfully"}), 200
    except Exception as e:
        return jsonify({"message": f"Database error: {str(e)}"}), 500

@app.route('/api', methods=['GET'])
def get_api_data():
    try:
        with open("data.json", "r") as f:
            import json
            data = json.load(f)
        return jsonify(data)
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5002)
