//
//  main.m
//  Block
//
//  Created by tidot on 2019/6/4.
//  Copyright © 2019 tidot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
void test1(void);
void test2(void);
void test3(void);
void test4(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"The target is Block!");
//        test1();
//        test2();
        test3();
        test4();
    }
    return 0;
}

void test1(){
    int val = 0;
    
    printf("1:addres = %p\n",&val);
    val = 10;
    void (^one)(void) = ^{
        printf("3:val = %d\n",val);
        printf("4:addres = %p\n",&val);

    };
    
    printf("2:addres = %p\n",&val);
    val = 20;
    one();
    
    printf("5:val = %d\n",val);
    printf("6:addres = %p\n",&val);

}

/**
 test the auto variable of Block
 */
void test2(){
    __block int val = 0;
    
    val = 10;
    printf("1:addres = %p\n",&val);
    
    void (^one)(void) = ^{
        printf("3:val = %d\n",val);
        val = 30;
        printf("4:addres = %p\n",&val);
        
    };
    printf("2:addres = %p\n",&val);

    val = 20;
    one();
    printf("5:val = %d\n",val);
    printf("6:addres = %p\n",&val);
    
}

void test3(){
    //    id array = [[NSMutableArray alloc]init];
    //
    //    void (^three)(void) = ^{
    //        id obj = [[NSObject alloc]init];
    //        [array addObject:obj];
    //        NSLog(@"obj = %@",obj);
    //    };
    //    three();
    //    NSLog(@"array = %@",array);
    
    id man = [[Person alloc]init];
    printf("1: addres = %p\n",&man);
    NSLog(@"2: addres = %@",man);
    
    [man setName:@"james"];
    void (^three)(void) = ^{
        printf("5: addres = %p\n",&man);
        NSLog(@"6: addres = %@",man);
        NSLog(@"7: name = %@", [man name]);
        
        //查看对象的引用计数
        printf("PS: retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(man)));
        
        [man setName:@"jack"];

    };
    printf("3: addres = %p\n",&man);
    NSLog(@"4: addres = %@",man);

    [man setName:@"mary"];
    
    three();
    NSLog(@"8: name = %@",[man name]);
    printf("9: addres = %p\n",&man);
    NSLog(@"10: addres = %@",man);

}
void test4(){
    __block id man = [[Person alloc]init];
    printf("1: addres = %p\n",&man);
    NSLog(@"2: addres = %@",man);
    
    [man setName:@"james"];
    void (^four)(void) = ^{
        printf("5: addres = %p\n",&man);
        NSLog(@"6: addres = %@",man);
        NSLog(@"7: name = %@", [man name]);
        
        //查看对象的引用计数
        printf("PS: retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(man)));
        
        man = [[Person alloc]init];
        [man setName:@"jack"];
        
        printf("PS: retain count = %ld\n",CFGetRetainCount((__bridge CFTypeRef)(man)));
    };
    printf("3: addres = %p\n",&man);
    NSLog(@"4: addres = %@",man);
    
    [man setName:@"mary"];
    
    four();
    NSLog(@"8: name = %@",[man name]);
    printf("9: addres = %p\n",&man);
    NSLog(@"10: addres = %@",man);
}
