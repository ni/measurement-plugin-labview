<?xml version='1.0' encoding='UTF-8'?>
<Library LVVersion="20008000">
	<Property Name="NI.Lib.Icon" Type="Bin">)!#!!!!!!!)!"1!&amp;!!!-!%!!!@````]!!!!"!!%!!!(]!!!*Q(C=\&gt;7R=2MR%!81N=?"5X&lt;A91M&lt;/W-,&lt;'&amp;&lt;9+K1,7Q,&lt;)%N&lt;!NMA3X)DW?-RJ(JQ"I\%%Z,(@`BA#==ZB3RN;]28_,V7@P_W`:R`&gt;HV*SU_WE@\N_XF[3:^^TX\+2YP)D7K6;G-RV3P)R`ZS%=_]J'XP/5N&lt;XH,7V\SEJ?]Z#5P?=J4HP+5JTTFWS%0?=B$DD1G(R/.1==!IT.+D)`B':\B'2Z@9XC':XC':XBUC?%:HO%:HO&amp;R7QT0]!T0]!S0I4&lt;*&lt;)?=:XA-(]X40-X40-VDSGC?"GC4N9(&lt;)"D2,L;4ZGG?ZH%;T&gt;-]T&gt;-]T?.S.%`T.%`T.)^&lt;NF8J4@-YZ$S'C?)JHO)JHO)R&gt;"20]220]230[;*YCK=ASI2F=)1I.Z5/Z5PR&amp;)^@54T&amp;5TT&amp;5TQO&lt;5_INJ6Z;"[(H#&gt;ZEC&gt;ZEC&gt;Z$"(*ETT*ETT*9^B)HO2*HO2*(F.&amp;]C20]C2)GN4UE1:,.[:/+5A?0^NOS?UJ^3&lt;*\9B9GT@7JISVW7*NIFC&lt;)^:$D`5Q9TWE7)M@;V&amp;D,6;M29DVR]6#R],%GC47T9_/=@&gt;Z5V&gt;V57&gt;V5E&gt;V5(OV?^T[FTP?\`?YX7ZRP6\D=LH%_8S/U_E5R_-R$I&gt;$\0@\W/VW&lt;[_"&lt;Y[X&amp;],0^^+,]T_J&gt;`J@_B_]'_.T`$KO.@I"O[^NF!!!!!!</Property>
	<Property Name="NI.Lib.SourceVersion" Type="Int">536903680</Property>
	<Property Name="NI.Lib.Version" Type="Str">1.0.0.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="Friends List" Type="Friends List">
		<Item Name="MeasurementServerTests.lvlib" Type="Friended Library" URL="../../../Tests/Tests.Runtime/Measurement Server/MeasurementServerTests.lvlib"/>
	</Item>
	<Item Name="Build Assets" Type="Folder">
		<Item Name="Post-Build Action.vi" Type="VI" URL="../Build Assets/Post-Build Action.vi"/>
		<Item Name="UiType.ctl" Type="VI" URL="../Build Assets/UiType.ctl">
			<Property Name="NI.LibItem.Scope" Type="Int">2</Property>
		</Item>
	</Item>
	<Item Name="Private Helpers" Type="Folder">
		<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
		<Property Name="NI.SortType" Type="Int">0</Property>
		<Item Name="Add JSON Name Value Pair.vim" Type="VI" URL="../Helpers/Add JSON Name Value Pair.vim"/>
		<Item Name="Create Enum Type Specialization.vi" Type="VI" URL="../Helpers/Create Enum Type Specialization.vi"/>
		<Item Name="Create Measurement Services.vi" Type="VI" URL="../Helpers/Create Measurement Services.vi"/>
		<Item Name="Encode to JSON String.vim" Type="VI" URL="../Helpers/Encode to JSON String.vim"/>
		<Item Name="Ensure Discovery Service Started.vi" Type="VI" URL="../Helpers/Ensure Discovery Service Started.vi"/>
		<Item Name="Filter for Enum Controls.vi" Type="VI" URL="../Helpers/Filter for Enum Controls.vi"/>
		<Item Name="Generate Service Config JSON.vi" Type="VI" URL="../Helpers/Generate Service Config JSON.vi"/>
		<Item Name="Get Annotations For Parameter.vi" Type="VI" URL="../Helpers/Get Annotations For Parameter.vi"/>
		<Item Name="Get Default for Type.vi" Type="VI" URL="../Helpers/Get Default for Type.vi"/>
		<Item Name="Get Discovery Service Key File Path.vi" Type="VI" URL="../Helpers/Get Discovery Service Key File Path.vi"/>
		<Item Name="Get Enum Type Specializations.vi" Type="VI" URL="../Helpers/Get Enum Type Specializations.vi"/>
		<Item Name="Get Measurement Configuration Controls.vi" Type="VI" URL="../Helpers/Get Measurement Configuration Controls.vi"/>
		<Item Name="Get MetaData from Configurations.vi" Type="VI" URL="../Helpers/Get MetaData from Configurations.vi"/>
		<Item Name="Get MetaData from Results.vi" Type="VI" URL="../Helpers/Get MetaData from Results.vi"/>
		<Item Name="Get Metadata.vi" Type="VI" URL="../Helpers/Get Metadata.vi"/>
		<Item Name="IsEnumArrayControl.vi" Type="VI" URL="../Helpers/IsEnumArrayControl.vi"/>
		<Item Name="IsEnumControl.vi" Type="VI" URL="../Helpers/IsEnumControl.vi"/>
		<Item Name="LabVIEW datatype to Measurement datatype.vi" Type="VI" URL="../Helpers/LabVIEW datatype to Measurement datatype.vi"/>
		<Item Name="Read Discovery Service Key File.vi" Type="VI" URL="../Helpers/Read Discovery Service Key File.vi"/>
		<Item Name="Register Configuration and Results.vi" Type="VI" URL="../Helpers/Register Configuration and Results.vi"/>
		<Item Name="Register to Discovery Service.vi" Type="VI" URL="../Helpers/Register to Discovery Service.vi"/>
		<Item Name="Start Discovery Service.vi" Type="VI" URL="../Helpers/Start Discovery Service.vi"/>
		<Item Name="Validate Configuration Metadata.vi" Type="VI" URL="../Helpers/Validate Configuration Metadata.vi"/>
	</Item>
	<Item Name="Private TypeDefs" Type="Folder">
		<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
		<Item Name="ConfigurationParameter.ctl" Type="VI" URL="../Helpers/TypeDefs/ConfigurationParameter.ctl"/>
		<Item Name="GetMetadataResponse.ctl" Type="VI" URL="../Helpers/TypeDefs/GetMetadataResponse.ctl"/>
		<Item Name="google_protobuf_Field_Kind.ctl" Type="VI" URL="../Helpers/TypeDefs/google_protobuf_Field_Kind.ctl"/>
		<Item Name="MeasurementSignature.ctl" Type="VI" URL="../Helpers/TypeDefs/MeasurementSignature.ctl"/>
		<Item Name="MeasureRequest.ctl" Type="VI" URL="../Helpers/TypeDefs/MeasureRequest.ctl"/>
		<Item Name="MeasureResponse.ctl" Type="VI" URL="../Helpers/TypeDefs/MeasureResponse.ctl"/>
		<Item Name="OutputParameter.ctl" Type="VI" URL="../Helpers/TypeDefs/OutputParameter.ctl"/>
		<Item Name="Parameter_AnnotationsEntry.ctl" Type="VI" URL="../Helpers/TypeDefs/Parameter_AnnotationsEntry.ctl"/>
		<Item Name="PinMapContext.ctl" Type="VI" URL="../Helpers/TypeDefs/PinMapContext.ctl"/>
		<Item Name="UserInterfaceDetails.ctl" Type="VI" URL="../Helpers/TypeDefs/UserInterfaceDetails.ctl"/>
	</Item>
	<Item Name="Public Helpers" Type="Folder">
		<Property Name="NI.LibItem.Scope" Type="Int">1</Property>
		<Item Name="Add Measurement Annotation.vim" Type="VI" URL="../Helpers/Add Measurement Annotation.vim"/>
		<Item Name="Create Basic Measurement Annotations.vi" Type="VI" URL="../Helpers/Create Basic Measurement Annotations.vi"/>
		<Item Name="Get Discovery Service Address.vi" Type="VI" URL="../Helpers/Get Discovery Service Address.vi"/>
	</Item>
	<Item Name="Public TypeDefs" Type="Folder">
		<Property Name="NI.LibItem.Scope" Type="Int">1</Property>
		<Item Name="MeasurementAnnotation.ctl" Type="VI" URL="../Helpers/TypeDefs/MeasurementAnnotation.ctl"/>
		<Item Name="MeasurementDetails.ctl" Type="VI" URL="../Helpers/TypeDefs/MeasurementDetails.ctl"/>
		<Item Name="MeasurementLinkServerUserEvents.ctl" Type="VI" URL="../Helpers/TypeDefs/MeasurementLinkServerUserEvents.ctl"/>
		<Item Name="Parameter Type Specialization.ctl" Type="VI" URL="../Helpers/TypeDefs/Parameter Type Specialization.ctl"/>
		<Item Name="StopServerUserEvent.ctl" Type="VI" URL="../Helpers/TypeDefs/StopServerUserEvent.ctl"/>
		<Item Name="Type Specialization Key.ctl" Type="VI" URL="../Helpers/TypeDefs/Type Specialization Key.ctl"/>
		<Item Name="Type Specialization.ctl" Type="VI" URL="../Helpers/TypeDefs/Type Specialization.ctl"/>
		<Item Name="UI Information.ctl" Type="VI" URL="../Helpers/TypeDefs/UI Information.ctl"/>
	</Item>
	<Item Name="IMeasurementService.lvclass" Type="LVClass" URL="../Classes/IMeasurementService/IMeasurementService.lvclass">
		<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
	</Item>
	<Item Name="MeasurementContext.lvclass" Type="LVClass" URL="../Classes/MeasurementContext/MeasurementContext.lvclass"/>
	<Item Name="MeasurementPluginService.lvclass" Type="LVClass" URL="../Classes/MeasurementPluginService/MeasurementPluginService.lvclass"/>
	<Item Name="MeasurementServiceV1.lvclass" Type="LVClass" URL="../Classes/MeasurementServiceV1/MeasurementServiceV1.lvclass">
		<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
	</Item>
	<Item Name="MeasurementServiceV2.lvclass" Type="LVClass" URL="../Classes/MeasurementServiceV2/MeasurementServiceV2.lvclass">
		<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
	</Item>
	<Item Name="Reservation Observer.lvclass" Type="LVClass" URL="../Reservation Observer/Reservation Observer.lvclass"/>
	<Item Name="Run Service.vi" Type="VI" URL="../Run Service.vi"/>
</Library>
