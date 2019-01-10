
// 有事联系作者微信 ： qq756119874 著名原因

#import <Foundation/Foundation.h>

@interface SimpleNetRequest : NSObject

+(void)getWithUrl:(NSString *)url para:(NSMutableDictionary *)para header:(NSDictionary *)header finishBlock:(void(^)(NSData * data)) finishiBlock failledBlock:(void (^)(NSError * error))failedBlock;

+(void)postWithUrl:(NSString *)url para:(NSMutableDictionary *)para header:(NSDictionary *)header finishBlock:(void(^)(NSData * data)) finishiBlock failledBlock:(void (^)(NSError * error))failedBlock;
@end
