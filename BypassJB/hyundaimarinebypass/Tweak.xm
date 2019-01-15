%hook NSString 
- (BOOL)writeToFile:(NSString *)path  {
		if([path isEqualToString:@"/private/jailbreak.txt"]) {
					return NO;
				}  else {
					return %orig;
					}
				}
%end

%hook UIApplication 
- (BOOL)canOpenURL:(NSURL *)url {
    if([[url absoluteString] isEqualToString:@"cydia://package/com.example.package"]) {
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
				}  else {
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
				} else {
					return %orig;
					}
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


%ctor 
	{
		%init;
		MSHookFunction((void *)fopen, (void *)new_fopen, (void **)&orig_fopen);
		MSHookFunction((void *)fopen, (void *)new_fopen2, (void **)&orig_fopen2);
		MSHookFunction((void *)fopen, (void *)new_fopen3, (void **)&orig_fopen3);
		MSHookFunction((void *)fopen, (void *)new_fopen4, (void **)&orig_fopen4);
		MSHookFunction((void *)fopen, (void *)new_fopen5, (void **)&orig_fopen5);

	}

