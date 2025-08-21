import os
import sqlite3


def ativar_respostas(resposta, nome):
    if resposta == '1':
        print(
            f'{os.linesep}{nome}, seja bem-vindo à Lojinha do Charles! Esta empresa é uma loja física com mais de 10 anos de mercado.{os.linesep}')
    elif resposta == '2':
        print(
            f'{os.linesep}{nome}, confira nossos produtos: Potes de alumínio por R$5,00, Baldes 50x60 por R$15,00, Jogo de colheres por R$25,00.{os.linesep}')
    elif resposta == '3':
        print(
            f'{os.linesep}{nome}, para escolher a quantidade de produtos, entre em contato pelo número 41984212178.{os.linesep}')
    else:
        print('Número digitado inválido, digite 1, 2, 3 ou 4 para prosseguir.')


def start():
    print(
        f'{os.linesep}Olá, me chamo Charlinho, sou a inteligência artificial do Grupo Charles SA. Como posso lhe ajudar?{os.linesep}')

    # Pedir o nome, email e telefone do usuário
    nome = input(f'{os.linesep}Qual o seu nome?{os.linesep}')
    email = input(f'{os.linesep}Qual o seu email?{os.linesep}')
    telefone = input(f'{os.linesep}Qual o seu telefone?{os.linesep}')

    # Mostrar o diretório atual
    print(f'Os arquivos serão salvos em: {os.getcwd()}{os.linesep}')

    # Salvar os dados em um arquivo de texto
    with open('contatosLeadings.txt', 'a') as file:
        file.write(f'Nome: {nome}{os.linesep}')
        file.write(f'Email: {email}{os.linesep}')
        file.write(f'Telefone: {telefone}{os.linesep}')
        file.write(f'{os.linesep}---{os.linesep}')

    # Verificar se o arquivo de banco de dados existe, se sim, excluir
    db_file = 'contatosLeadings.db'
    if os.path.exists(db_file):
        os.remove(db_file)  # Deleta o arquivo existente, se houver

    # Conectar ao banco de dados SQLite
    conn = sqlite3.connect(db_file)
    cursor = conn.cursor()

    # Criar a tabela se não existir
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS contatos (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT NOT NULL,
            email TEXT NOT NULL,
            telefone TEXT NOT NULL
        )
    ''')

    # Inserir os dados na tabela
    cursor.execute('''
        INSERT INTO contatos (nome, email, telefone)
        VALUES (?, ?, ?)
    ''', (nome, email, telefone))

    # Salvar e fechar a conexão
    conn.commit()
    conn.close()

    print(f'{os.linesep}Seu contato foi salvo com sucesso! Nossa equipe entrará em contato.{os.linesep}')

    # Loop para rodar o chatbot
    while True:
        resposta = input(
            f'{os.linesep}Em que podemos auxiliar?{os.linesep}[1] - Informações sobre a loja{os.linesep}[2] - Informações sobre produtos{os.linesep}[3] - Solicitar quantidade de produtos{os.linesep}[4] - Sair{os.linesep}')

        if resposta == '4':
            print(f'{os.linesep}Até mais, tamo junto!{os.linesep}')
            break

        ativar_respostas(resposta, nome)


if __name__ == '__main__':
    start()