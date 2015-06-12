//
//  DownImageOperation.m
//  StudyDemo
//
//  Created by maruiduan on 15/6/9.
//  Copyright (c) 2015年 Mariox. All rights reserved.
//

#import "DownImageOperation.h"

@implementation DownImageOperation

- (void)main
{
    NSURL *url = [[NSURL alloc] initWithString:@"http://t10.baidu.com/it/u=4286244909,263883255&fm=32&s=5A35894461A38EA4FAE4159603008089&w=533&h=800&img.JPEG"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    self.success(data);
}

@end
