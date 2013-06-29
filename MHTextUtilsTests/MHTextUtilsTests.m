//
//  MHTextUtilsTests.m
//  MHTextUtilsTests
//
//  Created by Matt Hawkins on 6/29/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "MHTextUtilsTests.h"
#import "NSString+MHTextUtils.h"

@interface MHTextUtilsTests(Private)
@end

@implementation MHTextUtilsTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testTruncatingLongStringThatEndsWithNonWhitespaceCharacterAndWantsAnEllipsis
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringByTruncatingToFitLength:10 withEllipsis:YES];
    
    // Verify strings are equal
    STAssertTrue([result isEqualToString:@"lorem i..."], @"Truncated strings are not equal.");
}

-(void)testTruncatingLongStringThatEndsWithWhitespaceCharacterAndWantsAnEllipsis
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringByTruncatingToFitLength:9 withEllipsis:YES];
    
    STAssertTrue([result isEqualToString:@"lorem "], @"Truncated strings are not equal.");
}

- (void)testTruncatingLongStringThatEndsWithNonWhitespaceCharacterAndDoesNotWantAnEllipsis
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringByTruncatingToFitLength:10 withEllipsis:NO];
    
    STAssertTrue([result isEqualToString:@"lorem ipsu"], @"Truncated strings are not equal.");
}

-(void)testTruncatingLongStringThatEndsWithWhitespaceCharacterAndDoesNotWantAnEllipsis
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringByTruncatingToFitLength:9 withEllipsis:NO];
    
    STAssertTrue([result isEqualToString:@"lorem ips"], @"Truncated strings are not equal.");
}

- (void)testTruncatingLongStringThatEndsWithNonWhitespaceCharacter
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringByTruncatingToFitLength:10];
    
    // Verify strings are equal
    STAssertTrue([result isEqualToString:@"lorem i..."], @"Truncated strings are not equal.");
}

-(void)testTruncatingLongStringThatEndsWithWhitespaceCharacter
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringByTruncatingToFitLength:9];
    
    STAssertTrue([result isEqualToString:@"lorem "], @"Truncated strings are not equal.");
}

- (void)testTruncatingShortStringThatEndsWithNonWhitespaceCharacterAndWantsAnEllipsis
{
    NSString *sampleString = @"lorem";
    NSString *result = [sampleString stringByTruncatingToFitLength:5 withEllipsis:YES];
    
    // Verify strings are equal
    STAssertTrue([result isEqualToString:@"lorem"], @"Truncated strings are not equal.");
}

- (void)testTruncatingShortStringThatEndsWithNonWhitespaceCharacter
{
    NSString *sampleString = @"lorem";
    NSString *result = [sampleString stringByTruncatingToFitLength:5];
    
    // Verify strings are equal
    STAssertTrue([result isEqualToString:@"lorem"], @"Truncated strings are not equal.");
}


@end
