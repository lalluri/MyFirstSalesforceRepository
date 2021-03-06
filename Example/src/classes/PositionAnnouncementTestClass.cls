/**
 * This class contains unit tests for validating the behavior of the PositionAnnouncementTrigger
 */
@isTest(SeeAllData=true)
private class PositionAnnouncementTestClass {
	//verifyPost: Verify that chatter messages are posted when positions have the status Open/Approved
	//TODO: Create the outline for a test method called verifyPost
	//TODO: In the body of verifyPost, put the code you used to test the PositionAnnouncementTrigger
	//TODO:   that is found in the file 5-3.TestPositionAnnouncment.txt


	//verifyNotPost: Verify that chatter messages are NOT posted when positions do not have the status Open/Approved
	//TODO: Create the test method called verifyNotPost to fulfull the requirements described in the comment above	

@isTest
static void VerifyPost(){
	
	List<Position__c> openApprovedPositions = new List<Position__c>();
 
	User hiringManager = [SELECT id, name FROM User u
				Where u.people_manager__c=true][0];   
	
	Integer startCountFeedPosts =[Select count() From CollaborationGroupFeed where parentId in (select id from CollaborationGroup where name='All Universal Containers')];
	
	System.debug(' Before trigger number of chatter posts for group is: ' + startCountFeedPosts);    
					
	for (Integer i = 1; i <=20; i++) {
		openApprovedPositions.add(new Position__c(name='Test Position #'+ i
								, hiring_manager__c=hiringManager.id
								, Job_Description__c='test position'
								, status__c='Open'
								, sub_status__c='Approved'));
	}
	Database.insert(openApprovedPositions);
	
	Integer endCountFeedPosts = [Select count() From CollaborationGroupFeed where parentId in (select id from CollaborationGroup where name='All Universal Containers')];
	System.debug('After trigger number of chatter posts for group is: ' + endCountFeedPosts);    
	System.assertEquals(startCountFeedPosts + 20, endCountFeedPosts);
	
	
	
}

}