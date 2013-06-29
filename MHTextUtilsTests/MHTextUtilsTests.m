//
//  MHTextUtilsTests.m
//  MHTextUtilsTests
//
//  Created by Matt Hawkins on 6/29/13.
//  Copyright (c) 2013 Matt Hawkins. All rights reserved.
//

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
    NSString *result = [sampleString stringTruncatedToLength:10 withEllipsis:YES];
    
    // Verify strings are equal
    STAssertTrue([result isEqualToString:@"lorem i..."], @"Truncated strings are not equal.");
}

-(void)testTruncatingLongStringThatEndsWithWhitespaceCharacterAndWantsAnEllipsis
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringTruncatedToLength:9 withEllipsis:YES];
    
    STAssertTrue([result isEqualToString:@"lorem "], @"Truncated strings are not equal.");
}

- (void)testTruncatingLongStringThatEndsWithNonWhitespaceCharacterAndDoesNotWantAnEllipsis
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringTruncatedToLength:10 withEllipsis:NO];
    
    STAssertTrue([result isEqualToString:@"lorem ipsu"], @"Truncated strings are not equal.");
}

-(void)testTruncatingLongStringThatEndsWithWhitespaceCharacterAndDoesNotWantAnEllipsis
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringTruncatedToLength:9 withEllipsis:NO];
    
    STAssertTrue([result isEqualToString:@"lorem ips"], @"Truncated strings are not equal.");
}

- (void)testTruncatingLongStringThatEndsWithNonWhitespaceCharacter
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringTruncatedToLength:10];
    
    // Verify strings are equal
    STAssertTrue([result isEqualToString:@"lorem i..."], @"Truncated strings are not equal.");
}

-(void)testTruncatingLongStringThatEndsWithWhitespaceCharacter
{
    NSString *sampleString = @"lorem ipsum dolar";
    NSString *result = [sampleString stringTruncatedToLength:9];
    
    STAssertTrue([result isEqualToString:@"lorem "], @"Truncated strings are not equal.");
}

@end
