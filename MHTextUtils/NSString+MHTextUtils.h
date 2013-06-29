//
//  NSString+MHTextUtils.h
//  MHTextUtils
//
//  Created by Matt Hawkins on 6/29/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MHTextUtils)

-(NSString *)stringTruncatedToLength:(int)length withEllipsis:(BOOL)useEllipsis;
-(NSString *)stringTruncatedToLength:(int)length;

@end
