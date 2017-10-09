//
//  ViewController.m
//  TDDExampleProj
//
//  Created by Anthony Tulai on 2017-09-04.
//  Copyright © 2017 Anthony Tulai. All rights reserved.
//

#import "ViewController.h"
#import "MathHelper.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *makeMathHappenSwitch;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UISwitch *meaningOfLifeSwitch;
@property (strong, nonatomic) MathHelper *mathHelper;
@property (strong, nonatomic) NSMutableArray *mathArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mathArray = @[@7,@5,@3].mutableCopy;
    self.mathHelper = [[MathHelper alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)meaningOfLifeDidChangeValue:(UISwitch *)sender {
    if (!self.makeMathHappenSwitch.on) {
        return;
    }
    if (sender.on == true) {
        [self.mathArray addObject:@42];
        self.resultLabel.text = [NSString stringWithFormat: @"%@", [self.mathHelper sumArray:self.mathArray.copy]];
    } else {
        [self.mathArray removeObject:@42];
        self.resultLabel.text = [NSString stringWithFormat: @"%@", [self.mathHelper sumArray:self.mathArray.copy]];
    }
}

- (IBAction)makeMathHappenDidChangeValue:(UISwitch *)sender {
    
    if (sender.on == true) {
        if (self.meaningOfLifeSwitch.isOn) {
            self.resultLabel.text = @"42";
            return;
        }
        self.resultLabel.text = [NSString stringWithFormat: @"%@", [self.mathHelper sumArray:self.mathArray.copy]];
    } else {
        self.resultLabel.text = @"No Math";
    }
}

@end
