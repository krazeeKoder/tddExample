#import <Cedar/Cedar.h>
#import "MathHelper.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

SPEC_BEGIN(CalculatorSpec)

describe(@"MathHelper", ^{
    __block MathHelper *subject;

    beforeEach(^{
        subject = [[MathHelper alloc] init];
    });
    
    it(@"should return the sum of all the integers in the array", ^{
        NSArray *testArray = @[@2.5, @5.5, @9, @-7];
        NSNumber *result = [subject sumArray: testArray];
        result should equal(@10);
    });
    
    it(@"should return 0 if the array is empty", ^{
        NSArray *testArray = @[];
        NSNumber *result = [subject sumArray:testArray];
        result should equal(@0);
    });
    
    it(@"should return a 42 if the array contains a 42 regardless of the sum", ^{
        NSArray *testArray = @[@2.5, @5.5, @9, @-7, @42];
        NSNumber *result = [subject sumArray:testArray];
        result should equal(@42);
    });
    

});

SPEC_END
