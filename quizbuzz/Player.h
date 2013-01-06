//
//  Player.h
//  quizbuzz
//
//  Created by Ben Vest on 12/19/12.
//  Copyright (c) 2012 polarcuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property NSString *userName;
@property NSString *buzzerAssignment;
@property int score;
@property NSMutableArray *infoArray;


@end
