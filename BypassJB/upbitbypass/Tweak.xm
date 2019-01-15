%hook BSAppIron
-(int) IiiIiIiiI {
return 9013; 
}
%end

%hook AppsFlyerUtils
+(bool) isJailBreakon {
return false;
}
%end

%hook ANSMetadata 
-(bool) computeIsJailbroken {
return false; 
}
%end