

#import "Json.h"

@implementation Json
+(id)getJSONObjectWithData:(NSData *)data{
    if (data) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        return object;
    }

    return nil;
}
@end
