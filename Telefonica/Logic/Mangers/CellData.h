//
//  RowData.h
//  TableViewSecondExample
//
//  Created by Action-Item on 12/15/15.
//  Copyright © 2015 Action item. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CellData : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subTitle;
@property (nonatomic, strong) UILabel *version;

@property (nonatomic, unsafe_unretained) NSInteger accessoryType;
@property (nonatomic, unsafe_unretained) BOOL isToggle;
@property (nonatomic, unsafe_unretained) BOOL isVersion;

- (instancetype)initWithTitle:(NSString *)title;
- (instancetype)initWithTitle:(NSString *)title andAccessoryType:(NSInteger)accessoryType;
- (instancetype)initWithTitle:(NSString *)title andSubTitle:(NSString *)subTitle
                                        andAccessoryType:(NSInteger)accessoryType
                                             andIsToggle:(BOOL)isToggle
                                            andIsVersion:(BOOL)isVersion;

@end
