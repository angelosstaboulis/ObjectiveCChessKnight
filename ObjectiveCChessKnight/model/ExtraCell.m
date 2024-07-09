//
//  ExtraCell.m
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import "ExtraCell.h"

@implementation ExtraCell
- (instancetype)initWithPreviousCell:(ExtraCell *)cell xPosition:(NSInteger)xPosition yPosition:(NSInteger)yPosition numberOfMovesMade:(NSInteger)num {
    self = [super init];
    if (self) {
        self.previousCell = cell;
        self.numberOfMovesMade = num;
        self.cell = [[ChessCell alloc] initWithX:xPosition Y:yPosition];
    }
    return self;
}

- (BOOL)isEqualToCell:(ChessCell *)cellToBeCompared {
    return cellToBeCompared.xPosition == self.cell.xPosition && cellToBeCompared.yPosition == self.cell.yPosition;
}

- (BOOL)hasMoreMoves {
    return self.numberOfMovesMade < 3;
}

- (PathChess *)getPath {
    NSMutableArray *cellVisitedList = [NSMutableArray array];
    ExtraCell *currentCell = self;
    
    for (NSInteger i = 0; i < self.numberOfMovesMade + 1; i++) {
        [cellVisitedList addObject:currentCell.cell];
        currentCell = currentCell.previousCell;
    }
    
    return [[PathChess alloc] initWithCells:cellVisitedList];
}

@end
