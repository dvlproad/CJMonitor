//
//  LogViewViewController.m
//  CJUIKitDemo
//
//  Created by ciyouzen on 2018/5/25.
//  Copyright © 2018年 dvlproad. All rights reserved.
//

#import "LogViewViewController.h"
#import <CQDemoKit/CQTSContainerViewFactory.h>
#import <CQDemoKit/CQTSSwitchViewFactory.h>
#import <CJMonitor/CJLogView.h>

@interface LogViewViewController () {
    
}
@property (nonatomic, strong) UIWindow *suspendWindow;
@property (nonatomic, strong) CJLogView *logView;

@end



@implementation LogViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    // buttonsView
    UIView *buttonsView = [CQTSContainerViewFactory threeButtonsViewAlongAxis:MASAxisTypeVertical title1:@"appendLog" actionBlock1:^(UIButton * _Nonnull bButton) {
         [self.logView appendObject:@"this is a test log"];
        
    } title2:@"removeLogFile" actionBlock2:^(UIButton * _Nonnull bButton) {
        [self.logView clear];
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
        self.suspendWindow.userInteractionEnabled = bSwitch.on; //如果为NO，则屏幕触摸事件会传递到下层的实际 view 上去，即不会挡住测试的操作
    }];
    [self.view addSubview:switchView];
    [switchView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(buttonsView.mas_bottom).mas_offset(40);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    
    //suspendWindow
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat height = CGRectGetHeight([UIScreen mainScreen].bounds);
    CGRect suspendWindowFrame = CGRectMake(0, height-200, width, 200);
    UIWindow *suspendWindow = [[UIWindow alloc] initWithFrame:suspendWindowFrame];
    suspendWindow.rootViewController = [UIViewController new]; // suppress warning
    suspendWindow.windowLevel = UIWindowLevelAlert; //是窗口保持在最前
    [suspendWindow setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.3]];
    suspendWindow.userInteractionEnabled = NO; //设为NO，使屏幕触摸事件会传递到下层的实际 view 上去，不会挡住测试的操作
    suspendWindow.hidden = NO; //显示窗口
    self.suspendWindow = suspendWindow;
    
    //logView
    CJLogView *logView = [[CJLogView alloc] initWithFrame:CGRectZero];
    logView.backgroundColor = [UIColor redColor];
    [suspendWindow addSubview:logView];
    [logView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(suspendWindow);
        make.top.mas_equalTo(suspendWindow);
        make.bottom.mas_equalTo(suspendWindow).mas_offset(-[self __screenBottomHeight]);
    }];
    
    self.logView = logView;
}

#pragma mark - Private Method
/// 获取在各个设备上的屏幕底部不可用的高度
- (CGFloat)__screenBottomHeight {
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    BOOL isScreenFull = screenHeight >= 812 && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone;  // 是否是全面屏
    CGFloat screenBottomHeight = isScreenFull ?  34.0 : 0.0;    // 屏幕底部
    return screenBottomHeight;
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
