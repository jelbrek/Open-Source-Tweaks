
@interface SBPasscodeNumberPadButton : UIView
@end

%hook SBPasscodeNumberPadButton

- (void)setFrame:(CGSize)arg1 {
%orig(CGSizeMake(-99999, -99999));
}

%end
