#import <UIKit/UIKit.h>
#import <imports.h>
#import <JBBulletinManager.h>
@interface SBIconProgressView : UIView
@end

%hook SBIconProgressView
-(void)setDisplayedFraction:(double)arg1 {
  %orig;
  if (arg1 >= 1.00) {
    [[objc_getClass("JBBulletinManager") sharedInstance] showBulletinWithTitle:@"Finished!" message:@"Your Application is done downloading!" bundleID:@"com.rustybalboadev.downloadnotify"];
  }
}
%end
