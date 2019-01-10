#import "Requst.h"
#import "NSString+Hashing.h"
@implementation Requst
-(void)startRequest{
    // 沙盒缓存路径
    NSString * sandBoxPath =    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    sandBoxPath = [sandBoxPath stringByAppendingPathComponent:[self.urlString  MD5Hash] ];
    // 文件管理
    NSFileManager * manager=[NSFileManager defaultManager];
    NSMutableURLRequest * request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
    if (self.header) {
        for (NSString * key in self.header) {
                [request setValue:self.header[key] forHTTPHeaderField:key];
        }
    }
    // 请求设置
    NSURLSession * session=[NSURLSession sharedSession];
    NSURLSessionTask * task=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
            if (!error) {
                [data writeToFile:sandBoxPath atomically:YES];
            }else{
                if ([manager fileExistsAtPath:sandBoxPath]) {
                    data = [NSData dataWithContentsOfFile:sandBoxPath];
                }
            }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.finishBlock(data);
            self.failedBlock(error);
        });

    }];
    [task resume];
    
}

-(void)postWithPara:(NSDictionary * )para{
    // 沙箱路径
    NSString * sandBoxPath =    NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    
    sandBoxPath = [sandBoxPath stringByAppendingPathComponent:[self.urlString  MD5Hash] ];
    //  文件管理
    NSFileManager * manager=[NSFileManager defaultManager];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString]];
    request.HTTPMethod=@"POST";
    //此处发送一定要设置，这个地方把字典封装为json格式
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    if (self.header) {
        for (NSString * key in self.header) {
            [request setValue:self.header[key] forHTTPHeaderField:key];
        }
    }
    
    NSData *data=[NSJSONSerialization dataWithJSONObject:para options:NSJSONWritingPrettyPrinted error:nil];
    request.HTTPBody=data;
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask=[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

        
        if(!error){
            //data 写入缓存
            [data writeToFile:sandBoxPath atomically:YES];
        }else{
            if ([manager fileExistsAtPath:sandBoxPath]) {
                data = [NSData dataWithContentsOfFile:sandBoxPath];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.finishBlock(data);
            self.failedBlock(error);
        });
    }];
    [dataTask resume];
}


@end
