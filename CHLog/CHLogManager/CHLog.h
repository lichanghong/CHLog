//
//  CHLog.h
//  CHLog
//
//  Created by lichanghong on 16/9/12.
//  Copyright © 2016年 lichanghong. All rights reserved.
//

#import <Foundation/Foundation.h>

#define hhlog(FORMAT, ...) {\
NSString *str = [NSString stringWithFormat:@"%s:%d [--%@--]",__func__, __LINE__,[NSString stringWithFormat:FORMAT, ##__VA_ARGS__]];\
[[CHLog defaultLog]inchlog:str];}

@interface CHLog : NSObject


+ (instancetype)defaultLog;

/**
 *@brief 上传日志接口
 */
- (void)uploadLog;
- (void)inchlog:(NSString *)log;
/**
 *@brief 管理员查看日志内容，只看Logs文件夹下的log信息
 *@param onlyRemote 是否只显示消息日志，如果为true就只显示消息日志，否则全部显示
 *@return 返回日志内容
 */
- (NSString *)logContents;


@end
