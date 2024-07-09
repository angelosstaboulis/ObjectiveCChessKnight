//
//  Coordinate.m
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import "Coordinate.h"

@implementation Coordinate
- (instancetype)initWithX:(NSInteger)xPos Y:(NSInteger)yPos {
    self = [super init];
    if (self) {
        _x = xPos;
        _y = yPos;
    }
    return self;
}

- (BOOL)isSameCoordinateWith:(Coordinate *)coordinate {
    return self.x == coordinate.x && self.y == coordinate.y;
}

@end
