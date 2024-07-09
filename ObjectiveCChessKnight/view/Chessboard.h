//
//  Chessboard.h
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import <UIKit/UIKit.h>
#import "Coordinate.h"
#import "Game.h"
#import "ChessCell.h"
#import "Knight.h"
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM (NSInteger,PieceType) {
    PieceTypeKnight = 0
};

@protocol ChessBoardDelegate <NSObject>
- (void)onKnightPositionChanged:(Coordinate *)newLocation;
@end

@interface Chessboard : UIView<ChessBoardDelegate>
@property (nonatomic) NSInteger boardSize;
@property (nonatomic) CGFloat cellSide;
@property (nonatomic, strong) Coordinate *locationOfKnight;
@property (nonatomic, weak) id<ChessBoardDelegate> delegate;
@property (nonatomic, strong) Coordinate *coordinateStartDragging;
@property (nonatomic) PieceType typeOfPieceStartDragging;
@property (nonatomic,strong) ChessCell *knightInitialCell;
@property (nonatomic,strong) ChessCell *targetInitialCell;
@property (nonatomic,strong) Knight *knight;
@property (nonatomic,strong) Game *game;
@property (nonatomic,strong) Engine *engine;
- (void) printResults;
- (void)applyConfiguration;
- (void)drawKnightAt:(Coordinate *)coordinate;
- (void)drawSquareAt:(Coordinate *)coordinate;
- (UIColor *)getSquareColorWithCol:(NSInteger)col row:(NSInteger)row;
- (Coordinate *)getSquareLocationByX:(CGFloat)x y:(CGFloat)y;
- (BOOL)isInputClickWithinViewBoundsWithX:(CGFloat)x y:(CGFloat)y;
@end

NS_ASSUME_NONNULL_END
