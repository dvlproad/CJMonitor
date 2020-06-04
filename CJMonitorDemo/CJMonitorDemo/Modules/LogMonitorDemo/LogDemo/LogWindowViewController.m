//
//  LogWindowViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2018/5/25.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "LogWindowViewController.h"
#import <CQDemoKit/CQTSContainerViewFactory.h>
#import <CQDemoKit/CQTSSwitchViewFactory.h>
#import <CJMonitor/CJLogViewWindow.h>

@interface LogWindowViewController () {
    
}

@end



@implementation LogWindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // buttonsView
    UIView *buttonsView = [CQTSContainerViewFactory threeButtonsViewAlongAxis:MASAxisTypeVertical title1:@"appendLog" actionBlock1:^(UIButton * _Nonnull bButton) {
        [CJLogViewWindow appendObject:@"this is a test log"];
        
    } title2:@"removeLogFile" actionBlock2:^(UIButton * _Nonnull bButton) {
        [CJLogViewWindow clear];
    } title3:@"removeLogDirectory" actionBlock3:^(UIButton * _Nonnull bButton) {
        
    }];
    [self.view addSubview:buttonsView];
    [buttonsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).mas_offset(120);
        make.height.mas_equalTo(44*3+10*2);
        make.centerX.mas_equalTo(self.view);
        make.left.mas_equalTo(self.view).mas_offset(20);
    }];
    
    // switchView
    UIView *switchView = [CQTSSwitchViewFactory switchViewWithTitle:@"悬浮window是否可操作" switchOn:NO switchValueChangedBlock:^(UISwitch * _Nonnull bSwitch) {
//        CJLogViewWindow.userInteractionEnabled = bSwitch.on; //如果为NO，则屏幕触摸事件会传递到下层的实际 view 上去，即不会挡住测试的操作
    }];
    [self.view addSubview:switchView];
    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(buttonsView.mas_bottom).mas_offset(40);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
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
