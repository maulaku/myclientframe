@echo off
brcc32 applicationCode.rc
brcc32 Consolecode.rc
brcc32 FORMCODE.rc
brcc32 FORMDFMCODE.rc
brcc32 TEXTCODE.rc
brcc32 UNITCODE.rc
brcc32 DLLCODE.rc
brcc32 PLUGINPROJECTCODE.rc
brcc32 PLUGINMODULEDFMCODE.rc
brcc32 PLUGINMODULESOURCECODE.rc
@echo on
PAUSE