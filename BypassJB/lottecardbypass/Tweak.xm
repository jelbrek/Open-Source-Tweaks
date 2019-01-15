#include <Foundation/Foundation.h>
#include <mach-o/dyld.h>
#include <spawn.h>
#include <unistd.h>

%hook ams2Library
-(long long) a3142:(id)arg1 { return %orig - 10; }
%end

%hook ANSMetadata
-(bool) isJailbroken {
return false;
}
-(bool) computerIsJailbroken {
return false;
}
%end


%hook NSFileManager
- (BOOL)fileExistsAtPath:(NSString *)path {
		if([path isEqualToString:@"/bin/bash"]) {
					return NO;
				} else if([path isEqualToString:@"/etc/apt"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/lib/hacktivate.dylib"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/Cydia.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/blackra1n.app"]) {
					return NO;
				} 
				  else {
					return %orig;
					}
				}		
%end











/*


int (*orig_100A635E0)(void);

int sub_100A635E0(void)
{
    return 121;
}

%ctor
{
    @autoreleasepool
    {
        unsigned long test1 = _dyld_get_image_vmaddr_slide(0) + 0x100A635E0;
        MSHookFunction((void *)test1, (void *)sub_100A635E0, (void **)&orig_100A635E0);
		
    }
}


%hook XASAskJobs
+(int) updateCheck {
return 121;
}
%end
*/
