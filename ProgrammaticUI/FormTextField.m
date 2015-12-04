//
//  FormTextField.m
//  ProgrammaticUI
//
//  Created by Aditya Narayan on 8/31/15.
//  Copyright (c) 2015 Angie Chilmaza. All rights reserved.
//

#import "FormTextField.h"

@implementation FormTextField


- (instancetype)init
{
    return [self initWithPlaceholder:@"" andIcon:@""];
}

-(instancetype)initWithPlaceholder:(NSString*)placeholderText andIcon:(NSString*)imageVal{
    
    self = [super init];
    if( self ){
        self.backgroundColor = [UIColor colorWithRed:0.937 green:0.925 blue:0.949 alpha:1];
        [[self layer] setCornerRadius:4.0f];
        self.placeholder = placeholderText;
        self.clipsToBounds = YES;

//        UIView *spacerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
//        [self setLeftViewMode:UITextFieldViewModeAlways];
//        [self setLeftView:spacerView];
//        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36, 26)];
        imgView.image = [UIImage imageNamed:imageVal];
        [self setLeftViewMode:UITextFieldViewModeAlways];
        [self setLeftView:imgView];
    }
    
    return self;
}

//// placeholder position
//- (CGRect)textRectForBounds:(CGRect)bounds {
//    return CGRectInset( bounds , 120 , 120 );
//}
//
//// text position
//- (CGRect)editingRectForBounds:(CGRect)bounds {
//    return CGRectInset( bounds , 120 , 120 );
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
