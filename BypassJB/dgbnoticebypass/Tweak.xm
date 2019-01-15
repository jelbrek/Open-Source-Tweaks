%hook mVaccine

-(bool) mvc{
return false;
}

-(bool) mvcd{
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