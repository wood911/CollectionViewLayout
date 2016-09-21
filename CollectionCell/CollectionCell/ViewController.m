//
//  ViewController.m
//  CollectionCell
//
//  Created by wtf on 16/9/20.
//  Copyright © 2016年 xiaowu. All rights reserved.
//

#import "ViewController.h"
#import "TagViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *strings;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"asjd;lfkj als;djfo asdjfa;lkdfjakls djf lk asd jfalksd jflaksjdf;laksjdfl;as kdjf;lasdjf;lak sjdfaksjdfo iwue r0qewfn aldksfoia urtquertdfj";
    self.strings = [str componentsSeparatedByString:@" "];
    
    TagViewController *tagVc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"tagPage"];
    tagVc.tags = self.strings;
    
    [self.view addSubview:tagVc.view];
    
}

@end
