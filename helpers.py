from flask import Flask, flash, url_for, redirect, session, render_template, request
from flask_session import Session

def apology(someArgument):
	return render_template("apology.html", someArgument=someArgument)
