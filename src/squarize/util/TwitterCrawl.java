package squarize.util;

import java.util.ArrayList;

import twitter4j.HashtagEntity;
import twitter4j.Query;
import twitter4j.QueryResult;
import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;

public class TwitterCrawl {
	
	public static void main(String[] args) {
		try {
		    Twitter twitter = TwitterFactory.getSingleton();
		    Query query = new Query("ㅇㅇㅇ");
		    QueryResult result;
				result = twitter.search(query);
			ArrayList<String> searchResult = new ArrayList<>();
		    for (Status status : result.getTweets()) {
		    	
		    	String[] words = status.getText().split(" ");
		    	for (int i = 0; i < words.length; i++) {
		    		if(!words[i].equals("RT"))
		    			searchResult.add(words[i]);
				}
		    	
		    	HashtagEntity[] hash = status.getHashtagEntities();
		    	if(hash.length > 0){
		    		for (int i = 0; i < hash.length; i++) {
		    			searchResult.add(hash[i].getText());
					}
		    	}
		    }
		    
		    
		    System.out.println(searchResult);		//본문쪼갠거 + 해쉬태그
		    
		} catch (TwitterException e) {
			e.printStackTrace();
		}
	}

}
