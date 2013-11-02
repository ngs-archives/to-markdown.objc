//
//  TMDAnchorTests.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMDAnchor.h"

@interface TMDAnchorTests : XCTestCase

@property (nonatomic, strong) TMDAnchor *a;

@end

@implementation TMDAnchorTests

- (void)setUp {
  [super setUp];
  [self setA:[[TMDAnchor alloc] init]];
}

- (void)tearDown {
  [super tearDown];
  [self setA:nil];
}

- (void)testRegex {
  NSRegularExpression *re = [self.a regexAtIndex:0];
  XCTAssertNotNil(re);
  XCTAssertEqualObjects([re pattern], @"<a\\b([^>]*)>([\\s\\S]*?)<\\/a>");
}

- (void)testReplaceText {
  NSString *text = nil;
  text = [self.a replaceText:@"foo <a href=\"http://www.foo.com\">Bar</a> baz"];
  XCTAssertEqualObjects(text, @"foo [Bar](http://www.foo.com) baz");
  text = [self.a replaceText:@"<a href=\"http://www.foo.com\" title=\"Qux\">Bar</a>"];
  XCTAssertEqualObjects(text, @"[Bar](http://www.foo.com \"Qux\")");
  text = [self.a replaceText:@"<a title=\"Qux\">Bar</a>"];
  XCTAssertEqualObjects(text, @"<a title=\"Qux\">Bar</a>");
}

@end
