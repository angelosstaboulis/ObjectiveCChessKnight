//
//  Stack.m
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import "Stack.h"

@implementation Stack
- (instancetype)init {
    self = [super init];
    if (self) {
        _items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (ExtraCell *)peek {
    return [_items firstObject];
}

- (void)pop {
    [_items removeObjectAtIndex:0];
}

- (void)push:(ExtraCell *)element {
    [_items insertObject:element atIndex:0];
}

- (BOOL)isEmpty {
    return [_items count] == 0;
}
- (NSUInteger)count{
    return [_items count];
}
@end
