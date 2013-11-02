//
//  TMDHeadingTests.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMDHeading.h"

@interface TMDHeadingTests : XCTestCase

@property (nonatomic, strong) TMDHeading *h;

@end

@implementation TMDHeadingTests

- (void)setUp {
  [super setUp];
  [self setH:[[TMDHeading alloc] init]];
}

- (void)tearDown {
  [super tearDown];
  [self setH:nil];
}


- (void)testRegex {
  NSRegularExpression *re = [self.h regexAtIndex:0];
  XCTAssertNotNil(re);
  XCTAssertEqualObjects([re pattern], @"<h([1-6])\\b([^>]*)>([\\s\\S]*?)<\\/h([1-6])>");
}

- (void)testReplaceText {
  NSString *text = nil;
  text = [self.h replaceText:@"<h1>Bar</h1>"];
  XCTAssertEqualObjects(text, @"# Bar");
  text = [self.h replaceText:@"<h2>Bar</h2>"];
  XCTAssertEqualObjects(text, @"## Bar");
  text = [self.h replaceText:@"<h3>Bar</h3>"];
  XCTAssertEqualObjects(text, @"### Bar");
  text = [self.h replaceText:@"<h4>Bar</h4>"];
  XCTAssertEqualObjects(text, @"#### Bar");
  text = [self.h replaceText:@"<h5>Bar</h5>"];
  XCTAssertEqualObjects(text, @"##### Bar");
  text = [self.h replaceText:@"<h6>Bar</h6>"];
  XCTAssertEqualObjects(text, @"###### Bar");
}


@end
