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

%hook SSLGuardWebViewVerifier
-(int)isJailBroken {
  return 0;
}
%end