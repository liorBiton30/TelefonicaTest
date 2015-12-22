//
//  UIAutoLayoutViewController.h
//  TableViewSecondExample
//
//  Created by Action-Item on 12/10/15.
//  Copyright © 2015 Action item. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellData.h"

enum
{
    sectionTypePaymentSettings,
    sectionTypeAccount,
    sectionTypeAbout
    
}; typedef NSInteger SectionType;

@interface UISettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *_tableView;
}

@end
