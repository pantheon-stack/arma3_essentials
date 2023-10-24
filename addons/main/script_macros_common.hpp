#ifndef MODULAR
  #define MODULAR true
#endif

#include "\x\cba\addons\main\script_macros_common.hpp"

#ifdef MODULAR
    #define ADDON_T DOUBLES(t,ADDON)
    #define ADDON_M DOUBLES(m,ADDON)
    #define ADDON_S DOUBLES(s,ADDON)
    #define ADDON_C DOUBLES(c,ADDON)
#endif
