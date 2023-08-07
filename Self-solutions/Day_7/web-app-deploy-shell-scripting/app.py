from flask import Flask, render_template
import socket
app = Flask(__name__)
@app.route("/") #health-check-api

def index():
    hostname = socket.gethostname()
    title = 'Welcome to Salwad Basha Task App'
    message="Welcome to Tasks app! I am running inside {} pod!".format(hostname)
    return render_template('index.html', title=title, body_text=message)
    
if __name__ == "__main__": #running this app using port 5000 while we run this file(app.py) it will initialize
	app.run(host="0.0.0.0", port=5000)
