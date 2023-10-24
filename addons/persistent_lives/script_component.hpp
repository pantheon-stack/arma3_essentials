#define COMPONENT persistent_lives
#include "\z\a3e\addons\persistent_lives\script_mod.hpp"

#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_PERSISTENT_LIVES
    #define DEBUG_MODE_FULL
#endif
#ifdef DEBUG_SETTINGS_PERSISTENT_LIVES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PERSISTENT_LIVES
#endif

#include "\z\a3e\addons\persistent_lives\script_macros.hpp"
