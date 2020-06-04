//
//  LogMonitorHomeViewController.m
//  CJNetworkDemo
//
//  Created by ciyouzen on 2017/4/5.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "LogMonitorHomeViewController.h"

//Log
#import "LogUtilViewController.h"
#import "LogViewViewController.h"
#import "LogWindowViewController.h"
#import "LogSuspendWindowViewController.h"


@interface LogMonitorHomeViewController ()

@end

@implementation LogMonitorHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = NSLocalizedString(@"LogMonitor首页", nil);
    
    NSMutableArray *sectionDataModels = [[NSMutableArray alloc] init];
    //Log
    {
        CJSectionDataModel *sectionDataModel = [[CJSectionDataModel alloc] init];
        sectionDataModel.theme = @"日志(Log)相关";
        {
            CJModuleModel *toastUtilModule = [[CJModuleModel alloc] init];
            toastUtilModule.title = @"LogUtil(输入、输出)";
            toastUtilModule.classEntry = [LogUtilViewController class];
            [sectionDataModel.values addObject:toastUtilModule];
        }
        {
            CJModuleModel *toastUtilModule = [[CJModuleModel alloc] init];
            toastUtilModule.title = @"LogView(Log视图)";
            toastUtilModule.classEntry = [LogViewViewController class];
            [sectionDataModel.values addObject:toastUtilModule];
        }
        {
            CJModuleModel *toastUtilModule = [[CJModuleModel alloc] init];
            toastUtilModule.title = @"LogWindow(Log窗口)";
            toastUtilModule.classEntry = [LogWindowViewController class];
            [sectionDataModel.values addObject:toastUtilModule];
        }
        {
            CJModuleModel *toastUtilModule = [[CJModuleModel alloc] init];
            toastUtilModule.title = @"LogSuspendWindow(Log悬浮球)";
            toastUtilModule.classEntry = [LogSuspendWindowViewController class];
            [sectionDataModel.values addObject:toastUtilModule];
        }
        [sectionDataModels addObject:sectionDataModel];
    }
    
    
    self.sectionDataModels = sectionDataModels;
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
