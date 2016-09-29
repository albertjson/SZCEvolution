//
//  ZCTYKTestViewController.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCTYKTestViewController.h"
#import "ZCMeGetInfoManger.h"

@interface ZCTYKTestViewController ()

@end

@implementation ZCTYKTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma -mark Action

- (IBAction)buttonAction:(UIButton*)sender
{
    switch (sender.tag) {
        case 1:
        {
            ZCMeGetInfoManger * manger = [ZCMeGetInfoManger new];
            [manger startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSLog(@"heheda = %@",request.responseJSONObject);
            } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSLog(@"fail = %@",request);
            }];
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
            
        default:
            break;
    }
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
