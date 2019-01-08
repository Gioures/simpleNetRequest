
#import <Foundation/Foundation.h>

@interface QFRequst : NSObject
@property(nonatomic,copy) NSString * urlString;
@property(nonatomic,copy)void(^finishBlock)(NSData * data);
@property(nonatomic,copy)void(^failedBlock)(NSError * error);


// get
-(void)startRequest;
// post
-(void)postWithPara:(NSDictionary * )para;
@end
