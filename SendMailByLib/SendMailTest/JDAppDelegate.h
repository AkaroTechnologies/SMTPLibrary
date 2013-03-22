//
//  JDAppDelegate.h
//  SendMailTest
//
//  Created by Rakesh Kumar on 6/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMTPSender.h"

@interface JDAppDelegate : UIResponder <UIApplicationDelegate,SMTPSenderDelegate> {
    SMTPSender *objSMTPSender;
}

@property (strong, nonatomic) UIWindow *window;

@end
