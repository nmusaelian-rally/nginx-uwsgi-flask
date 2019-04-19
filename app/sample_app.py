from flask import Flask, request

application = Flask(__name__)

@application.route("/")
def index():
  return """
  <h1>Python Flask in Docker!</h1>
  <p>A sample web-app for running Flask inside Docker on 0.0.0.0 from port %s</p>
  """ % request.host

if __name__ == "__main__":
    application.run(debug=True, host='0.0.0.0')