import os, sys
from bs4 import BeautifulSoup
fp=open("1.html","r")
soup=BeautifulSoup(fp, 'html.parser')
fp.close()
title_tag=soup.new_tag("title")
if not soup.head.title:
     soup.head.append(title_tag)
if not soup.head.title.text:
     soup.head.title.string="ACC Test Widgets"

fp=open("2.html","w")
fp.write(str(soup))
fp.close()
