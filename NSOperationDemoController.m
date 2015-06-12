//
//  NSOperationDemoController.m
//  StudyDemo
//
//  Created by maruiduan on 15/6/9.
//  Copyright (c) 2015年 Mariox. All rights reserved.
//

#import "NSOperationDemoController.h"
#import "DownImageOperation.h"

@interface NSOperationDemoController ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;

@end

@implementation NSOperationDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.operationQueue = [[NSOperationQueue alloc] init];
    
    DownImageOperation *downImageOperation = [[DownImageOperation alloc] init];
    
    
    __weak typeof(self) weakSelf = self;
    downImageOperation.success = ^(NSData *data){
        UIImage *image = [[UIImage alloc] initWithData:data];
        dispatch_sync(dispatch_get_main_queue(), ^{
            weakSelf.imageView.image = image;
        });
        NSLog(@"sleep");
        sleep(10);
        NSLog(@"success");
    };
    
    [self.operationQueue addOperation:downImageOperation];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.operationQueue cancelAllOperations];
//        [downImageOperation cancel];
        NSLog(@"cancel");
    });
    
    
    // Do any additional setup after loading the view.
}

- (void)viewDidLayoutSubviews
{
    self.imageView.backgroundColor = [UIColor redColor];
    self.imageView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
