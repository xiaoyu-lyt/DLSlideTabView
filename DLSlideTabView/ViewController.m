//
//  ViewController.m
//  DLSlideTabView
//
//  Created by 萧宇 on 8/11/16.
//  Copyright © 2016 萧宇. All rights reserved.
//

#import "ViewController.h"
#import "DLSlideTabView.h"

@interface ViewController ()<DLSlideTabViewDelegate, DLSlideTabViewDatasource>

@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // Tab总长度小于控件宽度时每个Tab宽度的1/x（x为总Tab数）
    self.titles = @[@"Tab1", @"Tab2"];
    // Tab总长度大于控件宽度时每个Tab宽度根据Tab标题确定
//    self.titles = @[@"Tab1", @"Tab2", @"LongTab3", @"LongLongTab4", @"LongLongLongTab5"];
    
    DLSlideTabView *slideTabView = [[DLSlideTabView alloc] initWithFrame:self.view.frame];
    slideTabView.delegate = self;
    slideTabView.datasource = self;
    [self.view addSubview:slideTabView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - DLSlideTabViewDelegate

#pragma mark - DLSlideTabViewDatasource

- (NSInteger)numberOfTabsInSlideTabView:(DLSlideTabView *)slideTabView {
    return self.titles.count;
}

- (NSArray<NSString *> *)titleOfTabsInSlideTabView:(DLSlideTabView *)slideTabView {
    return self.titles;
}

- (UIView *)slideTabView:(DLSlideTabView *)slideTabView viewForTabAtIndexPath:(NSIndexPath *)indexPath {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, slideTabView.frame.size.height - 44.0)];
    switch (indexPath.row % 2) {
        case 0:
            view.backgroundColor = [UIColor colorWithWhite:0.75 alpha:1.0];
            break;
        case 1:
            view.backgroundColor = [UIColor colorWithWhite:0.25 alpha:1.0];
            break;
        default:
            break;
    }
    return view;
}

@end
