//
//  TMDLineBreakTests.m
//  ToMarkdown
//
//  Created by Atsushi Nagase on 11/2/13.
//  Copyright (c) 2013 LittleApps Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TMDLineBreak.h"

@interface TMDLineBreakTests : XCTestCase

@property (nonatomic, strong) TMDLineBreak *br;

@end

@implementation TMDLineBreakTests

- (void)setUp {
  [super setUp];
  [self setBr:[[TMDLineBreak alloc] init]];
}

- (void)tearDown {
  [super tearDown];
  [self setBr:nil];
}


- (void)testRegex {
  NSRegularExpression *re = [self.br regexAtIndex:0];
  XCTAssertNotNil(re);
  XCTAssertEqualObjects([re pattern], @"<br\\b([^>]*)\\/?>");
}

- (void)testReplaceText {
  NSString *text = nil;
  text = [self.br replaceText:@"foo<br />bar<br clear='both'>baz"];
  XCTAssertEqualObjects(text, @"foo  \nbar  \nbaz");
}

@end
