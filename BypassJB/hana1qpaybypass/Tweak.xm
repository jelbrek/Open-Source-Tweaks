#import <substrate.h>
#import <mach-o/dyld.h>

%hook ams2Library
-(long long) a3142:(id)arg1 { return %orig - 10; }
%end

%hook BTWCGXMLParser
-(bool) isJailBroken {
  return false;
}
%end

%hook Codeguard

+(bool) isJailBroken {
  return false;
}
%end

%hook I3GDeviceInfo
+(id)getJailbreakInfo {
return (id)CFSTR("NO");
}
%end


%hook NSFileManager
- (BOOL)removeFileAtPath:(NSString *)path {
    return [path isEqualToString:@"/private/jailbreak.text"] ? NO : %orig;
}
%end


%hook NSString 
- (BOOL)writeToFile:(NSString *)path  {
    return [path isEqualToString:@"/private/jailbreak.txt"] ? NO : %orig;
}
%end

%hook UIApplication 
- (BOOL)canOpenURL:(NSURL *)url {
    return [[url absoluteString] isEqualToString:@"cydia://package/com.example.package"] ? NO : %orig;
}
%end


int (*orig_1006A7610)(void);

int sub_1006A7610(void)
{
    return 0;
}

%ctor
{
    @autoreleasepool
    {
        unsigned long test1 = _dyld_get_image_vmaddr_slide(0) + 0x1006A7610;
        MSHookFunction((void *)test1, (void *)sub_1006A7610, (void **)&orig_1006A7610);
		
    }
}
