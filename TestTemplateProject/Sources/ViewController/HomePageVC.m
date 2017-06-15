//
//  HomePageVC.m
//  TestTemplateProject
//
//  Created by Ben on 2017/5/22.
//  Copyright (c) 2017年 Ben. All rights reserved.
//

#import "HomePageVC.h"
#import "ResponderDescVC.h"
#import "FamiliarUsageVC.h"
#import "BeyondSuperViewVC.h"
#import "ScrollViewDemoVC.h"
#import "SuspendViewDemoVC.h"
#import "CircularSliderVC.h"
#import "GestureVC.h"
//#import "CheckPleaseVC.h"
#import "PlaygroundVC.h"

static const CGFloat kTableViewCellHeight = 60.0f;

@interface HomePageCellModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, copy) Block didSelectCellHandleBlock;

+ (instancetype)modelWithTitle:(NSString *)title
                      subTitle:(NSString *)subTitle
                       vcClass:(Class)vcClass
                  navigationVC:(UINavigationController *)navigationVC;

+ (instancetype)modelWithTitle:(NSString *)title
                      subTitle:(NSString *)subTitle
      didSelectCellHandleBlock:(Block)didSelectCellHandleBlock;

@end

@implementation HomePageCellModel

+ (instancetype)modelWithTitle:(NSString *)title
                      subTitle:(NSString *)subTitle
                       vcClass:(Class)vcClass
                  navigationVC:(UINavigationController *)navigationVC {
    
    return [HomePageCellModel modelWithTitle:title
                                    subTitle:subTitle
                    didSelectCellHandleBlock:^{
                        UIViewController *vc = [[vcClass alloc] init];
                        [navigationVC pushViewController:vc animated:YES];
                    }];
}


+ (instancetype)modelWithTitle:(NSString *)title
                      subTitle:(NSString *)subTitle
      didSelectCellHandleBlock:(Block)didSelectCellHandleBlock {
    HomePageCellModel *model = [HomePageCellModel new];
    model.title = title;
    model.subTitle = subTitle;
    model.didSelectCellHandleBlock = didSelectCellHandleBlock;
    
    return model;
}

@end

@interface HomePageVC () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray <HomePageCellModel *> *dataSourceArray;

@end

@implementation HomePageVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    HomePageCellModel *model1 = [HomePageCellModel modelWithTitle:@"UIResponder"
                                                         subTitle:@"看下其头文件"
                                                          vcClass:[ResponderDescVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model2 = [HomePageCellModel modelWithTitle:@"巧妙使用"
                                                         subTitle:@"开发中遇到的一些案例"
                                                          vcClass:[FamiliarUsageVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model3 = [HomePageCellModel modelWithTitle:@"子视图超出父视图"
                                                         subTitle:@"重写hitTest:withEvent:"
                                                          vcClass:[BeyondSuperViewVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model4 = [HomePageCellModel modelWithTitle:@"UIScrollView 案例"
                                                         subTitle:@"经常遇到的 UIScrollView 案例"
                                                          vcClass:[ScrollViewDemoVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model5 = [HomePageCellModel modelWithTitle:@"悬浮 Window"
                                                         subTitle:@"一个别人封装的悬浮 Window"
                                                          vcClass:[SuspendViewDemoVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model6 = [HomePageCellModel modelWithTitle:@"一个自定义UIControl"
                                                         subTitle:@"基于 Responder 自己实现一个滑动控件"
                                                          vcClass:[CircularSliderVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model7 = [HomePageCellModel modelWithTitle:@"UIGestureRecognizer"
                                                         subTitle:@"看下其头文件"
                                                          vcClass:[GestureVC class]
                                                     navigationVC:self.navigationController];
    
    HomePageCellModel *model8 = [HomePageCellModel modelWithTitle:@"自定义手势"
                                                         subTitle:@"一个打勾手势的识别"
                                                          vcClass:[GestureVC class]
                                                     navigationVC:self.navigationController];
    

    
    self.dataSourceArray = [NSArray arrayWithObjects:model1, model2, model3, model4, model5, model6, model7, model8, nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.title = @"事件响应链";
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellReuseIdentifier = @"HomePageCellReuseIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellReuseIdentifier];
    }
    
    cell.textLabel.textColor = [UIColor darkTextColor];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    cell.textLabel.text = [self.dataSourceArray objectAtIndex:indexPath.row].title;
    cell.detailTextLabel.text = [self.dataSourceArray objectAtIndex:indexPath.row].subTitle;
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    Block clickHandleBlock = [self.dataSourceArray objectAtIndex:indexPath.row].didSelectCellHandleBlock;
    if (clickHandleBlock) {
        clickHandleBlock();
    }
}


@end
