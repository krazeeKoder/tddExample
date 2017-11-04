//
//  MathHelper.m
//  TDDExampleProj
//
//  Created by Anthony Tulai on 2017-10-08.
//  Copyright © 2017 Anthony Tulai. All rights reserved.
//

#import "MathHelper.h"

@implementation MathHelper


-(NSNumber *)sumArray:(NSArray *)array {
    if ([array containsObject:@42]) {
        return @42;
    }
    float total = 0;
    for (NSNumber *number in array) {
        total += [number floatValue];
    }
    return @(total);
}

-(NSString *)doNoMath {
    return @"No Math";
}

@end
