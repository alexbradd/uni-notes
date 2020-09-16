#! /usr/bin/env python3
"""Client code for UDP message exchange"""

import sys
import socket

SERVER_IP = "localhost"
SERVER_PORT = 12000

class BruhError(Exception):
    """Bruh"""

def main():
    """Main"""
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM) # AF_INET -> IPv4
    client_socket.settimeout(5)

    while True:
        try:
            mod, recv_addr = get_send_message(client_socket,
                                              (SERVER_IP, SERVER_PORT))
            print(f'Received from {recv_addr[0]}:{recv_addr[1]} :',
                  int.from_bytes(mod, sys.byteorder, signed=False))
        except (socket.timeout, BruhError):
            print("Connection terminated due to timeout or bruh")
            break

    client_socket.close()

def get_send_message(sock, addr):
    """Get message from stdin and send it to addr through sock"""
    message = get_msg()

    sock.sendto(message.encode("utf-8"), addr)
    if message == "bruh":
        raise BruhError
    modified_message, recv_addr = sock.recvfrom(2048)
    return modified_message, recv_addr

def get_msg():
    """Get message from stdin"""
    try:
        return input("Insert message to send: ")
    except EOFError:
        print()
        return ""

if __name__ == '__main__':
    main()
