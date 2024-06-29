/*
 * AssignmentSuite.java
 *
 * Run Junit tests for Assignment.java.
 *
 * @author David C. Petty // http://j.mp/psb_david_petty
 */

import org.junit.runner.JUnitCore;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;
 
public class AssignmentSuite {
    @RunWith(Suite.class)
    @Suite.SuiteClasses({
        // Add test classes here.
        AssignmentTest.class,
        OtherTest.class
    })
    public class TestSuite {
        // This class remains empty, it is used only as a holder for the above annotations
    }

    public static void main(String [] args)
    {
        // Run JUnit tests.
        Class test = TestSuite.class;
        Result result = JUnitCore.runClasses(test);
        for (Failure failure : result.getFailures()) {
            System.out.printf("FAILURE: %s %s\n",
                failure.getTestHeader(), failure.getException());
        }
        System.out.printf("%s: %s test(s), %s failure(s), %s.\n", 
            test.getName(), result.getRunCount(), result.getFailureCount(),
            result.wasSuccessful() ? "PASSED" : "DID NOT PASS");
        System.exit(result.getFailureCount());
    }
}
