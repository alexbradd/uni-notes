#! /usr/bin/env python3
"""TCP server"""

import socket
import threading

SERVER_PORT = 12000

def main():
    """Main function"""
    welcome_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    welcome_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    binding = ("", 12000)
    welcome_socket.bind(binding)
    welcome_socket.listen(5) # n is the number of incomplete connections allowed
    print("ready")

    while True:
        connection_socket, client_addr = welcome_socket.accept()
        print("Connection established with:", client_addr)

        client_thread = threading.Thread(target=handle_client,
                                         args=(connection_socket,))

        client_thread.start()


def handle_client(connection_socket):
    """Function for client handling thread"""
    while True:
        message = connection_socket.recv(1024).decode("utf-8")
        if message == ".":
            break
        modified_message = message.upper()
        connection_socket.send(modified_message.encode("utf-8"))

    connection_socket.close()

if __name__ == "__main__":
    main()
