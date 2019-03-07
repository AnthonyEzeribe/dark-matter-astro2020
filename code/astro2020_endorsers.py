# Export the spreadsheet in tsv format
# https://docs.google.com/spreadsheets/d/15ABUX6cCw6eNijMPS5pm43lI_ySlXRDfsROzT0h3y4E/edit?usp=sharing

# This was challenging to parse with numpy csv reader
#import numpy as np
#data = np.genfromtxt('astro2020_endorsers.tsv', delimiter='\t', skip_header=1, usecols=0)

import pandas as pd
import numpy as np

data = pd.read_csv('astro2020_endorsers.tsv', sep='\t')

which_papers = data['Which Decadal Survey Science Submissions are you willing to endorse?']

count = np.char.count(which_papers.tolist(), 'Dark matter constraints with LSST')
cut = (count > 0)

print np.sum(cut), len(which_papers)

data['Latex Name'][cut]
data['LaTeX Affiliation alias(es)'][cut]

df = pd.DataFrame({'name': data['Latex Name'][cut],
                   'affiliation': data['LaTeX Affiliation alias(es)'][cut]})
df.to_csv('astro2020_endorsers_trimmed.csv')

# Open that trimmed file with pd.read_csv

