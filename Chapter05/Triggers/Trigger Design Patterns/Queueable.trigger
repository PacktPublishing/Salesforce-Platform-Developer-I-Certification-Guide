trigger Account_Trigger on Account (after insert) {
	if (Trigger.isAfter && Trigger.isInsert){
		Account_TriggerHelper queueJob = new Account_TriggerHelper((List<Account>) Trigger.new);
		Id jobId = System.enqueueJob(queueJob);
		// implement logic to monitor your job
	}
}
