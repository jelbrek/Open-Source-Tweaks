%hook AppDelegate
-(bool) doXecureAppShield
{
  return true;
}

%end

%hook AppDelegate
-(void) systemCheck
{
  
}
%end
