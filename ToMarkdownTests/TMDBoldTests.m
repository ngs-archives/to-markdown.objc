//
//  TMDBoldTests.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMDBold.h"

@interface TMDBoldTests : XCTestCase

@property (nonatomic, strong) TMDBold *b;

@end

@implementation TMDBoldTests

- (void)setUp {
  [super setUp];
  [self setB:[[TMDBold alloc] init]];
}

- (void)tearDown {
  [super tearDown];
  [self setB:nil];
}


- (void)testRegex {
  NSRegularExpression *re = nil;
  re = [self.b regexAtIndex:0];
  XCTAssertEqualObjects([re pattern], @"<b\\b([^>]*)>([\\s\\S]*?)<\\/b>");
  re = [self.b regexAtIndex:1];
  XCTAssertEqualObjects([re pattern], @"<strong\\b([^>]*)>([\\s\\S]*?)<\\/strong>");
}

- (void)testReplaceText {
  NSString *text = nil;
  text = [self.b replaceText:@"foo <b class=\"foo\">Bar</b> baz"];
  XCTAssertEqualObjects(text, @"foo **Bar** baz");
  text = [self.b replaceText:@"<strong class=\"foo\">Bar</strong>"];
  XCTAssertEqualObjects(text, @"**Bar**");
  text = [self.b replaceText:@"<a class=\"foo\">Bar</a>"];
  XCTAssertEqualObjects(text, @"<a class=\"foo\">Bar</a>");
  text = [self.b replaceText:@"<b>Bar</b>"];
  XCTAssertEqualObjects(text, @"**Bar**");
  text = [self.b replaceText:@"<strong>Bar</strong>"];
  XCTAssertEqualObjects(text, @"**Bar**");
  text = [self.b replaceText:@"<a>Bar</a>"];
  XCTAssertEqualObjects(text, @"<a>Bar</a>");
}


@end
