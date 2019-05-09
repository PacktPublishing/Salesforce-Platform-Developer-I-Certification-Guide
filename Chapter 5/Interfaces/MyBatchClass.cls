public class MyBatchClass implements Database.Batchable<SObject> {

    public Database.QueryLocator start(Database.BatchableContext bc){
        // logic to select your data
    }
    
    public void execute(Database.BatchableContext bc, List<SObject> scope){
        // logic to execute with the scope of records
    }
    
    public void finish(Database.BatchableContext bc){
        // logic to execute when all records are processed
    }
}
