#!/usr/bin/env python
# coding: utf-8

# # Resume (PDF)

# In[1]:


class PDF(object):
  def __init__(self, pdf, size=(200,200)):
    self.pdf = pdf
    self.size = size

  def _repr_html_(self):
    return '<iframe src={0} width={1[0]} height={1[1]}></iframe>'.format(self.pdf, self.size)

  def _repr_latex_(self):
    return r'\includegraphics[width=1.0\textwidth]{{{0}}}'.format(self.pdf)


from IPython.display import IFrame, display

filepath = "https://raw.githubusercontent.com/jirayusjiar/jirayusjiar.github.io/master/docs/me/jirayus_resume.pdf"
IFrame(filepath, width=595, height=841)

#PDF('jirayus_resume.pdf',size=(595,841))


# *This page has been updated on 21st April, 2021.* 

# In[ ]:




