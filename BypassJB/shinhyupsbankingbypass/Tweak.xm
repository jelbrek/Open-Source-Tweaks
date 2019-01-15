%hook BSAppIron
-(int) IiiIiIiiI {
return 9013; 
}
%end

%hook PPDeviceUtil 
+(bool) isJailbrokenDevice {
return false;
}
%end

