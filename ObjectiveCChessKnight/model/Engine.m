//
//  Engine.m
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import "Engine.h"

@implementation Engine
- (instancetype)init {
    self = [super init];
    if (self) {
        _satisfiedNewCells = [NSMutableArray array];
        _cells = [[NSArray alloc] init];
        _validKnightMoves = [NSMutableArray array];
        _data = [[Stack alloc] init];
    }
    return self;
}

- (void)dfs:(ExtraCell *)startingCell targetCell:(ChessCell *)targetCell {
    [_data push:startingCell];
    while (![_data isEmpty]) {
        ExtraCell *topInStackCell = [_data peek];
        if (![topInStackCell hasMoreMoves]) {
            if ([topInStackCell isEqualToCell:targetCell]) {
                [_satisfiedNewCells addObject:topInStackCell];
            }
           [_data pop];
            continue;
        }
        _virtualKnight.currentLocation = topInStackCell.cell;
        _validKnightMoves = [_virtualKnight getValidMoves];
        _cells = [self convertCellsToNewCells:_validKnightMoves previousCell:topInStackCell];
        [_data pop];
        for (ExtraCell *newCell in _cells) {
            [_data push:newCell];
        }
    }
}

- (void)solve:(Knight *)knight targetCell:(ChessCell *)targetCell {
    _startingCell = [[ExtraCell alloc] initWithPreviousCell:nil xPosition:knight.currentLocation.xPosition yPosition:knight.currentLocation.yPosition numberOfMovesMade:0];
    _virtualKnight = [[Knight alloc] initWithStartingCell:knight.currentLocation];
    [self dfs:_startingCell targetCell:targetCell];
}

- (NSArray<ExtraCell *> *)convertCellsToNewCells:(NSArray<ChessCell *> *)cellsList previousCell:(ExtraCell *)previousCell {
    NSMutableArray<ExtraCell *> *metaCellList = [NSMutableArray array];
    for (ChessCell *cell in cellsList) {
        ChessCell *getCell = cell;
        ExtraCell *cell = [[ExtraCell alloc] initWithPreviousCell:previousCell xPosition:getCell.xPosition yPosition:getCell.yPosition numberOfMovesMade:previousCell.numberOfMovesMade + 1];
        [metaCellList addObject:cell];
    }
    return [metaCellList copy];
}

@end
