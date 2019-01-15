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