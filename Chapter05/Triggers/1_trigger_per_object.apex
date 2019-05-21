trigger Account_Trigger on Account (before update, after update, after insert, after delete) {
	If (Trigger.isDelete){
		// perform logic when your record(s) has been deleted
	} else if (Trigger.isUpdate){
		// perform logic when your records are updated
		If (Trigger.isBefore){
			// execute the logic before the update of the record(s)
		} else if (Trigger.isAfter){
			// execute the logic after the update of the record(s)
		}
	} else if (Trigger.isInsert){
		// perform logic before a record is inserted
	}
}
