CPATH=".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission
cd student-submission
if [[ -f ListExamples.java ]]
then 
    echo "File found"
else 
    echo "Error!"
    exit
fi
cp ../GradeServer.java ./
cp ../Server.java ./
cp ../TestListExamples.java ./
javac -cp $CPATH *.java 

if [[ $? -ne 0 ]]
then 
    echo "Error"
fi
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
echo 'Finished cloning'