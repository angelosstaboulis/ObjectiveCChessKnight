//
//  Game.m
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import "Game.h"

@implementation Game
- (instancetype)initWithKnight:(Knight *)knight engine:(Engine *)engine targetCell:(ChessCell *)targetCell
{
    self = [super init];
    if (self) {
        _knight = knight;
        _engine = engine;
        _targetCell = targetCell;
    }
    return self;
}

- (void)changeKnightPosition:(ChessCell *)cell
{
    _knight.currentLocation = cell;
}

- (NSArray<PathChess *> *)findAllPaths
{
    NSMutableArray<PathChess *> *pathFoundList = [NSMutableArray array];
    
    [_engine solve:_knight targetCell:_targetCell];
    
    for (ExtraCell *curMetaCell in _engine.satisfiedNewCells) {
        [pathFoundList addObject:[curMetaCell getPath]];
    }
    return [pathFoundList copy];
}
@end
