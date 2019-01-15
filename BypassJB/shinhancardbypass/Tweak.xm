%hook ams2Library
-(long long) a3142:(id)arg1 { return %orig - 10; }
%end

%hook DocumentPath
+(bool) isJailbroken {return false; }
%end