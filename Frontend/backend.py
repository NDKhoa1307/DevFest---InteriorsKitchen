from flask import Flask, request, jsonify
import os

app = Flask(__name__)

# Specify the folder where you want to save the uploaded images
UPLOAD_FOLDER = '../source'
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

@app.route('/upload', methods=['GET', 'POST'])
def upload_image():
    if request.method == 'POST':
        try:
            # Check if the 'image' file is included in the request
            if 'image' not in request.files:
                return jsonify({'error': 'No file part'}), 400

            image = request.files['image']

            # Check if the file has a valid filename
            if image.filename == '':
                return jsonify({'error': 'No selected file'}), 400

            # Save the image to the specified folder
            if image:
                filename = os.path.join(app.config['UPLOAD_FOLDER'], image.filename)
                print(f"Saving to: {filename}")  # Print the full path for debugging
                image.save(filename)
                return jsonify({'message': 'Image uploaded successfully'}), 200

        except Exception as e:
            return jsonify({'error': f'Error: {str(e)}'}), 500
    elif request.method == 'GET':
        return jsonify({'message': 'GET request received'}), 200
    else:
        return jsonify({'error': 'Method Not Allowed'}), 405

if __name__ == '__main__':
    # Ensure the 'uploads' folder exists
    os.makedirs(UPLOAD_FOLDER, exist_ok=True)

    # Print the current working directory
    print(f"Current working directory: {os.getcwd()}")

    # Run the Flask app
    app.run(debug=True)