public class MyOutstandingReview{

    public Boolean checked{ get; set; }    
    public Review__c review { get; set;}
     
    public MyOutstandingReview(Review__c rev){
        review = rev;        
        checked = false;
    }
}