//
//  ZCDefines.h
//  ForOurLove
//
//  Created by Iijy ZC on 13-11-19.
//  Copyright (c) 2013年 Iijy ZC. All rights reserved.
//

#import <Foundation/Foundation.h>
#define KZC_SINGLEP       1   //单牌
#define KZC_DOUBLEP       2   //对子
#define KZC_MUDOUBLEPS    222  //连对
#define KZC_TRIPS         3   //三张
#define KZC_TRIPSANDI     31   //三带一
#define KZC_TRIPSANDII     32   //三带二
#define KZC_BUMB          4   //炸弹，4同点
#define KZC_FOURANDONEONE 411  //四带2单牌
#define KZC_FOURANDTOWTOW 422  //四带2对子

#define KZC_STRAIGHT      5   //顺子
#define KZC_STRAIGHTFLUSH 55   //同花顺

#define KZC_BUMBSBIG      88  //双王炸

#define KZC_CANNOTI       80001//请选择要出的牌
#define KZC_CANNOTII      80002//出牌不符合规则
#define KZC_CANNOTIII       80003//出牌没有大过上家
//-------------------------

#define KZC_BORDERWIDTH   1;

#define SCREEM_WIDTH            640        //屏幕宽度
#define SCREEM_HEIGHT            320        //屏幕宽度
#define KZC_LBPSTARTY  21
#define KZC_LBPSTARTX 41
#define KZC_LBPWIDTH 101
#define KZC_LBPHEIGHT 21

#define KZC_WIDTHPOCKETS  20
#define KZC_HEIGHTPOCKETS  13
#define KZC_WIDTHPOCKETSS  17
#define KZC_HEIGHTADD      5

#define KZC_ISWANNADO      0
#define KZC_ISWANNADOQ     110
#define KZC_ISWANNADOBQ    120

#define KZC_CANORNOT     0
#define KZC_CANCP        999
#define KZC_CANNOTCP     111

//568*320
#define KZC_FONTBIG      [UIFont fontWithName:@"经典繁勘亭" size:17]
#define KZC_LBFONT      [UIFont fontWithName:@"HanWangWCL03" size:17]
#define KZC_FONTPF      [UIFont fontWithName:@"ArialRoundedMTBold" size:16]
#define KZC_FONTPFM     [UIFont fontWithName:@"ArialRoundedMTBold" size:15]
#define KZC_FONTPFS     [UIFont fontWithName:@"ArialRoundedMTBold" size:12]
#define KZC_FONTPFXS    [UIFont fontWithName:@"ArialRoundedMTBold" size:9]
#define KZC_FONTPFXXS    [UIFont fontWithName:@"ArialRoundedMTBold" size:7]

#define KZC_RLNUM         CGRectMake(0, 1, 19, 18)
#define KZC_RLTYPE        CGRectMake(0,KZC_RLNUM.size.height, 19, 14)
#define KZC_RLNUMS        CGRectMake(0, 1, 17, 16)
#define KZC_RLTYPES       CGRectMake(0,KZC_RLNUMS.size.height, 17, 12)

#define KZC_RLDZS        CGRectMake(101, 18, 101, 21)       //label地主是：
#define KZC_RLDZP        CGRectMake( 21, 21,  21, 28)       //label地主牌第1张
#define KZC_RLFNB        CGRectMake(101, 40,  30, 17)       //label翻N倍

#define KZC_RLSCORE      CGRectMake(401,  18,156, 21)       //label得分栏
#define KZC_RLSCORED     CGRectMake( 66,   1, 28,  9)
#define KZC_RLSCORETA    CGRectMake(  5,  11, 28,  9)       //label得分栏
#define KZC_RLSCOREA     CGRectMake( 33,  11, 21,  9)       //label得分栏
#define KZC_RLSCORETB    CGRectMake( 54,  11, 28,  9)       //label得分栏
#define KZC_RLSCOREB     CGRectMake( 82,  11, 21,  9)       //label得分栏
#define KZC_RLSCORETC    CGRectMake(103,  11, 28,  9)       //label得分栏
#define KZC_RLSCOREC     CGRectMake(131,  11, 21,  9)       //label得分栏

#define KZC_RLCPA       CGRectMake(274, 128, 28, 38)       //label出牌区A的中心张牌
#define KZC_RLCPB       CGRectMake(394,  62, 28, 38)       //label出牌区B的中心张牌
#define KZC_RLCPC       CGRectMake(154,  62, 28, 38)       //label出牌区C的中心张牌
#define KZC_RLSPA       CGRectMake(283, 221, 48, 72)       //label玩家A的第中心张牌,改横坐标
#define KZC_RLSPB       CGRectMake(500,  69, 60, 25)       //label玩家B的第中心张牌,改纵坐标
#define KZC_RLSPC       CGRectMake(  8,  69, 60, 25)       //label玩家C的第中心张牌,改纵坐标

#define KZC_RLJBJA      CGRectMake(231, 138, 61, 25)       //label抢地主或不抢
#define KZC_RLJBJB      CGRectMake(441, 100, 61, 25)       //label叫地主或不叫
#define KZC_RLJBJC      CGRectMake(111, 100, 61, 25)      //label出不出
#define KZC_RLTSA       CGRectMake(211, 261,261, 25)
#define KZC_RLTSB       CGRectMake(351, 62, 261, 25)
#define KZC_RLTSC       CGRectMake(111, 62, 261, 25)

#define KZC_RLSETTING   CGRectMake(0, 0, 0, 0)       //设置工具条
#define KZC_RLWARNING   CGRectMake(51, 301 , 401, 18)       //设置工具条

#define KZC_RBKAISHI     CGRectMake(170, 170, 61, 31)      //button开始
#define KZC_RBREKAISHI   CGRectMake(251, 19, 61, 31)      //button重新开始
#define KZC_RBKAISHIX    251     //button开始

#define KZC_RBJDZX       211     //button叫地主
#define KZC_RBBJX        276     //button不叫
#define KZC_RBQDZX       211     //button抢地主
#define KZC_RBBQX        276     //button不抢

#define KZC_RBCHUPAIX    276     //button出牌
#define KZC_RBBUCHUX     343     //button不出
#define KZC_RBRESETX     145     //button重选
#define KZC_RBTISHIX     211     //button提示

#define KZC_TAGKAISHI   8001
#define KZC_TAGJDZ      8002
#define KZC_TAGBJ       8003
#define KZC_TAGQDZ      8004
#define KZC_TAGBQ       8005

#define KZC_TAGCHUPAI   8006
#define KZC_TAGBUCHU    8007
#define KZC_TAGRESET    8008
#define KZC_TAGTISHI    8009
#define KZC_TAGREKAISHI    8010

#define KZC_TXTREKAISHI   @"重新开始"
#define KZC_TXTKAISHI   @"开始"
#define KZC_TXTJDZ      @"叫地主"
#define KZC_TXTBJ       @"不叫"
#define KZC_TXTQDZ      @"抢地主"
#define KZC_TXTBQ       @"不抢"

#define KZC_TXTCHUPAI   @"出牌"
#define KZC_TXTBUCHU    @"不出"
#define KZC_TXTRESET    @"重选"
#define KZC_TXTTISHI    @"提示"


#define KZC_TXTISWANNADO [NSString stringWithFormat:@"%@是否抢地主？",[self getJDplayer:intJD].plname]
#define KZC_TXTWAITING  [NSString stringWithFormat:@"等待%@出牌",[self getJDplayer:intJD].plname]
#define KZC_TXTDZS      [NSString stringWithFormat:@"地主是%@",[self getJDplayer:intDZ].plname] //label地主是
#define KZC_TXTSCORE    @"得分栏"          //label得分栏
#define KZC_TXTFNB      [NSString stringWithFormat:@"翻%d倍",mymethod.metimes]      //label翻N倍
#define KZC_TXTPOOL     @"您没有手牌大过上家！"


#define KZC_TAG_SPLBI          100//玩家1手牌tagmark
#define KZC_TAG_SPLBII         200//玩家2手牌tagmark
#define KZC_TAG_SPLBIII        300//玩家3手牌tagmark
#define KZC_TAG_SPLBCP         500//出牌labels的tagmark
#define KZC_TAG_SPLBDZP        900//三张地主牌的tagmark

#define KZC_CLSCOREBG      [UIColor orangeColor]
#define KZC_CLPOKERBG      [UIColor whiteColor]
#define KZC_CLPOKERBORDER  [UIColor blackColor]
#define KZC_CLPOKERRED     [UIColor redColor]
#define KZC_CLPOKERBLACK   [UIColor blackColor]
#define KZC_CLWINDOWBG     [UIColor greenColor]
#define KZC_CLBUTTONCI     [UIColor blueColor]
#define KZC_CLBUTTONCII    [UIColor purpleColor]

//---------------------------
//#define KZC_RECT_LBPI          41,81,101,31//label“玩家1”的frame
//#define KZC_RECT_LBPII         41,81,101,31//label”玩家2“的frame
//#define KZC_RECT_LBPIII        41,81,101,31//label“玩家3”的frame
//#define KZC_RECT_LBCPQ         41,201,101,31//label”出牌区“的frame
//
//#define KZC_RECT_SPLBPI        0,121,25,51.2//labels玩家1手牌的frame
//#define KZC_RECT_SPLBPII       0,121,25,51.2//labels玩家2手牌的frame
//#define KZC_RECT_SPLBPIII      0,121,25,51.2//labels玩家3手牌的frame
//#define KZC_RECT_CPLBCPQ       0,241,25,51.2//labels出牌区牌的frame
//
//#define KZC_RECT_LBDZP         160,33,25,50//labels三张地主牌的frame
//
//#define KZC_RECT_LBDZ          20,33,120,18//label“地主”的frame
//#define KZC_RECT_LBCP          160,301,180,18//label“等待。。。”提示区的frame
//
//#define KZC_RECT_BTA           301,33,50,40//button*001的frame
//#define KZC_RECT_BTB           360,33,50,40//button*002的frame
//
//
//
//
//#define KZC_LBTAG  0
//#define KZC_ButtonChuPai 7001;
//#define KZC_ButtonBuChu 7002;
//#define KZC_ButtonJDZ 8001;
//#define KZC_ButtonBJ 8002;

@interface ZCDefines : NSObject

@end
