//
//  LogUtilViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2018/5/25.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "LogUtilViewController.h"
#import <CQDemoKit/CQTSContainerViewFactory.h>
#import <CJMonitor/CJLogUtil.h>

@interface LogUtilViewController () {
    
}

@end



@implementation LogUtilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    testLabel.numberOfLines = 0;
    testLabel.textColor = [UIColor lightGrayColor];
    testLabel.textAlignment = NSTextAlignmentCenter;
    testLabel.font = [UIFont systemFontOfSize:17];
    [self.view addSubview:testLabel];
    [testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).mas_offset(20);
        make.right.mas_equalTo(self.view).mas_offset(-20);
        make.top.mas_equalTo(self.view).mas_offset(100);
        make.height.mas_equalTo(120);
    }];
    NSString *text = @"请进入控制台上打印的NSHomeDirectory()，查看NSDocumentDirectory文件夹下的CJLog文件夹";
    testLabel.text = text;
    
    NSString *homeDirectory = NSHomeDirectory();
    NSLog(@"homeDirectory = %@", homeDirectory);
    
    
    
    // buttonsView
    UIView *buttonsView = [CQTSContainerViewFactory threeButtonsViewAlongAxis:MASAxisTypeVertical title1:@"appendLog" actionBlock1:^(UIButton * _Nonnull bButton) {
         [CJLogUtil cj_appendObject:@"this is a test log" toLogFileName:@"testLog.txt"];
        
    } title2:@"removeLogFile" actionBlock2:^(UIButton * _Nonnull bButton) {
        [CJLogUtil cj_removeLogFileName:@"testLog.txt"];
    } title3:@"removeLogDirectory" actionBlock3:^(UIButton * _Nonnull bButton) {
        [CJLogUtil cj_removeLogDirectory];
    }];
    [self.view addSubview:buttonsView];
    [buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(testLabel.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(44*3+10*2);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
    }];
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
