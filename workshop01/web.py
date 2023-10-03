from flask import Flask, render_template

from service import get_sentence

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html", sentence=get_sentence())


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
