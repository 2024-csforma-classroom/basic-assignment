/*
 * AssignmentTest.java
 *
 * Junit tests for Assignment.java.
 *
 * @author David C. Petty // http://j.mp/psb_david_petty
 */

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class AssignmentTest {

    private String toString;

    @Before
    public void setUp() {
        // TODO: set up any test data before each test
        toString = "Assignment()";
    }

    @After
    public void tearDown() {
        // TODO: tear down any test data after each test
        toString = null;
    }

    @Test
    public void testToString() {
        // Log test name to console.
        System.out.printf("%s\n", Feedback.formatBanner("testToString"));
        Assignment assignment = new Assignment();
        // Log student feedback to console.
        System.out.printf("\"%s\" \u225f \"%s\"\n",
            toString, assignment.toString());
        // Use Assert to test method behaviors (including failure message).
        Assert.assertEquals(String.format("\"%s\" != \"%s\"", 
            toString, assignment.toString()),
            toString, assignment.toString());
    }
}
