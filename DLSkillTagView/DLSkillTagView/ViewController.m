//
//  ViewController.m
//  DLSkillTagView
//
//  Created by FT_David on 2016/11/17.
//  Copyright © 2016年 FT_David. All rights reserved.
//

#import "ViewController.h"
#import "SKTagView.h"


@interface ViewController ()<UIAlertViewDelegate>
@property (strong, nonatomic) SKTagView *tagView;
@property (strong, nonatomic) NSArray *colors;
@property (weak, nonatomic) IBOutlet UITextField *index;
@end

@implementation ViewController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTagView];
    
    
}

#pragma mark - Private
- (void)setupTagView {
    self.tagView = ({
        SKTagView *view = [SKTagView new];
        view.backgroundColor = [UIColor whiteColor];
        view.padding = UIEdgeInsetsMake(40, 20, 40, 20);
        view.interitemSpacing = 15;
        view.lineSpacing = 10;
        __block SKTagView *blockView = view;
        view.didTapTagAtIndex = ^(NSUInteger index){
            if (index == 0) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"输入技能" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
                [alertView show];
            }
        };
        view;
    });
    self.tagView.frame = self.view.bounds;
    [self.view addSubview:self.tagView];
    
    
    //Add Tags
    [@[@"Python", @"Javascript", @"Python", @"Swift", @"Go", @"Objective-C", @"C", @"PHP"] enumerateObjectsUsingBlock: ^(NSString *text, NSUInteger idx, BOOL *stop) {
        SKTag *tag = [SKTag tagWithText: text];
        if (idx == 0) {
            tag.text = @"  ";
            tag.padding = UIEdgeInsetsMake(0, 0, 0, 0);
            UIImage *image = [UIImage imageNamed:@"ft_newLS_addSkill"];
            NSLog(@"%@",NSStringFromCGSize(image.size));
            tag.bgImg = image;
        }else{
            tag.textColor = [UIColor blueColor];
            tag.slcTextColor = [UIColor whiteColor];
            tag.fontSize = 15;
            tag.padding = UIEdgeInsetsMake(11, 12.5, 11, 12.5);
            tag.slcColor = [UIColor blueColor];
            tag.nrmColor = [UIColor clearColor];
            tag.borderWidth = 1;
            tag.borderColor = [UIColor blueColor];
        }
        [self.tagView addTag:tag];
    }];
}

- (IBAction)onTapBg: (id)sender {
    [self.view endEditing: YES];
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        SKTag *tag = [SKTag tagWithText: [alertView textFieldAtIndex:0].text];
        tag.textColor = [UIColor blueColor];
        tag.slcTextColor = [UIColor whiteColor];
        tag.fontSize = 15;
        tag.padding = UIEdgeInsetsMake(11, 12.5, 11, 12.5);
        tag.slcColor = [UIColor blueColor];
        tag.nrmColor = [UIColor clearColor];
        tag.borderWidth = 1;
        tag.borderColor = [UIColor blueColor];
        
        [self.tagView insertTag:tag atIndex:1];
    }
}



@end