#import <Cedar/Cedar.h>
#import "ViewController.h"
#import "MathHelper.h"

using namespace Cedar::Matchers;
using namespace Cedar::Doubles;

@interface ViewController (Test)
@property (weak, nonatomic) IBOutlet UISwitch *makeMathHappenSwitch;
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UISwitch *meaningOfLifeSwitch;
@property (strong, nonatomic) NSMutableArray *mathArray;
@property (strong, nonatomic) MathHelper *mathHelper;

- (IBAction)meaningOfLifeDidChangeValue:(UISwitch *)sender;
- (IBAction)makeMathHappenDidChangeValue:(UISwitch *)sender;
@end
SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController", ^{
    __block ViewController *subject;
    
    beforeEach(^{
        UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        subject = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        window.rootViewController = subject;
        [window makeKeyAndVisible];
        [subject view];
    });
    
    context(@"When make math happen switch is flipped", ^{
        context(@"When meaning of life switch is off", ^{
            beforeEach(^{
                UISwitch *fakeSwitch = nice_fake_for([UISwitch class]);
                subject.mathArray = @[@9,@3].mutableCopy;
                fakeSwitch stub_method(@selector(isOn)).and_return(true);
                [subject makeMathHappenDidChangeValue:fakeSwitch];
            });

            it(@"should should set result text to 12", ^{
                subject.resultLabel.text should equal(@"12");
            });
        });
        
        context(@"When meaning of life switch is on", ^{
            beforeEach(^{
                spy_on(subject.mathHelper);
                UISwitch *fakeSwitch = nice_fake_for([UISwitch class]);
                subject.mathArray = @[@9,@3].mutableCopy;
                fakeSwitch stub_method(@selector(isOn)).and_return(true);
                [subject.meaningOfLifeSwitch setOn:true];
                [subject makeMathHappenDidChangeValue:fakeSwitch];
            });
            
            it(@"should should set result text to 42", ^{
                subject.resultLabel.text should equal(@"42");
            });
            
            it(@"should not call the do no math method", ^{
                subject.mathHelper should_not have_received(@selector(doNoMath));
            });
        });
    });
    
    context(@"When math switch is off", ^{
        beforeEach(^{
            spy_on(subject.mathHelper);
            UISwitch *fakeSwitch = nice_fake_for([UISwitch class]);
            subject.mathArray = @[@9,@3].mutableCopy;
            fakeSwitch stub_method(@selector(isOn)).and_return(false);
            [subject makeMathHappenDidChangeValue:fakeSwitch];
        });
        it(@"should not do math", ^{
            subject.resultLabel.text should equal(@"No Math");
        });
        
        it(@"should call the do no math method on the math helper", ^{
            subject.mathHelper should have_received(@selector(doNoMath));
        });
    });

});

SPEC_END
