%hook amsLibrary
-(long long) a3142:(id)arg1 { return %orig - 10; }
%end

%hook Codeguard
+(bool) isJailBroken {
return false; }
%end

%hook BTWCGXMLParser
-(bool) isJailBroken {
return false; }
%end