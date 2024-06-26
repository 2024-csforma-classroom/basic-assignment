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
files=( ${build}/test/*Unit.class )
# Select last (and only) filename / classname.
for file in "${files[@]}"
do
    unitjava="${file##*/}"
    unitclass="${unitjava%.*}"
done

# Compile *.java silently.
cd ${scripts}; bash compile.bash 2>&1 > /dev/null
[ $? -ne 0 ] && exit $?

# Execute JUnit test class.
echo "Running ${unitclass}..."
java -cp "${project}:${build}/main::${build}/test:${resources}/*" -ea \
    ${unitclass}

#kill -SIGUSR1 $(ps $$ -o ppid=);exit       # MacOs
#kill -SIGUSR1 `ps --pid $$ -oppid=`; exit  # Linux
