'''A script to help test the reloader dll

todo, use the unittest module huehueh
'''

import os
import os.path
import ctypes

if not os.path.exists('foo.dll') or not os.path.exists('bar.dll'):
    raise Exception('foo.dll and bar.dll need to be compiled')

dll = ctypes.windll.LoadLibrary('foo.dll')
RVExtension = getattr(dll, '_RVExtension@12')

size = 4 * 1024
output_t = ctypes.c_char * size

def call_extension(cmd):
    output = output_t()
    print '>', cmd
    RVExtension(output, size, cmd)
    print '<', output.value
    return output.value

if call_extension('test') != 'No extension loaded yet!':
    raise Exception

if call_extension('reloader:load bar') != '':
    raise Exception

if call_extension('test') != '=D test':
    raise Exception

if call_extension('reloader:unload') != '1':
    raise Exception

if call_extension('test') != 'No extension loaded yet!':
    raise Exception

# If we move bar.dll, we shouldn't be able to load it
os.rename('bar.dll', '_bar.dll')
try:
    if not call_extension('reloader:load bar').startswith('Error Code 126'):
        raise Exception
finally:
    os.rename('_bar.dll', 'bar.dll')

# Try to reload it
if call_extension('reloader:load bar') != '':
    raise Exception

print 'Pass!'
