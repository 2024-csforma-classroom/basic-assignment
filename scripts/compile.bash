#!/bin/bash

# Initialize directory names.
scripts="$(pwd)/$(dirname "$0")"
project="$( realpath ${scripts}/.. )"
src="${project}/app/src"
build="${project}/app/build/classes/java"
resources="${project}/resources"

# Download JUnit .JAR files, if necessary.
[ ! -d  "${resources}" ] && mkdir "${resources}"
[ ! -f "${resources}/junit-4.13.2.jar" ] && \
    curl -o "${resources}/junit-4.13.2.jar" \
    https://repo1.maven.org/maven2/junit/junit/4.13.2/junit-4.13.2.jar
[ ! -f "${resources}/hamcrest-2.2.jar" ] && \
    curl -o "${resources}/hamcrest-2.2.jar" \
    https://repo1.maven.org/maven2/org/hamcrest/hamcrest/2.2/hamcrest-2.2.jar

# Expand *Unit.java glob.
files=( ${project}/*Unit.java )
# Select last (and only) filename / classname.
for file in "${files[@]}"
do
    unitjava="${file##*/}"
    unitclass="${unitjava%.*}"
done

# Compile Java files.
echo "Compiling ${src}/main/java/*.java..."
javac -cp "${project}:${build}/main::${build}/test:${resources}/*" \
    -d ${build}/main ${src}/main/java/*.java
echo "Compiling ${src}/test/java/*.java..."
javac -cp "${project}:${build}/main::${build}/test:${resources}/*" \
    -d ${build}/test ${src}/test/java/*.java
