//
//  ViewController.m
//  MyReader
//
//  Created by ZhangLianzhou on 15/8/16.
//  Copyright © 2016 lass.uliga. All rights reserved.
//

#import "MRShelfViewController.h"
#import "MRFileFetcher.h"

@interface MRShelfViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *files;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MRShelfViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Shelf";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sort"
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self action:@selector(didTapNavbarButtonSort:)];

    self.files = [[MRFileFetcher sharedInstance] loadFiles];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.files.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"books"];
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }

    NSURL *fileURL = self.files[indexPath.row];

    cell.textLabel.text = [[fileURL lastPathComponent] stringByDeletingPathExtension];
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    cell.textLabel.textColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
