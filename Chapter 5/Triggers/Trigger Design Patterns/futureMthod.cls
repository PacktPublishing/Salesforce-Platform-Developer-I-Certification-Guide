public class SomeClass {
	@future
	public static void someFutureMethod(List<Id> recordIds) {
		List<Account> accounts = [Select Id, Name from Account Where Id IN :recordIds];
		// process your accounts 
	}
}
