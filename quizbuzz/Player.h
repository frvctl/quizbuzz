//
//  Player.h
//  quizbuzz
//
//  Created by Ben Vest on 12/19/12.
//  Copyright (c) 2012 polarcuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject {
    NSString *userName;
    NSString *buzzerAssignment;
    
    int score;
    
    NSMutableArray *infoArray;
}

@end
