//
//  AboutNavigationController.m
//  iSH
//
//  Created by Theodore Dubois on 10/6/19.
//

#import "AboutNavigationController.h"
#import "UserPreferences.h"
#import "NSObject+SaneKVO.h"

@interface AboutNavigationController ()

@end

@implementation AboutNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UserPreferences.shared observe:@[@"scheme"] options:NSKeyValueObservingOptionInitial
                              owner:self usingBlock:^(typeof(self) self) {
        if (@available(iOS 13, *)) {
            UIKeyboardAppearance appearance = UserPreferences.shared.scheme.keyboardAppearance;
            if (appearance == UIKeyboardAppearanceDark) {
                self.overrideUserInterfaceStyle = UIUserInterfaceStyleDark;
            } else {
                self.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
            }
        }
    }];
}

@end
