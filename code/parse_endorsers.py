#!/usr/bin/env python
"""
Generic python script.
"""
__author__ = "Alex Drlica-Wagner"
import pandas as pd
import numpy as np

data = pd.read_csv('data/endorsers.csv')
colname = 'Which Decadal Survey Science Submissions are you willing to endorse?'
sel = np.char.count(data[colname].values.astype(str),'kadrlica@fnal.gov') > 0

d = data[sel]

