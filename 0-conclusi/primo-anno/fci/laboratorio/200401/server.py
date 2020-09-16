#! /usr/bin/env python3
"""Server code for UDP message exchange"""

import sys
import socket
import re

SERVER_PORT = 12000

def main():
    """Main"""
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    binding = ('', SERVER_PORT)
    message = ""
    client_addr = None

    server_socket.bind(binding)
    print("Receiving...")

    while True:
        message, client_addr = server_socket.recvfrom(2048)
        message = message.decode("utf-8")
        response = process_str(message)
        print(f'Processed string from {client_addr[0]}:{client_addr[1]} :',
              message)
        server_socket.sendto(response.to_bytes(4, sys.byteorder, signed=False),
                             client_addr)

        if message == "bruh":
            print("BRUH moment, exiting...")
            break

    server_socket.close()

def process_str(string):
    """Process string"""
    ## As done in class
    # vocals = ["a", "e", "i", "o", "u", "à", "è", "é", "ì", "ò", "ù"]
    # string = string.lower().replace(" ", "").replace("\t", "")
    # n_con = len(string)
    # for voc in vocals:
    #     num = string.count(voc)
    #     n_con -= num
    # return n_con

    ## True chad way
    return len(re.findall(r'[^AEIOUaeiouàèéìòù0-9\s\W]', string))

if __name__ == '__main__':
    main()
