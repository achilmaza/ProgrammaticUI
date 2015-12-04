//
//  ViewController.m
//  ProgrammaticUI
//
//  Created by Aditya Narayan on 8/28/15.
//  Copyright (c) 2015 Angie Chilmaza. All rights reserved.
//

#import "ViewController.h"
#import "SignupViewController.h"
#import "FormTextField.h"
#import "FormButton.h"

@interface ViewController ()

@property (nonatomic, strong) UINavigationBar * navbar;
@property (nonatomic, strong) UISegmentedControl * segmentedControl;
@property (nonatomic, strong) UIView * square;
@property (nonatomic, strong) UIView * formView;
@property (nonatomic, strong) FormTextField * email;
@property (nonatomic, strong) FormTextField * password;
@property (nonatomic, strong) FormButton * loginButton;
@property (nonatomic, strong) UIScrollView * aboutScrollView;
@property (nonatomic, strong) UIView * bottomSectionView;
@property (nonatomic, strong) UILabel * signupLabel;
@property (nonatomic, strong) UIButton * signupButton;

-(void)setupMasterView;
-(void)createSegmentedControl;
-(void)segmentedControlSwitch:(id)sender;
-(void)createLoginForm;
-(void)createAbout;
-(void)createSquare;
-(void)signupViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupMasterView];
}

//-(void)viewWillLayoutSubviews {
//    
//    [super viewWillLayoutSubviews];
//    
//}

-(void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    //self.navbar.frame = CGRectMake(0, 0, self.view.bounds.size.width, 75);

    //set the frame first before setting the center
    float formWidth   = 335;
    float formHeight  = 300;
    float formY = 160;
    float segmentedControlY = 100;
    float aboutY = 160;
    
    if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation)){
        formY = 100;
        segmentedControlY = 50;
        aboutY = 110;
    }

    self.formView.frame = CGRectMake(0, formY, formWidth, formHeight);
    self.formView.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.formView.center.y);
    self.square.frame = CGRectMake(self.view.bounds.size.width - 70, self.view.bounds.size.height - 70, 50, 50);
    
    self.segmentedControl.frame = CGRectMake(0, segmentedControlY, self.view.frame.size.width-50, 30);
    self.segmentedControl.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.segmentedControl.center.y);
    self.aboutScrollView.frame = CGRectMake(0, aboutY, self.view.bounds.size.width-50,
                                                       self.view.bounds.size.height-200);
    self.aboutScrollView.contentInset = UIEdgeInsetsMake(10, 20, 0, 20);
    self.aboutScrollView.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.aboutScrollView.center.y);
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
}


-(void) setupMasterView {
    
    self.title = @"Hireme";
    
    UIFont * font = [UIFont fontWithName:@"HoeflerText-BlackItalic" size:32];
    self.navigationController.navigationBar.titleTextAttributes =  [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,
                                                                   [UIColor colorWithRed:0.537 green:0.525 blue:0.545 alpha:1], NSForegroundColorAttributeName, nil];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"abstractColorBlock.jpg"]];
    
    [self createSquare];
    [self createLoginForm];
    //[self createSegmentedControl];
    
}

-(void)createNavbar {
    
    self.navbar = [[UINavigationBar alloc]init];
    self.navbar.barTintColor = [UIColor whiteColor];
    
    UINavigationItem* item = [[UINavigationItem alloc] initWithTitle:@"Hireme"];
    UIFont * font = [UIFont fontWithName:@"HoeflerText-BlackItalic" size:32];
    [self.navbar pushNavigationItem:item animated:YES];
    
    self.navbar.titleTextAttributes =  [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,
                                                    [UIColor colorWithRed:0.537 green:0.525 blue:0.545 alpha:1], NSForegroundColorAttributeName, nil];

    [self.view addSubview:self.navbar];
    
}

-(void)createSegmentedControl {
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Login", @"About", nil]];
    self.segmentedControl.frame = CGRectMake(0,100, self.view.frame.size.width-50, 30);
    //self.segmentedControl.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.segmentedControl.center.y);
    self.segmentedControl.backgroundColor = [UIColor colorWithRed:0.984 green:0.965 blue:0.965 alpha:1];
    
    NSLog(@"self.view.center = (%f, %f) \n", self.view.center.x, self.view.center.y);
    NSLog(@"self.view.bounds = (%f, %f) \n", self.view.bounds.origin.x, self.view.bounds.origin.y);
    NSLog(@"self.view.bounds = %f x %f \n", self.view.bounds.size.width, self.view.bounds.size.height);
    NSLog(@"segmentedControl.center = (%f, %f) \n", self.segmentedControl.center.x, self.segmentedControl.center.y);
    
    [self.segmentedControl addTarget:self action:@selector(segmentedControlSwitch:) forControlEvents:UIControlEventValueChanged];

    [self createAbout];
    [self.view addSubview:self.segmentedControl];
    
}


-(void)segmentedControlSwitch:(id)sender {
    
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            self.formView.hidden = false;
            self.aboutScrollView.hidden = true;
            break;
            
        case 1:
            self.formView.hidden = true;
            self.aboutScrollView.hidden = false;
            break;
            
        default:
            break;
    }

}

-(void)createLoginForm {
    
    float fieldHeight = 45;
    float fieldOffset = 5;
    float formWidth   = 335;
    float formHeight  = 300;
    float formY = 160;
    
    
    self.formView = [[UIView alloc] initWithFrame:CGRectMake(0, formY, formWidth, formHeight)];
    self.formView.center = CGPointMake(CGRectGetMidX(self.view.bounds), self.formView.center.y);
    //[[self.formView layer] setBorderWidth:2.0f];
    
    self.email = [[FormTextField alloc] initWithPlaceholder:@"Email" andIcon:@"mail.png"];
    [self.formView addSubview:self.email];
    self.email.frame = CGRectMake(0, 0, self.email.superview.bounds.size.width, fieldHeight);
    self.email.delegate = self;
    
    self.password = [[FormTextField alloc] initWithPlaceholder:@"Password" andIcon:@"lock.png"];
    [self.formView addSubview:self.password];
    self.password.frame = CGRectMake(0, fieldHeight + fieldOffset, self.password.superview.bounds.size.width, fieldHeight);
    self.password.delegate = self;
    
    self.loginButton = [[FormButton alloc] initWithTitle:@"Login"];
    [self.formView addSubview:self.loginButton];
    self.loginButton.frame = CGRectMake(0, fieldHeight*2 + fieldOffset*2, self.loginButton.superview.bounds.size.width, fieldHeight);
    
    self.signupLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,fieldHeight*3 + fieldOffset*3, 170, 50)];
    self.signupLabel.text = @"Do not have an account?";
    self.signupLabel.font = [UIFont fontWithName:@"GillSans" size:16];
    self.signupLabel.textColor = [UIColor colorWithRed:0.875 green:0.871 blue:0.871 alpha:1];
    [self.formView addSubview:self.signupLabel];
    
    self.signupButton = [[UIButton alloc] initWithFrame:CGRectMake(170,fieldHeight*3 + fieldOffset*3, 50, 50)];
    [self.signupButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [self.signupButton setTitleColor:[UIColor colorWithRed:0.992 green:0.976 blue:0.976 alpha:1] forState:UIControlStateNormal];
    self.signupButton.titleLabel.font = [UIFont fontWithName:@"GillSans" size:16];
    [self.formView addSubview:self.signupButton];
    [self.signupButton addTarget:self action:@selector(signupViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.formView];
}


-(void)createAbout {
    
    self.aboutScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 160, self.view.bounds.size.width-50, 400)];
    self.aboutScrollView.backgroundColor = [UIColor colorWithRed:0.937 green:0.925 blue:0.949 alpha:0.7];
    
    UILabel *label = [[UILabel alloc] initWithFrame: CGRectMake(0,0, 400, 400)];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label.textColor = [UIColor colorWithRed:0.49 green:0.482 blue:0.494 alpha:1];
    
    NSString *txt = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium.";
   

    [label setText:txt];
    [self.aboutScrollView addSubview:label];
    [self.aboutScrollView setHidden:true];
    [self.aboutScrollView setContentSize:label.frame.size];
    
    [self.view addSubview:self.aboutScrollView];
    
}


-(void)createSquare {
    
    self.square = [[UIView alloc] init];
    self.square.backgroundColor = [UIColor colorWithRed:0.686 green:0.09 blue:0.584 alpha:1];
    [[self.square layer] setCornerRadius:10.0f];
    [[self.square layer] setMasksToBounds:YES];
    
    [self.view addSubview:self.square];
}


-(void) signupViewController{

    SignupViewController * signupVC = [[SignupViewController alloc] init];
    [self.navigationController pushViewController:signupVC animated:YES];
    
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

@end
