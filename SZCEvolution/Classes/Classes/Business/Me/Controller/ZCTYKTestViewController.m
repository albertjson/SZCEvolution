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

#import "YTKBatchRequest+AnimatingAccessory.h"
#import "YTKChainRequest+AnimatingAccessory.h"

@interface ZCTYKTestViewController ()<YTKBatchRequestDelegate>

@property (nonatomic,strong) ZCMeGetInfoManger * infoManger;

@property (nonatomic,weak) IBOutlet UITextView * textView;

@end

@implementation ZCTYKTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupData];
    
    // Do any additional setup after loading the view.
}
- (void)setupData
{
    self.infoManger = [[ZCMeGetInfoManger alloc] init];
    self.infoManger.animatingView = self.view;
}
#pragma -mark Action

- (IBAction)buttonAction:(UIButton*)sender
{
    [self clearTextView];
    
    __weak typeof(self) weakself = self;
    
    switch (sender.tag) {
        case 1:
        {
            ZCGetInfoParam * param = [[ZCGetInfoParam alloc] init];
            param.userId = @"0";
            param.token = @"222222";
            _infoManger.param = param;
            
            [_infoManger startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
                NSLog(@"jjjjj=%@",_infoManger.responseJSONObject);
                
                ZCGetInfoModel * infoModel = [[ZCGetInfoModel alloc] initWithDictionary:_infoManger.responseJSONObject error:nil];

                [self updateTextViewWithLog:[NSString stringWithFormat:@"读取数据:\n%@",infoModel]];
                
            } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
                
                [weakself updateTextViewWithLog:[NSString stringWithFormat:@"读取失败:\n%@",weakself.infoManger.error]];

            }];
        }
            break;
        case 2:
        {
            ZCGetInfoParam * param = [[ZCGetInfoParam alloc] init];
            param.userId = @"0";
            param.token = @"222222";
            _infoManger.param = param;
            
            //每次读缓存，同时从接口中获取最新数据📚
            if ([self.infoManger loadCacheWithError:nil]) {
                
                ZCGetInfoModel * infoModel = [[ZCGetInfoModel alloc] initWithDictionary:_infoManger.responseJSONObject error:nil];
                NSLog(@"fromCache = %@",infoModel);
                [self updateTextViewWithLog:[NSString stringWithFormat:@"从缓存中读取:\n%@",infoModel]];
            }

            [_infoManger startWithoutCache];
            [_infoManger setCompletionBlockWithSuccess:^(__kindof ZCMeGetInfoManger * _Nonnull request) {
                
                ZCGetInfoModel * infoModel = [[ZCGetInfoModel alloc] initWithDictionary:request.responseJSONObject error:nil];

                NSLog(@"successfromNetwork=%@",infoModel);
                [weakself updateTextViewWithLog:[NSString stringWithFormat:@"从接口中读取成功:\n%@",infoModel]];
            } failure:^(__kindof ZCMeGetInfoManger * _Nonnull request) {
                NSLog(@"failFromNetwork=%@",weakself.infoManger.error);
                [weakself updateTextViewWithLog:[NSString stringWithFormat:@"从接口中读取失败:\n%@",weakself.infoManger.error]];
            }];
        }
            break;
        case 3:
        {
            ZCGetInfoParam * param = [[ZCGetInfoParam alloc] init];

            
            ZCMeGetInfoManger *a = [[ZCMeGetInfoManger alloc] init];
            param.userId = @"1";
            param.token = @"222222";
            a.param = param;
            ZCMeGetInfoManger *b = [[ZCMeGetInfoManger alloc] init];
            param.userId = @"2";
            param.token = @"222222";
            b.param = param;
            ZCMeGetInfoManger *c = [[ZCMeGetInfoManger alloc] init];
            param.userId = @"3";
            param.token = @"222222";
            c.param = param;
            ZCMeGetInfoManger *d = [[ZCMeGetInfoManger alloc] init];
            param.userId = @"4";
            param.token = @"222222";
            d.param = param;
            
            YTKBatchRequest *batchRequest = [[YTKBatchRequest alloc] initWithRequestArray:@[a, b, c, d]];
            batchRequest.animatingText = @"loading...";
            batchRequest.animatingView = self.view;
            batchRequest.delegate = self;
            [batchRequest startWithCompletionBlockWithSuccess:^(YTKBatchRequest * _Nonnull batchRequest) {
                
                NSLog(@"succeed");
                NSArray *requests = batchRequest.requestArray;
                ZCMeGetInfoManger *a = (ZCMeGetInfoManger *)requests[0];
                ZCMeGetInfoManger *b = (ZCMeGetInfoManger *)requests[1];
                ZCMeGetInfoManger *c = (ZCMeGetInfoManger *)requests[2];
                ZCMeGetInfoManger *d = (ZCMeGetInfoManger *)requests[3];
                NSLog(@"1=%@\n2=%@\n3=%@\n4=%@",a,b,c,d);
                
                [self updateTextViewWithLog:[NSString stringWithFormat:@"batch读取:\n1=%@\n2=%@\n3=%@\n4=%@",a.responseObject,b.responseObject,c.responseObject,d.responseObject]];
                
            } failure:^(YTKBatchRequest * _Nonnull batchRequest) {
                NSLog(@"batch request fail!=%@",batchRequest.failedRequest);
            }];
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
- (void)updateTextViewWithLog:(NSString*)log
{
    self.textView.text = log;
}
- (void)clearTextView
{
    self.textView.text = nil;
}
- (void)dealloc
{
    NSLog(@"ZCTYKTestViewController dealloc");
    //[manger stop];
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
