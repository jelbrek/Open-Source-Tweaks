%hook MintAppEnvironment 
-(bool) isJailbroken {
return false;
}
%end

%hook KSFileUtil
+(int) checkJailBreak {
return -100;
}
%end

%hook Codeguard

+(bool) isJailBroken {
  return false;
}
%end

%hook BTWCGXMLParser
-(bool) isJailBroken {
  return false;
}
%end

%hook ams2Library
-(long long) a3142:(id)arg1 { return %orig - 10; }
%end

%hook amsLibrary
-(long long) a3142:(id)arg1 { return %orig - 10; }
%end