//
//  ViewController.m
//  LiveTweets
//
//  Created by Ajeet N on 11/07/16.
//  Copyright © 2016 AhexTech. All rights reserved.
//

#import "ViewController.h"
#import <TwitterKit/TwitterKit.h>
@interface ViewController ()
{
    TWTRTweetView *tweetView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    // TODO: Base this Tweet ID on some data from elsewhere in your app
   
    
    
    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
        if (session) {
            NSLog(@"signed in as %@", [session userName]);
            NSLog(@"Signed in as %@", [session userID]);
        } else {
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
    logInButton.center = self.view.center;
    [self.view addSubview:logInButton];
    
  
    
//    TWTRAPIClient *client = [TWTRAPIClient clientWithCurrentUser];
//    NSURLRequest *request = [client URLRequestWithMethod:@"GET"
//                                                     URL:@"https://api.twitter.com/1.1/account/verify_credentials.json"
//                                              parameters:@{@"include_email": @"true", @"skip_status": @"true"}
//                                                   error:nil];
//    NSLog(@"The requested credentials are %@",request);
//    
//    [client sendTwitterRequest:request completion:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//    }];
//    
  
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
    [client loadTweetWithID:@"20" completion:^(TWTRTweet *tweet, NSError *error) {
        if (tweet) {
            [tweetView configureWithTweet:tweet];
        } else {
            NSLog(@"Failed to load tweet: %@", [error localizedDescription]);
        }
    }];
    
    tweetView.theme = TWTRTweetViewThemeDark;
    
    // Use custom colors
    tweetView.primaryTextColor = [UIColor yellowColor];
    tweetView.backgroundColor = [UIColor blueColor];
//    tweetView.style = TWTRTweetViewStyleCompact;
    
    
    [[[TWTRAPIClient alloc] init] loadTweetWithID:@"20" completion:^(TWTRTweet *tweet, NSError *error) {
        if (error.domain == TWTRAPIErrorDomain && (error.code == TWTRAPIErrorCodeInvalidOrExpiredToken || error.code == TWTRAPIErrorCodeBadGuestToken)) {
            // can manually retry by calling -[Twitter logInGuestWithCompletion:]
        }
    }];
    
    [[Twitter sharedInstance].sessionStore fetchGuestSessionWithCompletion:^(TWTRGuestSession *guestSession, NSError *error) {
        if (guestSession) {
            // make API calls that do not require user auth
        } else {
            NSLog(@"error: %@", [error localizedDescription]);
        }
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
