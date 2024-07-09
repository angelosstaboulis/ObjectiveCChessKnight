//
//  PathChess.h
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import <Foundation/Foundation.h>
#import "ChessCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface PathChess : NSObject
@property (nonatomic, readonly) NSArray<ChessCell *> *path;
@property (nonatomic, readonly) NSString *notation;

- (instancetype)initWithCells:(NSArray<ChessCell *> *)cellList;
@end

NS_ASSUME_NONNULL_END
