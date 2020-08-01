/**
 * Unit Tests for the SOQLRecipes class to ensure the code have more then
 * plenty of code coverage and to get more experience with Apex Unit Testing.
 * <br><br>
 * This is inspired and mainly sourced from the CodeLive series on Salesforce
 * and hosted by Kevin Poorman.
 *
 * @author Kenneth Soerensen (kenneth@ks81.com)
 * @since Version 0.1.0 - Aug 2020
 * @group SOQL
 * @see [This work by Kenneth Soerensen is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0](https://creativecommons.org/licenses/by/4.0)
 * @see [Kenneth Soerensen - GitHub Profile](https://github.com/Triopticon)
 * @see [CodeLive, Dec 5th, 2019 with Kevin Poorman](https://trailhead.salesforce.com/live/videos/a2r3k000001WFId/codelive-with-salesforce-developers-building-apex-recipes)
 * @see [Kevin Poorman](https://trailblazer.me/id/codefriar?_ga=2.136161912.876104214.1596140805-1647642799.1580159287)
 */
@IsTest
private class SOQLRecipes_Tests {
    @IsTest
    static void testSimpleQuerySingleObject() {
        /*
         * Creating test data.
         * Setup our test structure.
         * Call Test.StartTest();.
         * Execute our code.
         * Call Test.StopTest();.
         * Make assertions against what we executed.
         */

        Account acct = new Account(
            Name = 'The Test Account of awesomeness',
            ShippingStreet = '123 Sesame St.',
            ShippingCity = 'New Jersey?'
        );
        insert acct;
        Test.startTest();
        List<Account> testAccounts = SOQLRecipes.querySingleObject();
        Test.stopTest();
        System.assertEquals(
            testAccounts.size(),
            1,
            'We found more or less then 1 account having created exactly 1 account.'
        );
        System.assert(testAccounts[1].Name.contains('Awesome'));
    }

    @IsTest
    static void testCountOfLargeDataVolumes() {
        // Create test data.
        // Execute our code startTest().
        // StopTest().
        // Make assertions.
        List<Account> testAccounts = new List<Account>();

        for (Integer i = 0; i < 1500; i++) {
            testAccounts.add(new Account(Name = 'TestAccount ' + i));
        }
        insert testAccounts;
        testAccounts.clear();
    }
}
