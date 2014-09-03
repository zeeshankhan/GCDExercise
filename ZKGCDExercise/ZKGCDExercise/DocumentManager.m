//
//  DocumentManager.m
//  ZKGCDExercise
//
//  Created by Zeeshan Khan on 03/09/14.
//  Copyright (c) 2014 Zeeshan Khan. All rights reserved.
//


#import "DocumentManager.h"

@interface DocumentManager ()
@property (nonatomic, strong) NSMutableArray *arrDocs;
@property (nonatomic, strong) dispatch_queue_t concurrentDocumentQueue;
@end

@implementation DocumentManager


+ (instancetype)sharedManager {
    static DocumentManager *sharedDocumentManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDocumentManager = [[DocumentManager alloc] init];
        sharedDocumentManager->_arrDocs = [NSMutableArray array];
        sharedDocumentManager->_concurrentDocumentQueue = dispatch_queue_create("com.mycompany.ThreadySafety.documentQueue",DISPATCH_QUEUE_CONCURRENT);
    });
    return sharedDocumentManager;
}


- (void)addDocumentName:(NSString*)docName {
    if (docName) { // 1
        dispatch_barrier_async(self. concurrentDocumentQueue, ^{ // 2
            [_arrDocs addObject:docName]; // 3
        });
    }
}


- (NSArray*)allDocs {
    __block NSArray *array; // 1
    dispatch_sync(self.concurrentDocumentQueue, ^{ // 2
        array = [NSArray arrayWithArray:_arrDocs]; // 3
    });
    return array;
}


@end
