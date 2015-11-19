import datetime
from Tkinter import *


class Clock(Frame):

    def __init__(self, parent):
        Frame.__init__(self, parent)

        self.parent = parent
        self.initUI()


    def initUI(self):
        self.parent.title("Berlin Clock")
        self.pack(fill=BOTH, expand=1)
        self.canvas = Canvas(self)
        self.draw()


    def draw(self):
        current = datetime.datetime.now()
        self.canvas.delete(ALL)
        text = str(current.hour) + ":" + str(current.minute) + ":" + str(current.second)
        self.canvas.create_text(400,25, font = ("Helvetica", 20), text=str(current.hour) + ":" + str(current.minute) + ":" + str(current.second))
        if (current.second % 2 == 0):
            self.canvas.create_oval(347,80,457,194, outline="#000000", width =4, fill="#FFFF00")
        else :
            self.canvas.create_oval(347,80,457,194, outline="#000000", width =4)

        for i in xrange(4):
            if (i < current.hour / 5):
                self.canvas.create_rectangle(180 * i + 80,229,180 * (i+1), 333,outline="#000000", width =4,fill="#FF0000")
            else:
                self.canvas.create_rectangle(180 * i + 80,229,180 * (i+1), 333,outline="#000000", width =4)

        for i in xrange(4):
            if (i < current.hour % 5):
                self.canvas.create_rectangle(180 * i + 80,358,180 * (i+1), 472 ,outline="#000000", width =4,fill="#FF0000")
            else:
                self.canvas.create_rectangle(180 * i + 80,358,180 * (i+1), 472 ,outline="#000000", width =4)
        for i in xrange(11):
            if (i < current.minute / 5):
                if (i % 3 == 2):
                    self.canvas.create_rectangle(70 * i + 25,497,70 * (i+1),611,outline="#000000", width =4, fill="#FFF000")
                else:
                    self.canvas.create_rectangle(70 * i + 25,497,70 * (i+1),611,outline="#000000", width =4, fill="#FF0000")
            else:
                self.canvas.create_rectangle(70 * i + 25,497,70 * (i+1),611,outline="#000000", width =4)
        for i in xrange(4):
            if (i < current.minute % 5):
                self.canvas.create_rectangle(180 * i + 80,636,180 * (i+1),750,outline="#000000", width =4, fill="#FFF000")
            else:
                self.canvas.create_rectangle(180 * i + 80,636,180 * (i+1),750,outline="#000000", width =4)
        self.canvas.pack(fill=BOTH, expand=1)
        self.after(1000,self.draw)


def main():
    root = Tk()
    width = 800
    height = 800
    ex = Clock(root)
    root.geometry(str(width) + "x" + str(height))
    root.resizable(0,0)
    root.mainloop()


if __name__ == '__main__':
    main()
