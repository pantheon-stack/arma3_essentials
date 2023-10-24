class CBA_Extended_EventHandlers_base;

class CfgVehicles {
  class Logic;
  class Module_F: Logic
  {
    class EventHandlers;
    
    class AttributesBase
    {
      class Default;
      class Edit;
      class Combo;
      class Checkbox;
      class CheckboxNumber;
      class ModuleDescription;
      class Units;
    };

    class ModuleDescription {
    };
  };

  class GVAR(moduleBase): Module_F {
    author = "Dikusss";
    category = "NO_CATEGORY";
    function = "";
    scope = 1;
    scopeCurator = 2;
    class EventHandlers: EventHandlers {
        //init is used from the parent EventHandlers
        class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
    };
  };

  class GVAR(moduleSetLives): GVAR(moduleBase) {
    scope = 2;
    curatorCanAttach = 1;
    category = QGVAR(Misc);
    displayName = "Set Lives";
    function = QFUNC(moduleSetLives);
    curatorInfoType = "RscDisplaySetLives";

    isTriggerActivated = 1;
    //icon = "TO DO";

    functionPriority = 1;
    isGlobal = 0;
    
    isDisposable = 1;
    is3DEN = 1;


    class Attributes: AttributesBase {
      class Units: Units {
        property = "A3E_Module_SetLives_Units";
      };

      // Module-specific arguments:
      class NumberOfLives: Edit {
        property = "A3E_Module_Number_Of_Lives";
        displayName = "Numero de vidas";
        tooltip = "Cantidad de vidas inicial";
        typeName = "NUMBER";
        defaultValue = "3";
      };

      class ModuleDescription: ModuleDescription{};
    };

    class ModuleDescription: ModuleDescription {
      description = "Cambia la cantidad de vidas del jugador o jugadores sincronizados";
    };
  };
};
