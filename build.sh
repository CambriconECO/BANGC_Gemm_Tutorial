#!/bin/bash

g++ -O2 -std=c++11   -I /usr/local/neuware/include  -I . -DHOST -c ./common12/mlu_gemm16.cpp -o ./common12/mlu_gemm16.o
g++ -O2 -std=c++11   -I /usr/local/neuware/include  -I . -DHOST -c ./common12/main.cpp -o ./common12/main.o

pushd 1_gemm_GDRAM
cncc -S -O3 --bang-mlu-arch=MLU270 --bang-device-only ./gemm_GDRAM.mlu -o ./gemm_GDRAM.s
cnas --device-only -O2 --mcpu x86_64 -i ./gemm_GDRAM.s -o ./gemm_GDRAM.o
g++ -o ./test_int_matmul -L /usr/local/neuware/lib64 ../common12/mlu_gemm16.o ../common12/main.o ./gemm_GDRAM.o -lcnrt -lopenblas
echo "build 1_gemm_GDRAM done......."
popd

pushd 2_gemm_NRAM
cncc -S -O3 --bang-mlu-arch=MLU270 --bang-device-only ./gemm_NRAM.mlu -o ./gemm_NRAM.s
cnas --device-only -O2 --mcpu x86_64 -i ./gemm_NRAM.s -o ./gemm_NRAM.o
g++ -o ./test_int_matmul -L /usr/local/neuware/lib64 ../common12/mlu_gemm16.o ../common12/main.o ./gemm_NRAM.o -lcnrt -lopenblas
echo "build 2_gemm_NRAM done........"
popd

pushd 3_gemm_CONV
g++ -O2 -std=c++11   -I /usr/local/neuware/include  -I . -DHOST -c ./mlu_gemm16.cpp -o ./mlu_gemm16.o
g++ -O2 -std=c++11   -I /usr/local/neuware/include  -I . -DHOST -c ./main.cpp -o ./main.o

cncc -S -O3 --bang-mlu-arch=MLU270 --bang-device-only ./gemm_CONV.mlu -o ./gemm_CONV.s
cnas --device-only -O2 --mcpu x86_64 -i ./gemm_CONV.s -o ./gemm_CONV.o
g++ -o ./test_int_matmul -L /usr/local/neuware/lib64 ./mlu_gemm16.o ./main.o ./gemm_CONV.o -lcnrt -lopenblas
echo "build 3_gemm_CONV done........"
popd


g++ -O2 -std=c++11   -I /usr/local/neuware/include  -I . -DHOST -c ./common456/mlu_gemm16.cpp -o ./common456/mlu_gemm16.o
g++ -O2 -std=c++11   -I /usr/local/neuware/include  -I . -DHOST -c ./common456/main.cpp -o ./common456/main.o

pushd 4_1_gemm_PARALL
cncc -S -O3 --bang-mlu-arch=MLU270 --bang-device-only ./gemm_PARALL.mlu -o ./gemm_PARALL.s
cnas --device-only -O2 --mcpu x86_64 -i ./gemm_PARALL.s -o ./gemm_PARALL.o
g++ -o ./test_int_matmul -L /usr/local/neuware/lib64 ../common456/mlu_gemm16.o ../common456/main.o ./gemm_PARALL.o -lcnrt -lopenblas
echo "build 4_1_gemm_PARALL done......"
popd

pushd 4_2_gemm_PARALL_with_ALIGN
cncc -S -O3 --bang-mlu-arch=MLU270 --bang-device-only ./gemm_PARALL.mlu -o ./gemm_PARALL.s
cnas --device-only -O2 --mcpu x86_64 -i ./gemm_PARALL.s -o ./gemm_PARALL.o
g++ -o ./test_int_matmul -L /usr/local/neuware/lib64 ../common456/mlu_gemm16.o ../common456/main.o ./gemm_PARALL.o -lcnrt -lopenblas
echo "build 4_2_gemm_PARALL_with_ALIGN done......"
popd

pushd 5_gemm_SRAM
cncc -S -O3 --bang-mlu-arch=MLU270 --bang-device-only ./gemm_SRAM.mlu -o ./gemm_SRAM.s
cnas --device-only -O2 --mcpu x86_64 -i ./gemm_SRAM.s -o ./gemm_SRAM.o
g++ -o ./test_int_matmul -L /usr/local/neuware/lib64 ../common456/mlu_gemm16.o ../common456/main.o ./gemm_SRAM.o -lcnrt -lopenblas
echo "build 5_gemm_SRAM done........"
popd

pushd 6_gemm_PIPELINE
cncc -S -O3 --bang-mlu-arch=MLU270 --bang-device-only ./gemm_PIPELINE.mlu -o ./gemm_PIPELINE.s
cnas --device-only -O2 --mcpu x86_64 -i ./gemm_PIPELINE.s -o ./gemm_PIPELINE.o
g++ -o ./test_int_matmul -L /usr/local/neuware/lib64 ../common456/mlu_gemm16.o ../common456/main.o ./gemm_PIPELINE.o -lcnrt -lopenblas
echo "build 6_gemm_PIPELINE done...."
popd
