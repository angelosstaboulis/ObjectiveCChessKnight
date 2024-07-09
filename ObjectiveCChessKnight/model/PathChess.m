//
//  PathChess.m
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import "PathChess.h"

@implementation PathChess
- (instancetype)initWithCells:(NSArray<ChessCell *> *)cellList {
    self = [super init];
    if (self) {
        _path = cellList;
    }
    return self;
}

- (NSString *)notation {
    NSMutableString *fullPathNotation = [NSMutableString string];
    NSArray *letters = @[@"A", @"B", @"C", @"D", @"E", @"F", @"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P"];
    
    for (ChessCell *cell in self.path) {
        NSString *move = [NSString stringWithFormat:@"%@%ld", letters[cell.xPosition], (long)cell.yPosition + 1];
        [fullPathNotation appendFormat:@" %@ <- ", move];
    }
    
    return [fullPathNotation substringToIndex:fullPathNotation.length - 4];
}
@end
