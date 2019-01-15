%hook Codeguard
+(id) checkRooting{
  return nil;
}

-(void) setRootingCheck:(bool)arg1 {
  arg1 = false;
}

-(bool) rootingCheck {
  return false;
}

+(bool) isJailBroken {
  return false;
}
%end

%hook BTWCodeGuardManager
-(void) setRootingCheck:(bool)arg1 {
  arg1 = false;
}

-(bool) rootingCheck {
  return false;
}
%end

%hook SSLGuardWebViewVerifier
-(int)isJailBroken {
  return 0;
}
%end

%hook BTWCGXMLParser
-(bool) isJailBroken {
  return false;
}
%end

%hook MainViewController
-(bool) checkJailBreak {
  return false;
}
%end
