__author__ = 'ruben'

import urllib

urllib.urlretrieve('http://www.google-melange.com/gsoc/projects/list/google/gsoc2013?fmt=json&limit=1500&idx=0', 'gsoc2013.json')
urllib.urlretrieve('http://www.google-melange.com/gsoc/projects/list/google/gsoc2014?fmt=json&limit=1500&idx=0', 'gsoc2014.json')
