//
//  UIHeaderView.m
//  TableViewSecondExample
//
//  Created by Action-Item on 12/13/15.
//  Copyright © 2015 Action item. All rights reserved.
//

#import "UIHeaderTableView.h"

@implementation UIHeaderTableView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

- (IBAction)buttonClicked:(UIButton *)sender
{
    NSString *title;
    switch (sender.tag)
    {
        case shareButtonTypeFacebook:
        {
            title = @"Facebook";
            break;
        }
        case shareButtonTypeTwitter:
        {
            title = @"Twitter";
            break;
        }
        case shareButtonTypeSms:
        {
            title = @"Sms";
            break;
        }
        case shareButtonTypeEmail:
        {
            title = @"Email";
            break;
        }
        default:
            break;
    }
    NSLog(@"");

    UIAlertController * alert =   [UIAlertController
                                  alertControllerWithTitle:title
                                  message:@"Enter User Credentials"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             //Do some thing here
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    UIAlertAction* cancel = [UIAlertAction
                             actionWithTitle:@"Cancel"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
    [alert addAction:ok];
    [alert addAction:cancel];
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Password"; //for passwords
        textField.secureTextEntry = YES;
    }];
    
    UIViewController *vc = self.viewController;
    [vc presentViewController:alert animated:YES completion:nil];

}

//- (UIViewController*)getMyViewController
//{
//    for (UIView* next = [self superview]; next; next = next.superview)
//    {
//        UIResponder* nextResponder = [next nextResponder];
//        if ([nextResponder isKindOfClass:[UIViewController class]])
//        {
//            return (UIViewController*)nextResponder;
//        }
//    }
//    return nil;
//}

@end
