#import <mach-o/dyld.h>

%hook ams2Library
-(long long) fairPlay:(id)arg1 { return %orig - 144; }
%end


int (*orig_100049F10)(void);

int sub_100049F10(void)
{
    return 0;
}

%ctor
{
    @autoreleasepool
    {
        unsigned long test1 = _dyld_get_image_vmaddr_slide(0) + 0x100049F10  ;
        MSHookFunction((void *)test1, (void *)sub_100049F10  , (void **)&orig_100049F10  );
		
    }
}

