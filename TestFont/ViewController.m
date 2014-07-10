//
//  ViewController.m
//  TestFont
//
//  Created by mac on 13-9-5.
//  Copyright (c) 2013年 xiaoran. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSMutableDictionary *fonts = [[NSMutableDictionary alloc] init];
    NSArray *fontFamilys = [UIFont familyNames];
    NSLog(@"%@",fontFamilys);
    int count = 0;
    
    for (NSString *fontFamily in fontFamilys) {
        
        NSArray *fontNames = [UIFont fontNamesForFamilyName:fontFamily];
        NSLog(@"%@===>%@",fontFamily,fontNames);
        
        [fonts setObject:fontNames forKey:fontFamily];
        
        
        count += [fontNames count];
        
    }
    
    NSLog(@"all fonts count = %d",count);
    
//    NSArray customFont = [NSArray ];
//    [fonts setObject:customFont forKey:@"自定义字体"];
    
    self.dataSource = fonts;
    
    [_tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark tableview datasource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuse"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuse"];
    }
    
    //config cell
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    NSString *key = [[self.dataSource allKeys] objectAtIndex:section];
    
    id unkown = [self.dataSource objectForKey:key];
    
    if ([unkown isKindOfClass:[NSArray class]]) {
        NSArray *allFonts = (NSArray *)unkown;
        
        cell.textLabel.font = [UIFont fontWithName:[allFonts objectAtIndex:row] size:22];
        cell.textLabel.text = [NSString stringWithFormat:@"%@:english char,我是中国人",[allFonts objectAtIndex:row]];
    
    }
    
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataSource count];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *key = [[self.dataSource allKeys] objectAtIndex:section];
    
    id unkown = [self.dataSource objectForKey:key];
    
    if ([unkown isKindOfClass:[NSArray class]]) {
        NSArray *allFonts = (NSArray *)unkown;
        
        return [allFonts count];
    }
    return 0;

}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{

}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [[self.dataSource allKeys] objectAtIndex:section];
    

}




@end
