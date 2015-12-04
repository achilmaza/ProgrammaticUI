//
//  SignupViewController.m
//  ProgrammaticUI
//
//  Created by Aditya Narayan on 8/31/15.
//  Copyright (c) 2015 Angie Chilmaza. All rights reserved.
//

#import "SignupViewController.h"
#import "FormTextField.h"
#import "FormButton.h"

@interface SignupViewController ()

@property (nonatomic, strong) UIView * formView;
@property (nonatomic, strong) FormTextField * name;
@property (nonatomic, strong) FormTextField * email;
@property (nonatomic, strong) FormTextField * password;
@property (nonatomic, strong) FormButton * signupButton;


-(void)setupMasterView;
-(void)createSignUpForm;

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMasterView];
}


-(void)viewDidLayoutSubviews {
    
    //set the frame first before setting the center
    float formWidth   = 335;
    float formHeight  = 300;
    float formY = 160;
    
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)){
        formY = 100;
    }
    
    self.formView.frame = CGRectMake(0, formY, formWidth, formHeight);
    self.formView.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.formView.center.y);
    
}

-(void) setupMasterView {
    
    self.title = @"Hireme";
    
    UIFont * font = [UIFont fontWithName:@"HoeflerText-BlackItalic" size:32];
    self.navigationController.navigationBar.titleTextAttributes =  [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,
                                                                    [UIColor colorWithRed:0.537 green:0.525 blue:0.545 alpha:1], NSForegroundColorAttributeName, nil];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"abstractColorBlock.jpg"]];
    
    [self createSignUpForm];
    
}

-(void)createSignUpForm {
    
    float fieldHeight = 45;
    float fieldOffset = 5;
    float formWidth   = 335;
    float formHeight  = 300;
    float formY = 160;
    
    self.formView = [[UIView alloc] initWithFrame:CGRectMake(0, formY, formWidth, formHeight)];
    self.formView.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.formView.center.y);
    
    self.name = [[FormTextField alloc] initWithPlaceholder:@"Name" andIcon:@"user.png"];
    [self.formView addSubview:self.name];
    self.name.frame = CGRectMake(0, 0, self.name.superview.bounds.size.width, fieldHeight);
    self.name.delegate = self;
    
    self.email = [[FormTextField alloc] initWithPlaceholder:@"Email" andIcon:@"mail.png"];
    [self.formView addSubview:self.email];
    self.email.frame = CGRectMake(0, fieldHeight + fieldOffset, self.email.superview.bounds.size.width, fieldHeight);
    self.email.delegate = self;
    
    self.password = [[FormTextField alloc] initWithPlaceholder:@"Password" andIcon:@"lock.png"];
    [self.formView addSubview:self.password];
    self.password.frame = CGRectMake(0, fieldHeight*2 + fieldOffset*2, self.password.superview.bounds.size.width, fieldHeight);
    self.password.delegate = self;
    
    self.signupButton = [[FormButton alloc] initWithTitle:@"Sign Up"];
    [self.formView addSubview:self.signupButton];
    self.signupButton.frame = CGRectMake(0, fieldHeight*3 + fieldOffset*3, self.signupButton.superview.bounds.size.width, fieldHeight);
    
    [self.view addSubview:self.formView];
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES]; //get rid of keyboard
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
