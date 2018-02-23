from flask import Flask, flash, url_for, redirect, render_template, request
from flask_session import Session

def apology(someArgument):
	render_template("apology.html")
