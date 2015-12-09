//
//  UIColor+Additions.m
//  Stipend
//
//  Created by Naveen Katari on 09/12/15.
//  Copyright (c) 2015 Sourcebits. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)

+(UIColor *) CHActiveBlueColor
{
    return [UIColor colorWithRed:77.0f/255.0f green:208.0f/255.0f blue:225.0f/255.0f alpha:1];
}
+(UIColor *) CHInactiveBlueColor
{
    return [UIColor colorWithRed:165.0f/255.0f green:225.0f/255.0f blue:233.0f/255.0f alpha:1];
}
+(UIColor *) CHSgiGrayColor
{
    return [UIColor colorWithRed:192.0f/255.0f green:192.0f/255.0f blue:192.0f/255.0f alpha:1];
}
+(UIColor *) CHActiveBlueHalfOpaqueColor
{
    return [UIColor colorWithRed:77.0f/255.0f green:208.0f/255.0f blue:225.0f/255.0f alpha:0.5f];
}
@end
