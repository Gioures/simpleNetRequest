
#import <Foundation/Foundation.h>

@interface QFRequstManager : NSObject
+(void)getWithUrl:(NSString *)url para:(NSMutableDictionary *)para finishBlock:(void(^)(NSData * data)) finishiBlock failledBlock:(void (^)(NSError * error))failedBlock;

+(void)postWithUrl:(NSString *)url para:(NSMutableDictionary *)para finishBlock:(void(^)(NSData * data)) finishiBlock failledBlock:(void (^)(NSError * error))failedBlock;
@end
