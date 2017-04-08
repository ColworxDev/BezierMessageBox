//
//  CustomMessageBox.h
//  testbackgroundcolor
//
//  Created by Shujat on 30/03/2017.
//  Copyright © 2017 Shujat. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface CustomMessageBox : UIView

@property (nonatomic) IBInspectable UIColor *quadColor;
@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable NSInteger borderWidth;

@property (nonatomic) IBInspectable NSInteger bottomSpaceArrow;

@property (nonatomic) IBInspectable NSInteger paddingAll;

@property (nonatomic) IBInspectable BOOL QuadRight;

-(void)setQuadColor:(UIColor *)quadColor ;
-(void)setBorderColor : (UIColor *)borderColor;


@end
