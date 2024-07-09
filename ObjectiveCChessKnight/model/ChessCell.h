//
//  ChessCell.h
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChessCell : NSObject

@property  NSInteger xPosition;
@property  NSInteger yPosition;

- (instancetype)initWithX:(NSInteger)xPosition Y:(NSInteger)yPosition;
@end

NS_ASSUME_NONNULL_END
