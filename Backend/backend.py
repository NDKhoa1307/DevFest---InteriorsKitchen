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


# from flask import Flask, request, jsonify
# import os
# import random

# app = Flask(__name__)

# # Specify the folder where you want to save the uploaded images
# UPLOAD_FOLDER = '.\source'
# app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

# @app.route('/upload', methods=['GET', 'POST'])
# def upload_image():
#     if request.method == 'POST':
#         try:
#             # Check if the 'image' file is included in the request
#             if 'image' not in request.files:
#                 return jsonify({'error': 'No file part'}), 400

#             image = request.files['image']

#             # Check if the file has a valid filename
#             if image.filename == '':
#                 return jsonify({'error': 'No selected file'}), 400

#             # Save the image to the specified folder
#             if image:
#                 filename = os.path.join(app.config['UPLOAD_FOLDER'], image.filename)
#                 print(f"Saving to: {filename}")  # Print the full path for debugging
#                 image.save(filename)
#                 return jsonify({'message': 'Image uploaded successfully'}), 200

#         except Exception as e:
#             return jsonify({'error': f'Error: {str(e)}'}), 500
#     elif request.method == 'GET':
#         return jsonify({'message': 'GET request received'}), 200
#     else:
#         return jsonify({'error': 'Method Not Allowed'}), 405

# if __name__ == '__main__':
#     # Ensure the 'uploads' folder exists
#     os.makedirs(UPLOAD_FOLDER, exist_ok=True)

#     # Print the current working directory
#     print(f"Current working directory: {os.getcwd()}")

#     # Run the Flask app
#     app.run(debug=True)