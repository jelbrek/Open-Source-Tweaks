%hook NSFileManager
- (BOOL)fileExistsAtPath:(NSString *)path {
		if([path isEqualToString:@"/bin"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/WinterBoard.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/SBSettings.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/Cydia.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/RockApp.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/Icy.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/blackra1n.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/WinterBoard.app"]) {
					return NO;	
				} else if([path isEqualToString:@"/Applications/SBSettings.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Application/FakeCarrier.app"]) {
					return NO;
				} else if([path isEqualToString:@"/System/Library/LaunchDaemons/com.ikey.bbot.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/DynamicLibraries/Veency.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/tmp/cydia.log"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/lib/cydia"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/lib/apt"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/sbin/sshd"]) {
					return NO;
				} 
				  else {
					return %orig;
					}
				}		
%end