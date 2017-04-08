//
//  CustomMessageBox.m
//  testbackgroundcolor
//
//  Created by Shujat on 30/03/2017.
//  Copyright © 2017 Shujat. All rights reserved.
//

#import "CustomMessageBox.h"

@implementation CustomMessageBox

/*
 
        QuadLeft
        b---------------------c
       a                       d
       |                       |
       |                       |
        i___h  f______________e
            | /
            |/
            g
 
 
        QuadRight
        b---------------------c
       a                       d
       |                       |
       |                       |
        i_______________h  f__e
                         \ |
                          \|
                           g
 
 
 */



-(void)resetLayout {
    NSInteger paddingAll = 2;
    
    if(_paddingAll != 0){
        paddingAll = _paddingAll;
    }
    
    int height = CGRectGetHeight(self.frame);
    int width = CGRectGetWidth(self.frame);
    
    NSInteger bottomy = height * 0.7;
    
    if(_bottomSpaceArrow != 0){
        bottomy = height - _bottomSpaceArrow;
    }
    
    int x1Bottom = width * 0.2;
    int x2Bottom = width * 0.35;
    
    
    
    int curveRadius = 10;
    NSInteger borderWidth = 10;
    NSInteger paddingTopLeft = 10;
    NSInteger paddingBottomLeft = 10;
    
    if(_borderWidth !=0){
        borderWidth = _borderWidth;
    }
    
    CAShapeLayer *lineShapeBorder = [[CAShapeLayer alloc] init];
    lineShapeBorder.zPosition = 0.0f;
    lineShapeBorder.strokeColor = _borderColor.CGColor;
    lineShapeBorder.lineWidth = borderWidth;
    lineShapeBorder.lineCap = kCALineCapRound;
    lineShapeBorder.lineJoin = kCALineJoinRound;
    
    
    UIBezierPath* path = [[UIBezierPath alloc]init];
    
    if(_QuadRight){
        
        x1Bottom = width - x1Bottom;
        x2Bottom = width - x2Bottom;
        
        /*a*/[path moveToPoint:CGPointMake(0 +paddingAll ,0 + paddingAll+curveRadius)];
        /*b*/[path addQuadCurveToPoint:CGPointMake(0 + curveRadius + paddingAll, 0+paddingAll) controlPoint:CGPointMake(0+paddingAll, 0+paddingAll)];
        
        
        /*c*/[path addLineToPoint:CGPointMake(width - curveRadius-paddingAll,0+paddingAll+curveRadius)];
        /*d*/[path addQuadCurveToPoint:CGPointMake(width-paddingAll , 0 + curveRadius+paddingAll+paddingTopLeft) controlPoint:CGPointMake(width-paddingAll, 0+paddingAll+paddingTopLeft)];
        
        
        /*e1*/[path addLineToPoint:CGPointMake(width -paddingAll,bottomy+paddingAll-paddingBottomLeft*2.5)];
        /*e2*/[path addQuadCurveToPoint:CGPointMake(width -curveRadius-paddingAll,bottomy - curveRadius+paddingAll-paddingBottomLeft ) controlPoint:CGPointMake(width-paddingAll,bottomy+paddingAll-paddingBottomLeft*2.1)];
        
        
        /*f*/[path addLineToPoint:CGPointMake(x1Bottom+paddingAll , bottomy+paddingAll-paddingBottomLeft*1.5)];
        /*g*/[path addLineToPoint:CGPointMake(x1Bottom +paddingAll, height-paddingAll)];
        /*h*/[path addLineToPoint:CGPointMake(x2Bottom +paddingAll, bottomy+paddingAll-paddingBottomLeft)];
        
        
        
        
        /*i1*/[path addLineToPoint:CGPointMake(0 + curveRadius+paddingAll ,bottomy+paddingAll)];
        /*i2*/[path addQuadCurveToPoint:CGPointMake(0+ paddingAll, bottomy -paddingAll-curveRadius) controlPoint:CGPointMake(0+paddingAll,bottomy -paddingAll)];
    }
    else {
    /*a*/[path moveToPoint:CGPointMake(0 +paddingAll ,0 + curveRadius+paddingAll+paddingTopLeft)];
    /*b*/[path addQuadCurveToPoint:CGPointMake(0 + curveRadius + paddingAll, 0+paddingAll+paddingTopLeft) controlPoint:CGPointMake(0+paddingAll, 0+paddingAll+paddingTopLeft)];
    
    
    /*c*/[path addLineToPoint:CGPointMake(width - curveRadius-paddingAll,0+paddingAll)];
    /*d*/[path addQuadCurveToPoint:CGPointMake(width-paddingAll , 0 + curveRadius+paddingAll) controlPoint:CGPointMake(width-paddingAll, 0+paddingAll)];
    
    
    /*e1*/[path addLineToPoint:CGPointMake(width -paddingAll,bottomy - curveRadius-paddingAll)];
    /*e2*/[path addQuadCurveToPoint:CGPointMake(width -curveRadius-paddingAll, bottomy+paddingAll) controlPoint:CGPointMake(width-paddingAll,bottomy+paddingAll)];
    
    
    /*f*/[path addLineToPoint:CGPointMake(x2Bottom+paddingAll , bottomy+paddingAll-paddingBottomLeft)];
    /*g*/[path addLineToPoint:CGPointMake(x1Bottom +paddingAll, height-paddingAll)];
    /*h*/[path addLineToPoint:CGPointMake(x1Bottom +paddingAll, bottomy+paddingAll-paddingBottomLeft*1.5)];
    
    
    
    
    /*i1*/[path addLineToPoint:CGPointMake(0 + curveRadius+paddingAll ,bottomy+paddingAll-paddingBottomLeft*2.1)];
    /*i2*/[path addQuadCurveToPoint:CGPointMake(0+ paddingAll, bottomy - curveRadius+paddingAll-paddingBottomLeft*3) controlPoint:CGPointMake(0+paddingAll,bottomy+paddingAll-paddingBottomLeft*2.5)];
    
    }
    
    
    [path closePath];
    
    CAShapeLayer *fillLayer = [CAShapeLayer new];
    lineShapeBorder.path = fillLayer.path = path.CGPath;
    fillLayer.fillColor = _quadColor.CGColor;
    
    [lineShapeBorder addSublayer:fillLayer];
    
    
    [self.layer addSublayer:lineShapeBorder];
}

-(void)drawRect:(CGRect)rect{
    [self resetLayout];
    [super drawRect:rect];
    
}


-(void)setBottomSpaceArrow:(NSInteger)bottomSpaceArrow{
    _bottomSpaceArrow = bottomSpaceArrow;
    
    
}

-(void)setBorderWidth:(NSInteger )borderWidth{
    _borderWidth = borderWidth;
}


-(void)setQuadColor:(UIColor *)quadColor {
    _quadColor = quadColor;
    
}
-(void)setBorderColor : (UIColor *)borderColor{
    _borderColor = borderColor;
    
}

-(void)setPaddingAll:(NSInteger)paddingAll{
    _paddingAll = paddingAll;
}

-(void)setQuadRight:(BOOL)QuadRight{
    _QuadRight = QuadRight;
}


@end
