#!/usr/bin/env python3
"""Test response time of various sites"""

import sys
import requests
import matplotlib.pyplot as plt
import numpy as np

SITES = ["https://www.google.com",
         "https://www.duckduckgo.com",
         # "http://store.steampowered.com",
         "https://www.apple.com",
         "http://www.vittorone.altervista.org"]

def http_server_request(how_much=10):
    """Compute data"""
    avgs = {}
    times = {}

    for site in SITES:
        min_time = None
        avg = 0
        max_time = None

        print(f'Averaging {site}')
        for _ in range(how_much):
            ret = requests.get(site)
            if ret.status_code != 200:
                print(f'Error in request: {ret.status_code}')
            time = ret.elapsed.microseconds / 1000

            try:
                times[site].append(time)
            except (KeyError, TypeError):
                times[site] = [time,]

            if not min_time or time < min_time:
                min_time = time
            if not max_time or time > max_time:
                max_time = time
            avg += time

        avg = avg / how_much
        min_time = 0 if not min_time else min_time
        max_time = 0 if not max_time else max_time
        avgs[site] = [min_time, avg, max_time]

    plot_data(avgs, times)

def plot_data(avgs, times):
    """Plot data"""
    fig, axs = plt.subplots(2)

    for site in times:
        axs[0].plot(times[site], label=site)

    axs[0].set_title("Response times")
    axs[0].set_xlabel("pings")
    axs[0].set_ylabel("[ms]")
    axs[0].grid(axis='y', color='#DCDCDC')
    axs[0].set_axisbelow(True)
    axs[0].legend()

    ind = np.arange(len(avgs.keys()))
    width = 0.15

    l_mins = [avgs[site][0] for site in avgs]
    l_avgs = [avgs[site][1] for site in avgs]
    l_maxes = [avgs[site][2] for site in avgs]

    axs[1].bar(ind - width, l_mins, width, label="Min")
    axs[1].bar(ind, l_avgs, width, label="Avg")
    axs[1].bar(ind + width, l_maxes, width, label="Max")

    axs[1].set_xticks(ind)
    axs[1].set_xticklabels(avgs.keys(), rotation=5)

    axs[1].set_title("Minimum, average and maximum")
    axs[1].set_xlabel("sites")
    axs[1].set_ylabel("[ms]")
    axs[1].grid(axis='y', color='#DCDCDC')
    axs[1].legend()
    axs[1].set_axisbelow(True)

    fig.tight_layout()

    plt.show()

def main():
    """Main"""
    try:
        http_server_request(int(sys.argv[1]))
    except (IndexError, ValueError):
        http_server_request()

if __name__ == "__main__":
    main()
