from flask import Flask, request, jsonify
import os


app = Flask(__name__)

UPLOAD_FOLDER_IMAGE = './uploads/uploadImgs'
UPLOAD_FOLDER_TXT = './uploads/uploadTxts'
app.config['UPLOAD_FOLDER_IMAGE'] = UPLOAD_FOLDER_IMAGE
app.config['UPLOAD_FOLDER_TXT'] = UPLOAD_FOLDER_TXT

@app.route('/upload', methods=['POST'])
def upload_files():
    try:
        if 'image' not in request.files or 'txt' not in request.files:
            return jsonify({'error': 'Both image and txt files are required'}), 400

        image = request.files['image']
        txt_file = request.files['txt']

        if image.filename == '' or txt_file.filename == '':
            return jsonify({'error': 'Both image and txt files must have valid filenames'}), 400

        if image:
            image_filename = os.path.join(app.config['UPLOAD_FOLDER_IMAGE'], image.filename)
            print(f"Saving image to: {image_filename}")
            image.save(image_filename)

        if txt_file:
            txt_filename = os.path.join(app.config['UPLOAD_FOLDER_TXT'], txt_file.filename)
            print(f"Saving txt to: {txt_filename}")
            txt_file.save(txt_filename)

        return jsonify({'message': 'Files uploaded successfully'}), 200

    except Exception as e:
        return jsonify({'error': f'Error: {str(e)}'}), 500

if __name__ == '__main__':
    # Ensure the 'source' folder for images and 'txt_data' folder exist
    os.makedirs(UPLOAD_FOLDER_IMAGE, exist_ok=True)
    os.makedirs(UPLOAD_FOLDER_TXT, exist_ok=True)

    # Print the current working directory
    print(f"Current working directory: {os.getcwd()}")

    # Run the Flask app
    app.run(debug=True)

