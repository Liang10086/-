//
//  ViewController.m
//  partLableClick
//
//  Created by 王明亮 on 2018/6/15.
//  Copyright © 2018年 王明亮. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = @"实现了文字里边标签的点击事件";
   
    
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 200)];
    textView.backgroundColor = [UIColor clearColor];
    textView.delegate = self;
    textView.editable = NO;
    textView.scrollEnabled = NO;
    [self.view addSubview:textView];
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:str];
    [attr addAttribute:NSLinkAttributeName value:@"click://" range:[[attr string] rangeOfString:@"标签"]];
    textView.attributedText = attr;
    textView.linkTextAttributes = @{ NSForegroundColorAttributeName: [UIColor blueColor],
                                             NSUnderlineColorAttributeName: [UIColor clearColor],
                                             NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle)};
    

}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    if ([[URL scheme] isEqualToString:@"click"]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"事件" message:@"响应了点击事件" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了取消");
        }];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
    }
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
