//
//  ZCMethod.m
//  ForOurLove
//
//  Created by Iijy ZC on 13-11-21.
//  Copyright (c) 2013年 Iijy ZC. All rights reserved.
//

#import "ZCMethod.h"
#import "ZCObjects.h"
#import "ZCDefines.h"

@implementation ZCMethod
-(id)init{
    self.mebp=[NSMutableArray new];
    self.mecp=[NSMutableArray new];
    self.methree=[NSMutableArray new];
    self.me54=[NSMutableArray new];
    self.metimes=1;
    [self forpokers];
    return self;
}
-(NSMutableArray *)forpokers{
    NSArray *arr=[[NSArray alloc]initWithObjects:@"♠️",@"♥️",@"♣️",@"♦️",@"🐶",@"🐱",nil];
    ZCPoker *poker[54];
    poker[0]=[ZCPoker new];
    poker[0].ponum=50;
    poker[0].potype=arr[4];
    poker[0].potext=[NSString stringWithFormat:@"%@",poker[0].potype];
    for (int j=0, k=1; j<4; j++) {
        for (int i=0; i<13; i++) {
            poker[k]=[ZCPoker new];
            poker[k].potype=arr[j];
            poker[k].potypenum=j+1;
            if (j==0||j==3) {
                poker[k].pocolor=[UIColor redColor];
            }else poker[k].pocolor=[UIColor blackColor];
            if (i==0) {
                poker[k].ponum=20;
            }
            else poker[k].ponum=2+i;
            switch (poker[k].ponum) {
                case 20:
                    poker[k].potext=[NSString stringWithFormat:@"2"];
                    break;
                case 11:
                    poker[k].potext=[NSString stringWithFormat:@"J"];
                    break;
                case 12:
                    poker[k].potext=[NSString stringWithFormat:@"Q"];
                    break;
                case 13:
                    poker[k].potext=[NSString stringWithFormat:@"K"];
                    break;
                case 14:
                    poker[k].potext=[NSString stringWithFormat:@"A"];
                    break;
                default:
                    poker[k].potext=[NSString stringWithFormat:@"%d",poker[k].ponum];
                    break;
            }
            k++;
        }
    }
    poker[53]=[ZCPoker new];
    poker[53].ponum=100;
    poker[53].potype=arr[5];
    poker[53].potext=[NSString stringWithFormat:@"%@",poker[53].potype];
    for (int i=0; i<54; i++){
        
        poker[i].poview=[[ZCPokerFaceView alloc]initwithnumandtype:
                         poker[i].potext:poker[i].potype];
        poker[i].poviewsmall=[[ZCPokerFaceViewSmall alloc]initwithnumandtype:
                         poker[i].potext :poker[i].potype];
        poker[i].poviewheight=[[ZCPokerFaceViewHeight alloc]initwithnumandtype:
                                 poker[i].potext :poker[i].potype];
//        poker[i].poview=[poker[i].poview init];
        [self.me54 addObject:poker[i]];
//        ZCPoker *getpoker=[ZCPoker new];
//        getpoker=[self.me54 objectAtIndex:i];
//        NSLog(@"%@",getpoker.potext);
    }
    return self.me54;
}//给54张牌赋值
-(BOOL)startdeal:(ZCPlayer *)PlayerI :(ZCPlayer *)PlayerII :(ZCPlayer *)PlayerIII{
    NSMutableArray *arrayAll=self.me54;
    for (int i = 0; i < 51; i=i+3) {
        int index1 = arc4random() % (54 - i); //0~54随机数
        [PlayerI.plpocket addObject:[arrayAll objectAtIndex:index1]];
        [arrayAll removeObjectAtIndex:index1];
        int index2 = arc4random() % (54 - (i+1)); //0~54随机数
        [PlayerII.plpocket addObject:[arrayAll objectAtIndex:index2]];
        [arrayAll removeObjectAtIndex:index2];
        int index3 = arc4random() % (54 - (i+2)); //0~54随机数
        [PlayerIII.plpocket addObject:[arrayAll objectAtIndex:index3]];
        [arrayAll removeObjectAtIndex:index3];
    }//各发17张牌
    for (int i=0; i<3; i++) {
        [self.methree addObject:[arrayAll objectAtIndex:i]];
    }
    PlayerI.plpocket=[self pocketsort:PlayerI.plpocket];
    PlayerII.plpocket=[self pocketsort:PlayerII.plpocket];
    PlayerIII.plpocket=[self pocketsort:PlayerIII.plpocket];
    return YES;
}  //发牌

-(NSMutableArray *)pocketsort:(NSMutableArray *)playerpocket{
    NSInteger num=[playerpocket count];
    NSMutableArray *sortedpocket=[NSMutableArray arrayWithCapacity:20];
    ZCPoker *getpoker[num];
    ZCPoker *ls;
    for (int i=0; i<num; i++) {
       getpoker[i]= [playerpocket objectAtIndex:i] ;
    }
    for (NSInteger i=num-1; i>=0; i--) {
        for (int j=0; j<=i; j++) {
            if (getpoker[i].ponum>getpoker[i-j].ponum) {
                ls=getpoker[i];
                getpoker[i]=getpoker[i-j];
                getpoker[i-j]=ls;
            }
        }
    }
    
    for (NSInteger i=num-1; i>=0; i--) {
        for (int j=0; j<=i; j++) {
            if (getpoker[i].ponum==getpoker[i-j].ponum) {
                if (getpoker[i].potypenum<getpoker[i-j].potypenum) {
                    ls=getpoker[i];
                    getpoker[i]=getpoker[i-j];
                    getpoker[i-j]=ls;
                }
            }
        }
    }
    for (int i=0; i<num; i++) {
        [sortedpocket addObject:getpoker[i]];
    }
    return  sortedpocket;
} //排序
-(int)whoistherickman{
    int index= arc4random() % 3+1;
    return index;
}//随机产生地主
-(int)jdscroll:(int)oriJD{
    if (oriJD==3) return 1;
    return oriJD+1;
} //循环焦点
-(void)dealtherichman:(ZCPlayer *)Player{
    Player.plisrich=YES;
    for (int  i=0; i<3; i++) {
        ZCPoker *getpoker=[ZCPoker new];
        getpoker=[self.me54 objectAtIndex:i];
        
        getpoker.poisselected=YES;
       
        [self.me54 removeObjectAtIndex:i];
        [self.me54 insertObject:getpoker atIndex:i];
        [Player.plpocket addObject:[self.me54 objectAtIndex:i]];
    }
    Player.plpocket=[self pocketsort:Player.plpocket];
    int i=Player.plnum;
    printf("\n(地主)%d\n",i);
}//发地主牌
-(int)jdz:(ZCPlayer *)player{
    [self dealtherichman:player];
    return player.plnum;
}//叫地主
-(int)bj:(ZCPlayer *)player{
    return [self jdscroll:player.plnum];
}//不叫
-(int)qdz:(ZCPlayer *)player{
    self.metimes++;
    return [self jdscroll:player.plnum];
}//抢地主
-(int)bq:(ZCPlayer *)player{
    return [self jdscroll:player.plnum];
}//不抢
//---------------------------------v出牌相关v--------------------------------------------------
-(int)chupai:(ZCPlayer *)player{
    self.errornum=0;
    int bint=0;
    int cint=0;
    [self.mebp removeAllObjects];
    self.mebp=[NSMutableArray new];
    NSInteger count=[player.plpocket count];
    ZCPoker *getpoket[count];
    for (int i=0; i<count; i++) {
        getpoket[i]=player.plpocket[i];
        if(getpoket[i].poisselected==YES){
            [self.mebp addObject:getpoket[i]];
        };
    }
//          NSLog(@"bcount=%lu",(unsigned long)[self.mebp count]);
    if ([self.mebp count]==0) {
        self.errornum=KZC_CANNOTI;
    }else{
        bint=[self firstjudge:self.mebp];
        cint=[self firstjudge:self.mecp];
//        NSLog(@"bint=%d,cint=%d",bint,cint);
        if (bint==KZC_CANNOTII) {
            self.errornum=KZC_CANNOTII;
        }else{
            if (cint==0) {
                [self dochupai:player];
            }else if (bint==cint){
                if ([self secondjudge:self.mebp :self.mecp :bint]) {
                    [self dochupai:player];
                }else self.errornum=KZC_CANNOTIII;
            }else if (bint==KZC_BUMB||bint==KZC_BUMBSBIG){
                [self dochupai:player];
                return bint;
            }else self.errornum=KZC_CANNOTII;
        }
    }

    if (self.errornum==0) {
        return YES;
    }else return self.errornum;
}
-(BOOL)dochupai:(ZCPlayer *)player{
    [self.mecp removeAllObjects];
    self.mecp=[NSMutableArray new];
    NSInteger count=self.mebp.count;
    for (int i =0; i<count; i++) {
        [self.mecp addObject:self.mebp[i]];
        [player.plpocket removeObject:self.mebp[i]];
    }
    return YES;
}//出牌成不成功
-(int)firstjudge:(NSMutableArray *)arrayC{
    int judgement=0;
    NSInteger count=[arrayC count];
    ZCPoker *getpokers[count];
    for (int i=0; i<count; i++) {
        getpokers[i]=[arrayC objectAtIndex:i];
    }
    if (count>0) {
        if ([self isthestraight:arrayC]) {
            if ([self istheflush:arrayC]) {
                judgement=KZC_STRAIGHTFLUSH;
                return judgement;
            }
            judgement=KZC_STRAIGHT;
            return judgement;
        }
        else {
            ZCSeparateArray *mySA=[self separatethearray:arrayC];
            judgement=mySA.classnum;
            if (arrayC==self.mebp) {
                self.mebp=mySA.arrreset;
            }
            return judgement;
        }

    }
    
    //    NSLog(@"judgement=%d",judgement);
    return judgement;
}    //判定出牌规模，返回规模编号
-(BOOL)secondjudge :(NSMutableArray *)arrayNext :(NSMutableArray *)arrayNow :(int) fj{
    NSInteger count=[arrayNext count];
    ZCPoker *getpokersNext[count];
    ZCPoker *getpokersNow[count];
    for (int i=0; i<count; i++) {
        getpokersNext[i]=[arrayNext objectAtIndex:i];
        getpokersNow[i]=[arrayNow objectAtIndex:i];
    }
    if (getpokersNext[0].ponum>getpokersNow[0].ponum) {
        return YES;
    }else return NO;
}  //判定桌面前一玩家出的牌与当前玩家将要出的牌比较，当前大则替换之，小则清零
-(BOOL)istheflush:(NSMutableArray *)arrayC{
    NSInteger count=[arrayC count];
    if (count<5) {
        return NO;
    }
    ZCPoker *getpokers[count];
    for (int i=0; i<count; i++) {
        getpokers[i]=[arrayC objectAtIndex:i];
    }
    for (int i=0; i<(count-1); i++) {
        if (getpokers[i].potype!=getpokers[i+1].potype) {
            return NO;
        }
    }
    return YES;
}//N张牌的顺子判定是否同花，是yes，不是no
-(BOOL)isthestraight:(NSMutableArray *)arrayC{
    NSInteger count=[arrayC count];
    ZCPoker *getpokers[count];
    for (int i=0; i<count; i++) {
        getpokers[i]=[arrayC objectAtIndex:i] ;
    }
    if (count<5||(getpokers[0].ponum>14)) {
        return NO;
    }
    if (getpokers[0].ponum<=14) {
        for (int i=0; i<(count-1); i++) {
            if (getpokers[i].ponum!=getpokers[i+1].ponum+1) {
                return NO;
            }
        }
    }
    return YES;
}//顺子
-(ZCSeparateArray *)separatethearray:(NSMutableArray *)arrayC{
    ZCSeparateArray *mysa=[ZCSeparateArray new];
    mysa.countfours=0;
    mysa.counttrips=0;
    mysa.countdoubles=0;
    mysa.countsingles=0;
    mysa.classnum=0;
    mysa.arrfours=[NSMutableArray new];
    mysa.arrtrips=[NSMutableArray new];
    mysa.arrdouble=[NSMutableArray new];
    mysa.arrsingle=[NSMutableArray new];
    mysa.arrreset=[NSMutableArray new];
    ZCPoker *getpokersdouble[10];
    ZCPoker *getpokerstrips[6];
    NSInteger count=[arrayC count];
    ZCPoker *getpokers[count];
    for (int i=0; i<count; i++) {
        getpokers[i]=arrayC[i];
    }
    if (count==2&&getpokers[0].ponum==100&&getpokers[1].ponum==50){
        mysa.classnum=KZC_BUMBSBIG;
        [mysa.arrreset addObject:getpokers[0]];
        [mysa.arrreset addObject:getpokers[1]];
        return mysa;
    }
    for (int i=0; i<count; ) {
        if ((i+1<count)&&getpokers[i].ponum==getpokers[i+1].ponum) {
            if ((i+2<count)&&getpokers[i].ponum==getpokers[i+2].ponum) {
                if ((i+3<count)&&getpokers[i].ponum==getpokers[i+3].ponum) {
                    [mysa.arrfours addObject:getpokers[i]];
                    [mysa.arrfours addObject:getpokers[i+1] ];
                    [mysa.arrfours addObject:getpokers[i+2] ];
                    [mysa.arrfours addObject:getpokers[i+3] ];
                    i=i+4;
                }else{
                    [mysa.arrtrips addObject:getpokers[i] ];
                    [mysa.arrtrips addObject:getpokers[i+1] ];
                    [mysa.arrtrips addObject:getpokers[i+2] ];
                    i=i+3;
                }
            }else{
                [mysa.arrdouble addObject:getpokers[i] ];
                [mysa.arrdouble addObject:getpokers[i+1] ];
                i=i+2;
            }
        }else {
            [mysa.arrsingle addObject:getpokers[i] ];
            i++;
        }
    }
    mysa.countfours=[mysa.arrfours count]/4;
    mysa.counttrips=[mysa.arrtrips count]/3;
    mysa.countdoubles=[mysa.arrdouble count]/2;
    mysa.countsingles=[mysa.arrsingle count];
    if (mysa.countfours>1) {
        mysa.classnum=KZC_CANNOTII;
        return mysa;
    }else if (mysa.countfours==1&&mysa.countdoubles==2&&mysa.countsingles==0&&mysa.counttrips==0){
        mysa.classnum=KZC_FOURANDTOWTOW;
    }else if (mysa.countfours==1&&mysa.countdoubles==0&&mysa.countsingles==2&&mysa.counttrips==0){
        mysa.classnum=KZC_FOURANDONEONE;
    }else if (mysa.countfours==1&&mysa.countdoubles==0&&mysa.countsingles==0&&mysa.counttrips==0){
        mysa.classnum=KZC_BUMB;
    }else if (mysa.countfours==1){
        mysa.classnum=KZC_CANNOTII;
        return mysa;
    }
    else if (mysa.counttrips>0) {
        for (int i=0,j=0; i<[mysa.arrtrips count]; i=i+3,j++) {
            getpokerstrips[j]=[mysa.arrtrips objectAtIndex:i];
        }
        for (int i=0; i<mysa.counttrips-1; i++) {
            if (getpokerstrips[i].ponum!=(getpokerstrips[i+1].ponum+1)){
                mysa.classnum=KZC_CANNOTII;
                return mysa;
            }
        }
        if (mysa.countsingles==0&&mysa.countdoubles==0) {
            mysa.classnum=KZC_TRIPS;
        }else if (mysa.countdoubles==mysa.counttrips&&mysa.countsingles==0){
            mysa.classnum=KZC_TRIPSANDII;
        }else if (mysa.countsingles==mysa.counttrips&&mysa.countdoubles==0){
            mysa.classnum=KZC_TRIPSANDI;
        }else{
            mysa.classnum=KZC_CANNOTII;
            return mysa;
        }
    }else if(mysa.counttrips==0&&mysa.countsingles==0&&mysa.countdoubles>0){
        if (mysa.countdoubles==1) {
             mysa.classnum=KZC_DOUBLEP;
        }else if(mysa.countdoubles==2) {
            mysa.classnum=KZC_CANNOTII;
            return mysa;
        }
        else{
            for (int i=0,j=0; i<[mysa.arrdouble count]; i=i+2,j++) {
                getpokersdouble[j]=[mysa.arrdouble objectAtIndex:i];
            }
            for (int i=0; i<mysa.countdoubles-1; i++) {
                if (getpokersdouble[i].ponum!=(getpokersdouble[i+1].ponum+1)){
                    mysa.classnum=KZC_CANNOTII;
                    return mysa;
                }
            }
            mysa.classnum=KZC_MUDOUBLEPS;
        }
    }else if(mysa.counttrips==0&&mysa.countsingles==1&&mysa.countdoubles==0){
        mysa.classnum=KZC_SINGLEP;
    }
    else{
        mysa.classnum=KZC_CANNOTII;
        return mysa;
    }
    if (mysa.classnum!=KZC_CANNOTII) {
        ZCPoker *getpokerF[20];
        for (int i=0; i<[mysa.arrfours count]; i++) {
            getpokerF[i]=[mysa.arrfours objectAtIndex:i] ;
            [mysa.arrreset addObject:getpokerF[i] ];
        }
        for (int i=0; i<[mysa.arrtrips count]; i++) {
            getpokerF[i]=[mysa.arrtrips objectAtIndex:i] ;
            [mysa.arrreset addObject:getpokerF[i] ];
        }
        for (int i=0; i<[mysa.arrdouble count]; i++) {
            getpokerF[i]=[mysa.arrdouble objectAtIndex:i] ;
            [mysa.arrreset addObject:getpokerF[i] ];
        }
        for (int i=0; i<[mysa.arrsingle count]; i++) {
            getpokerF[i]=[mysa.arrsingle objectAtIndex:i] ;
            [mysa.arrreset addObject:getpokerF[i] ];
        }
        
    }
//    NSLog(@"mysa.classnum=%d",mysa.classnum);
    return mysa;
}
//---------------------------------^出牌相关^--------------------------------------------------
-(NSString *)tishi:(NSMutableArray *)cparr :(NSMutableArray *)pocketarr {
    NSString *strresult=@"OK";
    NSInteger countSP=[pocketarr count];
    ZCPoker *getpokerSP[countSP];
    for (NSInteger i=0; i<countSP; i++) {
        getpokerSP[i]=pocketarr[i];
    }
    NSInteger countCP=[cparr count];
    ZCPoker *getpokerCP[countCP];
    for (NSInteger i=0; i<countCP; i++) {
        getpokerCP[i]=cparr[i];
    }
    int fjcparr=[self firstjudge: cparr];
    ZCSeparateStraight *mySS;
    ZCSeparateArray *mySAN;
    switch (fjcparr) {
        case KZC_STRAIGHT:
            mySS=[self separatstraightfromarr:cparr :pocketarr];
            strresult=mySS.myresultstr;
            if ([strresult isEqualToString:KZC_TXTPOOL]) {
                return strresult;
            }
            for (NSInteger i=0; i<countSP; i++) {
                getpokerSP[i].poisselected=NO;
                for (NSInteger j=0; j<[mySS.mySA count]; j++) {
                    ZCPoker *getpokerN=mySS.mySA[j];
                    if (getpokerSP[i]==getpokerN) {
                        getpokerSP[i].poisselected=YES;
                    }
                }
            }
            break;
        case KZC_STRAIGHTFLUSH:
            break;
            
        default:
            mySAN=[self separateFTDSfromarr :cparr :pocketarr];
            strresult=mySAN.resultstr;
            if ([strresult isEqualToString:KZC_TXTPOOL]) {
                return strresult;
            }
            for (NSInteger i=0; i<countSP; i++) {
                getpokerSP[i].poisselected=NO;
                for (NSInteger j=0; j<[mySAN.arrreset count]; j++) {
                    ZCPoker *getpokerN=mySAN.arrreset[j];
                    if (getpokerSP[i]==getpokerN) {
                        getpokerSP[i].poisselected=YES;
                    }
                }
            }
            break;
    }
    return strresult;
}
-(ZCSeparateStraight *)separatstraightfromarr:(NSMutableArray *)cparr :(NSMutableArray *)sparr{
    NSInteger countSP=[sparr count];
    NSInteger countCP=[cparr count];
    
    ZCPoker *getpokerC[countCP];
    ZCPoker *getpokerS[countSP];
    
    ZCSeparateStraight *myST=[ZCSeparateStraight new];
    myST.mySA=[NSMutableArray new];
    myST.myflush=[NSMutableArray new];
    NSMutableArray *lssparr=[NSMutableArray new];
    if (countSP<countCP) {
        myST.myresultstr=KZC_TXTPOOL;
        return myST;
    }
    for (NSInteger i=0; i<countCP; i++) {
        getpokerC[i]=cparr[i];
    }
    for (NSInteger i=0; i<countSP; i++) {
        getpokerS[i]=sparr[i];
        if (i>0&&getpokerS[i].ponum!=getpokerS[i-1].ponum) {
//            NSLog(@"%@%@",getpokerS[i].potype,getpokerS[i].potext);
            [lssparr addObject:getpokerS[i]];
        }
    }
    NSInteger countLS=[lssparr count];
    for (NSInteger i=countLS-1,j=0; ; i--) {
        if (j==countCP) {
            break;
        }
        if (i<countCP-1) {
            myST.myresultstr=KZC_TXTPOOL;
            return myST;
        }
        ZCPoker *getpokerN=lssparr[i];
        ZCPoker *getpokerM;
        if (i<=countLS-2) {
            getpokerM=lssparr[i+1];
        }
        if (j==0&&getpokerN.ponum>getpokerC[countCP-1].ponum) {
            [myST.mySA addObject:getpokerN];
            j++;
        }else if(j>0&&i<=countLS-2&&getpokerN.ponum==getpokerM.ponum+1){
            [myST.mySA addObject:getpokerN];
            j++;
        }else {
            j=0;
            [myST.mySA removeAllObjects];
            myST.mySA=[NSMutableArray new];
        }
    }
    myST.myresultstr=@"OK";
    for (int i=0; i<[myST.mySA count]; i++) {
        ZCPoker *getpokerN=myST.mySA[i];
        NSLog(@"%@%@",getpokerN.potype,getpokerN.potext);
    }
    return myST;
}

-(ZCSeparateArray *)separateFTDSfromarr:(NSMutableArray *)cparr :(NSMutableArray *)sparr{
    int fjcparr=[self firstjudge:cparr];//出牌类型
    ZCSeparateArray *mysacp=[self separatethearray:cparr];
    ZCSeparateArray *mysanew=[ZCSeparateArray new];
    mysanew.resultstr=@"OK";
    mysanew.countfours=0;
    mysanew.counttrips=0;
    mysanew.countdoubles=0;
    mysanew.countsingles=0;
    mysanew.classnum=0;
    mysanew.arrfours=[NSMutableArray new];
    mysanew.arrtrips=[NSMutableArray new];
    mysanew.arrdouble=[NSMutableArray new];
    mysanew.arrsingle=[NSMutableArray new];
    mysanew.arrreset=[NSMutableArray new];
    
    NSInteger countSP=[sparr count];
    ZCPoker *getpokerSP[countSP];
    for (int i=0; i<countSP; i++) {
        getpokerSP[i]=sparr[i];
    }
    NSInteger countCP=[cparr count];
    ZCPoker *getpokerCP[countCP];
    for (int i=0; i<countCP; i++) {
        getpokerCP[i]=cparr[i];
    }
    if (countSP==2&&getpokerSP[0].ponum==100&&getpokerSP[1].ponum==50){
        mysanew.classnum=KZC_BUMBSBIG;
        [mysanew.arrreset addObject:getpokerSP[0]];
        [mysanew.arrreset addObject:getpokerSP[1]];
        return mysanew;
    }
    for (int i=0; i<countSP; ) {
        if ((i+1<countSP)&&getpokerSP[i].ponum==getpokerSP[i+1].ponum) {
            if ((i+2<countSP)&&getpokerSP[i].ponum==getpokerSP[i+2].ponum) {
                if ((i+3<countSP)&&getpokerSP[i].ponum==getpokerSP[i+3].ponum) {
                    [mysanew.arrfours addObject:getpokerSP[i]];
                    [mysanew.arrfours addObject:getpokerSP[i+1] ];
                    [mysanew.arrfours addObject:getpokerSP[i+2] ];
                    [mysanew.arrfours addObject:getpokerSP[i+3] ];
                    i=i+4;
                }else{
                    [mysanew.arrtrips addObject:getpokerSP[i] ];
                    [mysanew.arrtrips addObject:getpokerSP[i+1] ];
                    [mysanew.arrtrips addObject:getpokerSP[i+2] ];
                    i=i+3;
                }
            }else{
                [mysanew.arrdouble addObject:getpokerSP[i] ];
                [mysanew.arrdouble addObject:getpokerSP[i+1] ];
                i=i+2;
            }
        }else {
            [mysanew.arrsingle addObject:getpokerSP[i] ];
            i++;
        }
    }
    mysanew.countfours=[mysanew.arrfours count]/4;
    mysanew.counttrips=[mysanew.arrtrips count]/3;
    mysanew.countdoubles=[mysanew.arrdouble count]/2;
    mysanew.countsingles=[mysanew.arrsingle count];
    NSInteger lsint;
    switch (fjcparr) {
        case KZC_SINGLEP:
            for (NSInteger i=mysanew.countsingles-1; i>=0; i--) {
                ZCPoker *getpokerN=mysanew.arrsingle[i];
                if (getpokerN.ponum>getpokerCP[0].ponum){
                    [mysanew.arrreset addObject:getpokerN];
                    return mysanew;
                }
            }
            for (NSInteger i=countSP-1; i>=0; i--) {
                ZCPoker *getpokerN=sparr[i];
                if (getpokerN.ponum>getpokerCP[0].ponum){
                    [mysanew.arrreset addObject:getpokerN];
                    return mysanew;
                }
            }
            mysanew.resultstr=KZC_TXTPOOL;
            break;
        case KZC_DOUBLEP:
            if (mysanew.countdoubles>0) {
                for (NSInteger i=mysanew.countdoubles*2-1; i>0; i=i-2) {
                    ZCPoker *getpokerN=mysanew.arrdouble[i];
                    ZCPoker *getpokerM=mysanew.arrdouble[i-1];
                    if (getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        return mysanew;
                    }
                }
            }
            if (mysanew.counttrips>0) {
                for (NSInteger i=mysanew.counttrips*3-1; i>0; i=i-3) {
                    ZCPoker *getpokerN=mysanew.arrtrips[i];
                    ZCPoker *getpokerM=mysanew.arrtrips[i-1];
                    if (getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        return mysanew;
                    }
                }
            }
            mysanew.resultstr=KZC_TXTPOOL;
            break;
        case KZC_MUDOUBLEPS:
            lsint=countCP/2;
            if(mysanew.countdoubles>=lsint){
                for (NSInteger i=mysanew.countdoubles*2-1,k=0; i>0; i=i-2) {
                    ZCPoker *getpokerO;
                    if (i<mysanew.countdoubles*2-2) {
                        getpokerO=mysanew.arrdouble[i+1];
                    }
                    ZCPoker *getpokerN=mysanew.arrdouble[i];
                    ZCPoker *getpokerM=mysanew.arrdouble[i-1];
                    if (k==0&&getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        k=k+2;
                    }else if(k>0&&getpokerN.ponum==getpokerO.ponum+1){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        k=k+2;
                        if (k/2==lsint) {
                            return mysanew;
                        }
                    }else if(k>0&&getpokerN.ponum!=getpokerO.ponum+1){
                        k=0;
                        [mysanew.arrreset removeAllObjects];
                        mysanew.arrreset=[NSMutableArray new];
                    }
                }
            }
            if (mysanew.counttrips>=lsint) {
                for (NSInteger i=mysanew.counttrips*3-1,k=0; i>0; i=i-3) {
                    ZCPoker *getpokerO;
                    if (i<mysanew.counttrips*3-3) {
                        getpokerO=mysanew.arrtrips[i+1];
                    }
                    ZCPoker *getpokerN=mysanew.arrtrips[i];
                    ZCPoker *getpokerM=mysanew.arrtrips[i-1];
                    if (k==0&&getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        k=k+2;
                    }else if(k>0&&getpokerN.ponum==getpokerO.ponum+1){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        k=k+2;
                        if (k/2==lsint) {
                            return mysanew;
                        }
                    }else if(k>0&&getpokerN.ponum!=getpokerO.ponum+1){
                        k=0;
                        [mysanew.arrreset removeAllObjects];
                        mysanew.arrreset=[NSMutableArray new];
                    }
                }

            }
            if (mysanew.countfours>=lsint) {
                for (NSInteger i=mysanew.countfours*4-1,k=0; i>0; i=i-4) {
                    ZCPoker *getpokerO;
                    if (i<mysanew.countfours*4-4) {
                        getpokerO=mysanew.arrfours[i+1];
                    }
                    ZCPoker *getpokerN=mysanew.arrfours[i];
                    ZCPoker *getpokerM=mysanew.arrfours[i-1];
                    if (k==0&&getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        k=k+2;
                    }else if(k>0&&getpokerN.ponum==getpokerO.ponum+1){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        k=k+2;
                        if (k/2==lsint) {
                            return mysanew;
                        }
                    }else if(k>0&&getpokerN.ponum!=getpokerO.ponum+1){
                        k=0;
                        [mysanew.arrreset removeAllObjects];
                        mysanew.arrreset=[NSMutableArray new];
                    }
                }
                
            }
            mysanew.resultstr=KZC_TXTPOOL;
            break;
        case KZC_TRIPS:
            lsint=countCP/3;
            if(mysanew.counttrips>=lsint){
                for (NSInteger i=mysanew.counttrips*3-1,k=0; i>0; i=i-3) {
                    ZCPoker *getpokerO;
                    if (i<mysanew.counttrips*3-2) {
                        getpokerO=mysanew.arrtrips[i+1];
                    }
                    ZCPoker *getpokerN=mysanew.arrtrips[i];
                    ZCPoker *getpokerM=mysanew.arrtrips[i-1];
                    ZCPoker *getpokerL=mysanew.arrtrips[i-2];
                    if (k==0&&getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        [mysanew.arrreset addObject:getpokerL];
                        k=k+3;
                        if (k/3==lsint) {
                            return mysanew;
                        }

                    }else if(k>0&&getpokerN.ponum==getpokerO.ponum+1){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        [mysanew.arrreset addObject:getpokerL];
                        k=k+3;
                        if (k/3==lsint) {
                            return mysanew;
                        }
                    }else if(k>0&&getpokerN.ponum!=getpokerO.ponum+1){
                        k=0;
                        [mysanew.arrreset removeAllObjects];
                        mysanew.arrreset=[NSMutableArray new];
                    }
                }
            }
            mysanew.resultstr=KZC_TXTPOOL;
            break;
        case KZC_TRIPSANDI:
            lsint=mysacp.countsingles;
            if(mysanew.counttrips>=lsint&&mysanew.countsingles>=lsint){
                for (NSInteger i=mysanew.counttrips*3-1,k=0; i>0; i=i-3) {
                    ZCPoker *getpokerO;
                    if (i<mysanew.counttrips*3-2) {
                        getpokerO=mysanew.arrtrips[i+1];
                    }
                    ZCPoker *getpokerN=mysanew.arrtrips[i];
                    ZCPoker *getpokerM=mysanew.arrtrips[i-1];
                    ZCPoker *getpokerL=mysanew.arrtrips[i-2];
                    if (k==0&&getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        [mysanew.arrreset addObject:getpokerL];
                        k=k+3;
                        if (k/3==lsint) {
                            for (NSInteger mm=0; mm<lsint; mm++) {
                                getpokerN=mysanew.arrsingle[mysanew.countsingles-1-mm];
                                [mysanew.arrreset addObject:getpokerN];
                            }
                            return mysanew;
                        }
                    }else if(k>0&&getpokerN.ponum==getpokerO.ponum+1){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        [mysanew.arrreset addObject:getpokerL];
                        k=k+3;
                        if (k/3==lsint) {
                            for (NSInteger mm=0; mm<lsint; mm++) {
                                getpokerN=mysanew.arrsingle[mysanew.countsingles-1-mm];
                                [mysanew.arrreset addObject:getpokerN];
                            }
                            return mysanew;
                        }
                    }else if(k>0&&getpokerN.ponum!=getpokerO.ponum+1){
                        k=0;
                        [mysanew.arrreset removeAllObjects];
                        mysanew.arrreset=[NSMutableArray new];
                    }
                }
            }
            mysanew.resultstr=KZC_TXTPOOL;
            break;
        case KZC_TRIPSANDII:
            lsint=mysacp.countdoubles;
            if(mysanew.counttrips>=lsint&&mysanew.countdoubles>=lsint){
                for (NSInteger i=mysanew.counttrips*3-1,k=0; i>0; i=i-3) {
                    ZCPoker *getpokerO;
                    if (i<mysanew.counttrips*3-3) {
                        getpokerO=mysanew.arrtrips[i+1];
                    }
                    ZCPoker *getpokerN=mysanew.arrtrips[i];
                    ZCPoker *getpokerM=mysanew.arrtrips[i-1];
                    ZCPoker *getpokerL=mysanew.arrtrips[i-2];
                    if (k==0&&getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        [mysanew.arrreset addObject:getpokerL];
                        k=k+3;
                        if (k/3==lsint) {
                            for (NSInteger mm=0; mm<lsint*2; mm++) {
                                getpokerN=mysanew.arrdouble[mysanew.countdoubles*2-1-mm];
                                [mysanew.arrreset addObject:getpokerN];
                            }
                            return mysanew;
                        }
                    }else if(k>0&&getpokerN.ponum==getpokerO.ponum+1){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        [mysanew.arrreset addObject:getpokerL];
                        k=k+3;
                        if (k/3==lsint) {
                            for (NSInteger mm=0; mm<lsint*2; mm++) {
                                getpokerN=mysanew.arrdouble[mysanew.countdoubles*2-1-mm];
                                [mysanew.arrreset addObject:getpokerN];
                            }
                            return mysanew;
                        }
                    }else if(k>0&&getpokerN.ponum!=getpokerO.ponum+1){
                        k=0;
                        [mysanew.arrreset removeAllObjects];
                        mysanew.arrreset=[NSMutableArray new];
                    }
                }
            }
            mysanew.resultstr=KZC_TXTPOOL;
            break;
        case KZC_FOURANDONEONE:
            if(mysanew.countfours>=1&&mysanew.countsingles>=1){
                for (NSInteger i=mysanew.countfours*4-1,k=0; i>0; i=i-4) {
                    ZCPoker *getpokerO;
                    if (i<mysanew.countfours*4-4) {
                        getpokerO=mysanew.arrfours[i+1];
                    }
                    ZCPoker *getpokerN=mysanew.arrfours[i];
                    ZCPoker *getpokerM=mysanew.arrfours[i-1];
                    ZCPoker *getpokerL=mysanew.arrfours[i-2];
                    ZCPoker *getpokerK=mysanew.arrfours[i-3];
                    if (k==0&&getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        [mysanew.arrreset addObject:getpokerL];
                        [mysanew.arrreset addObject:getpokerK];
                        k=k+4;
                        if (k/4==1) {
                            getpokerN=mysanew.arrsingle[mysanew.countsingles-1];
                            getpokerN=mysanew.arrsingle[mysanew.countsingles-2];
                            [mysanew.arrreset addObject:getpokerN];
                            
                            return mysanew;
                        }
                    }
                }
            }
            mysanew.resultstr=KZC_TXTPOOL;
            break;
        case KZC_FOURANDTOWTOW:
            if(mysanew.countfours>=1&&mysanew.countdoubles>=1){
                for (NSInteger i=mysanew.countfours*4-1,k=0; i>0; i=i-4) {
                    ZCPoker *getpokerO;
                    if (i<mysanew.countfours*4-4) {
                        getpokerO=mysanew.arrfours[i+1];
                    }
                    ZCPoker *getpokerN=mysanew.arrfours[i];
                    ZCPoker *getpokerM=mysanew.arrfours[i-1];
                    ZCPoker *getpokerL=mysanew.arrfours[i-2];
                    ZCPoker *getpokerK=mysanew.arrfours[i-3];
                    if (k==0&&getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        [mysanew.arrreset addObject:getpokerL];
                        [mysanew.arrreset addObject:getpokerK];
                        k=k+4;
                        if (k/4==1) {
                           
                            getpokerN=mysanew.arrdouble[mysanew.countdoubles-1];
                            getpokerN=mysanew.arrdouble[mysanew.countdoubles-2];
                            getpokerN=mysanew.arrdouble[mysanew.countdoubles-3];
                            getpokerN=mysanew.arrdouble[mysanew.countdoubles-4];
                            [mysanew.arrreset addObject:getpokerN];
                           
                            return mysanew;
                        }
                    }
                }
            }
            mysanew.resultstr=KZC_TXTPOOL;
            break;
        case KZC_BUMB:
            if(mysanew.countfours>=1){
                for (NSInteger i=mysanew.countfours*4-1,k=0; i>0; i=i-4) {
                    ZCPoker *getpokerO;
                    if (i<mysanew.countfours*4-4) {
                        getpokerO=mysanew.arrfours[i+1];
                    }
                    ZCPoker *getpokerN=mysanew.arrfours[i];
                    ZCPoker *getpokerM=mysanew.arrfours[i-1];
                    ZCPoker *getpokerL=mysanew.arrfours[i-2];
                    ZCPoker *getpokerK=mysanew.arrfours[i-3];
                    if (k==0&&getpokerN.ponum>getpokerCP[0].ponum){
                        [mysanew.arrreset addObject:getpokerN];
                        [mysanew.arrreset addObject:getpokerM];
                        [mysanew.arrreset addObject:getpokerL];
                        [mysanew.arrreset addObject:getpokerK];
                        k=k+4;
                        return mysanew;
                    }
                }
            }
            mysanew.resultstr=KZC_TXTPOOL;
            return mysanew;
            break;
        default:
            break;
    }
    if ([mysanew.resultstr isEqualToString: KZC_TXTPOOL]) {
        if (mysanew.countfours>0) {
            for (NSInteger mm=0; mm<4; mm++) {
                mysanew.resultstr=@"OK";
                ZCPoker *getpokerN=mysanew.arrfours[mysanew.countfours-1-mm];
                [mysanew.arrreset addObject:getpokerN];
            }
            return mysanew;
        }
    }
    return mysanew;
}

@end
