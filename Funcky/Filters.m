#import "Filters.h"

@implementation Filters

+ (BOOL (^)(NSString *))isEqualToString:(NSString *)comparable {
    return [[^(NSString *item) { return (BOOL)[item isEqualToString:comparable]; } copy] autorelease];
}

+ (BOOL (^)(id))isEqual:(id)comparable {
    return [[^(id item) { return (BOOL)[item isEqual:comparable]; } copy] autorelease];
}

@end