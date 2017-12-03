//
//  ViewController.m
//  RSkin
//
//  Created by rui on 2017/12/3.
//  Copyright © 2017年 rui. All rights reserved.
//

#import "ViewController.h"
#import "SkinManager.h"
#import "RSkin.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.r_background = @"mainColor2";
}

- (IBAction)changeSkin:(id)sender {
    if ([SkinManager skinManager].isNight) {
        [SkinManager.skinManager day];
    }else {
        [SkinManager.skinManager night];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
