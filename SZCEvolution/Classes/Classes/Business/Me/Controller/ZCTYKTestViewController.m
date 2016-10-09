//
//  ZCTYKTestViewController.m
//  SZCEvolution
//
//  Created by choice-ios1 on 16/9/29.
//  Copyright © 2016年 albertjson. All rights reserved.
//

#import "ZCTYKTestViewController.h"
#import "ZCMeGetInfoManger.h"
#import <WMHUDUntil.h>
#import "ZCGetInfoModel.h"

@interface ZCTYKTestViewController ()
{
    ZCMeGetInfoManger * manger;
}
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
            manger = [ZCMeGetInfoManger new];
            manger.animatingView = self.view;
            //manger.animatingText = @"加载中";
            [manger startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSLog(@"heheda = %@",BASERequest.responseJSONObject);
                NSLog(@"jjjjj=%@",manger.result);
                                
            } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                
                NSLog(@"fail = %@",BASERequest.error);
                //[WMHUDUntil showFailWithMessage:@"难道就失败了吗" toView:self.view];

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
- (void)dealloc
{
    NSLog(@"ZCTYKTestViewController dealloc");
    [manger stop];
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
