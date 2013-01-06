//
//  MainBuzzView.h
//  quizbuzz
//
//  Created by Ben Vest on 1/6/13.
//  Copyright (c) 2013 polarcuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainBuzzView : NSObject{
        __unsafe_unretained NSTextView *mainTextArea;
}

@property (assign) IBOutlet NSWindow *window;
@property (unsafe_unretained) IBOutlet NSTextView *mainTextArea;


@end
