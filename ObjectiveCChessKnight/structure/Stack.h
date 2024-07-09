//
//  Stack.h
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import <Foundation/Foundation.h>
#import "ExtraCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface Stack : NSObject
@property NSMutableArray *items;
- (ExtraCell *)peek;
- (void)pop;
- (void)push:(ExtraCell *)element;
- (BOOL)isEmpty;
- (NSUInteger)count;
@end

NS_ASSUME_NONNULL_END
