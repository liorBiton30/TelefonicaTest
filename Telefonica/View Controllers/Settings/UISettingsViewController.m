//
//  UIAutoLayoutViewController.m
//  TableViewSecondExample
//
//  Created by Action-Item on 12/10/15.
//  Copyright © 2015 Action item. All rights reserved.
//

#import "UISettingsViewController.h"
#import "UIToggleWithTextCell.h"
#import "UIHeaderTableView.h"

@interface UISettingsViewController ()
{
    NSDictionary *_tableData;
}

@end

@implementation UISettingsViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self == [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        self.title = @"More";
    }
    
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableDictionary *tempTableData = [NSMutableDictionary dictionary];
    
    CellData *rowCallRates = [[CellData alloc] initWithTitle:@"Call rates" andAccessoryType:1];
    CellData *rowEnableAuto = [[CellData alloc] initWithTitle:@"Enable auto top up" andSubTitle:nil andAccessoryType:0 andIsToggle:YES andIsVersion:NO];
    CellData *rowRemove  = [[CellData alloc] initWithTitle:@"Remove saved card info" andSubTitle:nil andAccessoryType:0 andIsToggle:NO andIsVersion:NO];
    
    NSArray *rowsOfPaymentSettings = @[rowCallRates, rowEnableAuto, rowRemove];
    [tempTableData setObject:rowsOfPaymentSettings forKey:@"0"];

    CellData *rowPhone = [[CellData alloc] initWithTitle:@"Phone number" andSubTitle:@"+972521234567" andAccessoryType:0 andIsToggle:NO andIsVersion:NO];
    CellData *rowCall = [[CellData alloc] initWithTitle:@"Call as for help"];
    CellData *rowDelete = [[CellData alloc] initWithTitle:@"Delete Account"];
    CellData *rowSignOut = [[CellData alloc] initWithTitle:@"Sign out"];
    
    NSArray *rowsOfSectionAccount = @[rowPhone, rowCall, rowDelete, rowSignOut];
    [tempTableData setObject:rowsOfSectionAccount forKey:@"1"];
    
    CellData *rowTermsAndConditions = [[CellData alloc] initWithTitle:@"Terms and conditions" andAccessoryType:1];
    CellData *rowPrivacy = [[CellData alloc] initWithTitle:@"Privacy Policy" andAccessoryType:1];
    CellData *rowTakeATour = [[CellData alloc] initWithTitle:@"Take a tour"];
    
    UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
    versionLabel.textColor = [UIColor colorWithRed:176.0/255.0 green:176.0/255.0 blue:176.0/255.0 alpha:1.0];
    versionLabel.adjustsFontSizeToFitWidth = YES;
    versionLabel.text = @"1.2.3";
    
    CellData *rowVersion = [[CellData alloc] initWithTitle:@"Version" andSubTitle:nil andAccessoryType:0 andIsToggle:NO andIsVersion:YES];
    rowVersion.version = versionLabel;
    
    NSArray *rowsOfSectionAbout = @[rowTermsAndConditions, rowPrivacy, rowTakeATour, rowVersion];
    [tempTableData setObject:rowsOfSectionAbout forKey:@"2"];
    
    _tableData = tempTableData;

    _tableView.tableHeaderView =  [[[NSBundle mainBundle] loadNibNamed:@"UIHeaderTableView" owner:self options:nil] firstObject];
    [_tableView registerNib:[UINib nibWithNibName:@"UIToggleWithTextCell" bundle:nil] forCellReuseIdentifier:@"UIToggleWithTextCell"];
}

#pragma mark - UIScrollView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == sectionTypeAccount)
    {
        if (indexPath.row == 0)
            return 59;
    }
    
    return 44;
}

#pragma mark - UITableViewDataSource Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tableData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *keyValue = [@(section) stringValue];
    NSArray *rowsData = _tableData[keyValue];
    
    return rowsData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    NSString *keyValue = [@(indexPath.section) stringValue];
    NSArray *rowsData = _tableData[keyValue];
    CellData *row = rowsData[indexPath.row];
    
    if (row.isToggle)
    {
         UIToggleWithTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UIToggleWithTextCell"];
         return cell;
    }
    else
    if (row.subTitle)
    {
        UITableViewCell *cell = [self createViewCellStyleSubtitle:tableView];
        cell.textLabel.text = row.title;
        cell.detailTextLabel.text = row.subTitle;
        cell.detailTextLabel.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:17.0f];
        cell.accessoryType = row.accessoryType;
        
        return cell;
    }
    else
    {
        UITableViewCell *cell = [self createViewCellStyleDefault:tableView];
        cell.textLabel.text = row.title;
        cell.accessoryType = row.accessoryType;
        cell.selectionStyle = UITableViewCellAccessoryNone;
        
        if (row.isVersion)
            cell.accessoryView = row.version;
    
        return cell;
    }
}

#pragma mark - Help function

- (UITableViewCell *)createViewCellStyleDefault:(UITableView *)tableView
{
    static NSString *contactIdentifier = @"settingsDentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:contactIdentifier];
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contactIdentifier];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.accessoryView = nil;
    cell.textLabel.text = @"";
    
    return cell;
}

- (UITableViewCell *)createViewCellStyleSubtitle:(UITableView *)tableView
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Subtitledentifier"];
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Subtitledentifier"];
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellAccessoryNone;
    
    return cell;
}

#pragma mark - UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == sectionTypePaymentSettings || section == sectionTypeAccount || section == sectionTypeAbout)
    {
        return 44;
    }
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *sectionTitle;
    
    switch (section)
    {
        case sectionTypePaymentSettings:
            sectionTitle = @"Payment Settings";
            break;
        case sectionTypeAccount:
            sectionTitle = @"Account";
            break;
        case sectionTypeAbout:
            sectionTitle = @"About";
            break;
            
        default:
            break;
    }
    
    UIView *tempView = [[UIView alloc] initWithFrame:tableView.bounds];
    tempView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:248/255.0 alpha:1.0f];

    UILabel *label = [[UILabel alloc] initWithFrame:tempView.bounds];
    label.text = sectionTitle;
    label.frame = CGRectInset(label.frame, 15, 20);
    label.font = [UIFont fontWithName:@"HelveticaNeue-Regular" size:14.0f];
    label.textColor = [UIColor colorWithRed:81/255.0 green:81/255.0 blue:81/255.0 alpha:1];
    [label sizeToFit];
    
    [tempView addSubview:label];
    
    return tempView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Row selected");
}

@end
