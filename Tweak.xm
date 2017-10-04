#import <libactivator/libactivator.h>
#import <UIKit/UIKit.h>

@interface FEMenuOpen : NSObject <LAListener>

+ bool active;

@end

@implementation FEMenuOpen

- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event {
	if (/* your plugin is activated */) {
		// Dismiss your plugin
		return;
	}
	
	// Activate your plugin

	[event setHandled:YES]; // To prevent the default OS implementation
}

+ (void)load {
	if ([LASharedActivator isRunningInsideSpringBoard]) {
		[LASharedActivator registerListener:[self new] forName:@"com.nbear3.multfe_active"];
	}
}

@end