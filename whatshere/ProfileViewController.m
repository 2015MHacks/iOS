//
//  ProfileViewController.m
//  WhatsHere
//
//  Created by Jaxon Stevens on 05/08/14.
//  Copyright (c) 2014 Lemona Inc. All rights reserved.
//

#import "ProfileViewController.h"


@interface ProfileViewController ()

@property (nonatomic, strong) NSArray *userAttributes;
@end

@implementation ProfileViewController


- (void)viewDidLoad
{
    [self createProfileArray];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)createProfileArray
{
    _userAttributes = @[ @{@"Creator":@"Jaxon Stevens"}, @{@"Country":@"Canada"}, @{@"Number #":@"4034792554"}, @{@"City":@"Bragg Creek"}];
    
}

- (void)didReceiveMemoryWarning
{

    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - table view delegates & data sources

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _userAttributes.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        
        UILabel *lblKey = [[UILabel alloc]initWithFrame:CGRectMake(20, 10, 100, 24)];
        lblKey.font = [UIFont systemFontOfSize:17];
        lblKey.tag = 1;
        lblKey.textColor = [UIColor darkGrayColor];
        [cell.contentView addSubview:lblKey];
        
        UILabel *lblValue = [[UILabel alloc] initWithFrame: CGRectMake(120, 10, 170, 24)];
        lblValue.font = [UIFont systemFontOfSize:16];
        lblValue.tag = 2;
        lblValue.textColor = [UIColor darkGrayColor];
        lblValue.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:lblValue];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(170, 10, 22, 24)];
        img.image = [UIImage imageNamed:@"icon-calender"];
        img.hidden = YES;
        img.tag =3;
        [cell.contentView addSubview:img];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSDictionary *userDic = [_userAttributes objectAtIndex:indexPath.row];
    NSString *key= [[userDic allKeys] lastObject];
    UILabel *lblKey = (UILabel *)[cell.contentView viewWithTag:1];
    lblKey.text = key;
    UILabel *lblValue = (UILabel *)[cell.contentView viewWithTag:2];
    lblValue.text = [userDic valueForKey:key];
    UIImageView *img = (UIImageView *)[cell.contentView viewWithTag:3];
    if ([key isEqualToString:@"Birthdate"])
        img.hidden = NO;
    return cell;

}


@end
