//
//  ZCPokerFaceView.m
//  ForOurLove
//
//  Created by Iijy ZC on 13-11-21.
//  Copyright (c) 2013年 Iijy ZC. All rights reserved.
//

#import "ZCPokerFaceView.h"
#import "ZCDefines.h"
#import <QuartzCore/QuartzCore.h>
@implementation ZCPokerLabelNum
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font=KZC_FONTPF;
        self.textAlignment=NSTextAlignmentCenter;
    }
    return self;
}
@end
@implementation ZCPokerLabelType
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font=KZC_FONTPFS;
        self.textAlignment=NSTextAlignmentCenter;
    }
    return self;
}
@end
@implementation ZCPokerFaceView
-(id)init{
    self = [super init];
    return self;
}
- (id)initwithnumandtype:(NSString *)num :(NSString *)type
{
    if ([self init]) {
        self.backgroundColor=KZC_CLPOKERBG;
        self.layer.borderWidth=KZC_BORDERWIDTH;
        self.layer.borderColor=[KZC_CLPOKERBORDER CGColor];
        self.layer.cornerRadius=8;
        UIColor *color;
        if ([type isEqualToString:@"♥️"]||[type isEqualToString:@"♦️"]) {
            color=KZC_CLPOKERRED;
        }else color=KZC_CLPOKERBLACK;
        if ([type isEqualToString:@"🐱"]||[type isEqualToString:@"🐶"]) {
            NSArray *arrJOKER=@[@"J",@"O",@"K",@"E",@"R"];
            for (int i=0; i<5; i++) {
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLNUM.origin.x, KZC_RLNUM.origin.y+i*(KZC_RLNUM.size.height-8), KZC_RLNUM.size.width, KZC_RLNUM.size.height-8)];
                _lnum.font=KZC_FONTPFS;
                _lnum.text=arrJOKER[i];
                _lnum.numberOfLines=0;
                if ([type isEqualToString:@"🐶"]) {
                    _lnum.textColor=KZC_CLPOKERBLACK;
                }else _lnum.textColor=KZC_CLPOKERRED;
                [self addSubview:_lnum];
                _lnumb=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLSPA.size.width-KZC_RLNUM.size.width, KZC_RLSPA.size.height-KZC_RLNUM.size.height+8-i*(KZC_RLNUM.size.height-8)-1, KZC_RLNUM.size.width, KZC_RLNUM.size.height-8)];
                _lnumb.text=arrJOKER[i];
                _lnumb.font=KZC_FONTPFS;
                if ([type isEqualToString:@"🐶"]) {
                    _lnumb.textColor=KZC_CLPOKERBLACK;
                }else _lnumb.textColor=KZC_CLPOKERRED;
                [_lnumb setTransform:CGAffineTransformMakeRotation(-M_PI)];
                [self addSubview:_lnumb];

            }
        }
        else{
            if ([num isEqualToString:@"10"]) {
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLNUM.origin.x, KZC_RLNUM.origin.y, KZC_RLNUM.size.width/2, KZC_RLNUM.size.height)];
                _lnum.text=@"1";
                _lnum.textColor=color;
                [self addSubview:_lnum];
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLNUM.origin.x+KZC_RLNUM.size.width/2-2,KZC_RLNUM.origin.y, KZC_RLNUM.size.width/2, KZC_RLNUM.size.height)];
                _lnum.text=@"0";
                _lnum.textColor=color;
                [self addSubview:_lnum];
                _lnumb=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLSPA.size.width-KZC_RLNUM.size.width/2-1, KZC_RLSPA.size.height-KZC_RLNUM.size.height-1, KZC_RLNUM.size.width/2, KZC_RLNUM.size.height)];
                _lnumb.text=@"1";
                _lnumb.textColor=color;
                [_lnumb setTransform:CGAffineTransformMakeRotation(-M_PI)];
                [self addSubview:_lnumb];
                _lnumb=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLSPA.size.width-KZC_RLNUM.size.width+2, KZC_RLSPA.size.height-KZC_RLNUM.size.height-1, KZC_RLNUM.size.width/2, KZC_RLNUM.size.height)];
                _lnumb.text=@"0";
                _lnumb.textColor=color;
                [_lnumb setTransform:CGAffineTransformMakeRotation(-M_PI)];
                [self addSubview:_lnumb];

            }else{
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:KZC_RLNUM];
                _lnum.text=num;
                _lnum.textColor=color;
                [self addSubview:_lnum];
                _lnumb=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLSPA.size.width-KZC_RLNUM.size.width-1, KZC_RLSPA.size.height-KZC_RLNUM.size.height-1, KZC_RLNUM.size.width, KZC_RLNUM.size.height)];
                _lnumb.text=self.lnum.text;
                _lnumb.textColor=color;
                [_lnumb setTransform:CGAffineTransformMakeRotation(-M_PI)];
                [self addSubview:_lnumb];
            }
            _ltype=[[ZCPokerLabelType alloc]initWithFrame:KZC_RLTYPE];
            _ltype.text=type;
            [self addSubview:_ltype];
            _ltypeb=[[ZCPokerLabelType alloc]initWithFrame:CGRectMake(KZC_RLSPA.size.width-KZC_RLTYPE.size.width-KZC_RLTYPE.origin.x, KZC_RLSPA.size.height-KZC_RLNUM.size.height-1-KZC_RLTYPE.size.height, KZC_RLTYPE.size.width, KZC_RLTYPE.size.height)];
            _ltypeb.text=self.ltype.text;
            [_ltypeb setTransform:CGAffineTransformMakeRotation(-M_PI)];
            [self addSubview:_ltypeb];
        }
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
@end
@implementation ZCPokerFaceViewHeight
-(id)init{
    self = [super init];
    return self;
}
- (id)initwithnumandtype:(NSString *)num :(NSString *)type
{
    if ([self init]) {
        self.backgroundColor=KZC_CLPOKERBG;
        self.layer.borderWidth=KZC_BORDERWIDTH;
        self.layer.borderColor=[KZC_CLPOKERBORDER CGColor];
        self.layer.cornerRadius=8;
        UIColor *color;
        
        if ([type isEqualToString:@"♥️"]||[type isEqualToString:@"♦️"]) {
            color=KZC_CLPOKERRED;
        }else color=KZC_CLPOKERBLACK;
        
        if ([type isEqualToString:@"🐱"]||[type isEqualToString:@"🐶"]) {
            NSArray *arrJOKER=@[@"J",@"O",@"K",@"E",@"R"];
            for (int i=0; i<5; i++) {
                _lnum=[[ZCPokerLabelNum alloc]init];
                _lnum.font=KZC_FONTPFXS;
                _lnum.text=arrJOKER[i];
                _lnum.numberOfLines=0;
                [_lnum setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
                _lnum.frame=CGRectMake(KZC_RLNUMH.origin.x+i*(KZC_RLNUMH.size.width-11), KZC_RLNUMH.origin.y, KZC_RLNUMH.size.width-11, KZC_RLNUMH.size.height);
                if ([type isEqualToString:@"🐶"]) {
                    _lnum.textColor=KZC_CLPOKERBLACK;
                }else _lnum.textColor=KZC_CLPOKERRED;
                [self addSubview:_lnum];
            }
        }
        else{
            if ([num isEqualToString:@"10"]) {
                _lnum=[[ZCPokerLabelNum alloc]init];
                _lnum.text=@"0";
                _lnum.font=KZC_FONTPFS;
                _lnum.textColor=color;
                [_lnum setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
                _lnum.frame=CGRectMake(KZC_RLNUMH.origin.x, KZC_RLNUMH.origin.y, KZC_RLNUMH.size.width, KZC_RLNUMH.size.height/2+2);
                [self addSubview:_lnum];
                _lnum=[[ZCPokerLabelNum alloc]init];
                _lnum.text=@"1";
                _lnum.font=KZC_FONTPFS;
                _lnum.textColor=color;
                [_lnum setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
                _lnum.frame=CGRectMake(KZC_RLNUMH.origin.x,KZC_RLNUMH.origin.y+KZC_RLNUMH.size.height/2, KZC_RLNUMH.size.width, KZC_RLNUMH.size.height/2+2);
                [self addSubview:_lnum];
                
            }else{
                _lnum=[[ZCPokerLabelNum alloc]init];
                _lnum.font=KZC_FONTPFS;
                _lnum.text=num;
                _lnum.textColor=color;
                [_lnum setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
                _lnum.frame=KZC_RLNUMH;
                [self addSubview:_lnum];
            }
            _ltype=[[ZCPokerLabelType alloc]initWithFrame:KZC_RLTYPEH];
            _ltype.text=type;
            _ltype.font=KZC_FONTPFXS;
            [_ltype setTransform:CGAffineTransformMakeRotation(-M_PI/2)];
            [self addSubview:_ltype];
        }
    }
    return self;
}
@end
@implementation ZCPokerFaceViewSmall
-(id)init{
    self = [super init];
    return self;
}
- (id)initwithnumandtype:(NSString *)num :(NSString *)type
{
    if ([self init]) {
        self.backgroundColor=KZC_CLPOKERBG;
        self.layer.borderWidth=KZC_BORDERWIDTH;
        self.layer.borderColor=[KZC_CLPOKERBORDER CGColor];
        self.layer.cornerRadius=6;
        UIColor *color;
        if ([type isEqualToString:@"♥️"]||[type isEqualToString:@"♦️"]) {
            color=KZC_CLPOKERRED;
        }else color=KZC_CLPOKERBLACK;
        if ([type isEqualToString:@"🐱"]||[type isEqualToString:@"🐶"]) {
            NSArray *arrJOKER=@[@"J",@"O",@"K",@"E",@"R"];
            for (int i=0; i<5; i++) {
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLNUMS.origin.x, KZC_RLNUMS.origin.y+i*(KZC_RLNUMS.size.height-9), KZC_RLNUMS.size.width, KZC_RLNUMS.size.height-9)];
                _lnum.font=KZC_FONTPFXS;
                _lnum.text=arrJOKER[i];
                _lnum.numberOfLines=0;
                if ([type isEqualToString:@"🐶"]) {
                    _lnum.textColor=KZC_CLPOKERBLACK;
                }else _lnum.textColor=KZC_CLPOKERRED;
                [self addSubview:_lnum];
            }
        }
        else{
            if ([num isEqualToString:@"10"]) {
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLNUMS.origin.x, KZC_RLNUMS.origin.y, KZC_RLNUMS.size.width/2, KZC_RLNUMS.size.height)];
                _lnum.text=@"1";
                _lnum.font=KZC_FONTPFM;
                _lnum.textColor=color;
                [self addSubview:_lnum];
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLNUMS.origin.x+KZC_RLNUMS.size.width/2-2,KZC_RLNUMS.origin.y, KZC_RLNUMS.size.width/2, KZC_RLNUMS.size.height)];
                _lnum.text=@"0";
                _lnum.font=KZC_FONTPFM;
                _lnum.textColor=color;
                [self addSubview:_lnum];
                
            }else{
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:KZC_RLNUMS];
                _lnum.text=num;
                _lnum.font=KZC_FONTPFM;
                _lnum.textColor=color;
                [self addSubview:_lnum];
            }
            _ltype=[[ZCPokerLabelType alloc]initWithFrame:KZC_RLTYPES];
            _ltype.text=type;
            _ltype.font=KZC_FONTPFXS;
            [self addSubview:_ltype];
        }
    }
    return self;
}
@end

@implementation ZCPokerFaceViewXSmall
-(id)init{
    self = [super init];
    return self;
}
- (id)initwithnumandtype:(NSString *)num :(NSString *)type
{
    if ([self init]) {
        self.backgroundColor=KZC_CLPOKERBG;
        self.layer.borderWidth=KZC_BORDERWIDTH;
        self.layer.borderColor=[KZC_CLPOKERBORDER CGColor];
        self.layer.cornerRadius=6;
        UIColor *color;
        if ([type isEqualToString:@"♥️"]||[type isEqualToString:@"♦️"]) {
            color=KZC_CLPOKERRED;
        }else color=KZC_CLPOKERBLACK;
        if ([type isEqualToString:@"🐱"]||[type isEqualToString:@"🐶"]) {
            NSArray *arrJOKER=@[@"J",@"O",@"K",@"E",@"R"];
            for (int i=0; i<5; i++) {
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLNUMS.origin.x+1, KZC_RLNUMS.origin.y+i*(KZC_RLNUMS.size.height-11), KZC_RLNUMS.size.width, KZC_RLNUMS.size.height-11)];
                _lnum.font=KZC_FONTPFXXS;
                _lnum.text=arrJOKER[i];
                _lnum.numberOfLines=0;
                if ([type isEqualToString:@"🐶"]) {
                    _lnum.textColor=KZC_CLPOKERBLACK;
                }else _lnum.textColor=KZC_CLPOKERRED;
                [self addSubview:_lnum];
            }
        }
        else{
            if ([num isEqualToString:@"10"]) {
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLNUMS.origin.x, KZC_RLNUMS.origin.y, KZC_RLNUMS.size.width/2, KZC_RLNUMS.size.height)];
                _lnum.text=@"1";
                _lnum.font=KZC_FONTPFM;
                _lnum.textColor=color;
                [self addSubview:_lnum];
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:CGRectMake(KZC_RLNUMS.origin.x+KZC_RLNUMS.size.width/2-2,KZC_RLNUMS.origin.y, KZC_RLNUMS.size.width/2, KZC_RLNUMS.size.height)];
                _lnum.text=@"0";
                _lnum.font=KZC_FONTPFM;
                _lnum.textColor=color;
                [self addSubview:_lnum];
                
            }else{
                _lnum=[[ZCPokerLabelNum alloc]initWithFrame:KZC_RLNUMS];
                _lnum.text=num;
                _lnum.font=KZC_FONTPFM;
                _lnum.textColor=color;
                [self addSubview:_lnum];
            }
            _ltype=[[ZCPokerLabelType alloc]initWithFrame:KZC_RLTYPES];
            _ltype.text=type;
            _ltype.font=KZC_FONTPFXXS;
            [self addSubview:_ltype];
        }
    }
    return self;
}
@end


