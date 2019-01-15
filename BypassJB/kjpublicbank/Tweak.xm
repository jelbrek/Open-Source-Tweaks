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

%hook Utility

+(bool) isJailBroken {
  return false;
}
%end

%hook BTWCodeGuardManager 
-(void) setJbCheckArray:(id)arg1
{ 
arg1 = nil; 
}

-(id) jbCheckArray {
return nil;
}
%end

