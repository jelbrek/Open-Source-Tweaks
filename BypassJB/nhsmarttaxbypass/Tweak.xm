%hook SSLGuardWebViewVerifier
-(int)isJailBroken {
  return 0;
}
%end

%hook ams2Library
-(long long) fairPlay:(id)arg1 { return %orig - 144; }
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
