//
//  HandleDevice.m
//  quizbuzz
//
//  Created by Ben Vest on 1/5/13.
//  Copyright (c) 2013 polarcuke. All rights reserved.
//

#import "HandleDevice.h"
#import "MainBuzzView.h"
#import "hidapi.h"

@implementation HandleDevice
@synthesize listen;

- (void)resetBuzzerButton:(id)sender {
    if (listen) {
        [self resetTheBuzzer];
    }
}

- (void)stopReading:(id)sender {
    listen = NO;
    [self performSelectorInBackground:@selector(resetTheBuzzer) withObject:nil];
}

- (void)listenForEventsEngage:(id)sender {
    listen = YES;
    [self performSelectorInBackground:@selector(listenToTheBuzzer) withObject:nil];
}

- (void)testLights:(id)sender {
    for (int x = 0; x < 5; x++) {
        buffer[x+1] = 0xff;
        res = hid_write(handle, buffer, 8);
    }
}

- (void)createBuzzerConnection {
    hid_init ();
	while (handle  ==  NULL) {
		handle  =  hid_open (0x054c, 0x1000 , NULL);
		if (handle  ==  NULL)
            NSLog(@"wtf");
    }
    
    listen = YES;
    hid_set_nonblocking(handle, 1);
}

- (void)listenToTheBuzzer {
    MainBuzzView *buzzview = [[MainBuzzView alloc]init];
    while (listen) {
        res  =  hid_read (handle, buffer, 6);
        
        if  ( res  <  0 )
            [buzzview.mainTextArea setString:@"ERROR: BUZZER UNIT DISCONNECT"];
        [self performSelectorInBackground:@selector(createBuzzerConnection) withObject:nil];
        
        if(buffer[2] == 1) {
            [self lightTheBuzz:1 event:YES];
        } else if(buffer[2]  ==  32) {
            [self lightTheBuzz:2 event:YES];
        } else if (buffer[3] == 4) {
            [self lightTheBuzz:3 event:YES];
        } else if (buffer[3] == 128) {
            [self lightTheBuzz:4 event:YES];
        }
    }
}


- (void)lightTheBuzz:(int)buzzerToLight event:(bool)isAEvent{
    MainBuzzView *buzzview = [[MainBuzzView alloc]init];
    [self resetTheBuzzer];
    
    if (isAEvent) {
        switch (buzzerToLight) {
            case 1:
                buffer[2] = 0xff;
                [buzzview.mainTextArea setString:@"Buzzer 1 has BUZZED!"];
                break;
            case 2:
                buffer[3] = 0xff;
                [buzzview.mainTextArea setString:@"Buzzer 2 has BUZZED!"];
                break;
            case 3:
                buffer[4] = 0xff;
                [buzzview.mainTextArea setString:@"Buzzer 3 has BUZZED!"];
                break;
            case 4:
                buffer[5] = 0xff;
                [buzzview.mainTextArea setString:@"Buzzer 4 has BUZZED!"];
                break;
        }
        
        res = hid_write (handle, buffer, 8);
    }
}


- (void)resetTheBuzzer {
    buffer[0] = buffer[1] = buffer[2] = buffer[3] = buffer[4] = buffer[5] = buffer[6] = buffer[7] = 0;
    res = hid_write(handle, buffer, 8);
    
    while (!listen) {
        res = hid_write(handle, buffer, 8);
    }
}



@end
