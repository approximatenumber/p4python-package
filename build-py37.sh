WHEEL=p4python-2018.2.1743033-cp37-cp37m-linux_x86_64.whl

docker run --rm -v ${PWD}:/p4python -e WHEEL=${WHEEL} python:3.7 /p4python/build.sh 
