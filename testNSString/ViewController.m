//
//  ViewController.m
//  testNSString
//
//  Created by 唐征征 on 16/3/21.
//  Copyright © 2016年 唐征征. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
  
#pragma mark----字符串与基本数据类型转换------------------
    
    NSString *aa=@"123";
    int b=[aa intValue];
    float b2=[aa floatValue];
    BOOL b3 = [aa boolValue]; //将 aa 转换为 布尔型（true /  false）
    NSInteger b4 = [aa integerValue]; //将 aa 转换为 整数型
    long b5 = [aa longLongValue]; //将 aa 转换为 长整型
   
    
    
#pragma mark---- 字符串的截取，删除，查找－－－－－－－
    
//    字符串截取到第n位  （substringToIndex: n）(第n 位不算再内)
    NSString  *a = @"i like long dress";
    NSString *C = [a substringToIndex:4];
    
//    字符串从第n 位开始截取,直到最后 （substringFromIndex:n）（包括第 n 位）
  NSString *C2 = [a substringFromIndex:4];
    
    
    
    NSMutableString *C3 = [[NSMutableString  alloc]initWithString:@"123456798"];
 //可变字符串删除中间字符
    [C3 deleteCharactersInRange:NSMakeRange(1,2)];
    [C3 replaceCharactersInRange:NSMakeRange(1,2) withString:@"A"];
    
    NSLog(@" \n a:  %@\n",C3);
    
    NSRange tmprange =[C3 rangeOfString:@"A"];
//字符串的查找
    if (tmprange.location!=NSNotFound) {
        NSLog(@"tmprange=%@",NSStringFromRange(tmprange));
    } else {
        NSLog(@"没有找到");
    }
    
    
    
#pragma mark－－－－数组字符串转换方式（1）（有分割符）－－－－
    
    
#pragma mark---字符串转数组
    //定义一个字符串
    NSMutableString * str=[[NSMutableString alloc]initWithFormat:@"1,1,1,1,1,1"];
    //字符串根据逗号分隔符转换为不可变数组
    NSArray *arr=[str componentsSeparatedByString:@","];
    //字符串转变为可变数组
    NSMutableArray * array=[NSMutableArray arrayWithArray:[str   componentsSeparatedByString:@","]];
    //替换数组中的第四个元素的个值
    [array replaceObjectAtIndex:4 withObject:@"2"];
    
#pragma mark---数组转字符串
    //把数组转换成字符串
    NSString *ns=[array componentsJoinedByString:@","];
    
    //将字符串整体作为分割条件 返回值为NSArray不可变数组
//    NSArray * array = [num componentsSeparatedByString:@" "];
    
    //若修改，则将NSArray转化为NSMutableArray
    NSMutableArray * array1 = [NSMutableArray arrayWithArray:array];
    
    
    NSArray * array2 = [ns componentsSeparatedByCharactersInSet:[NSCharacterSet  characterSetWithCharactersInString:@", "]];//以字符串中的字符作为分割条件进行分割
    
    
    
   #pragma mark－－－－数组字符串转换方式（2）（无分割符）－－－－
    
    
    //（1） 通过查找的方式来(这方式适合所有格式的子符串，推荐使用)
    //遍历字符串得到的是字符串
    NSString *newStr =@"abcd1234tang";
    NSString *temp = nil;
    NSMutableArray *newArr=[[NSMutableArray alloc] init];
    for(int i =0; i < [newStr length]; i++)
    {
        temp = [newStr substringWithRange:NSMakeRange(i, 1)];
        NSLog(@"第%d个字是:%@",i,temp);
        [newArr addObject:temp];
    }
    
    
    
    
    //    (2) 通过遍历字符的方式遍历字符串(只适合不包含中文的字符串)
    //遍历字符串得到的是字符，不能添加到数组中
    NSString *newStr2 = @"zheng345";
    unichar temp2;
    
    for(int i =0; i < [newStr2 length]; i++)
    {
        temp2=[newStr2 characterAtIndex:i];
        NSLog(@"第%d个字符是:%hu",i, [newStr2 characterAtIndex:i]);
    }

    
//    字符串替换
    
//stringByReplacingCharactersInRange:range
    NSString *string = @"this is my name";
    
    
    for (int i = 0; i<[string length]; i++) {
        //截取字符串中的每一个字符
        NSString *s = [string substringWithRange:NSMakeRange(i, 1)];
        NSLog(@"string is %@",s);
        if ([s isEqualToString:@"m"]) {
            NSRange range = NSMakeRange(i, 1);
            //将字符串中的“m”转化为“w”
            string =   [string stringByReplacingCharactersInRange:range withString:@"w"];
            
        }
    }
    NSLog(@"%@",string);
    
 
    // 字符串转ascii码
    NSString *stringValue=[NSString stringWithFormat:@"01000435"];
    NSString * str2 = [stringValue substringWithRange:NSMakeRange(0, 2)];
    NSInteger ar = [str integerValue];
    char br = (char)(ar+64);
    
#pragma mark------ NSString ,int,char,unichar ascii码 互相转换--------
    
    
//    string 转成 char(1):
    char mychar[100];
    NSString * mystring=@"h";
    strcpy(mychar,(char *)[mystring UTF8String]);
    

    
//NSString to ASCII
    NSString *stringA = @"A";
    int asciiCodeA = [stringA characterAtIndex:0]; // 65

    
// ASCII to NSString   (int char To NSString)
    int asciiCodeB = 65;
    char asciiCodeB2=65;
    NSString *stringB = [NSString stringWithFormat:@"%c", asciiCodeB]; // A
    int i;
#pragma mark---根据ascii码得到对应字符
    for (int i = 0 ; i <26 ; i ++) {
        unichar ch = i+65;
        //char[]转NSString简单的方法
        NSString *str = [NSString stringWithUTF8String:(const char *)&ch];
        //NSLog(@"=========%@",str);
        //NSLog(@"-----------%d",i);
    }

 
    
    
    
// ASCII  ASCII to NSString（2）
//    (int) NSString to 
    NSString  *result=@"010000317";
    NSString *head=[result substringWithRange:NSMakeRange(0, 2)];
    int asciiCode = [head intValue]+64;
    NSString *asciiToString = [NSString stringWithFormat:@"%c", asciiCode]; // A
    
    
    
    
    
//
    
#pragma mark---------c语言字符串转成oc字符串---------
    
    char *Cstring = "This is a String!";    //C语言字符串
    NSString *astring = [[NSString alloc] initWithCString:Cstring];  //转换
    
    
}

//判断字符串是否是整型:
+ (BOOL)isPureInt:(NSString*)string{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
    
}
//判断字符串是否为浮点型：
+(BOOL)isPureFloat:(NSString*)string{
    
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
