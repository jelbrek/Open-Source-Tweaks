#import <substrate.h>
#import <mach-o/dyld.h>

%hook AppsFlyerUtils
+(BOOL)isJailbreakon {
    return false;
}
-(BOOL)isJailbroken {
    return false;
}
%end

%hook NSFileManager
- (BOOL)fileExistsAtPath:(NSString *)path {
		if([path isEqualToString:@"/bin/bash"]) {
					return NO;
				} else if([path isEqualToString:@"/bin/sh"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/Cydia.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/sbin/sshd"]) {
					return NO;
				} else if([path isEqualToString:@"/etc/apt"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/bin/ssh"]) {
					return NO;
				} else {
					return %orig;
					}
				}		
%end


int (*orig_1000BBE6C)(void);

int sub_1000BBE6C(void)
{
    return 0;
}

%ctor
{
    @autoreleasepool
    {
        unsigned long test1 = _dyld_get_image_vmaddr_slide(0) + 0x1000BBE6C;
        MSHookFunction((void *)test1, (void *)sub_1000BBE6C, (void **)&orig_1000BBE6C);
		
    }
}

