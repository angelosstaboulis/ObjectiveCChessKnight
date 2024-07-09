//
//  ViewController.h
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import <UIKit/UIKit.h>
#import "Chessboard.h"
@interface ViewController : UIViewController
@property Chessboard *chessboard;
@property UIButton *btnStart;
@property UIButton *btnReset;
- (void) btnStartClick;
- (void) btnResetClick;
@end

