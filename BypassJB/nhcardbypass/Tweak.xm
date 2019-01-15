
%hook ams2Library
-(long long) fairPlay:(id)arg1 { return %orig - 144; }
%end

%hook BTWCGXMLParser
-(bool) isJailBroken {
  return false;
}

-(id) checkRooting:(id)arg1 {
return 0;
}
%end

%hook Codeguard
+(bool) isJailBroken {
return false;
}
%end

%hook ixcJailBreakDetect
+(id)isJailbroken {
return (id)CFSTR("N");
}

+(char)findPiratedApps {
return 0;
}

+(char)isPiratedApp {
return 0;
}


+(char)checkJailbreak {
return 0;
}

%end

%hook SSLGuardWebViewVerifier
-(int)isJailBroken {
  return 0;
}
%end

%hook ixcSecureManager 
+(char)checkJailbreak {
return 0;
}
%end

