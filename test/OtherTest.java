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
 
     private String repr;
 
     @Before
     public void setUp() {
         // TODO: set up any test data before each test
         repr = "new Assignment()";
     }
 
     @After
     public void tearDown() {
         // TODO: tear down any test data after each test
         repr = null;
     }
 
     @Test
     public void testRepr() {
         // Log test name to console.
         System.out.printf("%s\n", Feedback.formatBanner("testRepr"));
         Assignment assignment = new Assignment();
         // Log student feedback to console.
         System.out.printf("\"%s\" \u225f \"%s\"\n",
             repr, assignment.repr());
         // Use Assert to test method behaviors (including failure message).
         Assert.assertEquals(String.format("\"%s\" != \"%s\"", 
             repr, assignment.repr()),
             repr, assignment.repr());
     }
 }
 