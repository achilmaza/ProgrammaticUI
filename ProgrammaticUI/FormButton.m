//
//  FormButton.m
//  ProgrammaticUI
//
//  Created by Aditya Narayan on 8/31/15.
//  Copyright (c) 2015 Angie Chilmaza. All rights reserved.
//

#import "FormButton.h"

@implementation FormButton


- (instancetype)init{
    
    return [self initWithTitle:@""];
}

- (instancetype)initWithTitle:(NSString*)titleVal
{
    self = [super init];
    if (self) {
        [[self layer] setCornerRadius:4.0f];
        [[self layer] setMasksToBounds:YES];
        self.backgroundColor = [UIColor colorWithRed:0.686 green:0.09 blue:0.584 alpha:1];
        [self setTitle:titleVal forState:UIControlStateNormal];
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
