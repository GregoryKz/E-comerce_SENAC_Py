
import tkinter as tk
from tkinter import ttk, messagebox
import mysql.connector
from mysql.connector import Error

# Cores
BG_COLOR = "#ffffff"
SIDEBAR_COLOR = "#343a40"
BTN_COLOR = "#007bff"
BTN_TEXT_COLOR = "white"
TEXT_COLOR = "#f8f9fa"
HEADER_FONT = ("Segoe UI", 16, "bold")
LABEL_FONT = ("Segoe UI", 11)
ENTRY_FONT = ("Segoe UI", 10)

def conectar():
    try:
        return mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            database='eCOMERCE'
        )
    except Error as e:
        messagebox.showerror("Erro", f"Erro de conexão: {e}")
        return None

class LojaApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Loja Desktop")
        self.root.geometry("1000x600")
        self.carrinho = []

        self.criar_sidebar()
        self.criar_conteudo()

    def criar_sidebar(self):
        self.sidebar = tk.Frame(self.root, bg=SIDEBAR_COLOR, width=200)
        self.sidebar.pack(side="left", fill="y")

        tk.Label(self.sidebar, text="☰ MENU", bg=SIDEBAR_COLOR, fg=TEXT_COLOR, font=HEADER_FONT).pack(pady=20)

        botoes = [
            ("Cadastrar Cliente", self.mostrar_cadastro_cliente),
            ("Cadastrar Produto", self.mostrar_cadastro_produto),
            ("Ver Produtos", self.mostrar_produtos),
            ("Carrinho", self.mostrar_carrinho),
        ]

        for texto, comando in botoes:
            btn = tk.Button(self.sidebar, text=texto, command=comando, bg=BTN_COLOR, fg=BTN_TEXT_COLOR,
                            font=LABEL_FONT, relief="flat", padx=10, pady=5)
            btn.pack(fill="x", padx=10, pady=5)

    def criar_conteudo(self):
        self.conteudo = tk.Frame(self.root, bg=BG_COLOR)
        self.conteudo.pack(expand=True, fill="both")

        self.frames = {
            "cliente": self.criar_frame_cliente(),
            "produto": self.criar_frame_produto(),
            "produtos": self.criar_frame_produtos(),
            "carrinho": self.criar_frame_carrinho()
        }

        self.mostrar_cadastro_cliente()

    def esconder_frames(self):
        for frame in self.frames.values():
            frame.pack_forget()

    def mostrar_cadastro_cliente(self):
        self.esconder_frames()
        self.frames["cliente"].pack(expand=True, fill="both")

    def mostrar_cadastro_produto(self):
        self.esconder_frames()
        self.frames["produto"].pack(expand=True, fill="both")

    def mostrar_produtos(self):
        self.esconder_frames()
        self.frames["produtos"].pack(expand=True, fill="both")
        self.atualizar_lista_produtos()

    def mostrar_carrinho(self):
        self.esconder_frames()
        self.frames["carrinho"].pack(expand=True, fill="both")
        self.atualizar_lista_carrinho()

    def criar_frame_cliente(self):
        frame = tk.Frame(self.conteudo, bg=BG_COLOR)
        tk.Label(frame, text="Cadastro de Cliente", font=HEADER_FONT, bg=BG_COLOR).pack(pady=20)

        self.entry_nome = tk.Entry(frame, font=ENTRY_FONT)
        self.entry_cpf = tk.Entry(frame, font=ENTRY_FONT)
        self.entry_email = tk.Entry(frame, font=ENTRY_FONT)

        for label, entry in [("Nome", self.entry_nome), ("CPF", self.entry_cpf), ("Email", self.entry_email)]:
            tk.Label(frame, text=label + ":", font=LABEL_FONT, bg=BG_COLOR).pack()
            entry.pack(pady=(0, 10), ipadx=5)

        tk.Button(frame, text="Cadastrar", font=LABEL_FONT, bg=BTN_COLOR, fg=BTN_TEXT_COLOR,
                  command=self.cadastrar_cliente).pack(pady=10)
        return frame

    def cadastrar_cliente(self):
        nome = self.entry_nome.get()
        cpf = self.entry_cpf.get()
        email = self.entry_email.get()

        if not nome or not cpf or not email:
            messagebox.showwarning("Aviso", "Preencha todos os campos.")
            return

        con = conectar()
        if con:
            try:
                cur = con.cursor()
                cur.execute("INSERT INTO Cliente (Nome, CPF, Email) VALUES (%s, %s, %s)", (nome, cpf, email))
                con.commit()
                messagebox.showinfo("Sucesso", "Cliente cadastrado!")
                self.entry_nome.delete(0, tk.END)
                self.entry_cpf.delete(0, tk.END)
                self.entry_email.delete(0, tk.END)
            except Error as e:
                messagebox.showerror("Erro", f"{e}")
            finally:
                con.close()

    def criar_frame_produto(self):
        frame = tk.Frame(self.conteudo, bg=BG_COLOR)
        tk.Label(frame, text="Cadastro de Produto", font=HEADER_FONT, bg=BG_COLOR).pack(pady=20)

        self.entry_prod_nome = tk.Entry(frame, font=ENTRY_FONT)
        self.entry_prod_valor = tk.Entry(frame, font=ENTRY_FONT)
        self.entry_prod_marca = tk.Entry(frame, font=ENTRY_FONT)

        for label, entry in [("Nome", self.entry_prod_nome), ("Valor", self.entry_prod_valor), ("Marca", self.entry_prod_marca)]:
            tk.Label(frame, text=label + ":", font=LABEL_FONT, bg=BG_COLOR).pack()
            entry.pack(pady=(0, 10), ipadx=5)

        tk.Button(frame, text="Cadastrar Produto", font=LABEL_FONT, bg=BTN_COLOR, fg=BTN_TEXT_COLOR,
                  command=self.cadastrar_produto).pack(pady=10)
        return frame

    def cadastrar_produto(self):
        nome = self.entry_prod_nome.get()
        valor = self.entry_prod_valor.get()
        marca = self.entry_prod_marca.get()

        if not nome or not valor or not marca:
            messagebox.showwarning("Aviso", "Preencha todos os campos.")
            return

        con = conectar()
        if con:
            try:
                cur = con.cursor()
                cur.execute("INSERT INTO Produto (Nome, Valor, Marca) VALUES (%s, %s, %s)", (nome, valor, marca))
                con.commit()
                messagebox.showinfo("Sucesso", "Produto cadastrado!")
                self.entry_prod_nome.delete(0, tk.END)
                self.entry_prod_valor.delete(0, tk.END)
                self.entry_prod_marca.delete(0, tk.END)
            except Error as e:
                messagebox.showerror("Erro", f"{e}")
            finally:
                con.close()

    def criar_frame_produtos(self):
        frame = tk.Frame(self.conteudo, bg=BG_COLOR)
        tk.Label(frame, text="Produtos Disponíveis", font=HEADER_FONT, bg=BG_COLOR).pack(pady=10)

        self.tree = ttk.Treeview(frame, columns=("ID", "Nome", "Valor", "Marca"), show="headings")
        for col in ("ID", "Nome", "Valor", "Marca"):
            self.tree.heading(col, text=col)
        self.tree.pack(expand=True, fill="both", padx=20, pady=10)

        tk.Button(frame, text="Adicionar ao Carrinho", font=LABEL_FONT, bg=BTN_COLOR, fg=BTN_TEXT_COLOR,
                  command=self.adicionar_ao_carrinho).pack(pady=10)
        return frame

    def atualizar_lista_produtos(self):
        con = conectar()
        if con:
            try:
                cur = con.cursor()
                cur.execute("SELECT ID, Nome, Valor, Marca FROM Produto")
                dados = cur.fetchall()
                self.tree.delete(*self.tree.get_children())
                for p in dados:
                    self.tree.insert("", tk.END, values=p)
            except Error as e:
                messagebox.showerror("Erro", f"{e}")
            finally:
                con.close()

    def adicionar_ao_carrinho(self):
        item = self.tree.focus()
        if not item:
            messagebox.showwarning("Aviso", "Selecione um produto.")
            return
        produto = self.tree.item(item)['values']
        self.carrinho.append(produto)
        messagebox.showinfo("Adicionado", f"{produto[1]} foi adicionado ao carrinho.")

    def criar_frame_carrinho(self):
        frame = tk.Frame(self.conteudo, bg=BG_COLOR)
        tk.Label(frame, text="Carrinho de Compras", font=HEADER_FONT, bg=BG_COLOR).pack(pady=20)

        self.listbox_carrinho = tk.Listbox(frame, font=ENTRY_FONT)
        self.listbox_carrinho.pack(padx=20, pady=10, expand=True, fill="both")

        tk.Button(frame, text="Finalizar Compra", font=LABEL_FONT, bg="green", fg="white",
                  command=self.finalizar_compra).pack(pady=10)
        return frame

    def atualizar_lista_carrinho(self):
        self.listbox_carrinho.delete(0, tk.END)
        for item in self.carrinho:
            self.listbox_carrinho.insert(tk.END, f"{item[1]} - R${item[2]}")

    def finalizar_compra(self):
        if not self.carrinho:
            messagebox.showwarning("Aviso", "Carrinho vazio.")
            return
        self.carrinho.clear()
        self.atualizar_lista_carrinho()
        messagebox.showinfo("Compra Finalizada", "Compra realizada com sucesso!")

if __name__ == "__main__":
    root = tk.Tk()
    app = LojaApp(root)
    root.mainloop()
