//
//  ViewController.m
//  ObjectiveCChessKnight
//
//  Created by Angelos Staboulis on 9/7/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    // Do any additional setup after loading the view.
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [[self navigationItem] setTitle:@"Chessboard"];
    _chessboard = [[Chessboard alloc] initWithFrame:CGRectMake(45, 100, 300, 300)];
    [_chessboard applyConfiguration];
    [[self view] addSubview:_chessboard];
    _btnStart = [[UIButton alloc] initWithFrame:CGRectMake(45, 450, 300, 45)];
    [_btnStart setTitle:@"Start" forState:UIControlStateNormal];
    [_btnStart setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [[self view] addSubview:_btnStart];
    [_btnStart addTarget:self action:@selector(btnStartClick) forControlEvents:UIControlEventAllEvents];
    _btnReset = [[UIButton alloc] initWithFrame:CGRectMake(45, 500, 300, 45)];
    [_btnReset setTitle:@"Reset" forState:UIControlStateNormal];
    [_btnReset setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [[self view] addSubview:_btnReset];
    [_btnReset addTarget:self action:@selector(btnResetClick) forControlEvents:UIControlEventAllEvents];
}

- (void)btnStartClick{
    [_chessboard printResults];
}
- (void)btnResetClick{
    [_chessboard applyConfiguration];
}
@end
