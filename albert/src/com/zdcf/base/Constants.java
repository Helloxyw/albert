package com.zdcf.base;

public interface Constants {

	//推特验证信息
	static String AccessToken = "959746950-ifkHxIgWxgodhDeLYeGeFHf6Vle3gzHpwJnTmIvW";
	static String AccessSecret = "Y9c4Aad4qCC3sbJJ16avGCVvqvAJuvE1ivbZ3oLemVFsv";
	static String ConsumerKey = "aWgjz4QU7vm6cITrJ1Ff9Ve49";
	static String ConsumerSecret = "FrBakfTEvCVop4BxD3ttrE3fFojp62IqweqA9dTl9Uu2undD9y";
	
	static final  String TWITTER_MY_TIME_LINE="https://api.twitter.com/1.1/statuses/home_timeline.json";
	
	static final  String TWITTER_USER_TIME_LINE="https://api.twitter.com/1.1/statuses/user_timeline.json";
	
	static final  String TWITTER_MY_MENTIONS_TIME_LINE="https://api.twitter.com/1.1/statuses/mentions_timeline.json";
	
	static final  String TWITTER_SEARCH_TWEETS="https://api.twitter.com/1.1/search/tweets.json";
	
	static final  String USER_SESSION_KEY = "USER_SESSION_KEY";
	
	static final  String ADMIN_SESSION_KEY = "ADMIN_SESSION_KEY";
	
	static final  String FORGET_VERIFIED_KEY = "FORGET_VERIFIED_KEY";
	//系统语言
	static final  String SYS_LANGUAGE_SESSION_KEY = "SYS_LANGUAGE_SESSION_KEY";
	
	static final  String COOKIE_REMEMBER_USER__PASSWORD__NAME = "COOKIE_REMEMBER_USER__PASSWORD__NAME";
	
	static final  String SESSION_IMAGE_CODE = "SESSION_IMAGE_CODE";//图形验证码
	
	
	static final String GOOGLE_SEARCH_URL="https://www.googleapis.com/customsearch/v1?cx=007821717631179546661:42aw6xv7bxe&key=AIzaSyCTU7bnqcAsdGG7ZhjjEfM706s7Z0tITWE&q=";
	
	// 系统中的主要频道编码
	interface Chnl {
		static final  int House = 100; // 租房
	}
	
	interface Cache{
		static final  String Entity= "entity";
		static final  String PageView = "pv";
		static final  String TotalScore = "score";
		static final  String TotalCount = "count";
		static final  String AveScore = "avg";
		
		static final  String Zhihu = "zhihu:";
		static final  String Theme = "theme:";
		static final  String Movie = "movie:";
		static final  String FileExchange = "fileExchange:";
		
		enum Type{
			save, del, update
		}
	}
	
	interface LOCALE_LANGUAGE{
		static final  String  zh_CN = "zh_CN"; //中文
		static final  String  en_US = "en_US"; //英文
		static final  String  zh_HK = "zh_HK"; //繁体
	}
	
	interface TWITTER_POST_TYPE{
		static final  Integer MY_POST=0;
		static final  Integer SEARCH_RESULT=1;
	}
	
	interface TWITTER_SEARCH_TYPE{
		static final  Integer SEARCH_USER=0;
		static final  Integer SEARCH_TEXT=1;
	}
		
}
