mkdir -p tmp/
mkdir -p bld/
mkdir -p env/
curl "http://www.cmake.org/files/v2.8/cmake-2.8.11.2-win32-x86.zip" > tmp/cmake.zip
unzip -d tmp/ -u tmp/cmake.zip
mv tmp/cmake-*/* env/
