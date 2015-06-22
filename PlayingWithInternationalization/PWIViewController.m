//
//  PWIViewController.m
//  PlayingWithInternationalization
//
//  Created by Michael Vilabrera on 6/20/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "PWIViewController.h"

NSString *const kBigLabelHorizontal = @"H:|-[_bigLabel]-|";
NSString *const kBigLabelVertical = @"V:|-[_bigLabel]-|";

@interface PWIViewController ()

@property (nonatomic) UILabel *bigLabel;

@end

@implementation PWIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self constructSubviews];
    [self positionUI];
    [self.view addConstraints:[self constraints]];
}

- (void)constructSubviews {
    self.bigLabel = [[UILabel alloc] init];
    self.bigLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.bigLabel setText:@"Big Label"];   // the old way
    self.bigLabel.text = NSLocalizedString(@"Big Label", @"Grande la etiqueta");    // the new way
//    self.bigLabel.text = [NSString localizedStringWithFormat:NSLocalizedString(@"Big Label", @"Grande la etiqueta")];   // longer way
    [self.view addSubview:self.bigLabel];
}

- (NSArray *)positionUI {
    NSMutableArray *result = [NSMutableArray array];
    
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_bigLabel);
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kBigLabelHorizontal options:0 metrics:nil views:viewsDictionary]];
    [result addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:kBigLabelVertical options:0 metrics:nil views:viewsDictionary]];
    
    return [NSArray arrayWithArray:result];
}

- (NSArray *)constraints{
    NSMutableArray *result = [NSMutableArray array];
    [result addObjectsFromArray:[self positionUI]];
    
    return [NSArray arrayWithArray:result];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
