//
//  UIToggleWithTextCell.m
//  TableViewSecondExample
//
//  Created by Action-Item on 12/10/15.
//  Copyright © 2015 Action item. All rights reserved.
//

#import "UIToggleWithTextCell.h"

@implementation UIToggleWithTextCell
{
    __weak IBOutlet UISwitch *_cellSwitch;
    __weak IBOutlet UILabel *_label;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)prepareForReuse
{
    [super prepareForReuse];

    _cellSwitch.on = NO;
}

@end




