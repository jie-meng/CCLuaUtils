import os
import platform
import shutil

APP_NAME = 'CCLuaUtils'

bin_src_path = None
bin_file = None
if 'windows' in platform.system().lower():
    bin_src_path = os.getcwd() + '/simulator/win32'
    bin_file = bin_src_path + '/' + APP_NAME + '.exe'
elif 'linux' in platform.system().lower():
    bin_src_path = os.getcwd() + '/simulator/linux/Resources'
    bin_file = os.getcwd() + '/simulator/linux/HelloLua'
elif 'darwin' in platform.system().lower():
    bin_src_path = os.getcwd() + '/simulator/mac/' + APP_NAME + '-desktop.app/Contents/Resources'
    bin_file = os.getcwd() + '/simulator/mac/' + APP_NAME + '-desktop.app'

print('remove src ...')
if os.path.isdir(bin_src_path + '/src'):
    shutil.rmtree(bin_src_path + '/src')

print('remove res ...')
if os.path.isdir(bin_src_path + '/res'):
    shutil.rmtree(bin_src_path + '/res')

shutil.copytree('./src', bin_src_path + '/src')
print('copy res ...')
print('copy src ...')
shutil.copytree('./res', bin_src_path + '/res')

print('run game')
if 'darwin' in platform.system().lower():
    os.system('open ' + bin_file)
else:
    os.system(bin_file)
