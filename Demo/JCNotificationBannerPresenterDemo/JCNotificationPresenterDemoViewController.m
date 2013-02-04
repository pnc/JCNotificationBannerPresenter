#import "JCNotificationPresenterDemoViewController.h"
#import "JCNotificationBannerPresenter.h"
#import "JCNotificationBannerViewIOSStyle.h"

@interface JCNotificationPresenterDemoViewController ()

@property (weak, nonatomic) IBOutlet UITextField* titleTextField;
@property (weak, nonatomic) IBOutlet UITextView* messageTextView;
@property (weak, nonatomic) IBOutlet UISwitch* customizationSwitch;


@end

@implementation JCNotificationPresenterDemoViewController

- (IBAction) presentNotificationButtonTapped:(id)sender {
  JCNotificationBannerStyle style = kJCNotificationBannerPresenterStyleAndroidToast;
  if (self.customizationSwitch.on) {
    style = kJCNotificationBannerPresenterStyleIOSBanner;
  }

  [JCNotificationBannerPresenter enqueueNotificationWithTitle:self.titleTextField.text
                                                      message:self.messageTextView.text
                                                   tapHandler:^{
                                                     UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Tapped notification"
                                                                                                     message:@"Perform some custom action on notification tap event..."
                                                                                                    delegate:nil
                                                                                           cancelButtonTitle:@"OK"
                                                                                           otherButtonTitles:nil];
                                                     [alert show];
                                                   }
                                                        style: style];
}

- (void) viewDidUnload {
  [self setMessageTextView:nil];
  [self setTitleTextField:nil];
  [super viewDidUnload];
}

@end
