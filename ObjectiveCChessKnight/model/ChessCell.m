//
//  ChessCell.m
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import "ChessCell.h"

@implementation ChessCell

- (instancetype)initWithX:(NSInteger)xPosition Y:(NSInteger)yPosition {
    self = [super init];
    if (self) {
        _xPosition = xPosition;
        _yPosition = yPosition;
    }
    return self;
}

@end
