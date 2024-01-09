if not exist stable-diffusion.cpp (
    git clone --recursive https://github.com/leejet/stable-diffusion.cpp
)

cd stable-diffusion.cpp
git fetch
git checkout 2b6ec97fe244d03c40aa8d70131d40bb086099b0
git submodule init
git submodule update

if not exist build (
    mkdir build
)

cd build

rem remove -DSD_CUBLAS=ON to disable cuda support
cmake .. -DBUILD_SHARED_LIBS=ON -DSD_BUILD_EXAMPLES=OFF -DSD_CUBLAS=ON 
cmake --build . --config Release

cd ..\..

dotnet publish -c Release -o bin

copy .\stable-diffusion.cpp\build\bin\Release\*.dll .\bin\

pause