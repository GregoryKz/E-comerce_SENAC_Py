from flask import Flask, render_template, request, redirect, flash, session, url_for
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)
app.secret_key = 'segredo'

def conectar():
    try:
        return mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='eCOMERCE'
        )
    except Error as e:
        print("Erro:", e)
        return None

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/cadastrar_cliente', methods=['GET', 'POST'])
def cadastrar_cliente():
    if request.method == 'POST':
        nome = request.form['nome']
        cpf = request.form['cpf']
        email = request.form['email']
        try:
            con = conectar()
            cur = con.cursor()
            cur.execute("INSERT INTO Cliente (Nome, CPF, Email) VALUES (%s, %s, %s)", (nome, cpf, email))
            con.commit()
            flash('Cliente cadastrado com sucesso!', 'success')
        except Error as e:
            flash(f'Erro: {e}', 'danger')
        finally:
            con.close()
        return redirect('/')
    return render_template('cadastrar_cliente.html')

@app.route('/cadastrar_produto', methods=['GET', 'POST'])
def cadastrar_produto():
    if request.method == 'POST':
        nome = request.form['nome']
        valor = request.form['valor']
        marca = request.form['marca']
        try:
            con = conectar()
            cur = con.cursor()
            cur.execute("INSERT INTO Produto (Nome, Valor, Marca) VALUES (%s, %s, %s)", (nome, valor, marca))
            con.commit()
            flash('Produto cadastrado com sucesso!', 'success')
        except Error as e:
            flash(f'Erro: {e}', 'danger')
        finally:
            con.close()
        return redirect('/')
    return render_template('cadastrar_produto.html')

@app.route('/produtos')
def listar_produtos():
    try:
        con = conectar()
        cur = con.cursor(dictionary=True)
        cur.execute("SELECT * FROM Produto")
        produtos = cur.fetchall()
        return render_template('produtos.html', produtos=produtos)
    except Error as e:
        return f'Erro: {e}'
    finally:
        con.close()

@app.route('/adicionar_carrinho/<int:id>')
def adicionar_carrinho(id):
    session.setdefault('carrinho', []).append(id)
    flash('Produto adicionado ao carrinho!', 'info')
    return redirect(url_for('listar_produtos'))

@app.route('/carrinho')
def ver_carrinho():
    ids = session.get('carrinho', [])
    if not ids:
        return render_template('carrinho.html', produtos=[])
    try:
        con = conectar()
        cur = con.cursor(dictionary=True)
        format_strings = ','.join(['%s'] * len(ids))
        cur.execute(f"SELECT * FROM Produto WHERE ID IN ({format_strings})", tuple(ids))
        produtos = cur.fetchall()
        return render_template('carrinho.html', produtos=produtos)
    except Error as e:
        return f'Erro: {e}'
    finally:
        con.close()

@app.route('/finalizar')
def finalizar():
    session['carrinho'] = []
    flash('Compra finalizada com sucesso!', 'success')
    return redirect('/')

if __name__ == '__main__':
    app.run(debug=True)
