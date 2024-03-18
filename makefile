test64:
	x86_64-w64-mingw32-g++ -Wall -std=c++11 \
		test.cpp -o test.exe \
		-I./include \
		-I/src/build/x86_64-w64-mingw32/ \
		-I/src/build/x86_64-w64-mingw32/include/ \
		-I/src/build/x86_64-w64-mingw32/include/opencv4/ \
		-I/src/build/x86_64-w64-mingw32/include/opencv4/opencv2/ \
		-I/src/build/x86_64-w64-mingw32/include/opencv4/opencv2/core/ \
		-I/src/build/x86_64-w64-mingw32/include/opencv4/opencv2/imgproc/ \
		-I/src/build/x86_64-w64-mingw32/include/opencv4/opencv2/imgcodecs/ \
		-L/src/build/x86_64-w64-mingw32/lib \
		-L/src/build/x86_64-w64-mingw32/include/ \
		-L/src/build/x86_64-w64-mingw32/lib/opencv4/3rdparty/ \
		-lopencv_imgcodecs490 -lopencv_imgproc490 -lopencv_core490 \
		-l:libIlmImf.a -l:libzlib.a -l:liblibopenjp2.a \
		-l:liblibjpeg-turbo.a -l:liblibpng.a -l:liblibtiff.a -l:liblibwebp.a \
		-lpthread -static-libgcc -static-libstdc++ -static
