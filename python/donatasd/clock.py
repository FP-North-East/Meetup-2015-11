import datetime

def clock():
    current = datetime.datetime.now()
    print str(current.hour) + ":" + str(current.minute) + ":" + str(current.second)
    display([int(current.second % 2 == 0), current.hour / 5, current.hour % 5, current.minute / 5, current.minute % 5])

def display(clock):
    print clock[0] * '*'
    if (len(clock) > 1):
        display(clock[1:])

clock()
