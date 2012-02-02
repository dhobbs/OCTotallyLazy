#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>
#import "Some.h"
#import "None.h"
#import "NoSuchElementException.h"
#import "Callables.h"

@interface OptionTest : SenTestCase
@end

@implementation OptionTest

-(void)testEquality {
    assertThat([Some some:@"bob"], equalTo([Some some:@"bob"]));
    assertThat([None none], equalTo([None none]));
    assertThat([Some some:@"bob"], isNot(equalTo([None none])));
}

-(void)testCannotGetValueOfNone {
    @try {
        [[None none] get];
        STFail(@"Should throw.");
    }
    @catch (NoSuchElementException *e) {
        //good
    }
}

-(void)testCanGetValueOfSome {
    assertThat([[Some some:@"fred"] get], equalTo(@"fred"));
}

-(void)testCanMap {
    assertThat([[Option option:@"bob"] map:[Callables toUpperCase]], equalTo([Some some:@"BOB"]));
    assertThat([[Option option:nil] map:[Callables toUpperCase]], equalTo([None none]));
}

-(void)testCanFold {
    assertThat([[Option option:@"bob"] fold:@"fred" with:[Callables appendString]], equalTo([Some some:@"fredbob"]));
    assertThat([[None none] fold:@"fred" with:[Callables appendString]], equalTo([Some some:@"fred"]));
}
@end