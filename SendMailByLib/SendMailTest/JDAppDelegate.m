//
//  JDAppDelegate.m
//  SendMailTest
//
//  Created by Rakesh Kumar on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JDAppDelegate.h"

@implementation JDAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    objSMTPSender = [[SMTPSender alloc] init];
    //[objSMTPSender sendMessage:@"Hello I am testing SMTP integration from iPhone." delegate:self attachmentData:nil];
    
    //For Others
    [objSMTPSender sendMessage:@"Hello this is Test Mail to check SMTP integration." subject:@"Test Mail" delegate:self attachmentData:nil senderId:@"rakesh.kumar@sebiz.net" password:@"password" receiverId:@"rakesh.kumar@sebiz.net" relayHost:@"mail.sebiz.net"];
    
    //For Gmail
   // [objSMTPSender sendMessageByGmail:@"Hello this is Test Mail to check SMTP integration." subject:@"Test Mail" delegate:self attachmentData:nil senderId:@"your mail id" password:@"India1947" receiverId:@"rakesh.netsmartz@gmail.com"];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

#pragma mark- SMTPSender Delegates

- (void)messageSent:(SKPSMTPMessage *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sent" message:@"Your message sent." delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alert show];
    
    NSLog(@"delegate - message sent");
}

- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error {
    
    NSLog(@"delegate - error(%d): %@", [error code], [error localizedDescription]);
}



@end
