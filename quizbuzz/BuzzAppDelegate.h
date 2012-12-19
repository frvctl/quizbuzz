//
//  BuzzAppDelegate.h
//  quizbuzz
//
//  Created by Ben Vest on 12/14/12.
//  Copyright (c) 2012 polarcuke. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "hidapi.h"

@interface BuzzAppDelegate : NSObject <NSApplicationDelegate> {

    int res;
    int lastBuzzed;
    int buzzNum;
    
    NSString *text;
    
    bool listen;

    unsigned char buffer[65];
    unsigned char buf_temp[65];
    
    hid_device  *handle;
    
    __unsafe_unretained NSTextView *mainTextArea;
}


@property (assign) IBOutlet NSWindow *window;
@property (unsafe_unretained) IBOutlet NSTextView *mainTextArea;


- (IBAction)resetBuzzerButton:(id)sender;
- (IBAction)stopReading:(id)sender;
- (IBAction)listenForEventsEngage:(id)sender;
 
- (void)listenToTheBuzzer;
- (void)lightTheBuzz:(int)buzzerToLight event:(bool)isAEvent;
- (void)resetTheBuzzer;
- (void)createBuzzerConnection;

@end
