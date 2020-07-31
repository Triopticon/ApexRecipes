public with sharing class SOQLRecipes {
    
    /**
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

     public static void querySingleObject() {
        List<Account> accounts = [
            SELECT Name, MailingStreet
            FROM Account
        ];
     }
}
