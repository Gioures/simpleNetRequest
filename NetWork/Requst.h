
#import <Foundation/Foundation.h>

@interface Requst : NSObject
@property(nonatomic,copy) NSString * urlString;
@property(nonatomic,copy)void(^finishBlock)(NSData * data);
@property(nonatomic,copy)void(^failedBlock)(NSError * error);
@property (nonatomic , strong) NSDictionary * header;

// get
-(void)startRequest;
// post
-(void)postWithPara:(NSDictionary * )para;
@end
