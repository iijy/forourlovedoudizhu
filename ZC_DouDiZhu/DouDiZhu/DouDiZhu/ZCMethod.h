//
//  ZCMethod.h
//  ForOurLove
//
//  Created by Iijy ZC on 13-11-21.
//  Copyright (c) 2013年 Iijy ZC. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ZCPoker;
@class ZCPlayer;
@class ZCSeparateArray;
@class ZCSeparateStraight;

@interface ZCMethod : NSObject
@property int errornum;
@property NSString *pokertext;
@property NSMutableArray *mecp;
@property NSMutableArray *mebp;
@property int metimes;
@property NSMutableArray *me54;
@property NSMutableArray *methree;

-(BOOL)startdeal:(ZCPlayer *)PlayerI :(ZCPlayer *)PlayerII :(ZCPlayer *)PlayerIII;  //发牌
-(int)whoistherickman;//随机产生地主
-(void)dealtherichman:(ZCPlayer *)Player;//发地主牌
-(NSMutableArray *)pocketsort:(NSMutableArray *)playerpocket;
-(int)jdscroll:(int)oriJD;//循环焦点
-(int)jdscrollF:(int)oriJD;//反循环焦点
-(int)chupai:(ZCPlayer *)player;//出牌
//-----------------------------------------------------------------------------------
-(int)jdz:(ZCPlayer *)player;//叫地主
-(int)bj:(ZCPlayer *)player;//不叫
-(int)qdz:(ZCPlayer *)player;//抢地主
-(int)bq:(ZCPlayer *)player;//不抢

-(NSString *)tishi:(NSMutableArray *)pocketarr :(NSMutableArray *)cparr;

-(ZCSeparateStraight *)separatstraightfromarr:(NSMutableArray *)cparr :(NSMutableArray *)sparr;
//-(ZCSeparateArray *)separatethearray:(NSMutableArray *)arrayC;
@end
