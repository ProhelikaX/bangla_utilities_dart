//
//  Generated file. Do not edit.
//

#include "generated_plugin_registrant.h"

#include <bangla_utilities/bangla_utilities_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) bangla_utilities_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "BanglaUtilitiesPlugin");
  bangla_utilities_plugin_register_with_registrar(bangla_utilities_registrar);
}
