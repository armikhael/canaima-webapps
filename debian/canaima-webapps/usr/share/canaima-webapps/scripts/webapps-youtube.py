#!/usr/bin/env python
# -*- coding: utf-8 -*-
'''
Copyright (C) 2010 Canaima GNU/Linux
<desarrolladores@canaima.softwarelibre.gob.ve>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA

@author: Carlos Espinoza <carlosarmikhael@gmail.com>
'''

import os
import threading

class hilo_pag_web(threading.Thread):
    def __init__(self, mainview):
        threading.Thread.__init__(self)
    def run(self):
        pag_web= os.system("sensible-browser http://www.youtube.com/ -new-tab")

class Main():
	def __init__(self):
		ejecutar_hilo = hilo_pag_web(self)
		ejecutar_hilo.start()
Main()

