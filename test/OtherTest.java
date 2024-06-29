/*
 * OtherTest.java
 *
 * Junit tests for Assignment.java.
 *
 * @author David C. Petty // http://j.mp/psb_david_petty
 */

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class OtherTest {


    @Before
    public void setUp() {
    }

    @After
    public void tearDown() {
    }

    @Test
    public void testRepr() {
        System.out.printf("%s\n", Feedback.formatBanner("testRepr"));
        Assignment assignment = new Assignment();
        String repr = "new Assignment()";
        System.out.printf("\"%s\" \u225f \"%s\"\n",
            repr, assignment.repr());
        Assert.assertEquals(String.format("\"%s\" != \"%s\"", 
            repr, assignment.repr()),
            repr, assignment.repr());
    }
}
