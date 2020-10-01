#!/usr/bin/python3
import sys
import requests as rq
from bs4 import BeautifulSoup

ukraine = 'ukraine' in sys.argv
url = 'https://www.worldometers.info/coronavirus/' \
      + ukraine*'country/ukraine/'
page = rq.get(url)
soup = BeautifulSoup(page.content, 'html.parser')

results = [x.find('span').text.strip() 
           for x in soup.find_all(class_='maincounter-number')]

if 'total' in sys.argv or ukraine:
    print(results[0])
elif 'deaths' in sys.argv:
    print(results[1])
elif 'recovered' in sys.argv:
    print(results[2])


