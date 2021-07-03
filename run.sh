mkdir -p webroot
if [ -a "webroot/demo.pid" ]; then
pid=$(cat webroot/demo.pid)
existpid=$(ps aux | awk '{print $2}'| grep -w $pid)
@echo "获得PID=$pid, 运行中PID=$existpid"
fi
if [[ $existpid != "" ]]; then
kill -9 $pid
@echo "目标 $pid 进程存在，已删除之"
fi
if [ -a "build/libs/demo-0.0.1-SNAPSHOT.jar" ]; then
mv -f build/libs/demo-0.0.1-SNAPSHOT.jar webroot/demo.jar
@echo "jar包已拷贝"
fi
cd webroot
if [ -a demo.jar ]; then
nohup java -jar demo.jar > demo.log 2>&1 & echo $! >"demo.pid"
@echo "已执行发布"
fi