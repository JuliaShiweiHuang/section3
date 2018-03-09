import os
from flask import Flask, flash, url_for, redirect, session, render_template, request
from flask_session import Session
from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker

from helpers import *

app = Flask(__name__)

app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

engine = create_engine(os.getenv("DATABASE_URL"))
dbBook = scoped_session(sessionmaker(bind=engine))


class db():
	users = {}
	user_id = 0


@app.route("/", methods=["GET", "POST"])
def index():
	if request.method == "GET":
		return redirect(url_for("login"))
	if request.method == "POST":
		# uname = find_uname_from_id(db.users, session["user_id"])
		# return render_template("index.html", name=uname)
		return render_template("index.html")

@app.route("/login", methods=["GET", "POST"])
def login():
	if request.method =="GET":
		return render_template("login.html")

	elif request.method =="POST":
		uname = request.form.get("username")
		pw = request.form.get("password")

		if not uname:
			return apology("you must provide username")
		elif not pw:
			return apology("you must provide password")
		try: 
			match = pw == db.users[uname][0]
		except KeyError:
			return apology("username does not exist")
		if not match:
			return apology("password incorrect")

		else:
			session["user_id"] = db.users[uname][1]
			return redirect(url_for("index"), code=307)


@app.route("/register", methods=["GET", "POST"])
def register():
	if request.method == "GET":
		return render_template("register.html")
	elif request.method == "POST":
		uname = request.form.get("username")
		pw1 = request.form.get("password")
		pw2 = request.form.get("rePassword")
		if not uname:
			return apology("you must provide username")
		if not pw1 or not pw2:
			return apology("you must provide password twice")
		if pw1 != pw2:
			return apology("password must match")
		if uname in db.users:
			return apology("username already exists")
		else: 
			db.user_id += 1
			db.users[uname] = (pw1, db.user_id)
		return redirect(url_for("login"))


@app.route("/books")
def books():
	"""list all books"""
	books = dbBook.execute("SELECT * FROM juliaStore").fetchall()
	return render_template("books.html", books=books)




@app.route("/book/<int:id>")
def book(id):
	book = dbBook.execute("SELECT * FROM juliaStore WHERE id = :id", {"id": id}).fetchone()
	if book is None:
		return render_template("error.html", message="No such book")

	juliaStore = dbBook.execute("SELECT title FROM juliaStore where id = :id",
								{"id": id}).fetchall()
	return render_template("book.html", book=book, juliaStore=juliaStore)


@app.route("search", methods=["GET", "POST"])
def search():


