//
//  DownImageOperation.h
//  StudyDemo
//
//  Created by maruiduan on 15/6/9.
//  Copyright (c) 2015年 Mariox. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^LoadSuccessBlock)(NSData *data);


@interface DownImageOperation : NSOperation

@property (nonatomic, copy) LoadSuccessBlock success ;

@end
