//
//  CHLog.m
//  CHLog
//
//  Created by lichanghong on 16/9/12.
//  Copyright © 2016年 lichanghong. All rights reserved.
//

#import "CHLog.h"

#define UPLOADLOGS_DIR_NAME  @"chlog"
#define UploadURLStr @"http://10.17.28.36/index.php/user/savelog?log=%@"


@implementation CHLog


+ (instancetype)defaultLog
{
    static CHLog *s_manager = nil;
    if (s_manager == nil) {
        s_manager = [[CHLog alloc]init];
    }
    return s_manager;
}



- (NSString *)logContents
{
    //获得日志文件所有内容到contents
    NSMutableString *contents = nil;
    NSArray *logfilepathes = [self logFiles];
    if (logfilepathes && logfilepathes.count>0) {
        contents = [NSMutableString string];
        for (NSString *path in logfilepathes) {
            NSError *error = nil;
            NSString *file = [[self uploadDir]stringByAppendingPathComponent:path];
            NSString *fileContent = [NSString stringWithContentsOfFile:file encoding:NSUTF8StringEncoding error:&error];
            if (!error) {
                [contents appendString:fileContent];
            }
            else
            {
                NSLog(@"read log content error = %@",error);
            }
        }
    }
    return contents;
}

- (void)inchlog:(NSString *)log
{
    NSString *writefile =[[self uploadDir] stringByAppendingPathComponent: [self writeFileName]];
    BOOL write = [log writeToFile:writefile atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (write) {
        [self uploadLog:YES];
    }
    else
    {
    }
}

- (void)uploadLog:(BOOL)bforceUpload
{
    NSLog(@"%s",__func__);
    [self doUploadLog];
}

- (void)doUploadLog
{
    NSString *logcontent =[self logContents];
    BOOL empty = (logcontent == nil || logcontent.length == 0 || [[logcontent stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0);  //  同IsNullOrWhiteSpace
    
    if (!empty) {
        NSString *urlstr =[NSString stringWithFormat:UploadURLStr,logcontent];
        NSURL *uploadURL = [NSURL URLWithString:[urlstr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
        NSURLRequest *request = [NSURLRequest requestWithURL:uploadURL];
        [[[NSURLSession sharedSession]dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (!error) {
                //                [self deleteLoggersWhenPostSuccess:[self uploadDir]];
            }
            else
            {
                
            }
        }] resume];
    }
    else
    {
        NSLog(@"uploadLog error =log content = nil");
    }
    
}

//临时文件目录
- (NSString *)uploadDir
{
    //caches 路径,513 error ,permission deny
    NSString *caches = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *tempLog = [caches stringByAppendingPathComponent:UPLOADLOGS_DIR_NAME];
    
    //查看目录如果已经存在就直接返回路径，否则创建目录并返回路径，如果创建路径失败则返回nil
    if (![[NSFileManager defaultManager] fileExistsAtPath:tempLog isDirectory:nil])
    {
        NSError *createError = nil;
        BOOL createSuccess = [[NSFileManager defaultManager] createDirectoryAtPath:tempLog withIntermediateDirectories:YES attributes:nil error:&createError];
        
        if (createSuccess) {
        }
        else
        {
            NSLog(@"slfdlsfalf  = %@",createError);
            tempLog=nil;
        }
    }
    return tempLog;
}

-(NSArray *)logFiles
{
    return [[NSFileManager defaultManager]contentsOfDirectoryAtPath:[self uploadDir] error:nil];
}

-(NSString *)writeFileName
{
    NSDate *now = [NSDate date];
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    return [df stringFromDate:now];
}


@end
