#include <sys/stat.h>
#import <mach-o/dyld.h>
#include <spawn.h>
#include <unistd.h>


const char *notablst[] = {"/Applications/Cydia.app", "/Library/MobileSubstrate/MobileSubstrate.dylib", "/bin/bash", "/usr/sbin/sshd", "/etc/apt", "/usr/bin/ssh", "/bin/sh", "/var/cache/apt", "/var/lib/apt", "/var/lib/cydia", "/var/log/syslog", "/var/tmp/cydia.log", "/usr/libexec/ssh-keysign", "/etc/ssh/sshd_config"};

%hook AppJailBrokenChecker
+(unsigned char) isAppJailbroken 
{ 
	return 0;
}
%end

%hook NSString 
- (BOOL)writeToFile:(NSString *)path  {
		if([path isEqualToString:@"/private/jailbreak.txt"]) {
					return NO;
				} 
		else if([path isEqualToString:@"/private/test_jb.txt"]) {
					return NO;
				}
				else {
					return %orig;
					}
				}
			
			
- (BOOL)hasPrefix:(NSString *)code {
		if([code isEqualToString:@"A30"]) {
					code = nil;
					return %orig;

				}
				else if([code isEqualToString:@"A302"]) {
					code = nil;
					return %orig;
					
				}
				else {
					return %orig;
					}
				}


%end



%hook UIApplication 
- (BOOL)canOpenURL:(NSURL *)url {
    if([[url absoluteString] isEqualToString:@"cydia://package/com.example.package"]) {
		return NO;
				}
	else if([[url absoluteString] isEqualToString:@"cydia://package/com.fake.package"]) {
		return NO;
				}
				else {
					return %orig;
					}
				}
%end

%hook NSFileManager
- (BOOL)removeItemAtPath:(NSString *)path {
		if([path isEqualToString:@"/private/jailbreak.txt"]) {
					return NO;
				} 
				else if([path isEqualToString:@"/private/test_jb.txt"]) {
					return NO;
				}
				else {
					return %orig;
					}
				}	
				
- (BOOL)fileExistsAtPath:(NSString *)path 
             isDirectory:(BOOL *)isDirectory {
					if([path isEqualToString:@"/etc/apt/"]) {
					return NO;
				} 
				    else if([path isEqualToString:@"/var/lib/cydia/"]) {
					return NO;
				} 
				    else if([path isEqualToString:@"/var/lib/apt/"]) {
					return NO;
				} 
					else if([path isEqualToString:@"/var/cache/apt/"]) {
					return NO;
				} 
				    else if([path isEqualToString:@"/usr/libexec/cydia/"]) {
					return NO;
				} 
				    else if([path isEqualToString:@"/private/var/stash/"]) {
					return NO;
				}   
				    else if([path isEqualToString:@"/private/var/mobile/Library/SBSettings/Themes/"]) {
					return NO;
				}
					else if([path isEqualToString:@"/private/var/lib/cydia/"]) {
					return NO;
				}
					else if([path isEqualToString:@"/private/var/lib/apt/"]) {
					return NO;
				}
					else {
					return %orig;
					}
				}				

- (BOOL)fileExistsAtPath:(NSString *)path {
		if([path isEqualToString:@"/Applications/Cydia.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Library/MobileSubstrate/MobileSubstrate.dylib"]) {
					return NO;
				} else if([path isEqualToString:@"/bin/bash"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/sbin/sshd"]) {
					return NO;
				} else if([path isEqualToString:@"/etc/apt"]) {
					return NO;
				} else if([path isEqualToString:@"/private/var/lib/apt/"]) {
					return NO;
				} else if([path isEqualToString:@"/usr/bin/ssh"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/usr/libexec/ssh-keysign"]) {
					return NO;
				}
				  else if([path isEqualToString:@"/etc/ssh/sshd_config"]) {
					return NO;
				}
				  else if([path isEqualToString:@"/bin/sh"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/var/log/syslog"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/System/Library/LaunchDaemons/com.ikey.bbot.plist"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/usr/libexec/sftp-server"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/usr/bin/sshd"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/private/var/tmp/cydia.log"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/Applications/WinterBoard.app"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/Applications/SBSettings.app"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/Applications/RockApp.app"]) {
					return NO;
				}
				  else if([path isEqualToString:@"/Applications/MxTube.app"]) {
					return NO;
				} 
				  else if([path isEqualToString:@"/Applications/IntelliScreen.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/Icy.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/FakeCarrier.app"]) {
					return NO;
				} else if([path isEqualToString:@"/Applications/blackra1n.app"]) {
					return NO;
				} 
				  else {
					return %orig;
					}
				}		
%end


MSHook(pid_t, fork) {
    return -1;
}


static int (*orig_stat)(const char * file_name, struct stat *buf);
int new_stat(const char * file_name, struct stat *buf) {
    if (strcmp(file_name, "/bin/sh") == 0) {  
        return -1;
    }
    return orig_stat(file_name, buf);
}

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
    if (strcmp(filename, "/var/cache/apt") == 0) {
        return NULL;
    }
    return orig_fopen5(filename, mode);
}

static FILE * (*orig_fopen6) ( const char * filename, const char * mode );
FILE * new_fopen6 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/var/lib/apt") == 0) {
        return NULL;
    }
    return orig_fopen6(filename, mode);
}

static FILE * (*orig_fopen7) ( const char * filename, const char * mode );
FILE * new_fopen7 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/var/lib/cydia") == 0) {
        return NULL;
    }
    return orig_fopen7(filename, mode);
}

static FILE * (*orig_fopen8) ( const char * filename, const char * mode );
FILE * new_fopen8 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/var/log/syslog") == 0) {
        return NULL;
    }
    return orig_fopen8(filename, mode);
}

static FILE * (*orig_fopen9) ( const char * filename, const char * mode );
FILE * new_fopen9 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/var/tmp/cydia.log") == 0) {
        return NULL;
    }
    return orig_fopen9(filename, mode);
}

static FILE * (*orig_fopen10) ( const char * filename, const char * mode );
FILE * new_fopen10 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/bin/sh") == 0) {
        return NULL;
    }
    return orig_fopen10(filename, mode);
}

static FILE * (*orig_fopen11) ( const char * filename, const char * mode );
FILE * new_fopen11 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/usr/libexec/ssh-keysign") == 0) {
        return NULL;
    }
    return orig_fopen11(filename, mode);
}

static FILE * (*orig_fopen12) ( const char * filename, const char * mode );
FILE * new_fopen12 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/etc/ssh/sshd_config") == 0) {
        return NULL;
    }
    return orig_fopen12(filename, mode);
}

static FILE * (*orig_fopen13) ( const char * filename, const char * mode );
FILE * new_fopen13 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/etc/apt") == 0) {
        return NULL;
    }
    return orig_fopen13(filename, mode);
}

static FILE * (*orig_fopen14) ( const char * filename, const char * mode );
FILE * new_fopen14 ( const char * filename, const char * mode ) {
    if (strcmp(filename, "/usr/bin/ssh") == 0) {
        return NULL;
    }
    return orig_fopen14(filename, mode);
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

static void ppfix_image_added(const struct mach_header *mh, intptr_t slide) {
    Dl_info image_info;
    int result = dladdr(mh, &image_info);
    if (result == 0) {
        return;
    }
    const char *image_name = image_info.dli_fname;
    if (strstr(image_name, "/Library/MobileSubstrate") != NULL || strstr(image_name, "/Library/Frameworks/CydiaSubstrate.framework") != NULL || strstr(image_name, "/usr/lib/libsubstrate.dylib") != NULL || strstr(image_name, "/usr/lib/TweakInject") != NULL || strstr(image_name, "MobileSubstrate") != NULL) {
        NSLog(@"FORTNITE: FOUND IMAGE %s", image_name);
        void *handle = dlopen(image_name, RTLD_NOLOAD);
        if (handle) {
            dlclose(handle);
        }
    }
    setenv("_SafeMode", "0", true);
}

MSHook(FILE *, fopen, const char* path, const char* mode) {
    for (int i = 0; i < 14; i++) {
        if (strstr(path, notablst[i])) {
            NSLog(@"FORTNITE: blocked %s", path);
            return NULL;
        }
    }
    return _fopen(path, mode);
}


unsigned char (*orig_1005D8780)(void);
unsigned char sub_1005D8780(void)
{
    return 0;
}

bool (*orig_1008C7D08)(void);
bool sub_1008C7D08(void)
{
    return false;
}

bool (*orig_1008C8024)(void);
bool sub_1008C8024(void)
{
    return false;
}

bool (*orig_1008C82D0)(void);
bool sub_1008C82D0(void)
{
    return false;
}







%ctor 
	{
		%init;
		MSHookFunction((void *)fopen, (void *)new_fopen, (void **)&orig_fopen);
		MSHookFunction((void *)fopen, (void *)new_fopen2, (void **)&orig_fopen2);
		MSHookFunction((void *)fopen, (void *)new_fopen3, (void **)&orig_fopen3);
		MSHookFunction((void *)fopen, (void *)new_fopen4, (void **)&orig_fopen4);
		MSHookFunction((void *)fopen, (void *)new_fopen5, (void **)&orig_fopen5);
		MSHookFunction((void *)fopen, (void *)new_fopen6, (void **)&orig_fopen6);
		MSHookFunction((void *)fopen, (void *)new_fopen7, (void **)&orig_fopen7);
		MSHookFunction((void *)fopen, (void *)new_fopen8, (void **)&orig_fopen8);
		MSHookFunction((void *)fopen, (void *)new_fopen9, (void **)&orig_fopen9);
		MSHookFunction((void *)fopen, (void *)new_fopen10, (void **)&orig_fopen10);
		MSHookFunction((void *)fopen, (void *)new_fopen11, (void **)&orig_fopen11);
		MSHookFunction((void *)fopen, (void *)new_fopen12, (void **)&orig_fopen12);
		MSHookFunction((void *)fopen, (void *)new_fopen13, (void **)&orig_fopen13);
		MSHookFunction((void *)fopen, (void *)new_fopen14, (void **)&orig_fopen14);
		
		MSHookFunction((void *)stat, (void *)new_stat, (void **)&orig_stat);
		
		MSHookFunction((void *)lstat, (void *)new_lstat, (void **)&orig_lstat);
		MSHookFunction((void *)lstat, (void *)new_lstat2, (void **)&orig_lstat2);
		MSHookFunction((void *)lstat, (void *)new_lstat3, (void **)&orig_lstat3);
		MSHookFunction((void *)lstat, (void *)new_lstat4, (void **)&orig_lstat4);
		MSHookFunction((void *)lstat, (void *)new_lstat5, (void **)&orig_lstat5);
		MSHookFunction((void *)lstat, (void *)new_lstat6, (void **)&orig_lstat6);
		MSHookFunction((void *)lstat, (void *)new_lstat7, (void **)&orig_lstat7);

		unsigned long test1 = _dyld_get_image_vmaddr_slide(0) + 0x1005D8780;
       	MSHookFunction((void *)test1, (void *)sub_1005D8780, (void **)&orig_1005D8780);
		unsigned long test2 = _dyld_get_image_vmaddr_slide(0) + 0x1008C7D08;
       	MSHookFunction((void *)test2, (void *)sub_1008C7D08, (void **)&orig_1008C7D08);
		unsigned long test3 = _dyld_get_image_vmaddr_slide(0) + 0x1008C8024;
       	MSHookFunction((void *)test3, (void *)sub_1008C8024, (void **)&orig_1008C8024);
		unsigned long test4 = _dyld_get_image_vmaddr_slide(0) + 0x1008C82D0;
       	MSHookFunction((void *)test4, (void *)sub_1008C82D0, (void **)&orig_1008C82D0);



	}
	
__attribute__((constructor)) static void initialize() {
	MSHookFunction(fork, MSHake(fork));
	MSHookFunction(fopen, MSHake(fopen));
	_dyld_register_func_for_add_image(&ppfix_image_added);
	}
