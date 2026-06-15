push: git/samples/task-dashboard.git
	./build_multiplatform.sh --push

build: git/samples/task-dashboard.git
	./build_multiplatform.sh --load

git/samples/task-dashboard.git:
	cd git/samples && git clone --mirror https://github.com/GerritForge/task-dashboard.git
	
