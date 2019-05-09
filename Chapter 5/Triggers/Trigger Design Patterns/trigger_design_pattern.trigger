trigger Account_Trigger on Account (before update, before insert) {
	if (Trigger.isBefore){
		if (Trigger.isInsert){
			Account_TriggerHelper.beforeInsert((List<Account>) Trigger.new);
		} else if (Trigger.isUpdate){
			Account_TriggerHelper.beforeUpdate((List<Account>) Trigger.new);
		}
	}	
}
