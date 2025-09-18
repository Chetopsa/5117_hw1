from flask import Flask, render_template, request, redirect, url_for


app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/survey')
def survey():
    return render_template('survey.html')

@app.route('/decline')
def decline():
    return render_template('decline.html')

@app.route('/thanks')
def thanks():
    return render_template('thanks.html')

@app.route('/api/results', methods=['POST'])
def results():
    pass

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000, debug=True)