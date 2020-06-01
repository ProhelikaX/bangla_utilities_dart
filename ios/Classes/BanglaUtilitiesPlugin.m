#import "BanglaUtilitiesPlugin.h"
#if __has_include(<bangla_utilities/bangla_utilities-Swift.h>)
#import <bangla_utilities/bangla_utilities-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bangla_utilities-Swift.h"
#endif

@implementation BanglaUtilitiesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBanglaUtilitiesPlugin registerWithRegistrar:registrar];
}
@end
