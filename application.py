from flask import Flask, url_for, redirect, render_template, request
from flask_session import Session

app = Flask(__name__)

app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

@app.route("/")
def index():
	return render_template("index.html")

@app.route("/login", methods=["GET", "POST"])
def login():
	if request.method =="GET":
		return render_template("login.html")
	elif request.method =="POST":
		return redirect(url_for("index"))

	return render_template("login.html")

@app.route("/register")
def register():
	return render_template("register.html")

