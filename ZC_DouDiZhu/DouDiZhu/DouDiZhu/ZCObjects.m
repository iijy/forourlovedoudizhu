//
//  ZCObjects.m
//  ForOurLove
//
//  Created by Iijy ZC on 13-11-21.
//  Copyright (c) 2013年 Iijy ZC. All rights reserved.
//

#import "ZCObjects.h"
#import "ZCDefines.h"
#import <QuartzCore/QuartzCore.h>
@implementation ZCPlayer
-(id)init{
    self.plcp=[[ZCLabelbig alloc]init];
       self.plTS=[[ZCLabelbig alloc]init];
    self.plpocket=[NSMutableArray new];
    self.plnum=0;
    self.plscore=0;
    self.plisrich=NO;
    self.pliswannabe=NO;
    self.pliswannado=KZC_ISWANNADO;
    self.plcanornot=KZC_CANORNOT;
    return self;
}
@end

@implementation ZCPoker
-(id)init{
    self.ponum=0;
    self.potypenum=0;
    self.potype=@"-";
    self.poisselected=NO;
    return self;
}
@end
@implementation ZCSeparateArray
@end
@implementation ZCSeparateStraight
@end

@implementation ZCLabelScore
-(id)init{
    self =[super init];
    return self;
}
-(id)initwith:(ZCPlayer *)player1 :(ZCPlayer *)player2 :(ZCPlayer *)player3 {
    if ([self init]) {
        self.backgroundColor=KZC_CLSCOREBG;
        self.layer.borderColor=[KZC_CLPOKERRED CGColor];
        self.layer.borderWidth=1.5;
        self.layer.cornerRadius=8;
        self.frame=KZC_RLSCORE;
        ZCLabelsmall *label=[[ZCLabelsmall alloc]init];
        label.frame=KZC_RLSCORED;
        label.text=KZC_TXTSCORE;
        [self addSubview:label];
        self.txtA=[[ZCLabelsmall alloc]init];
        self.txtA.frame=KZC_RLSCORETA;
        self.txtA.text=player1.plname;
        [self addSubview:self.txtA];
        
        self.scoreA=[[ZCLabelsmall alloc]init];
        self.scoreA.frame=KZC_RLSCOREA;
        [self addSubview:self.txtA];
        
        self.txtB=[[ZCLabelsmall alloc]init];
        self.txtB.frame=KZC_RLSCORETB;
        self.txtB.text=player2.plname;
        [self addSubview:self.txtB];
        
        self.scoreB=[[ZCLabelsmall alloc]init];
        self.scoreB.frame=KZC_RLSCOREB;
        [self addSubview:self.txtB];
        
        self.txtC=[[ZCLabelsmall alloc]init];
        self.txtC.frame=KZC_RLSCORETC;
        self.txtC.text=player3.plname;
        [self addSubview:self.txtC];
        
        self.scoreC=[[ZCLabelsmall alloc]init];
        self.scoreC.frame=KZC_RLSCOREC;
        [self addSubview:self.txtC];
        
    }
    return self;
}

@end
@implementation ZCLabelbig

-(id)init{
    self=[super init];
    self.font=KZC_FONTBIG;
    self.textColor=KZC_CLBUTTONCII;
    return self;
}

@end
@implementation ZCLabelmiddle

-(id)init{
    self=[super init];
    self.font=KZC_FONTPFS;
    self.textColor=KZC_CLBUTTONCII;
    return self;
}

@end
@implementation ZCLabelsmall

-(id)init{
    self=[super init];
    self.font=KZC_FONTPFXS;
    self.textColor=KZC_CLBUTTONCII;
    return self;
}

@end