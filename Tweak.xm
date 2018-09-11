#import <UIKit/UIKit.h>
//Imports for notifications
#import <imports.h>
#import <JBBulletinManager.h>
@interface SBIconProgressView : UIView
@end

%hook SBIconProgressView
-(void)setDisplayedFraction:(double)arg1 {
  %orig;
  //Check if arg1 is greater than or equal to 1.00 if it is then send notification.
  if (arg1 >= 1.00) {
    [[objc_getClass("JBBulletinManager") sharedInstance] showBulletinWithTitle:@"Finished!" message:@"Your Application is done downloading!" bundleID:@"com.rustybalboadev.downloadnotify"];
  }
}
%end
