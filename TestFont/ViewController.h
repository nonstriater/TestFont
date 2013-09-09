//
//  ViewController.h
//  TestFont
//
//  Created by mac on 13-9-5.
//  Copyright (c) 2013年 xiaoran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource>{

    IBOutlet UITableView *_tableView;

}


@property(strong,nonatomic) NSDictionary *dataSource;

@end
