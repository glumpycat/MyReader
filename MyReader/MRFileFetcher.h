//
//  MRFileFetcher.h
//  MyReader
//
//  Created by ZhangLianzhou on 15/8/16.
//  Copyright © 2016 lass.uliga. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MRFileFetcher : NSObject

+ (instancetype)sharedInstance;

- (NSArray *)loadFiles;

@end
