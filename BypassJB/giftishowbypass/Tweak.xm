#import <substrate.h>
#import <mach-o/dyld.h>

%hook NSFileManager
- (BOOL)fileExistsAtPath:(NSString *)path {
		if([path isEqualToString:@"/Applications/Cydia.app"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/lib/apt/"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/RockApp.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/Icy.app"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/sbin/sshd"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/bin/sshd"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/libexec/sftp-server"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/WinterBoard.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/SBSettings.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/MxTube.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/IntelliScreen.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/DynamicLibraries/Veency.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/stash"]) {
					return NO;
				} else if([path isEqualToString:@"/System/Library/LaunchDaemons/com.ikey.bbot.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/tmp/cydia.log"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/lib/cydia"]) {
					return NO;
				} else if([path isEqualToString:@"/etc/clutch.conf"]) {
					return NO;
				} else if([path isEqualToString:@"/var/cache/clutch.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/etc/clutch_cracked.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/var/cache/clutch_cracked.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/var/lib/clutch/overdrive.dylib"]) {
					return NO;
				} else if([path isEqualToString:@"/var/root/Documents/Cracked/"]) {
					return NO;
				} else {
					return %orig;
					}
				}		
%end

%hook UIApplication 
- (BOOL)canOpenURL:(NSURL *)url {
    return [[url absoluteString] isEqualToString:@"cydia://package/com.example.package"] ? NO : %orig;
}
%end

int (*orig_100137514)(void);

int sub_100137514(void)
{
    return 4783242;
}

%ctor
{
    @autoreleasepool
    {
        unsigned long test1 = _dyld_get_image_vmaddr_slide(0) + 0x100137514;
        MSHookFunction((void *)test1, (void *)sub_100137514, (void **)&orig_100137514);
		
    }
}