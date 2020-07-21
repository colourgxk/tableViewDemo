//
//  ViewController.m
//  demo1
//
//  Created by 关晓珂 on 2020/7/21.
//  Copyright © 2020 TencentIOS. All rights reserved.
//

#import "ViewController.h"
 
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@end
 
NSArray *cityArray;
 
@implementation ViewController

 
- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    //创建一个数组，存储需要显示的数据
    cityArray = @[@"北京",@"上海",@"广州",@"深圳",@"重庆",@"杭州",@"西安",@"合肥",@"成都",@"天津",@"郑州",@"济南",@"石家庄",@"昆明",@"长沙",@"武汉"];
    //创建UITableView对象
    UITableView* tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    
    UILabel* headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44.0)];
    [headerLabel setText:@"城市列表开始"];
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    
    //设置UITableView的页眉控件
    [tableView setTableHeaderView:headerLabel];
    
    UILabel* footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 44.0)];
    [footerLabel setText:@"城市列表结束"];
    footerLabel.textColor = [UIColor blackColor];
    footerLabel.textAlignment = NSTextAlignmentCenter;
    
    //设置UITableView页脚控件
    [tableView setTableFooterView:footerLabel];
    
    //设置行cell高（默认44px）
    [tableView setRowHeight:50];
    //设置分割线颜色
    [tableView setSeparatorColor:[UIColor blackColor]];
    //设置分割线风格
    
    /*
     UITableViewCellSeparatorStyleNone 不使用分割线
     UITableViewCellSeparatorStyleSingleLine 使用分割线
     UITableViewCellSeparatorStyleSingleLineEtched 在有组的情况使用分割线
    */
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
    // 设置UITableView的背景颜色
    [tableView setBackgroundColor:[UIColor lightGrayColor]];
    
    // 设置数据源代理，必须实现协议UITableViewDataSource中的相关方法
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    
}
 
#pragma mark -UITableViewDataSource

 
// 返回表格分区数，默认返回1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
// 返回每个区标题名称
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"分区1开始";
}
 
//  返回每个区尾部名称
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"分区1结束";
}
 

// 提供tableView中分区的单元格数量
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [cityArray count];
}
 
// 为单元格定义一个静态字符串作为可重用标识符，在UITableView的cell缓存池当中所有的cell的标示符都是刚定义的cellID，因为重用时无所谓获取哪一个cell，只要是cell就可以
static NSString* cellID = @"cellID";
 
// 返回单元格,提供 tableView 中显示的数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 根据cellID从可重用单元格的队列中取出可重用的一个单元格UITableViewCell对象
    UITableViewCell* tableViewCell = [tableView dequeueReusableCellWithIdentifier:cellID];
    // 如果取出的单元格为nil
    if (tableViewCell == nil) {
        //创建一个UITableViewCell对象，并绑定到cellID
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    }

    tableViewCell.layer.masksToBounds = YES;
    //UITableView声明了一个NSIndexPath的类别，主要用来标识当前cell的在tableView中的位置，该类别有section和row两个属性，section标识当前cell处于第几个section中，row代表在该section中的第几行。
    // 从IndexPath参数获取当前行的行号
    NSUInteger rowNo = indexPath.row;
    // 取出cityArray中索引为rowNo的元素作为UITableViewCell的文本内容
    tableViewCell.textLabel.text = [cityArray objectAtIndex:rowNo];
    // 设置UITableViewCell的详细内容
    tableViewCell.detailTextLabel.text = [NSString stringWithFormat:@"详情"];
    // 设置UITableViewCell的左边的图标
    tableViewCell.imageView.image = [UIImage imageNamed:@"beijing.jpg"];
    // 设置UITableViewCell附加按钮的样式
    tableViewCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //返回设置好数据的cell给UITableView对象
    return tableViewCell;
}
 
 
@end

