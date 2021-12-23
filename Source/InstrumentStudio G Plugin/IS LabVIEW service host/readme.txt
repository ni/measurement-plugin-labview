Make sure to rename the .lvlib which contains the Main.vi to somehting relevant to your plugin behavior.  
Rename and edit the TemplatePlugin.gplugindata based on the specifics for your plugin.

Deploying basics:
Build VI into a PPL. Place both the *.gplugindata and PPL into the InstrumentStudio Addons directory (C:\Program Files\National Instruments\InstrumentStudio 2021\Addons).
Refer to the InstrumentStudio LabVIEW Plugin document for more info.

Recommendations:
- Make the LabVIEW front panel handle resizing within InstrumentStudio
- InstrumentStudio supports both large and small panels.  Recommend creating separate VIs for each to reduce UI effort if you want both large and small panels.
- Do not need an "exit" button on UI since InstrumentStudio will handle that.  If running standalone, the user can press the "X" to close the front panel.
- Use the mode control to change the VIs behavior in interactive (InstrumentStudio) vs automation (TestStand).


Considerations:
- VI can be called directly from TestStand.  Make sure to set the mode to "Automated".
- Can use the built in InstrumentStudio edit and/or run time configuration file to save configurations
	- May be able to reuse these in TestStand.