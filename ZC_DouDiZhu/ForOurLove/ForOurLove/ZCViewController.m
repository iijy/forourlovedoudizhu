//
//  ZCViewController.m
//  ForOurLove
//
//  Created by Iijy ZC on 13-11-21.
//  Copyright (c) 2013年 Iijy ZC. All rights reserved.
//

#import "ZCViewController.h"
#import "ZCObjects.h"
#import "ZCMethod.h"
#import "ZCPokerFaceView.h"
#import "ZCDefines.h"
#import "ACPButton.h"
@interface ZCViewController ()
{
    ZCMethod *mymethod;
    ZCPlayer *myplayerI;
    ZCPlayer *myplayerII;
    ZCPlayer *myplayerIII;
    int intJD;//焦点玩家plnum
    NSArray *arrx;
    NSArray *arrtxt;
    NSArray *arrtag;
    ZCLabelmiddle *mywarning;
    ZCLabelmiddle *myDZS;
    ZCLabelsmall *myFNB;
    ZCLabelScore *labelscore;
    int intBCCS;
    int intBJCS;//不叫的次数
    int intQCS;//抢的次数
    int intCSDZ;//第一个叫地主的plnum
    int intDZ;//地主plnum
    int intlastQ;//最后一个抢地主的
    int intBQCS;
}
@end

@implementation ZCViewController
@synthesize SaveAlertDelegate;
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view setBackgroundColor:KZC_CLWINDOWBG];
    [self formattostart];
    [self showcustomButtons];
	[self showcustomLabels];
    // Do any additional setup after loading the view, typically from a nib.
}
-(ZCPlayer *)getJDplayer:(int)jd{
    switch (jd) {
        case 1:
            return myplayerI;
            break;
        case 2:
            return myplayerII;
            break;
        case 3:
            return myplayerIII;
            break;
        default:
            return myplayerI;
            break;
    }
}
-(void)formattostart{
    intBJCS=0;
    intQCS=0;
    intDZ=0;
    intlastQ=0;
    mymethod=[[ZCMethod alloc]init];
    myplayerI=[[ZCPlayer alloc]init];
    myplayerI.plname=@"玩家A";
    myplayerI.plnum=1;
    myplayerI.plframe=KZC_RLSPA;
    myplayerII=[[ZCPlayer alloc]init];
    myplayerII.plname=@"玩家B";
    myplayerII.plnum=2;
    myplayerII.plframe=KZC_RLSPB;
    myplayerIII=[[ZCPlayer alloc]init];
    myplayerIII.plname=@"玩家C";
    myplayerIII.plnum=3;
    myplayerIII.plframe=KZC_RLSPC;
    arrx=@[@KZC_RBKAISHIX,@KZC_RBJDZX,@KZC_RBBJX,@KZC_RBQDZX,@KZC_RBBQX,
                     @KZC_RBCHUPAIX,@KZC_RBBUCHUX,@KZC_RBRESETX,@KZC_RBTISHIX];
    arrtag=@[@KZC_TAGKAISHI,@KZC_TAGJDZ,@KZC_TAGBJ,@KZC_TAGQDZ,@KZC_TAGBQ,
              @KZC_TAGCHUPAI,@KZC_TAGBUCHU,@KZC_TAGRESET,@KZC_TAGTISHI,@KZC_TAGREKAISHI];
    arrtxt=@[KZC_TXTKAISHI,KZC_TXTJDZ,KZC_TXTBJ,KZC_TXTQDZ,KZC_TXTBQ,
                      KZC_TXTCHUPAI,KZC_TXTBUCHU,KZC_TXTRESET,KZC_TXTTISHI,KZC_TXTREKAISHI];

    myplayerI.plcp.frame=KZC_RLJBJA;
    myplayerII.plcp.frame=KZC_RLJBJB;
    myplayerIII.plcp.frame=KZC_RLJBJC;
    myplayerI.plcp.hidden=YES;
    myplayerI.plcp.text=KZC_TXTBJ;
    myplayerII.plcp.hidden=YES;
    myplayerII.plcp.text=KZC_TXTBJ;
    myplayerIII.plcp.hidden=YES;
    myplayerIII.plcp.text=KZC_TXTBJ;
    [self.view addSubview:myplayerI.plcp];
    [self.view addSubview:myplayerII.plcp];
    [self.view addSubview:myplayerIII.plcp];
    myplayerI.plTS.frame=KZC_RLTSA;
    myplayerII.plTS.frame=KZC_RLTSB;
    myplayerIII.plTS.frame=KZC_RLTSC;
    myplayerI.plTS.hidden=YES;
    myplayerI.plTS.text=KZC_TXTBJ;
    myplayerII.plTS.hidden=YES;
    myplayerII.plTS.text=KZC_TXTBJ;
    myplayerIII.plTS.hidden=YES;
    myplayerIII.plTS.text=KZC_TXTBJ;
    [self.view addSubview:myplayerI.plTS];
    [self.view addSubview:myplayerII.plTS];
    [self.view addSubview:myplayerIII.plTS];
}
-(void)clearallpokerlabels{
//    for (int i=0; i<20; i++) {
//        ZCPokerFaceView *pokerview=(ZCPokerFaceView *)[self.view viewWithTag:100+i];
//        ZCPokerFaceViewHeight *pokerviewheight2=(ZCPokerFaceViewHeight *)[self.view viewWithTag:200+i];
//        ZCPokerFaceViewHeight *pokerviewheight3=(ZCPokerFaceViewHeight *)[self.view viewWithTag:300+i];
//        
//    }
//    [self.view.subviews ]
    NSArray *label=[self.view subviews];
    for (int i=0; i<[label count]; i++) {
        [label[i] removeFromSuperview];
    }
}
-(void)showcustomLabels{
    myDZS=[[ZCLabelmiddle alloc]init];
    myDZS.frame=KZC_RLDZS;
    [self.view addSubview:myDZS];
    myFNB=[[ZCLabelsmall alloc]init];
    myFNB.frame=KZC_RLFNB;
    [self.view addSubview:myFNB];
    mywarning=[[ZCLabelmiddle alloc]init];
    mywarning.frame=KZC_RLWARNING;
    [self.view addSubview:mywarning];
    labelscore=[[ZCLabelScore alloc]initwith:myplayerI :myplayerII :myplayerIII];
    [self.view addSubview:labelscore];
    
}
-(void)showcustomButtons{
    UIColor *color1= KZC_CLBUTTONCI;
    UIColor *color2= KZC_CLBUTTONCII;
    for (int i=0; i<[arrtxt count]; i++) {
        CGRect rect;
        ACPButton *mybutton=[[ACPButton alloc]init];
        if (i==[arrtxt count]-1) {
            rect=KZC_RBREKAISHI;
            mybutton.frame=rect;
        }else{
            rect=KZC_RBKAISHI;
            mybutton.frame=CGRectMake([arrx[i] intValue], rect.origin.y, rect.size.width, rect.size.height);
        }
        [mybutton setTitle:arrtxt[i] forState:UIControlStateNormal];
        [mybutton setStyle:color1 andBottomColor:color2];
        [mybutton setLabelTextColor:KZC_CLPOKERBG highlightedColor:KZC_CLPOKERRED disableColor:nil];
        mybutton.tag=[arrtag[i] intValue];
        [mybutton setCornerRadius:20];
        [mybutton setBorderStyle:nil andInnerColor:nil];
        [mybutton addTarget:self  action:@selector(theButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:mybutton];
        if (i>0&&i<[arrtxt count]-1) {
            mybutton.hidden=YES;
        }
    }
}

-(void)showpocketLabels:(ZCPlayer *)player{
    NSInteger count =[player.plpocket count];
    CGRect rect=player.plframe;
    ZCPoker *getpokers[count];
    for (int i=0; i<count; i++) {
        getpokers[i] = [player.plpocket objectAtIndex:i];
        if (player.plnum==1) {
             CGFloat startx=((count-1)*KZC_WIDTHPOCKETS+KZC_RLSPA.size.width)/2;
            if (getpokers[i].poisselected==YES) {
                getpokers[i].poview.frame=CGRectMake(rect.origin.x-startx+i*KZC_WIDTHPOCKETS,
                                                     rect.origin.y-KZC_HEIGHTADD,
                                                     rect.size.width, rect.size.height) ;
            }else getpokers[i].poview.frame=CGRectMake(rect.origin.x-startx+i*KZC_WIDTHPOCKETS,
                                                       rect.origin.y,
                                                       rect.size.width, rect.size.height) ;
            getpokers[i].poview.tag=player.plnum*100+i;
            [self.view addSubview:getpokers[i].poview];
        }
        else{
            if (getpokers[i].poisselected==YES) {
                getpokers[i].poviewheight.frame=CGRectMake(rect.origin.x-KZC_HEIGHTADD,
                                                           rect.origin.y+i*KZC_HEIGHTPOCKETS,
                                                           rect.size.width, rect.size.height) ;
            }else getpokers[i].poviewheight.frame=CGRectMake(rect.origin.x,
                                                             rect.origin.y+i*KZC_HEIGHTPOCKETS,
                                                             rect.size.width, rect.size.height) ;
            getpokers[i].poviewheight.tag=player.plnum*100+i;
            [self.view addSubview:getpokers[i].poviewheight];
        }
    }
}
-(void)showThreeLabels:(NSMutableArray *)pokerthree{
    pokerthree=[mymethod pocketsort:pokerthree];
    NSInteger count =[pokerthree count];
    CGRect rect=KZC_RLDZP;
    ZCPoker *getpokers[count];
    for (int i=0; i<count; i++) {
        getpokers[i] = [pokerthree objectAtIndex:i];
        ZCPokerFaceViewXSmall *threepokerview=[[ZCPokerFaceViewXSmall alloc]initwithnumandtype:getpokers[i].potext :getpokers[i].potype];
//        threepokerview.lnum.font=KZC_FONTPFXS;
        
        threepokerview.frame=CGRectMake(rect.origin.x+i*KZC_WIDTHPOCKETSS,
                                                  rect.origin.y,
                                                  rect.size.width, rect.size.height) ;
        threepokerview.tag=9*100+i;
        [self.view addSubview:threepokerview];
    }
}
-(void)showCPLabels:(NSMutableArray *)pokerCP{
    NSInteger count =[pokerCP count];
    CGFloat startx=((count-1)*KZC_WIDTHPOCKETSS+KZC_RLCPA.size.width)/2;
//    NSLog(@"%f",startx);
    CGRect rect;
    switch (intJD) {
        case 1:
            rect=CGRectMake(KZC_RLCPA.origin.x-startx, KZC_RLCPA.origin.y, KZC_RLCPA.size.width, KZC_RLCPA.size.height);
            break;
        case 2:
            rect=CGRectMake(KZC_RLCPB.origin.x-startx, KZC_RLCPB.origin.y, KZC_RLCPB.size.width, KZC_RLCPB.size.height);
            break;
        case 3:
            rect=CGRectMake(KZC_RLCPC.origin.x-startx, KZC_RLCPC.origin.y, KZC_RLCPC.size.width, KZC_RLCPC.size.height);
            break;
        default:
            break;
    }
    ZCPoker *getpokers[count];
    for (int i=0; i<count; i++) {
        getpokers[i] = pokerCP[i];
        ZCPokerFaceViewSmall *CPpokerview=[[ZCPokerFaceViewSmall alloc]initwithnumandtype:getpokers[i].potext :getpokers[i].potype];
        CPpokerview.frame=CGRectMake(rect.origin.x+i*KZC_WIDTHPOCKETSS,
                                                  rect.origin.y,
                                                  rect.size.width, rect.size.height) ;
        CPpokerview.tag=intJD*1000+i;
        [self.view addSubview:CPpokerview];
    }
}


-(void)hiddenbuttons:(int)buttontag{
    for (int i=0; i<[arrtag count]; i++) {
        if (buttontag==KZC_TAGKAISHI+i) {
            ACPButton *mybutton=(ACPButton *)[self.view viewWithTag:buttontag];
            mybutton.hidden=YES;
        }
    }
}//隐藏button*
-(void)unhiddenbuttons:(int)buttontag{
    for (int i=0; i<[arrtag count]; i++) {
        if (buttontag==KZC_TAGKAISHI+i) {
            ACPButton *mybutton=(ACPButton *)[self.view viewWithTag:buttontag];
            mybutton.hidden=NO;
        }
    }
}//显示button*
-(void)unhiddenLabel:(ZCPlayer *)player{
    player.plcp.hidden=NO;
}
-(void)hiddenLabel:(ZCPlayer *)player{
    player.plcp.hidden=YES;
}
-(void)unhiddenLabelTS:(ZCPlayer *)player{
    player.plTS.hidden=NO;
}
-(void)hiddenLabelTS:(ZCPlayer *)player{
    player.plTS.hidden=YES;
}
-(void)DZbirth{
    [self hiddenbuttons:KZC_TAGQDZ];
    [self hiddenbuttons:KZC_TAGBQ];
    [self hiddenbuttons:KZC_TAGJDZ];
    [self hiddenbuttons:KZC_TAGBJ];
    intDZ=intJD;
    myDZS.text=KZC_TXTDZS;
    myFNB.text=KZC_TXTFNB;
    mywarning.text=[NSString stringWithFormat:@"等待%@出牌",[self getJDplayer:intJD].plname];
    [mymethod jdz:[self getJDplayer:intDZ]];
    [self showThreeLabels:mymethod.methree];
    [self showpocketLabels:[self getJDplayer:intDZ]];

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:tapGesture];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self.view addGestureRecognizer:panGesture];
    [tapGesture requireGestureRecognizerToFail:panGesture];
    [self unhiddenbuttons:KZC_TAGCHUPAI];
    [self hiddenbuttons:KZC_TAGBUCHU];
    [self unhiddenbuttons:KZC_TAGRESET];
    [self unhiddenbuttons:KZC_TAGTISHI];
}//确定地主是。。。
-(void)btndothedeal{
    [self hiddenbuttons:KZC_TAGKAISHI];
    [mymethod startdeal:myplayerI :myplayerII :myplayerIII];
    [self showpocketLabels:myplayerI];
    [self showpocketLabels:myplayerII];
    [self showpocketLabels:myplayerIII];
    intJD=[mymethod whoistherickman];
    mywarning.text=[NSString stringWithFormat:@"%@叫地主？",[self getJDplayer:intJD].plname];
    [self unhiddenbuttons:KZC_TAGJDZ];
    [self unhiddenbuttons:KZC_TAGBJ];
}//发牌按钮触发事件
-(void)btnjdz{
    intBCCS=0;
    [self getJDplayer:intJD].pliswannabe=YES;
    [self getJDplayer:intJD].plcp.text=KZC_TXTJDZ;
    [self getJDplayer:intJD].plcp.hidden=NO;
    [self performSelector:@selector(hiddenLabel:) withObject:[self getJDplayer:intJD] afterDelay:1.0f];
    [self hiddenbuttons:KZC_TAGJDZ];
    [self hiddenbuttons:KZC_TAGBJ];
    intCSDZ=intJD;
    intlastQ=intJD;
    if (intBJCS==2) {
        [self DZbirth];
        return;
    }
    intJD=[mymethod jdscroll:intJD];
    mywarning.text=[NSString stringWithFormat:@"%@叫地主，%@是否抢地主？",[self getJDplayer:intCSDZ].plname,[self getJDplayer:intJD].plname];
    [self unhiddenbuttons:KZC_TAGQDZ];
    [self unhiddenbuttons:KZC_TAGBQ];
}//叫地主 按钮触发事件
-(void)btnbj{
    intBJCS++;
    [self getJDplayer:intJD].pliswannado=KZC_ISWANNADOBQ;
    [self getJDplayer:intJD].plcp.text=KZC_TXTBJ;
    [self getJDplayer:intJD].plcp.hidden=NO;
    [self performSelector:@selector(hiddenLabel:) withObject:[self getJDplayer:intJD] afterDelay:1.0f];
    NSString *str=[NSString stringWithFormat:@"%@",[self getJDplayer:intJD].plname];
    intJD=[mymethod bj:[self getJDplayer:intJD]];
    if (intBJCS==3) {
        [self DZbirth];
        return;
    }
    mywarning.text=[NSString stringWithFormat:@"%@没有叫地主，%@是否叫地主？",str,[self getJDplayer:intJD].plname];
}//不叫 按钮触发事件
-(void)btnqdz{
    intQCS++;
    [self getJDplayer:intJD].pliswannado=KZC_ISWANNADOQ;
    [self getJDplayer:intJD].plcp.text=KZC_TXTQDZ;
    [self getJDplayer:intJD].plcp.hidden=NO;
    [self performSelector:@selector(hiddenLabel:) withObject:[self getJDplayer:intJD] afterDelay:1.0f];
    if (intJD==intCSDZ) {
        [mymethod qdz:[self getJDplayer:intJD]];
        [self DZbirth];
        return;
    }
    if (intQCS==3) {
        intJD=intCSDZ;
        [mymethod qdz:[self getJDplayer:intJD]];
        [self DZbirth];
        return;
    }
    intlastQ=[self getJDplayer:intJD].plnum;
    intJD=[mymethod qdz:[self getJDplayer:intJD]];
    if ([self getJDplayer:intJD].pliswannabe==NO&&[self getJDplayer:intJD].pliswannado==KZC_ISWANNADOBQ) {
        intJD=[mymethod bq:[self getJDplayer:intJD]];
    }
    mywarning.text=[NSString stringWithFormat:@"%@是否抢地主？",[self getJDplayer:intJD].plname];
}//抢地主 按钮触发事件
-(void)btnbq{
    intBQCS++;
    [self getJDplayer:intJD].pliswannado=KZC_ISWANNADOBQ;
    [self getJDplayer:intJD].plcp.text=KZC_TXTBQ;
    [self getJDplayer:intJD].plcp.hidden=NO;
    [self performSelector:@selector(hiddenLabel:) withObject:[self getJDplayer:intJD] afterDelay:1.0f];
    if (intBQCS==2) {
        intJD=intlastQ;
        [self DZbirth];
        return;
    }
    if (intJD==intCSDZ) {
        intJD=intlastQ;
        [self DZbirth];
        return;
    }
    intJD=[mymethod bq:[self getJDplayer:intJD]];
    if ([self getJDplayer:intJD].pliswannabe==NO&&[self getJDplayer:intJD].pliswannado==KZC_ISWANNADOBQ) {
        intJD=[mymethod bq:[self getJDplayer:intJD]];
        if (intJD==intlastQ) {
            [self DZbirth];
            return;
        }
    }
    mywarning.text=[NSString stringWithFormat:@"%@是否抢地主？",[self getJDplayer:intJD].plname];
}//不抢 按钮触发事件

-(void)btnreset{
    ZCPlayer *playerJD=[self getJDplayer:intJD];
    NSInteger count=[playerJD.plpocket count];
    ZCPoker *getpokers[count];
    if (intJD==1) {
        for (int i=0; i<count; i++) {
            getpokers[i]=playerJD.plpocket[i];
            ZCPokerFaceView *labelpoker=(ZCPokerFaceView *)[self.view viewWithTag:playerJD.plnum*100+i];
            if (getpokers[i].poisselected==YES) {
                getpokers[i].poisselected=NO;
                labelpoker.frame=CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y+KZC_HEIGHTADD,labelpoker.frame.size.width,labelpoker.frame.size.height);
            }
        }
    }else{
        for (int i=0; i<count; i++) {
            getpokers[i]=playerJD.plpocket[i];
            ZCPokerFaceView *labelpoker=(ZCPokerFaceView *)[self.view viewWithTag:playerJD.plnum*100+i];
            if (getpokers[i].poisselected==YES) {
                getpokers[i].poisselected=NO;
                labelpoker.frame=CGRectMake(labelpoker.frame.origin.x+KZC_HEIGHTADD, labelpoker.frame.origin.y,labelpoker.frame.size.width,labelpoker.frame.size.height);
            }
        }
    }

}//重置 按钮触发事件
-(void)btnchupai{
    intBCCS=0;
    
    NSInteger countcpq1=[mymethod.mecp count];
    for (int i=0; i<countcpq1; i++) {
        ZCPokerFaceViewSmall *CPpokerview=(ZCPokerFaceViewSmall *)[self.view viewWithTag:intJD*1000+i];
        [CPpokerview removeFromSuperview];
    }
    ZCPlayer *playerJD=[self getJDplayer:intJD];
    NSInteger count=[playerJD.plpocket count];
    ZCPoker *getpoker[count];
    for (int i=0; i<count; i++) {
        getpoker[i]=playerJD.plpocket[i];
    }
    int result=[mymethod chupai:playerJD];
    switch (result) {
        case KZC_CANNOTI:
            [self chupaialert1];
            break;
        case KZC_CANNOTII:
            [self chupaialert2];
            break;
        case KZC_CANNOTIII:
            [self chupaialert3];
            break;
        case KZC_BUMBSBIG:
            [self removeCPQ:countcpq1];
            
            for (int i=0; i<count; i++) {
                if (playerJD.plnum==1) {
                    [getpoker[i].poview removeFromSuperview];
                }else [getpoker[i].poviewheight removeFromSuperview];
            }
            //            [self showThreeLabels:mymethod.methree];
            [self showCPLabels: mymethod.mecp];
            [self showpocketLabels:playerJD];
            intJD=[mymethod jdscroll:intJD];
            [self getJDplayer:intJD].plTS.text=KZC_TXTPOOL;
            [self getJDplayer:intJD].plTS.hidden=NO;
            [self performSelector:@selector(hiddenLabelTS:) withObject:[self getJDplayer:intJD] afterDelay:1.0f];
            intJD=[mymethod jdscroll:intJD];
            [self getJDplayer:intJD].plTS.text=KZC_TXTPOOL;
            [self getJDplayer:intJD].plTS.hidden=NO;
            [self performSelector:@selector(hiddenLabelTS:) withObject:[self getJDplayer:intJD] afterDelay:1.0f];
            if ([self winthegame]) {
                return;
            }
            [self unhiddenbuttons:KZC_TAGBUCHU];
            //            [self unhiddenbuttons:KZC_TAGTISHI];
            intJD=[mymethod jdscroll:intJD];
            mywarning.text=KZC_TXTWAITING;
            break;
        case KZC_BUMB:
            [self removeCPQ:countcpq1];
        default:
            for (int i=0; i<count; i++) {
                if (playerJD.plnum==1) {
                     [getpoker[i].poview removeFromSuperview];
                }else [getpoker[i].poviewheight removeFromSuperview];
            }
//            [self showThreeLabels:mymethod.methree];
            [self showCPLabels: mymethod.mecp];
            [self showpocketLabels:playerJD];
            if ([self winthegame]) {
                return;
            }
            [self unhiddenbuttons:KZC_TAGBUCHU];
            //            [self unhiddenbuttons:KZC_TAGTISHI];
            intJD=[mymethod jdscroll:intJD];
            NSInteger countcpq1=[mymethod.mecp count];
            for (int i=0; i<countcpq1; i++) {
                ZCPokerFaceViewSmall *CPpokerview=(ZCPokerFaceViewSmall *)[self.view viewWithTag:intJD*1000+i];
                [CPpokerview removeFromSuperview];
            }
            mywarning.text=KZC_TXTWAITING;
            break;
    }
}//出牌 按钮触发事件
-(void)btnbuchu{
    ZCPlayer *playerJD=[self getJDplayer:intJD];
    NSInteger count=[playerJD.plpocket count];
    ZCPoker *getpokers[count];
    if (intJD==1) {
        for (int i=0; i<count; i++) {
            getpokers[i]=playerJD.plpocket[i];
            ZCPokerFaceView *labelpoker=(ZCPokerFaceView *)[self.view viewWithTag:playerJD.plnum*100+i];
            if (getpokers[i].poisselected==YES) {
                getpokers[i].poisselected=NO;
                labelpoker.frame=CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y+KZC_HEIGHTADD,labelpoker.frame.size.width,labelpoker.frame.size.height);
            }
        }
    }else{
        for (int i=0; i<count; i++) {
            getpokers[i]=playerJD.plpocket[i];
            ZCPokerFaceView *labelpoker=(ZCPokerFaceView *)[self.view viewWithTag:playerJD.plnum*100+i];
            if (getpokers[i].poisselected==YES) {
                getpokers[i].poisselected=NO;
                labelpoker.frame=CGRectMake(labelpoker.frame.origin.x+KZC_HEIGHTADD, labelpoker.frame.origin.y,labelpoker.frame.size.width,labelpoker.frame.size.height);
            }
        }
    }
    intBCCS++;
    playerJD.plcp.text=KZC_TXTBUCHU;
    playerJD.plcp.hidden=NO;
    [self performSelector:@selector(hiddenLabel:) withObject:playerJD afterDelay:1.0f];
    NSInteger countcpq=[mymethod.mecp count];
    for (int i=0; i<countcpq; i++) {
        ZCPokerFaceViewSmall *CPpokerview=(ZCPokerFaceViewSmall *)[self.view viewWithTag:intJD*1000+i];
        [CPpokerview removeFromSuperview];
    }
    intJD=[mymethod jdscroll:intJD];
    mywarning.text=KZC_TXTWAITING;
    if (intBCCS==2) {
        intBCCS=0;
        [self removeCPQ:countcpq];
        [mymethod.mecp removeAllObjects];
        mymethod.mecp=[NSMutableArray new];
        [self hiddenbuttons:KZC_TAGBUCHU];
//        [self unhiddenbuttons:KZC_TAGTISHI];
    }
}//不出 按钮触发事件
-(void)removeCPQ:(NSInteger)count{
    for (int i=0; i<count; i++) {
        ZCPokerFaceViewSmall *CPpokerview=(ZCPokerFaceViewSmall *)[self.view viewWithTag:1000+i];
        [CPpokerview removeFromSuperview];
        CPpokerview=(ZCPokerFaceViewSmall *)[self.view viewWithTag:2000+i];
        [CPpokerview removeFromSuperview];
        CPpokerview=(ZCPokerFaceViewSmall *)[self.view viewWithTag:3000+i];
        [CPpokerview removeFromSuperview];
    }
}
-(void)btntishi{
    ZCPlayer *playerJD=[self getJDplayer:intJD];
    NSString *str=[mymethod tishi:mymethod.mecp :playerJD.plpocket];
    if ([str isEqualToString:KZC_TXTPOOL]) {
        intBCCS++;
        playerJD.plTS.text=str;
        [self.view addSubview: playerJD.plTS];
        playerJD.plTS.hidden=NO;
        [self performSelector:@selector(hiddenLabelTS:) withObject:playerJD afterDelay:1.0f];
        playerJD.plcanornot=KZC_CANNOTCP;
        intJD=[mymethod jdscroll:intJD];
        if (intBCCS==2) {
            intBCCS=0;
            [self removeCPQ:[mymethod.mecp count]];
            [mymethod.mecp removeAllObjects];
            mymethod.mecp=[NSMutableArray new];
            [self hiddenbuttons:KZC_TAGBUCHU];
//            [self unhiddenbuttons:KZC_TAGTISHI];
        }
        mywarning.text=KZC_TXTWAITING;
    }
    [self showpocketLabels:[self getJDplayer:intJD]];
    
}//提示 按钮触发事件

-(void)theButtonClick:(UIButton *)button{
    switch (button.tag) {
        case KZC_TAGREKAISHI:
            [self clearallpokerlabels];
            [self formattostart];
            [self showcustomButtons];
            [self showcustomLabels];
            break;
        case KZC_TAGKAISHI:
            [self btndothedeal];
            break;
        case KZC_TAGBJ:
            [self btnbj];
            break;
        case KZC_TAGJDZ:
            [self btnjdz];
            break;
        case KZC_TAGBQ:
            [self btnbq];
            break;
        case KZC_TAGQDZ:
            [self btnqdz];
            break;
        case KZC_TAGCHUPAI:
            [self btnchupai];
            break;
        case KZC_TAGBUCHU:
            [self btnbuchu];
            break;
        case KZC_TAGRESET:
            [self btnreset];
            break;
        case KZC_TAGTISHI:
            [self btntishi];
            break;
        default:
            break;
    }
}


-(void)handleGesture:(UIGestureRecognizer *)gestureRecognizer{
    int yy=0;
    ZCPlayer *playerJD=[self getJDplayer:intJD];
    NSInteger count=[playerJD.plpocket count];
    ZCPoker *getpokers[count];
    if (intJD==1) {
        CGPoint locationTouch = [gestureRecognizer locationInView:self.view];
        for (int i=0; i<count; i++) {
            getpokers[i]=playerJD.plpocket[i];
            ZCPokerFaceView *labelpoker=(ZCPokerFaceView *)[self.view viewWithTag:playerJD.plnum*100+i];
            if(CGRectContainsPoint(CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y, KZC_WIDTHPOCKETS, labelpoker.frame.size.height) , locationTouch)){
                yy=labelpoker.frame.origin.y;
                if (getpokers[i].poisselected==NO) {
                    getpokers[i].poisselected=YES;
                    labelpoker.frame=CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y-KZC_HEIGHTADD,labelpoker.frame.size.width,labelpoker.frame.size.height);
                }else{
                    getpokers[i].poisselected=NO;
                    labelpoker.frame=CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y+KZC_HEIGHTADD,labelpoker.frame.size.width,labelpoker.frame.size.height);
                }
            }
        }

    }
    else{
        CGPoint locationTouch = [gestureRecognizer locationInView:self.view];
        for (int i=0; i<count; i++) {
            getpokers[i]=playerJD.plpocket[i];
            ZCPokerFaceViewHeight *labelpoker=(ZCPokerFaceViewHeight *)[self.view viewWithTag:playerJD.plnum*100+i];
            if(CGRectContainsPoint(CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y, labelpoker.frame.size.width,KZC_HEIGHTPOCKETS ) , locationTouch)){
                yy=labelpoker.frame.origin.y;
                if (getpokers[i].poisselected==NO) {
                    getpokers[i].poisselected=YES;
                    labelpoker.frame=CGRectMake(labelpoker.frame.origin.x-KZC_HEIGHTADD, labelpoker.frame.origin.y,labelpoker.frame.size.width,labelpoker.frame.size.height);
                }else{
                    getpokers[i].poisselected=NO;
                    labelpoker.frame=CGRectMake(labelpoker.frame.origin.x+KZC_HEIGHTADD, labelpoker.frame.origin.y,labelpoker.frame.size.width,labelpoker.frame.size.height);
                }
            }
        }
        
    }
}//提牌手势
-(void)panGesture:(UIGestureRecognizer *)sender{
    int yy=0;
    CGPoint locationB;
    CGPoint locationE;

    ZCPlayer *playerJD=[self getJDplayer:intJD];
    NSInteger count=[playerJD.plpocket count];
    ZCPoker *getpokers[count];
    if (intJD==1) {
        if(([sender state] == UIGestureRecognizerStateBegan || [sender state] == UIGestureRecognizerStateChanged)){
            
            //        CGPoint translation = [sender translationInView:[self.firstLayerView superview]];
            locationB = [sender locationInView:self.view];
            for (int i=0; i<count; i++) {
                getpokers[i]=playerJD.plpocket[i];
                ZCPokerFaceView *labelpoker=(ZCPokerFaceView *)[self.view viewWithTag:playerJD.plnum*100+i];
                if(CGRectContainsPoint(CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y, KZC_WIDTHPOCKETS, labelpoker.frame.size.height) , locationB)){
                    yy=labelpoker.frame.origin.y;
                    if (getpokers[i].poisselected==NO) {
                        getpokers[i].poisselected=YES;
                        labelpoker.frame=CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y-KZC_HEIGHTADD,labelpoker.frame.size.width,labelpoker.frame.size.height);
                    }else{
                        getpokers[i].poisselected=NO;
                        labelpoker.frame=CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y+KZC_HEIGHTADD,labelpoker.frame.size.width,labelpoker.frame.size.height);
                    }
                }
            }
        }
        else if([sender state] == UIGestureRecognizerStateEnded){
            locationE = [sender locationInView:self.view];
            if (abs(locationB.y-locationE.y)<80) {
                for (int i=0; i<count; i++) {
                    getpokers[i]=playerJD.plpocket[i];
                    ZCPokerFaceView *labelpoker=(ZCPokerFaceView *)[self.view viewWithTag:playerJD.plnum*100+i];
                    if(CGRectContainsPoint(CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y, KZC_WIDTHPOCKETS, labelpoker.frame.size.height) , locationE)){
                        yy=labelpoker.frame.origin.y;
                        if (getpokers[i].poisselected==NO) {
                            getpokers[i].poisselected=YES;
                            labelpoker.frame=CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y-KZC_HEIGHTADD,labelpoker.frame.size.width,labelpoker.frame.size.height);
                        }else{
                            getpokers[i].poisselected=NO;
                            labelpoker.frame=CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y+KZC_HEIGHTADD,labelpoker.frame.size.width,labelpoker.frame.size.height);
                        }
                    }
                }
            }
        }

    }
    else {
        if(([sender state] == UIGestureRecognizerStateBegan|| [sender state] == UIGestureRecognizerStateChanged)){
            //        CGPoint translation = [sender translationInView:[self.firstLayerView superview]];
            locationB = [sender locationInView:self.view];
            for (int i=0; i<count; i++) {
                getpokers[i]=playerJD.plpocket[i];
                ZCPokerFaceViewHeight *labelpoker=(ZCPokerFaceViewHeight *)[self.view viewWithTag:playerJD.plnum*100+i];
                if(CGRectContainsPoint(CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y, labelpoker.frame.size.width, KZC_HEIGHTPOCKETS) , locationB)){
                    yy=labelpoker.frame.origin.y;
                    if (getpokers[i].poisselected==NO) {
                        getpokers[i].poisselected=YES;
                        labelpoker.frame=CGRectMake(labelpoker.frame.origin.x-KZC_HEIGHTADD, labelpoker.frame.origin.y,labelpoker.frame.size.width,labelpoker.frame.size.height);
                    }else{
                        getpokers[i].poisselected=NO;
                        labelpoker.frame=CGRectMake(labelpoker.frame.origin.x+KZC_HEIGHTADD, labelpoker.frame.origin.y,labelpoker.frame.size.width,labelpoker.frame.size.height);
                    }
                }
            }
        }
        else if([sender state] == UIGestureRecognizerStateEnded){
            locationE = [sender locationInView:self.view];
            if (abs(locationB.x-locationE.x)<80) {
                for (int i=0; i<count; i++) {
                    getpokers[i]=playerJD.plpocket[i];
                    ZCPokerFaceViewHeight *labelpoker=(ZCPokerFaceViewHeight *)[self.view viewWithTag:playerJD.plnum*100+i];
                    if(CGRectContainsPoint(CGRectMake(labelpoker.frame.origin.x, labelpoker.frame.origin.y, labelpoker.frame.size.width, KZC_HEIGHTPOCKETS) , locationE)){
                        yy=labelpoker.frame.origin.y;
                        if (getpokers[i].poisselected==NO) {
                            getpokers[i].poisselected=YES;
                            labelpoker.frame=CGRectMake(labelpoker.frame.origin.x-KZC_HEIGHTADD, labelpoker.frame.origin.y,labelpoker.frame.size.width,labelpoker.frame.size.height);
                        }else{
                            getpokers[i].poisselected=NO;
                            labelpoker.frame=CGRectMake(labelpoker.frame.origin.x+KZC_HEIGHTADD, labelpoker.frame.origin.y,labelpoker.frame.size.width,labelpoker.frame.size.height);
                        }
                    }
                }
            }
        }
        
    }
}//滑动提牌手势 问题 有待改进

-(BOOL)winthegame{
    ZCPlayer *playerJD=[self getJDplayer:intJD];
    if ([playerJD.plpocket count]==0) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"游戏结束"  message:@"恭喜您！" delegate: self cancelButtonTitle:@"结束游戏" otherButtonTitles:@"重新开始", nil];
        [alert show];
        return YES;
    }
    return NO;
}//焦点玩家手牌为0，游戏结束弹出提示
#pragma about alert delegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            ;
            break;
        case 1:
            [self clearallpokerlabels];
            [self formattostart];
            [self showcustomButtons];
            [self showcustomLabels];
            break;
        default:
            break;
    }
    
}//游戏结束弹出提示按钮功能
-(void)chupaialert2{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"出牌失败"  message:@"您的出牌不符合规则！" delegate: SaveAlertDelegate cancelButtonTitle:@"知道了" otherButtonTitles:nil];
    [alert show];}//若预出牌不符合规定
-(void)chupaialert3{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"出牌失败"  message:@"您的牌没有大过上家！" delegate: SaveAlertDelegate cancelButtonTitle:@"知道了" otherButtonTitles:nil];
    [alert show];}//若预出牌小于出牌区的牌弹出提示
-(void)chupaialert1{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"出牌失败"  message:@"请您出牌！" delegate: SaveAlertDelegate cancelButtonTitle:@"知道了" otherButtonTitles:nil];
    [alert show];}//若出牌区没有牌，当前焦点必须出牌
@end
