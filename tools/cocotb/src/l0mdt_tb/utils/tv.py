#!/usr/bin/env python3

"""
# @ Filename: tv.py
# @ Author: Priya Sundararajan
# @ Email: priya.sundararajan@cern.ch
# @ Description: Generic class to describe the testvectors for a RTL PORT
"""

class tvRTL:
    def __init__(self):
        self.tv_val  = []
        self.thread = 0
        self.station = 0
        self.df  = 'SF2PTCALC_LSF'
    
    def set_tv(self, tv_val, df, thread=0, station="INN"):
        #print(" DEBUG: ", tv_val, df, thread, station)
        self.tv_val.append(tv_val)
        self.df          = df
        self.thread  = thread
        if station == '':
            self.station = "NONE"
        else:
            self.station  = station
        

    def print_tv(self):
        print(" tv_dataformat = ", self.df)
        print(" tv_station        = ", self.station)
        print(" tv_thread        = ", self.thread)
        print(" tv_vals            = ", self.tv_val)
    
    def clear(self):
        self.tv_val.clear()
