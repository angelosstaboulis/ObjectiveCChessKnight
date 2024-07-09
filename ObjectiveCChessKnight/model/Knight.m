//
//  Knight.m
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import "Knight.h"

@implementation Knight
- (instancetype)initWithStartingCell:(ChessCell *)location {
    self = [super init];
    if (self) {
        _currentLocation = location;
    }
    return self;
}

- (NSArray<ChessCell *> *)getValidMoves {
    NSMutableArray<ChessCell *> *validMovesList = [NSMutableArray array];
    
    NSInteger curX = self.currentLocation.xPosition;
    NSInteger curY = self.currentLocation.yPosition;
    
    if ([self isMoveWithinBounds:curX + 2 y:curY + 1]) {
        ChessCell *cell = [[ChessCell alloc] initWithX:curX+2 Y:curY+1];
        [validMovesList addObject:cell];
    }
    if ([self isMoveWithinBounds:curX + 2 y:curY - 1]) {
        ChessCell *cell = [[ChessCell alloc] initWithX:curX+2 Y:curY-1];
        [validMovesList addObject:cell];
    }
    if ([self isMoveWithinBounds:curX - 2 y:curY + 1]) {
        ChessCell *cell = [[ChessCell alloc] initWithX:curX-2 Y:curY+1];
        [validMovesList addObject:cell];
    }
    if ([self isMoveWithinBounds:curX - 2 y:curY - 1]) {
        ChessCell *cell = [[ChessCell alloc] initWithX:curX-2 Y:curY-1];
        [validMovesList addObject:cell];
    }
    
    if ([self isMoveWithinBounds:curX + 1 y:curY + 2]) {
        ChessCell *cell = [[ChessCell alloc] initWithX:curX+1 Y:curY+2];
        [validMovesList addObject:cell];
    }
    if ([self isMoveWithinBounds:curX + 1 y:curY - 2]) {
        ChessCell *cell = [[ChessCell alloc] initWithX:curX+1 Y:curY-2];
        [validMovesList addObject:cell];
    }
    if ([self isMoveWithinBounds:curX - 1 y:curY + 2]) {
        ChessCell *cell = [[ChessCell alloc] initWithX:curX-1 Y:curY+2];
        [validMovesList addObject:cell];
    }
    if ([self isMoveWithinBounds:curX - 1 y:curY - 2]) {
        ChessCell *cell = [[ChessCell alloc] initWithX:curX-1 Y:curY-2];
        [validMovesList addObject:cell];
    }
    
    return validMovesList;
}

- (BOOL)isMoveWithinBounds:(NSInteger)x y:(NSInteger)y {
    if (x < 0 || x > 6 - 1) {
        return NO;
    }
    if (y < 0 || y > 6 - 1) {
        return NO;
    }
    return YES;
}

@end
