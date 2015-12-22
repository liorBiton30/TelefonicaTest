//
//  RowData.m
//  TableViewSecondExample
//
//  Created by Action-Item on 12/15/15.
//  Copyright © 2015 Action item. All rights reserved.
//

#import "CellData.h"

@implementation CellData

- (instancetype)initWithTitle:(NSString *)title
{
    if (self = [super init])
    {
        _title = title;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title andAccessoryType:(NSInteger)accessoryType
{
    if (self = [super init])
    {
        _title = title;
        _accessoryType = accessoryType;
    }
    
    return self;
}

- (instancetype)initWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle
             andAccessoryType:(NSInteger)accessoryType
                  andIsToggle:(BOOL)isToggle
                 andIsVersion:(BOOL)isVersion
{
    if (self = [super init])
    {
        _title = title;
        _subTitle = subTitle;
        _accessoryType = accessoryType;
        _isToggle = isToggle;
        _isVersion = isVersion;
    }
    
    return self;
}

@end
