import os, sys
from os.path import isfile, join
import re
from datetime import datetime, timedelta
import math
from pandas import date_range
import numpy as np
from scipy import optimize

class Parameter:
    def __init__(self, value):
        self.value = value

    def set(self, value):
        self.value = value

    def __call__(self):
        return self.value


def fit(function, parameters, y, x=None):
    def f(params):
        i = 0
        for p in parameters:
            p.set(params[i])
            i += 1
        return y - function(x)

    if x is None: x = np.arange(y.shape[0])
    p = [param() for param in parameters]
    return optimize.leastsq(f, p)

def flatten(L):
    return [val for sublist in L for val in sublist]

P0 = Parameter(1.0)
P1 = Parameter(1.0)
P2 = Parameter(1.0)

#FLAT_M = np.array(flatten(map(lambda d: MF(d), dts)))
FLAT_M = np.array([...])
FLAT_HIROMB = np.array([...])
FLAT_BSM = np.array([...])

def f(X):
    return FLAT_BSM * P0() + FLAT_HIROMB * P1() + P2()

fittedCoeffs, success = fit(f, [P0, P1, P2], np.array(FLAT_M))

print fittedCoeffs, success
