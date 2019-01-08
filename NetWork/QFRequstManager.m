
#import "QFRequstManager.h"
#import "QFRequst.h"
@implementation QFRequstManager

+(void)getWithUrl:(NSString *)url para:(NSMutableDictionary *)para finishBlock:(void(^)(NSData * data)) finishiBlock failledBlock:(void (^)(NSError * error))failedBlock{
    QFRequst * r=[[QFRequst alloc]init];
    NSMutableString  * str = [url mutableCopy];
    if (para) {
        [str appendString:@"?"];
        [para enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [str appendString:[NSString stringWithFormat:@"%@=%@&",key,obj]];
        }];
        [str deleteCharactersInRange:NSMakeRange(str.length - 1, 1)];
    }
    
    
    r.urlString = str;
    r.finishBlock = finishiBlock;
    r.failedBlock = failedBlock;
    [r startRequest];
    
}

+(void)postWithUrl:(NSString *)url para:(NSMutableDictionary *)para finishBlock:(void (^)(NSData *))finishiBlock failledBlock:(void (^)(NSError *))failedBlock{
    QFRequst * r=[[QFRequst alloc]init];
    r.urlString = url;
    r.finishBlock = finishiBlock;
    r.failedBlock = failedBlock;
    [r postWithPara:para];
}

@end
