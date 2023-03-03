CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'


cd student-submission
    if [[ -f ListExamples.java ]]
    then
    echo "List Examples found"
    else
    echo "need file ListExamples.java"
    exit 1
    fi 
cd ..

mkdir grader
cp TestListExamples.java grader
cp student-submission/ListExamples.java grader
cp -r lib grader

cd grader
javac -cp ..:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
if [[ $? -eq 0 ]]
then
echo "compile succeeds"
else
echo "compilation error"
exit 1
fi

java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples