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
