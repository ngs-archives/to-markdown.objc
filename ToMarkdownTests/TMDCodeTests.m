//
//  TMDCodeTests.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMDCode.h"

@interface TMDCodeTests : XCTestCase

@property (nonatomic, strong) TMDCode *code;

@end

@implementation TMDCodeTests

- (void)setUp {
  [super setUp];
  [self setCode:[[TMDCode alloc] init]];
}

- (void)tearDown {
  [super tearDown];
  [self setCode:nil];
}


- (void)testRegex {
  NSRegularExpression *re = [self.code regexAtIndex:0];
  XCTAssertNotNil(re);
  XCTAssertEqualObjects([re pattern], @"<code\\b([^>]*)>([\\s\\S]*?)<\\/code>");
}

- (void)testReplaceText {
  NSString *text = nil;
  text = [self.code replaceText:@"<code>foo</code><code>bar</code><code>baz</code>"];
  XCTAssertEqualObjects(text, @"`foo``bar``baz`");
}

@end
