import grails.test.AbstractCliTestCase

class EventsTests extends AbstractCliTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testEvents() {

        execute(["events"])

        assertEquals 0, waitForProcess()
        verifyHeader()
    }
}
