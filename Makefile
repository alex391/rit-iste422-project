build:
	echo "Compiling source code and unit tests..."
	mkdir -p build
	javac -cp lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar -d build src/main/java/*.java src/test/java/*
run: build
	echo "Running application..."
	java -cp .:build/ RunEdgeConvert
test: build
	echo "Running unit tests..."
	java -cp .:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar:build/ org.junit.runner.JUnitCore EdgeConnectorTest
clean:
	echo "Cleaning existing classes..."
	rm -f *.class
	# This command looks for matching files and runs the rm command for each file
	# Note that {} are replaced with each file name
	find . -name \*.class -exec rm {} \;
	rm -f --dir build # Like rmdir, but don't error if the directory doesn't exist. Do error if it isn't empty
all: clean build test run
	echo "running all"
