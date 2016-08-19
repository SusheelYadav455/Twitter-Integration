//
//  ViewController.m
//  LiveTweets
//
//  Created by Ajeet N on 11/07/16.
//  Copyright © 2016 AhexTech. All rights reserved.
//



#import "ViewController.h"
#import <TwitterKit/TwitterKit.h>
#import "AppDelegate.h"
#import <Accounts/Accounts.h>
#import "MBProgressHUD.h"




@interface ViewController ()
{
    MBProgressHUD *HUD;
}



@property (strong, atomic) NSMutableArray *imagesDictionary;
@property (strong, nonatomic)TWTRTweetView *tweetViewObj;


@property (strong,nonatomic)ACAccount *accountObj;




@end



@implementation ViewController

- (void)viewDidLoad

{
    
[super viewDidLoad];
    
    
//    for (UIView *subview in [Tweetview subviews]){
//        NSLog(@"Class: %@", [subview class]);
//        if ([subview isKindOfClass:[UIImageView class]]){
//            [subview removeFromSuperview];
//        }
//    }
    
    
   
    

    // WashingtonianPS
    TWTRAPIClient *client = [[TWTRAPIClient alloc] init];
    
    self.dataSource = [[TWTRUserTimelineDataSource alloc] initWithScreenName:@"WashingtonianPS" APIClient:client];
    
    
    

    
  
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithTitle:@"Post" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonAction)];
    self.navigationItem.rightBarButtonItem= rightButton;
    
    
    
    
    
    
    
    
}
    
    
-(void)rightButtonAction{
    
    
    TWTRComposer *composer = [[TWTRComposer alloc] init];
    
    
        [composer setText:@"post Something here !!!"];
        [composer setURL:[NSURL URLWithString:@"www.AhexTechnologies.com"]];
        [composer setImage:[UIImage imageNamed:@"images.png"]];
    
        [composer showFromViewController:self completion:^(TWTRComposerResult result) {
            if (result == TWTRComposerResultCancelled) {
    
    
    
                HUD = [[MBProgressHUD alloc] initWithView:self.view];
    
                HUD.labelText=@"Tweet was cancelled!!!";
                [self.view addSubview:HUD];
                [HUD show:YES];
                [HUD hide:YES afterDelay:2];
    
    
    
                NSLog(@"Tweet composition cancelled");
            }
            else {
    
    
                HUD.labelText=@"You successfully posted the Tweet !!!!!";
                [self.view addSubview:HUD];
    
                [HUD show:YES];
                [HUD hide:YES afterDelay:2];
                
                
                NSLog(@"Sending Tweet!");
            }
        }];
    
        

    
    
    
}









@end
