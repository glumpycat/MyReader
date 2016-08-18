//
//  MRFileFetcher.m
//  MyReader
//
//  Created by ZhangLianzhou on 15/8/16.
//  Copyright © 2016 lass.uliga. All rights reserved.
//

#import "MRFileFetcher.h"

@interface MRFileFetcher()

@end

@implementation MRFileFetcher

+ (instancetype)sharedInstance
{
    static MRFileFetcher *fetcher;
    static dispatch_once_t token;

    dispatch_once(&token, ^{
        fetcher = [[MRFileFetcher alloc] init];
    });

    return fetcher;
}

- (NSArray *)loadFiles
{
    NSURL *bundleRoot = [[NSBundle mainBundle] bundleURL];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray * dirContents =
    [fm contentsOfDirectoryAtURL:bundleRoot
      includingPropertiesForKeys:@[]
                         options:NSDirectoryEnumerationSkipsHiddenFiles
                           error:nil];
    NSPredicate * fltr = [NSPredicate predicateWithFormat:@"pathExtension='txt'"];
    NSArray * onlyTXTs = [dirContents filteredArrayUsingPredicate:fltr];

    return onlyTXTs;
}

@end
