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


    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    @Test
    public void testToString() {
        System.out.printf("%s\n", Feedback.formatBanner("testToString"));
        Assignment assignment = new Assignment();
        String toString = "Assignment()";
        System.out.printf("\"%s\" \u225f \"%s\"\n",
            toString, assignment.toString());
        Assert.assertEquals(String.format("\"%s\" != \"%s\"", 
            toString, assignment.toString()),
            toString, assignment.toString());
    }
}
