# App backend

from flask import Flask, request, jsonify

app = Flask(__name__)

# Route to handle the incoming request from the Svelte frontend
@app.route('/send-data-to-python', methods=['POST'])
def send_data_to_python():
    try:
        print("thing")
    except Exception as e:
        return str(e), 500

if __name__ == '__main__':
    app.run(port=500)  # Use a different port for the backend server, e.g., 500