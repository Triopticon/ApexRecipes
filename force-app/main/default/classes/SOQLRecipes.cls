/**
 * This SOQLRecipes class contains various SOQL recipes for playing with and
 * learning more about SOQL in Salesforce.
 * <br><br>
 * This is inspired and mainly sourced from the CodeLive series on Salesforce
 * and hosted by Kevin Poorman.
 *
 * @author Kenneth Soerensen (kenneth@ks81.com)
 * @since Version 0.1.0 - Aug 2020
 * @group SOQL
 * @see [This work by Kenneth Soerensen is licensed under CC BY 4.0. To view a copy of this license, visit https://creativecommons.org/licenses/by/4.0](https://creativecommons.org/licenses/by/4.0)
 * @see [GitHub Profile](https://github.com/Triopticon)
 * @see [CodeLive, Dec 5th, 2019 with Kevin Poorman](https://trailhead.salesforce.com/live/videos/a2r3k000001WFId/codelive-with-salesforce-developers-building-apex-recipes)
 * @see [Kevin Poorman](https://trailblazer.me/id/codefriar?_ga=2.136161912.876104214.1596140805-1647642799.1580159287)
 */
public with sharing class SOQLRecipes {
    /*
     * What soql is.
     * Query a single object?
     * Query lots of records - more than 2k.
     * Query of child objects from a parent. Get all contacts for accounts X along with Account info.
     * Query of parent records data from a child object: Show mw the account's name for contact X.
     * * LIMIT
     * * OFFSET
     * * Complex WHERE clauses
     * * Aggregate functions
     */

    /**
     * Showing how to query a single object with SOQL by querying the Account
     * object for all records.
     *
     * @author Kenneth Soerensen (kenneth@ks81.com)
     * @since Version 0.1.0 - Aug 2020
     * @returns Returns a list of Accounts as `List<Account>`
     */
    public static List<Account> querySingleObject() {
        List<Account> accounts = [SELECT Name, ShippingStreet FROM Account];
        return accounts;
    }

    /**
     * Showing how to query a massive number of records on a single object with
     * SOQL by querying the Account object for all records without any limits.
     *
     * @author Kenneth Soerensen (kenneth@ks81.com)
     * @since Version 0.1.0 - Aug 2020
     * @returns Returns the count of records as `integer`
     */
    public static integer queryMassiveNumberOfRecordsReturningCount() {
        Integer count = 0;
        for (Account acct : [SELECT Name FROM Account]) {
            // DML here! -- dangerous, but not totally bad.
            // Interact with our acct variable // modify etc.
            count++;
        }
        return count;
    }

    /**
     * Showing how to query with a simple where clause SOQL statement
     * by querying the Account object for all records with the where clause:
     * `ShippingCountry = 'UK'`
     *
     * @author Kenneth Soerensen (kenneth@ks81.com)
     * @since Version 0.1.0 - Aug 2020
     * @returns Returns a list of Accounts as `List<Account>`
     */
    public static List<Account> getFilteredList() {
        List<Account> accounts = [
            SELECT Name
            FROM Account
            WHERE ShippingCountry = 'UK'
        ];

        return accounts;
    }

    /**
     * Showing how to query with a more advanced where clause SOQL statement
     * by querying the Account object for all records with the where clause:
     * `ShippingCountry = 'US' AND ShippingState = 'Indiana' AND
     * (Industry = 'Fast Food - Made whole' OR Industry = 'Slow Food - Made quickly')`
     *
     * @author Kenneth Soerensen (kenneth@ks81.com)
     * @since Version 0.1.0 - Aug 2020
     * @returns Returns a list of Accounts as `List<Account>`
     */
    public static List<Account> getComplexFilteredList() {
        List<Account> accountsInUS = [
            SELECT Name
            FROM Account
            WHERE
                ShippingCountry = 'US'
                AND ShippingState = 'Indiana'
                AND (Industry = 'Fast Food - Made whole'
                OR Industry = 'Slow Food - Made quickly')
        ];

        return accountsInUS;
    }

    /**
     *
     *
     * @returns `List<Account>`
     */
    public static List<Account> getSpecificNumberOfResults() {
        return [SELECT Name FROM Account LIMIT 10];
    }
}
