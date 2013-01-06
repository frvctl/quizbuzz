//
//  HandleDevice.h
//  quizbuzz
//
//  Created by Ben Vest on 1/5/13.
//  Copyright (c) 2013 polarcuke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "hidapi.h"

@interface HandleDevice : NSObject{
    int res;
    
    unsigned char buffer[65];
    unsigned char buf_temp[65];
    
    hid_device  *handle;
}

@property (readonly) NSString *deviceText;
@property (readonly) int lastBuzzed;
@property (readonly) int buzzNum;
@property bool listen;

- (void)resetBuzzerButton;
- (void)stopReading;
- (void)listenForEventsEngage;
- (void)testLights;
- (void)listenToTheBuzzer;
- (void)lightTheBuzz:(int)buzzerToLight event:(bool)isAEvent;
- (void)resetTheBuzzer;
- (void)createBuzzerConnection;


@end
