#! /usr/bin/env python3
"""TCP client"""

import socket

SERVER_NAME = 'localhost'
SERVER_PORT = 12000

def main():
    """main function"""
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((SERVER_NAME, SERVER_PORT))

    while True:
        message = input("Scrivi: ")
        client_socket.send(message.encode("utf-8"))
        if message == ".":
            break

        modified_message = client_socket.recv(1024).decode("utf-8")
        print("Ricevuto:", modified_message)

    client_socket.close()

if __name__ == "__main__":
    main()
