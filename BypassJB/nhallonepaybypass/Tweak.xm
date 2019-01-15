#import <mach-o/dyld.h>
#include <sys/stat.h>

%hook NSString 
- (BOOL)writeToFile:(NSString *)path  {
		if([path isEqualToString:@"/private/test_jb.txt"]) {
					return NO;
				}
				else {
					return %orig;
					}
				}
%end

%hook NSFileManager
- (BOOL)removeItemAtPath:(NSString *)path {
				if([path isEqualToString:@"/private/test_jb.txt"]) {
					return NO;
				}
				else {
					return %orig;
					}
				}	


- (BOOL)fileExistsAtPath:(NSString *)path 
             isDirectory:(BOOL *)isDirectory {
					if([path isEqualToString:@"/private/var/lib/apt/"]) {
					return NO;
				} 
				    else if([path isEqualToString:@"/private/var/lib/cydia/"]) {
					return NO;
				} 
				    else if([path isEqualToString:@"/private/var/mobile/Library/SBSettings/Themes/"]) {
					return NO;
				} 
					else if([path isEqualToString:@"/private/var/stash/"]) {
					return NO;
				} 
				    else if([path isEqualToString:@"/usr/libexec/cydia/"]) {
					return NO;
				} 
				    else if([path isEqualToString:@"/var/cache/apt/"]) {
					return NO;
				}   
				    else if([path isEqualToString:@"/var/lib/apt/"]) {
					return NO;
				}
					else if([path isEqualToString:@"/var/lib/cydia/"]) {
					return NO;
				} else if([path isEqualToString:@"/etc/apt/"]) {
					return NO;
				} 
					else {
					return %orig;
					}
				}				

- (BOOL)fileExistsAtPath:(NSString *)path {
		if([path isEqualToString:@"/Applications/Cydia.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/blackra1n.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/FakeCarrier.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/Icy.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/IntelliScreen.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/MxTube.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/RockApp.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/SBSettings.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/WinterBoard.app"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/tmp/cydia.log"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/usr/bin/sshd"]) {
					return NO;
				}
				  else if([path isEqualToString:@"/usr/sbin/sshd"]) {
					return NO;
				}
				  else if([path isEqualToString:@"/usr/libexec/sftp-server"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/System/Library/LaunchDaemons/com.ikey.bbot.plist"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/var/log/syslog"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/bin/bash"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/bin/sh"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/etc/ssh/sshd_config"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/usr/libexec/ssh-keysign"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/Library/PreferenceBundles/tsProtectorPSettings"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/Library/PreferenceBundles/tsProtectorSettings"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/Library/PreferenceBundles/tsProtectorPFBSettings"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/DynamicLibraries/tsProtector.dylib"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/DynamicLibraries/tsProtector.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/PreferenceBundles/tsProtectorSettings.bundle"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/PreferenceBundles/tsProtectorSettings.bundle/en.proj/tsProtectorSettings.strings"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/PreferenceBundles/tsProtectorSettings.bundle/ko.proj/tsProtectorSettings.strings"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/PreferenceBundles/tsProtectorSettings.bundle/tsProtector.png"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/PreferenceBundles/tsProtectorSettings.bundle/tsProtector@2x.png"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/PreferenceBundles/tsProtectorSettings.bundle/tsProtectorSettings"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/PreferenceLoader/Preferences/tsProtectorSettings.plist"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/DynamicLibraries/tsProtector.dylib"]) {
					return NO;
				}
				  else {
					return %orig;
					}
				}		
%end


%hook ams2Library
-(long long) fairPlay:(id)arg1 { return %orig - 144; }
%end

%hook BTWCGXMLParser
-(bool) isJailBroken {
  return false;
}

-(id) checkRooting:(id)arg1 {
return nil;
}
%end

%hook Codeguard
+(bool) isJailBroken {
return false;
}
%end

%hook ixcJailBreakDetect
+(id)isJailbroken {
return (id)CFSTR("N");
}

+(char)findPiratedApps {
return 0;
}

+(char)isPiratedApp {
return 0;
}


+(char)checkJailbreak {
return 0;
}


%end





static FILE * (*orig_fopen) ( const char * filename, const char * mode );
FILE * new_fopen ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/bin/bash") == 0) {
        return NULL;
    }
    return orig_fopen(filename, mode);
}

static FILE * (*orig_fopen2) ( const char * filename, const char * mode );
FILE * new_fopen2 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/Applications/Cydia.app") == 0) {
        return NULL;
    }
    return orig_fopen2(filename, mode);
}

static FILE * (*orig_fopen3) ( const char * filename, const char * mode );
FILE * new_fopen3 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/Library/MobileSubstrate/MobileSubstrate.dylib") == 0) {
        return NULL;
    }
    return orig_fopen3(filename, mode);
}

static FILE * (*orig_fopen4) ( const char * filename, const char * mode );
FILE * new_fopen4 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/usr/sbin/sshd") == 0) {
        return NULL;
    }
    return orig_fopen4(filename, mode);
}

static FILE * (*orig_fopen5) ( const char * filename, const char * mode );
FILE * new_fopen5 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/etc/apt") == 0) {
        return NULL;
    }
    return orig_fopen5(filename, mode);
}







static int (*orig_lstat)(const char *path, struct stat *buf);
int new_lstat(const char *path, struct stat *buf) {
    if (strcmp(path, "/Applications") == 0) {
        return -1;
    }
    return orig_lstat(path, buf);
}

static int (*orig_lstat2)(const char *path, struct stat *buf);
int new_lstat2(const char *path, struct stat *buf) {
    if (strcmp(path, "/var/stash/Library/Ringtones") == 0) {
        return -1;
    }
    return orig_lstat2(path, buf);
}

static int (*orig_lstat3)(const char *path, struct stat *buf);
int new_lstat3(const char *path, struct stat *buf) {
    if (strcmp(path, "/var/stash/Library/Wallpaper") == 0) {
        return -1;
    }
    return orig_lstat3(path, buf);
}

static int (*orig_lstat4)(const char *path, struct stat *buf);
int new_lstat4(const char *path, struct stat *buf) {
    if (strcmp(path, "/var/stash/usr/include") == 0) {
        return -1;
    }
    return orig_lstat4(path, buf);
}

static int (*orig_lstat5)(const char *path, struct stat *buf);
int new_lstat5(const char *path, struct stat *buf) {
    if (strcmp(path, "/var/stash/usr/libexec") == 0) {
        return -1;
    }
    return orig_lstat5(path, buf);
}

static int (*orig_lstat6)(const char *path, struct stat *buf);
int new_lstat6(const char *path, struct stat *buf) {
    if (strcmp(path, "/var/stash/usr/share") == 0) {
        return -1;
    }
    return orig_lstat6(path, buf);
}

static int (*orig_lstat7)(const char *path, struct stat *buf);
int new_lstat7(const char *path, struct stat *buf) {
    if (strcmp(path, "/var/stash/usr/arm-apple-darwin9") == 0) {
        return -1;
    }
    return orig_lstat7(path, buf);
}



%ctor
{
    %init;
	MSHookFunction((void *)fopen, (void *)new_fopen, (void **)&orig_fopen);
	MSHookFunction((void *)fopen, (void *)new_fopen2, (void **)&orig_fopen2);
	MSHookFunction((void *)fopen, (void *)new_fopen3, (void **)&orig_fopen3);
	MSHookFunction((void *)fopen, (void *)new_fopen4, (void **)&orig_fopen4);
	MSHookFunction((void *)fopen, (void *)new_fopen5, (void **)&orig_fopen5);

       MSHookFunction((void *)lstat, (void *)new_lstat, (void **)&orig_lstat);
	MSHookFunction((void *)lstat, (void *)new_lstat2, (void **)&orig_lstat2);
	MSHookFunction((void *)lstat, (void *)new_lstat3, (void **)&orig_lstat3);
	MSHookFunction((void *)lstat, (void *)new_lstat4, (void **)&orig_lstat4);
	MSHookFunction((void *)lstat, (void *)new_lstat5, (void **)&orig_lstat5);
	MSHookFunction((void *)lstat, (void *)new_lstat6, (void **)&orig_lstat6);
	MSHookFunction((void *)lstat, (void *)new_lstat7, (void **)&orig_lstat7);
		
		
        
}
