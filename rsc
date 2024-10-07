import sqlite3
import tkinter as tk
from tkinter import messagebox, font

# Função para conectar ao banco de dados
def connect_db():
    conn = sqlite3.connect('biblioteca.db')
    cursor = conn.cursor()
    return conn, cursor

# Funções para criar tabelas, adicionar autores, livros e empréstimos
# (Mantenha as funções existentes como estão)

# Funções para visualizar informações do usuário e do autor
# (Mantenha as funções existentes como estão)

# Cria as tabelas ao iniciar o programa
create_tables()

# Interface Gráfica com Tkinter
root = tk.Tk()
root.title('Sistema de Biblioteca')

# Mudando a cor de fundo para um azul claro
root.configure(bg='#87CEEB')  # Azul claro

# Define uma fonte maior
large_font = font.Font(size=12)

# Frame para adicionar dados
frame_insercao = tk.LabelFrame(root, text='Inserir Dados', bg='lightblue', padx=10, pady=10, font=large_font)
frame_insercao.grid(row=0, column=0, padx=10, pady=10, sticky="nsew", rowspan=3)

# Frame para adicionar autores
frame_autor = tk.LabelFrame(frame_insercao, text='Adicionar Autor', bg='lightblue', padx=10, pady=10, font=large_font)
frame_autor.grid(row=0, column=0, padx=10, pady=10, sticky="nsew")

tk.Label(frame_autor, text='Nome:', bg='lightblue', font=large_font).grid(row=0, column=0, sticky="w")
entry_nome_autor = tk.Entry(frame_autor, font=large_font)
entry_nome_autor.grid(row=0, column=1, sticky="ew")

tk.Label(frame_autor, text='Nacionalidade:', bg='lightblue', font=large_font).grid(row=1, column=0, sticky="w")
entry_nacionalidade_autor = tk.Entry(frame_autor, font=large_font)
entry_nacionalidade_autor.grid(row=1, column=1, sticky="ew")

tk.Button(frame_autor, text='Adicionar Autor', command=add_autor, font=large_font).grid(row=2, columnspan=2, pady=5)

# Frame para adicionar livros
frame_livro = tk.LabelFrame(frame_insercao, text='Adicionar Livro', bg='lightblue', padx=10, pady=10, font=large_font)
frame_livro.grid(row=1, column=0, padx=10, pady=10, sticky="nsew")

tk.Label(frame_livro, text='Título:', bg='lightblue', font=large_font).grid(row=0, column=0, sticky="w")
entry_titulo_livro = tk.Entry(frame_livro, font=large_font)
entry_titulo_livro.grid(row=0, column=1, sticky="ew")

tk.Label(frame_livro, text='AutorID:', bg='lightblue', font=large_font).grid(row=1, column=0, sticky="w")
entry_autor_id = tk.Entry(frame_livro, font=large_font)
entry_autor_id.grid(row=1, column=1, sticky="ew")

tk.Label(frame_livro, text='Ano Publicação:', bg='lightblue', font=large_font).grid(row=2, column=0, sticky="w")
entry_ano_livro = tk.Entry(frame_livro, font=large_font)
entry_ano_livro.grid(row=2, column=1, sticky="ew")

tk.Label(frame_livro, text='Gênero:', bg='lightblue', font=large_font).grid(row=3, column=0, sticky="w")
entry_genero_livro = tk.Entry(frame_livro, font=large_font)
entry_genero_livro.grid(row=3, column=1, sticky="ew")

tk.Button(frame_livro, text='Adicionar Livro', command=add_livro, font=large_font).grid(row=4, columnspan=2, pady=5)

# Frame para adicionar empréstimos
frame_emprestimo = tk.LabelFrame(frame_insercao, text='Adicionar Empréstimo', bg='lightblue', padx=10, pady=10, font=large_font)
frame_emprestimo.grid(row=2, column=0, padx=10, pady=10, sticky="nsew")

tk.Label(frame_emprestimo, text='LivroID:', bg='lightblue', font=large_font).grid(row=0, column=0, sticky="w")
entry_livro_id = tk.Entry(frame_emprestimo, font=large_font)
entry_livro_id.grid(row=0, column=1, sticky="ew")

tk.Label(frame_emprestimo, text='Data Empréstimo:', bg='lightblue', font=large_font).grid(row=1, column=0, sticky="w")
entry_data_emp = tk.Entry(frame_emprestimo, font=large_font)
entry_data_emp.grid(row=1, column=1, sticky="ew")

tk.Label(frame_emprestimo, text='Data Devolução:', bg='lightblue', font=large_font).grid(row=2, column=0, sticky="w")
entry_data_dev = tk.Entry(frame_emprestimo, font=large_font)
entry_data_dev.grid(row=2, column=1, sticky="ew")

tk.Label(frame_emprestimo, text='Nome Usuário:', bg='lightblue', font=large_font).grid(row=3, column=0, sticky="w")
entry_nome_usuario = tk.Entry(frame_emprestimo, font=large_font)
entry_nome_usuario.grid(row=3, column=1, sticky="ew")

tk.Button(frame_emprestimo, text='Adicionar Empréstimo', command=add_emprestimo, font=large_font).grid(row=4, columnspan=2, pady=5)

# Frame para visualizar informações do autor
frame_autor_informacoes = tk.LabelFrame(root, text='Informações do Autor', bg='lightblue', padx=10, pady=10, font=large_font)
frame_autor_informacoes.grid(row=0, column=1, padx=10, pady=10, sticky="nsew", rowspan=2)

tk.Label(frame_autor_informacoes, text='Nome Autor:', bg='lightblue', font=large_font).grid(row=0, column=0, sticky="w")
entry_autor_informacoes = tk.Entry(frame_autor_informacoes, font=large_font)
entry_autor_informacoes.grid(row=0, column=1, sticky="ew")

tk.Button(frame_autor_informacoes, text='Ver Informações', command=view_informacoes_autor, font=large_font).grid(row=1, columnspan=2)

# Lista para mostrar informações do autor
info_autor_list = tk.Listbox(frame_autor_informacoes, height=6, width=40, bg='white', font=large_font)
info_autor_list.grid(row=2, column=0, columnspan=2)

# Lista para mostrar livros do autor
livros_autor_list = tk.Listbox(frame_autor_informacoes, height=6, width=40, bg='white', font=large_font)
livros_autor_list.grid(row=3, column=0, columnspan=2)

# Frame para visualizar recomendações gerais
frame_recomendacoes = tk.LabelFrame(root, text='Recomendações Gerais', bg='lightblue', padx=10, pady=10, font=large_font)
frame_recomendacoes.grid(row=2, column=1, padx=10, pady=10, sticky="nsew")

# Botão para ver recomendações gerais
tk.Button(frame_recomendacoes, text='Ver Recomendações', command=recomendacoes_gerais, font=large_font).pack(pady=5)

# Lista para mostrar recomendações
recomendacoes_list = tk.Listbox(frame_recomendacoes, height=6, width=40, bg='white', font=large_font)
recomendacoes_list.pack(pady=5)

# Frame para visualizar empréstimos
frame_visualizar = tk.LabelFrame(root, text='Visualizar Empréstimos', bg='lightblue', padx=10, pady=10, font=large_font)
frame_visualizar.grid(row=3, column=0, columnspan=2, padx=10, pady=10, sticky="nsew")

tk.Label(frame_visualizar, text='Nome Usuário:', bg='lightblue', font=large_font).grid(row=0, column=0, sticky="w")
entry_usuario_emprestimo = tk.Entry(frame_visualizar, font=large_font)
entry_usuario_emprestimo.grid(row=0, column=1, sticky="ew")

tk.Button(frame_visualizar, text='Visualizar Empréstimos', command=view_emprestimos_usuario, font=large_font).grid(row=1, columnspan=2)

# Lista para mostrar os empréstimos
emprestimos_list = tk.Listbox(frame_visualizar, height=6, width=40, bg='white', font=large_font)
emprestimos_list.grid(row=2, column=0, columnspan=2)

# Frame para visualizar livros por gênero
frame_livros_genero = tk.LabelFrame(root, text='Visualizar Livros por Gênero', bg='lightblue', padx=10, pady=10, font=large_font)
frame_livros_genero.grid(row=3, column=1, padx=10, pady=10, sticky="nsew")

tk.Label(frame_livros_genero, text='Gênero:', bg='lightblue', font=large_font).grid(row=0, column=0, sticky="w")
entry_genero = tk.Entry(frame_livros_genero, font=large_font)
entry_genero.grid(row=0, column=1, sticky="ew")

tk.Button(frame_livros_genero, text='Ver Livros', command=lambda: view_livros_por_genero(entry_genero.get()), font=large_font).grid(row=1, columnspan=2)

# Lista para mostrar os livros por gênero
livros_genero_list = tk.Listbox(frame_livros_genero, height=6, width=40, bg='white', font=large_font)
livros_genero_list.grid(row=2, column=0, columnspan=2)

# Ajuste do grid para expandir as colunas e linhas
for i in range(2):
    root.grid_columnconfigure(i, weight=1)
for j in range(4):
    root.grid_rowconfigure(j, weight=1)

root.mainloop()
