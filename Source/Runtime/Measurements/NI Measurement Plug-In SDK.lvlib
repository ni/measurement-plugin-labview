<?xml version='1.0' encoding='UTF-8'?>
<Library LVVersion="21008000">
	<Property Name="NI.Lib.Icon" Type="Bin">)1#!!!!!!!)!"1!&amp;!!!-!%!!!@````]!!!!"!!%!!!(]!!!*Q(C=\&gt;7R=2MR%!81N=?"5X&lt;A91M&lt;/W-,&lt;'&amp;&lt;9+K1,7Q,&lt;)%N&lt;!NMA3X)DW?-RJ(JQ"I\%%Z,(@`BA#==ZB3RN;]28_,V7@P_W`:R`&gt;HV*SU_WE@\N_XF[3:^^TX\+2YP)D7K6;G-RV3P)R`ZS%=_]J'XP/5N&lt;XH,7V\SEJ?]Z#5P?=J4HP+5JTTFWS%0?=B$DD1G(R/.1==!IT.+D)`B':\B'2Z@9XC':XC':XBUC?%:HO%:HO&amp;R7QT0]!T0]!S0I4&lt;*&lt;)?=:XA-(]X40-X40-VDSGC?"GC4N9(&lt;)"D2,L;4ZGG?ZH%;T&gt;-]T&gt;-]T?.S.%`T.%`T.)^&lt;NF8J4@-YZ$S'C?)JHO)JHO)R&gt;"20]220]230[;*YCK=ASI2F=)1I.Z5/Z5PR&amp;)^@54T&amp;5TT&amp;5TQO&lt;5_INJ6Z;"[(H#&gt;ZEC&gt;ZEC&gt;Z$"(*ETT*ETT*9^B)HO2*HO2*(F.&amp;]C20]C2)GN4UE1:,.[:/+5A?0^NOS?UJ^3&lt;*\9B9GT@7JISVW7*NIFC&lt;)^:$D`5Q9TWE7)M@;V&amp;D,6;M29DVR]6#R],%GC47T9_/=@&gt;Z5V&gt;V57&gt;V5E&gt;V5(OV?^T[FTP?\`?YX7ZRP6\D=LH%_8S/U_E5R_-R$I&gt;$\0@\W/VW&lt;[_"&lt;Y[X&amp;],0^^+,]T_J&gt;`J@_B_]'_.T`$KO.@I"O[^NF!!!!!!</Property>
	<Property Name="NI.Lib.Version" Type="Str">1.0.0.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="Friends List" Type="Friends List">
		<Item Name="MeasurementServerTests.lvlib" Type="Friended Library" URL="../../../Tests/Tests.Runtime/Measurement Server/MeasurementServerTests.lvlib"/>
		<Item Name="MeasurementServerTests.lvlib:Measurement Plugin Service Tests.lvlib" Type="Friended Library" URL="../../../Tests/Tests.Runtime/Measurement Server/Measurement Plugin Service/Measurement Plugin Service Tests.lvlib"/>
	</Item>
	<Item Name="Build Assets" Type="Folder">
		<Item Name="Post-Build Action.vi" Type="VI" URL="../Build Assets/Post-Build Action.vi"/>
		<Item Name="User Interface Type.ctl" Type="VI" URL="../Build Assets/User Interface Type.ctl">
			<Property Name="NI.LibItem.Scope" Type="Int">2</Property>
		</Item>
	</Item>
	<Item Name="Private Helpers" Type="Folder">
		<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
		<Property Name="NI.SortType" Type="Int">0</Property>
		<Item Name="Add JSON Name Value Pair.vim" Type="VI" URL="../Helpers/Add JSON Name Value Pair.vim"/>
		<Item Name="Check For Latched Booleans.vi" Type="VI" URL="../Helpers/Check For Latched Booleans.vi"/>
		<Item Name="Copy UI Files Into Destination.vi" Type="VI" URL="../Helpers/Copy UI Files Into Destination.vi"/>
		<Item Name="Create Enum Type Specialization.vi" Type="VI" URL="../Helpers/Create Enum Type Specialization.vi"/>
		<Item Name="Create Measurement Services.vi" Type="VI" URL="../Helpers/Create Measurement Services.vi"/>
		<Item Name="Encode to JSON String.vim" Type="VI" URL="../Helpers/Encode to JSON String.vim"/>
		<Item Name="Filter for Enum Controls.vi" Type="VI" URL="../Helpers/Filter for Enum Controls.vi"/>
		<Item Name="Generate Service Config JSON.vi" Type="VI" URL="../Helpers/Generate Service Config JSON.vi"/>
		<Item Name="Get Annotations For Parameter.vi" Type="VI" URL="../Helpers/Get Annotations For Parameter.vi"/>
		<Item Name="Get Default for Type.vi" Type="VI" URL="../Helpers/Get Default for Type.vi"/>
		<Item Name="Get Enum Type Specializations.vi" Type="VI" URL="../Helpers/Get Enum Type Specializations.vi"/>
		<Item Name="Get Measurement Configuration Controls.vi" Type="VI" URL="../Helpers/Get Measurement Configuration Controls.vi"/>
		<Item Name="Get MetaData from Configurations.vi" Type="VI" URL="../Helpers/Get MetaData from Configurations.vi"/>
		<Item Name="Get MetaData from Results.vi" Type="VI" URL="../Helpers/Get MetaData from Results.vi"/>
		<Item Name="Get Metadata.vi" Type="VI" URL="../Helpers/Get Metadata.vi"/>
		<Item Name="Get Parameter Information.vi" Type="VI" URL="../Helpers/Get Parameter Information.vi"/>
		<Item Name="Get Parameters And Check Data Types.vi" Type="VI" URL="../Helpers/Get Parameters And Check Data Types.vi"/>
		<Item Name="Is Enum Array Control.vi" Type="VI" URL="../Helpers/Is Enum Array Control.vi"/>
		<Item Name="Is Enum Control.vi" Type="VI" URL="../Helpers/Is Enum Control.vi"/>
		<Item Name="Is Latched Boolean.vi" Type="VI" URL="../Helpers/Is Latched Boolean.vi"/>
		<Item Name="Is Supported Cluster.vi" Type="VI" URL="../Helpers/Is Supported Cluster.vi"/>
		<Item Name="Register Configuration and Results.vi" Type="VI" URL="../Helpers/Register Configuration and Results.vi"/>
		<Item Name="Register to Discovery Service.vi" Type="VI" URL="../Helpers/Register to Discovery Service.vi"/>
		<Item Name="Validate Enum Strings.vi" Type="VI" URL="../Helpers/Validate Enum Strings.vi"/>
		<Item Name="Validate Metadata.vi" Type="VI" URL="../Helpers/Validate Metadata.vi"/>
		<Item Name="Validate Parameters.vi" Type="VI" URL="../Helpers/Validate Parameters.vi"/>
	</Item>
	<Item Name="Private TypeDefs" Type="Folder">
		<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
		<Item Name="Configuration Parameter.ctl" Type="VI" URL="../Helpers/TypeDefs/Configuration Parameter.ctl"/>
		<Item Name="Get Metadata Response.ctl" Type="VI" URL="../Helpers/TypeDefs/Get Metadata Response.ctl"/>
		<Item Name="Google Protobuf Field Kind.ctl" Type="VI" URL="../Helpers/TypeDefs/Google Protobuf Field Kind.ctl"/>
		<Item Name="Measure Request.ctl" Type="VI" URL="../Helpers/TypeDefs/Measure Request.ctl"/>
		<Item Name="Measure Response.ctl" Type="VI" URL="../Helpers/TypeDefs/Measure Response.ctl"/>
		<Item Name="Measurement Signature.ctl" Type="VI" URL="../Helpers/TypeDefs/Measurement Signature.ctl"/>
		<Item Name="Output Parameter.ctl" Type="VI" URL="../Helpers/TypeDefs/Output Parameter.ctl"/>
		<Item Name="Parameter Annotations Entry.ctl" Type="VI" URL="../Helpers/TypeDefs/Parameter Annotations Entry.ctl"/>
		<Item Name="User Interface Details.ctl" Type="VI" URL="../Helpers/TypeDefs/User Interface Details.ctl"/>
	</Item>
	<Item Name="Public Helpers" Type="Folder">
		<Property Name="NI.LibItem.Scope" Type="Int">1</Property>
		<Item Name="Add Measurement Annotation.vim" Type="VI" URL="../Helpers/Add Measurement Annotation.vim"/>
		<Item Name="Create Basic Measurement Annotations.vi" Type="VI" URL="../Helpers/Create Basic Measurement Annotations.vi"/>
		<Item Name="Get Discovery Service Address.vi" Type="VI" URL="../Helpers/Get Discovery Service Address.vi"/>
	</Item>
	<Item Name="Public TypeDefs" Type="Folder">
		<Property Name="NI.LibItem.Scope" Type="Int">1</Property>
		<Item Name="Measurement Annotation.ctl" Type="VI" URL="../Helpers/TypeDefs/Measurement Annotation.ctl"/>
		<Item Name="Measurement Details.ctl" Type="VI" URL="../Helpers/TypeDefs/Measurement Details.ctl"/>
		<Item Name="Measurement Server User Settings.ctl" Type="VI" URL="../Helpers/TypeDefs/Measurement Server User Settings.ctl"/>
		<Item Name="Measurement Service Version.ctl" Type="VI" URL="../Helpers/TypeDefs/Measurement Service Version.ctl"/>
		<Item Name="Parameter Type Specialization.ctl" Type="VI" URL="../Helpers/TypeDefs/Parameter Type Specialization.ctl"/>
		<Item Name="Pin Map Context.ctl" Type="VI" URL="../Helpers/TypeDefs/Pin Map Context.ctl"/>
		<Item Name="Service Descriptor.ctl" Type="VI" URL="../Helpers/TypeDefs/Service Descriptor.ctl"/>
		<Item Name="Stop Server User Event.ctl" Type="VI" URL="../Helpers/TypeDefs/Stop Server User Event.ctl"/>
		<Item Name="Type Specialization Key.ctl" Type="VI" URL="../Helpers/TypeDefs/Type Specialization Key.ctl"/>
		<Item Name="Type Specialization.ctl" Type="VI" URL="../Helpers/TypeDefs/Type Specialization.ctl"/>
		<Item Name="User Interface Information.ctl" Type="VI" URL="../Helpers/TypeDefs/User Interface Information.ctl"/>
	</Item>
	<Item Name="IMeasurement Service.lvclass" Type="LVClass" URL="../IMeasurement Service/IMeasurement Service.lvclass">
		<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
	</Item>
	<Item Name="Measure Call Context.lvclass" Type="LVClass" URL="../Measure Call Context/Measure Call Context.lvclass"/>
	<Item Name="Measurement Plugin Service.lvclass" Type="LVClass" URL="../Measurement Plugin Service/Measurement Plugin Service.lvclass"/>
	<Item Name="Measurement Service V1.lvclass" Type="LVClass" URL="../Measurement Service V1/Measurement Service V1.lvclass">
		<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
	</Item>
	<Item Name="Measurement Service V2.lvclass" Type="LVClass" URL="../Measurement Service V2/Measurement Service V2.lvclass">
		<Property Name="NI.LibItem.Scope" Type="Int">4</Property>
	</Item>
	<Item Name="Run Service.vi" Type="VI" URL="../Run Service.vi"/>
</Library>
