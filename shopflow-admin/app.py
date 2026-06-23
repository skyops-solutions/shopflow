from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/health')
def health():
    return jsonify({'status': 'ok', 'app': 'shopflow-admin'})

@app.route('/orders')
def orders():
    return jsonify([
        {'id': 1, 'product': 'T-Shirt', 'status': 'shipped'},
        {'id': 2, 'product': 'Hoodie', 'status': 'pending'},
    ])

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
