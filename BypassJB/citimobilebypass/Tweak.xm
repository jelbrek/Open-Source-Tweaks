%hook MobileAPI
-(int) isJailbroken {
return 0;
}

-(int) getJailBreak {
return 0;
}
%end

%hook mVaccine
-(bool) isJailBreak {
return false;
}

-(bool) checkJailBreakFile{
return false;
}

-(bool) checkJailBreakFolder{
return false;
}

-(bool) checkFSTabFileSize{
return false;
}

-(bool)checkUrl{
return false;
}
%end

%hook BSAppIron
-(int) IiiIiIiiI {
return 9013; 
}
%end

%hook I3GDeviceInfo
+(id)getJailbreakInfo {
return (id)CFSTR("NO");
}
%end
