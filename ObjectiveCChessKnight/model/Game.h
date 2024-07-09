//
//  Game.h
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import <Foundation/Foundation.h>
#import "Knight.h"
#import "ChessCell.h"
#import "Engine.h"
#import "PathChess.h"
NS_ASSUME_NONNULL_BEGIN

@interface Game : NSObject
@property Knight *knight;
@property ChessCell *targetCell;
@property Engine *engine;
- (instancetype)initWithKnight:(Knight *)knight engine:(Engine *)engine targetCell:(ChessCell *)targetCell;
- (void)changeKnightPosition:(ChessCell *)cell;
- (NSArray<PathChess *> *)findAllPaths;
@end

NS_ASSUME_NONNULL_END
