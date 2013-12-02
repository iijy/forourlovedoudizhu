//
//  ZCPokerFaceView.h
//  ForOurLove
//
//  Created by Iijy ZC on 13-11-21.
//  Copyright (c) 2013年 Iijy ZC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCPokerLabelNum : UILabel

@end
@interface ZCPokerLabelType : UILabel

@end
@interface ZCPokerFaceView : UIView
@property NSString *strnum;
@property NSString *strtype;
@property    ZCPokerLabelNum *lnum;
@property    ZCPokerLabelType *ltype;
@property    ZCPokerLabelNum *lnumb;
@property    ZCPokerLabelType *ltypeb;
- (id)initwithnumandtype:(NSString *)num :(NSString *)type;
@end
@interface ZCPokerFaceViewHeight : UIView
@property NSString *strnum;
@property NSString *strtype;
@property    ZCPokerLabelNum *lnum;
@property    ZCPokerLabelType *ltype;
- (id)initwithnumandtype:(NSString *)num :(NSString *)type;
@end

@interface ZCPokerFaceViewSmall: UIView
@property    NSString *strnum;
@property    NSString *strtype;
@property    ZCPokerLabelNum *lnum;
@property    ZCPokerLabelType *ltype;
- (id)initwithnumandtype:(NSString *)num :(NSString *)type;
@end

@interface ZCPokerFaceViewXSmall: UIView
@property    NSString *strnum;
@property    NSString *strtype;
@property    ZCPokerLabelNum *lnum;
@property    ZCPokerLabelType *ltype;
- (id)initwithnumandtype:(NSString *)num :(NSString *)type;
@end
