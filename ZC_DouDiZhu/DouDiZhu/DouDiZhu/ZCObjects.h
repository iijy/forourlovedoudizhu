//
//  ZCObjects.h
//  ForOurLove
//
//  Created by Iijy ZC on 13-11-21.
//  Copyright (c) 2013年 Iijy ZC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCPokerFaceView.h"
@interface ZCLabelbig : UILabel


@end
@interface ZCLabelmiddle : UILabel


@end
@interface ZCLabelsmall : UILabel


@end

@interface ZCPlayer : NSObject
@property ZCLabelbig *plcp;//显示“叫地主”“不叫”“抢地主”“不出”“不抢”等
@property ZCLabelbig *plTS;
@property int plscore;
@property int plnum;
@property BOOL plisrich;
@property BOOL pliswannabe;
@property int pliswannado;
@property int plcanornot;
@property int plchuorbuchu;
@property NSString *plname;
@property NSMutableArray *plpocket;
@property CGRect plframe;


@end

@interface ZCPoker : NSObject
@property ZCPokerFaceView *poview;
@property ZCPokerFaceViewSmall *poviewsmall;
@property ZCPokerFaceViewHeight *poviewheight;
@property int ponum;
@property NSString *potext;
@property UIColor *pocolor;
@property NSString *potype;
@property int potypenum;
@property BOOL poisselected;

@end

@interface ZCSeparateArray : NSObject

@property    int classnum;
@property    NSString  *resultstr;
@property    NSInteger countfours;
@property    NSInteger counttrips;
@property    NSInteger countdoubles;
@property    NSInteger countsingles;
@property    NSMutableArray *arrfours;
@property    NSMutableArray *arrtrips;
@property    NSMutableArray *arrdouble;
@property    NSMutableArray *arrsingle;
@property    NSMutableArray *arrreset;
@property    NSMutableArray *arrjokers;

@end
@interface ZCSeparateStraight : NSObject
@property    NSString *myresultstr;
@property    NSMutableArray *myflush;
@property    NSMutableArray *mySA;
//@property    NSMutableArray *mySB;

@end
@interface ZCLabelScore : UILabel

@property ZCLabelsmall *txtA;
@property ZCLabelsmall *scoreA;
@property ZCLabelsmall *txtB;
@property ZCLabelsmall *scoreB;
@property ZCLabelsmall *txtC;
@property ZCLabelsmall *scoreC;
-(id)initwith:(ZCPlayer *)player1 :(ZCPlayer *)player2 :(ZCPlayer *)player3;
@end