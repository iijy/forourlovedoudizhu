//
//  ZCViewController.h
//  ForOurLove
//
//  Created by Iijy ZC on 13-11-21.
//  Copyright (c) 2013年 Iijy ZC. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SaveAlertViewDelegate <NSObject>
@end
@interface ZCViewController : UIViewController<UIAlertViewDelegate>
@property(nonatomic, assign) id<SaveAlertViewDelegate> SaveAlertDelegate;
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;


@end
