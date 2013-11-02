//
//  TMDHorizontalRuleTests.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMDHorizontalRule.h"

@interface TMDHorizontalRuleTests : XCTestCase

@property (nonatomic, strong) TMDHorizontalRule *h;

@end

@implementation TMDHorizontalRuleTests

- (void)setUp {
  [super setUp];
  [self setH:[[TMDHorizontalRule alloc] init]];
}

- (void)tearDown {
  [super tearDown];
  [self setH:nil];
}


- (void)testRegex {
  NSRegularExpression *re = [self.h regexAtIndex:0];
  XCTAssertNotNil(re);
  XCTAssertEqualObjects([re pattern], @"<hr\\b([^>]*)\\/?>");
}

- (void)testReplaceText {
  NSString *text = nil;
  text = [self.h replaceText:@"foo<hr>bar<hr class=\"buz\" />qux"];
  XCTAssertEqualObjects(text, @"foo\n\n* * *\nbar\n\n* * *\nqux");
}

@end
