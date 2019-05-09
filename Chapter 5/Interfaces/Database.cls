public class Database {
	Public interface Batchable {
		Database.QueryLocator start(Database.BatchableContext bc);
		void execute(Database.BatchableContext bc, List<SObject> sObjects);
		void finish(Database.BatchableContext bc);
	}
}

