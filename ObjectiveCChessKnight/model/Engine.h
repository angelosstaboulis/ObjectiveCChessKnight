//
//  Engine.h
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import <Foundation/Foundation.h>
#import "ExtraCell.h"
#import "Knight.h"
#import "Stack.h"
NS_ASSUME_NONNULL_BEGIN

@interface Engine : NSObject
@property (nonatomic, strong) NSMutableArray<ExtraCell *> *satisfiedNewCells;
@property (nonatomic, strong) NSArray<ExtraCell *>  *cells;
@property (nonatomic, strong) Knight *virtualKnight;
@property (nonatomic, strong) ExtraCell *startingCell;
@property (nonatomic, strong) NSArray<ChessCell *>  *validKnightMoves;
@property (nonatomic, strong) Stack *data;

- (void)dfs:(ExtraCell *)startingCell targetCell:(ChessCell *)targetCell;
- (void)solve:(Knight *)knight targetCell:(ChessCell *)targetCell;
- (NSArray<ExtraCell *> *)convertCellsToNewCells:(NSArray<ChessCell *> *)cellsList previousCell:(ExtraCell *)previousCell;
@end

NS_ASSUME_NONNULL_END
