//
//  Coordinate.h
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Coordinate : NSObject
@property (nonatomic, readonly) NSInteger x;
@property (nonatomic, readonly) NSInteger y;

- (instancetype)initWithX:(NSInteger)xPos Y:(NSInteger)yPos;
- (BOOL)isSameCoordinateWith:(Coordinate *)coordinate;
@end

NS_ASSUME_NONNULL_END
