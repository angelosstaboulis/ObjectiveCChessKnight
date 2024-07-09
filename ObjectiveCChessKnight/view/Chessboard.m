//
//  Chessboard.m
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import "Chessboard.h"

@implementation Chessboard
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _boardSize = 6;
        _cellSide = -1;
        _locationOfKnight = [[Coordinate alloc] initWithX:0 Y:0];
        _knightInitialCell = [[ChessCell alloc] initWithX:1 Y:1];
        _targetInitialCell = [[ChessCell alloc] initWithX:4 Y:3];
        _knight = [[Knight alloc] initWithStartingCell:_knightInitialCell];
        _engine = [[Engine alloc] init];
        _game = [[Game alloc] initWithKnight:_knight engine:_engine targetCell:_targetInitialCell];
    }
    return self;
}
- (void)applyConfiguration{
    self.boardSize = 8;
    self.locationOfKnight = [[Coordinate alloc] initWithX:1 Y:1];
    [self setNeedsDisplay];
}
- (void)printResults{
    NSArray<PathChess *> *path = [_game findAllPaths];
    for(PathChess *chess in path){
        NSLog(@"path=%@",[chess notation]);
    }
}
- (void)drawRect:(CGRect)rect {
    self.cellSide = self.bounds.size.width / (CGFloat)self.boardSize;
    
    for (NSInteger column = 0; column < self.boardSize; column++) {
        for (NSInteger row = 0; row < self.boardSize; row++) {
            [self drawSquareAt:[[Coordinate alloc] initWithX:column Y:row]];
        }
    }
    
    [self drawKnightAt:self.locationOfKnight];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *firstTouch = [touches anyObject];
    CGPoint location = [firstTouch locationInView:self];
    
    Coordinate *coordinateClicked = [self getSquareLocationByX:location.x y:location.y];
    BOOL isKnightDragged = [coordinateClicked isSameCoordinateWith:self.locationOfKnight];
    
    if (!isKnightDragged) return;
    
    self.coordinateStartDragging = coordinateClicked;
    if (isKnightDragged) {
        self.typeOfPieceStartDragging = PieceTypeKnight;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.coordinateStartDragging) return;
    
    UITouch *firstTouch = [touches anyObject];
    CGPoint location = [firstTouch locationInView:self];
    Coordinate *coordinateClicked = [self getSquareLocationByX:location.x y:location.y];
    
    if (![self isInputClickWithinViewBoundsWithX:location.x y:location.y]) {
        self.typeOfPieceStartDragging = PieceTypeKnight;
        self.coordinateStartDragging = coordinateClicked;
        return;
    }
    
    if (self.typeOfPieceStartDragging == PieceTypeKnight) {
        self.locationOfKnight = coordinateClicked;
        [self.delegate onKnightPositionChanged:coordinateClicked];
    }
    
    self.typeOfPieceStartDragging = 0;
    self.coordinateStartDragging = coordinateClicked;
    [self setNeedsDisplay];
}



- (void)drawKnightAt:(Coordinate *)coordinate {
    CGFloat xToDraw = (CGFloat)coordinate.x * self.cellSide;
    CGFloat yToDraw = (CGFloat)coordinate.y * self.cellSide;
    
    UIImage *img = [UIImage imageNamed:@"chess"];
    [img drawInRect:CGRectMake(xToDraw, yToDraw, self.cellSide, self.cellSide)];
}

- (void)drawSquareAt:(Coordinate *)coordinate {
    CGFloat xToDraw = (CGFloat)coordinate.x * self.cellSide;
    CGFloat yToDraw = (CGFloat)coordinate.y * self.cellSide;
    
    UIBezierPath *box = [UIBezierPath bezierPathWithRect:CGRectMake(xToDraw, yToDraw, self.cellSide, self.cellSide)];
    
    UIColor *squareColor = [self getSquareColorWithCol:coordinate.x row:coordinate.y];
    [squareColor setFill];
    [box fill];
}

- (UIColor *)getSquareColorWithCol:(NSInteger)col row:(NSInteger)row {
    return (col + row) % 2 == 0 ? [UIColor whiteColor] : [UIColor darkGrayColor];
}

- (Coordinate *)getSquareLocationByX:(CGFloat)x y:(CGFloat)y {
    Coordinate *coordinate = [[Coordinate alloc] initWithX:(NSInteger)(x / self.cellSide) Y:(NSInteger)(y / self.cellSide)];
    return coordinate;
}

- (BOOL)isInputClickWithinViewBoundsWithX:(CGFloat)x y:(CGFloat)y {
    return x <= self.bounds.size.width && y <= self.bounds.size.height;
}
- (void)onKnightPositionChanged:(Coordinate *)newLocation{
    ChessCell *chessCell = [[ChessCell alloc] initWithX:newLocation.x Y:newLocation.y];
    [self.game changeKnightPosition:chessCell];
}
@end
