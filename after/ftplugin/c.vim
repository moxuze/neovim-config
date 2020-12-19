set commentstring=//%s
command! -nargs=* Make !make --silent --directory=./build/debug <args>
command! -nargs=* MakeRelease !make --silent --directory=./build/release <args>
command! -nargs=* Cmake !cmake -S . -B ./build/debug -DCMAKE_BUILD_TYPE=Debug <args>
command! -nargs=* CmakeRelease !cmake -S . -B ./build/release -DCMAKE_BUILD_TYPE=Release <args>
