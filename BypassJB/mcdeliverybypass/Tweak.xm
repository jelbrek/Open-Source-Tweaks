%hook StartupOperation 
- (BOOL) checkInject{
	return false;
	}
- (BOOL) checkReadWritePermissions{
	return false;
	}
- (BOOL) checkDyld{
	return false;
	}
- (BOOL) checkFiles{
	return false;
	}
- (BOOL) checkSymlinks{
return false;
}
%end

%hook UIApplication 
- (BOOL)canOpenURL:(NSURL *)url {
    if([[url absoluteString] isEqualToString:@"cydia://"]) {
		return NO;
				}
				else if([[url absoluteString] isEqualToString:@"cydia://package/com.example.package"]) {
					return NO;
					}
				else {
					return %orig;
					}
				}
%end

%hook NSString 
- (BOOL)writeToFile:(NSString *)path  {
		if([path isEqualToString:@"/private/jailbreak.txt"]) {
					return NO;
				}  else {
					return %orig;
					}
				}
%end


%hook NSFileManager
- (BOOL)removeFileAtPath:(NSString *)path {
		if([path isEqualToString:@"/private/jailbreak.txt"]) {
					return NO;
				}  else {
					return %orig;
					}
				}
				

- (BOOL)fileExistsAtPath:(NSString *)path {
		if([path isEqualToString:@"/Applications/Cydia.app"]) {
					return NO;
				} else if([path isEqualToString:@"/var/cache/apt"]) {
					return NO;
				} else if([path isEqualToString:@"/var/lib/apt"]) {
					return NO;
				} else if([path isEqualToString:@"/var/lib/cydia"]) {
					return NO;
				} else if([path isEqualToString:@"/var/log/syslog"]) {
					return NO;
				} else if([path isEqualToString:@"/var/tmp/cydia.log"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]) {
					return NO;
				} else if([path isEqualToString:@"/bin/bash"]) {
					return NO;
				} else if([path isEqualToString:@"/bin/sh"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/sbin/sshd"]) {
					return NO;
				} else if([path isEqualToString:@"/etc/ssh/sshd_config"]) {
					return NO;
				} else if([path isEqualToString:@"/etc/apt"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/stash"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/mobile/Library/SBSettings/Themes"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/DynamicLibraries/Veency.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/DynamicLibraries/LiveClock.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/System/Library/LaunchDaemons/com.ikey.bbot.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/libexec/ssh-keysign"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/bin/sshd"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/libexec/sftp-server"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/RockApp.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/Icy.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/WinterBoard.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/SBSettings.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/MxTube.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/IntelliScreen.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/FakeCarrier.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/blackra1n.app"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/lib/apt/"]) {
					return NO;
				} else {
					return %orig;
					}
				}		
%end