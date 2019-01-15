#import <mach-o/dyld.h>

%hook amsLibrary
-(long long) a3142:(id)arg1 { return %orig - 10; }
%end

%hook XASAskJobs
+(int)isPure {
return 0;
}
%end

int (*orig_1003F5F68)(void);

int sub_1003F5F68(void)
{
    return 0;
}

%ctor
{
    @autoreleasepool
    {
        unsigned long test1 = _dyld_get_image_vmaddr_slide(0) + 0x1003F5F68;
        MSHookFunction((void *)test1, (void *)sub_1003F5F68, (void **)&orig_1003F5F68);
		
    }
}