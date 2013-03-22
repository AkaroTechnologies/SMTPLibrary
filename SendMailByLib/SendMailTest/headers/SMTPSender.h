//
//  SMTPSender.h
//  SMTPSender
//
//  Created by Test Kumar on 6/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CFNetwork/CFNetwork.h>
#import "SKPSMTPMessage.h"

@class SMTPSender;

@protocol SMTPSenderDelegate
@optional
- (void)messageSent:(SKPSMTPMessage *)message;
- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error;

@end

@interface SMTPSender : NSObject <SKPSMTPMessageDelegate>{
    id <SMTPSenderDelegate> smtpDelegate;
    
}

@property (nonatomic, assign)  id <SMTPSenderDelegate> smtpDelegate;


- (void)sendMessage:(NSString *)message subject:(NSString*)subject delegate:(id)delegate attachmentData:(NSData *)attachmentData senderId:(NSString*)senderId password:(NSString *)password receiverId:(NSString *)receiverId relayHost:(NSString*)relayHost;
- (void)sendMessageByGmail:(NSString *)message subject:(NSString*)subject delegate:(id)delegate attachmentData:(NSData *)attachmentData senderId:(NSString*)senderId password:(NSString *)password receiverId:(NSString *)receiverId;@end


