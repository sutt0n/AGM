class CfgPatches {
  class AGM_NoRadio {
    units[] = {};
    weapons[] = {};
    requiredVersion = 0.60;
    requiredAddons[] = {A3_Dubbing_Radio_F};
    version = "0.91";
    versionStr = "0.91";
    versionAr[] = {0,91,0};
    author[] = {"commy2"};
    authorUrl = "https://github.com/commy2/";
  };
};

class CfgVoice {
  class Base;
  class ENG: Base {
    protocol = "";
  };
  class ENGB: Base {
    protocol = "";
  };
  class GRE: Base {
    protocol = "";
  };
  class PER: Base {
    protocol = "";
  };
};
