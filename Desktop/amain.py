import gtk 
import webkit 

view = webkit.WebView() 

sw = gtk.ScrolledWindow() 
sw.add(view) 

win = gtk.Window(gtk.WINDOW_TOPLEVEL) 
win.add(sw) 
win.resize(400, 700);
win.show_all() 

import os
curDir = os.getcwd()

view.open("file://"+curDir+"/chat.html") 
gtk.main()
