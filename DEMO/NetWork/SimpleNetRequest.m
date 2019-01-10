
#import "SimpleNetRequest.h"
#import "Requst.h"
#import "Json.h"

@implementation SimpleNetRequest

+(void)getWithUrl:(NSString *)url para:(NSMutableDictionary *)para header:(NSDictionary *)header finishBlock:(void(^)(NSData * data)) finishiBlock failledBlock:(void (^)(NSError * error))failedBlock{
    Requst * r=[[Requst alloc]init];
    
    NSMutableString  * str = [url mutableCopy];
    if (para) {
        [str appendString:@"?"];
        [para enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [str appendString:[NSString stringWithFormat:@"%@=%@&",key,obj]];
        }];
        [str deleteCharactersInRange:NSMakeRange(str.length - 1, 1)];
    }
    
    r.header = header;
    r.urlString = str;
    r.finishBlock = finishiBlock;
    r.failedBlock = failedBlock;
    [r startRequest];
    
}

+(void)postWithUrl:(NSString *)url para:(NSMutableDictionary *)para header:(NSDictionary *)header finishBlock:(void (^)(NSData *))finishiBlock failledBlock:(void (^)(NSError *))failedBlock{
    Requst * r=[[Requst alloc]init];
    r.header = header;
    r.urlString = url;
    r.finishBlock = finishiBlock;
    r.failedBlock = failedBlock;
    [r postWithPara:para];
}

@end
