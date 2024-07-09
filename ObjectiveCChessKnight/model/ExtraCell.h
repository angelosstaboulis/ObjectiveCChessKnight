//
//  ExtraCell.h
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import <Foundation/Foundation.h>
#import "ChessCell.h"
#import "PathChess.h"
NS_ASSUME_NONNULL_BEGIN

@interface ExtraCell : NSObject
@property (nonatomic, strong) ExtraCell *previousCell;
@property (nonatomic, assign) NSInteger numberOfMovesMade;
@property (nonatomic, strong) ChessCell *cell;

- (instancetype)initWithPreviousCell:(ExtraCell *)cell xPosition:(NSInteger)xPosition yPosition:(NSInteger)yPosition numberOfMovesMade:(NSInteger)num;
- (BOOL)isEqualToCell:(ChessCell *)cellToBeCompared;
- (BOOL)hasMoreMoves;
- (PathChess *)getPath;

@end

NS_ASSUME_NONNULL_END
