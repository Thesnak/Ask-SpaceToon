from flask import Flask, jsonify,request
import time
import search
app = Flask(__name__);
@app.route("/bot", methods=["POST"])
def response():
    query = dict(request.form)['query']
    res = search.search(query)
    return jsonify({"response" : res})
if __name__=="__main__":
    app.run(host="0.0.0.0",)