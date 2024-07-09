//
//  Knight.h
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import <Foundation/Foundation.h>
#import "ChessCell.h"
NS_ASSUME_NONNULL_BEGIN
@protocol Movable
- (NSArray<ChessCell *> *)getValidMoves;
@end

@protocol Piece <Movable>
@property (nonatomic, strong) ChessCell *currentLocation;
@end

@interface Knight : NSObject<Piece>
@property (nonatomic, strong) ChessCell *currentLocation;

- (instancetype)initWithStartingCell:(ChessCell *)location;
- (NSArray<ChessCell *> *)getValidMoves;
@end

NS_ASSUME_NONNULL_END
