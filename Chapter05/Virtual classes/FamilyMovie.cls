public class FamilyMovie extends MovieVirtual{

	public FamilyMovie(){
		// the same initiation of the parent class as for the abstract class
		super('Family');
	}

	public override void insertMovie(){
		// I override the initial functionality and implement new logic for this specific child
		System.debug('insertMovie From FamilyMovie');
	}

	// I didn't implement the second virtual method, is not necessary

	// reuse of the implemented logic in the virtual class
	public List<Movie__c> getFamilyMovies(){
		return this.selectMovies();
	}
}
