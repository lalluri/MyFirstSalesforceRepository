trigger PositionInsertTrigger on Position__c (after insert) {
	SubscriptionClass.HiringManagerSubscribeNewPosition(trigger.new);
}