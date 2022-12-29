<?xml version='1.0' encoding='UTF-8'?>
<Library LVVersion="20008000">
	<Property Name="NI.Lib.Icon" Type="Bin">)!#!!!!!!!)!"1!&amp;!!!-!%!!!@````]!!!!"!!%!!!(]!!!*Q(C=\&gt;7R=2MR%!81N=?"5X&lt;A91M&lt;/W-,&lt;'&amp;&lt;9+K1,7Q,&lt;)%N&lt;!NMA3X)DW?-RJ(JQ"I\%%Z,(@`BA#==ZB3RN;]28_,V7@P_W`:R`&gt;HV*SU_WE@\N_XF[3:^^TX\+2YP)D7K6;G-RV3P)R`ZS%=_]J'XP/5N&lt;XH,7V\SEJ?]Z#5P?=J4HP+5JTTFWS%0?=B$DD1G(R/.1==!IT.+D)`B':\B'2Z@9XC':XC':XBUC?%:HO%:HO&amp;R7QT0]!T0]!S0I4&lt;*&lt;)?=:XA-(]X40-X40-VDSGC?"GC4N9(&lt;)"D2,L;4ZGG?ZH%;T&gt;-]T&gt;-]T?.S.%`T.%`T.)^&lt;NF8J4@-YZ$S'C?)JHO)JHO)R&gt;"20]220]230[;*YCK=ASI2F=)1I.Z5/Z5PR&amp;)^@54T&amp;5TT&amp;5TQO&lt;5_INJ6Z;"[(H#&gt;ZEC&gt;ZEC&gt;Z$"(*ETT*ETT*9^B)HO2*HO2*(F.&amp;]C20]C2)GN4UE1:,.[:/+5A?0^NOS?UJ^3&lt;*\9B9GT@7JISVW7*NIFC&lt;)^:$D`5Q9TWE7)M@;V&amp;D,6;M29DVR]6#R],%GC47T9_/=@&gt;Z5V&gt;V57&gt;V5E&gt;V5(OV?^T[FTP?\`?YX7ZRP6\D=LH%_8S/U_E5R_-R$I&gt;$\0@\W/VW&lt;[_"&lt;Y[X&amp;],0^^+,]T_J&gt;`J@_B_]'_.T`$KO.@I"O[^NF!!!!!!</Property>
	<Property Name="NI.Lib.SourceVersion" Type="Int">536903680</Property>
	<Property Name="NI.Lib.Version" Type="Str">1.0.0.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="Service" Type="Folder">
		<Item Name="Helper" Type="Folder">
			<Item Name="TypeDefs" Type="Folder">
				<Item Name="Key.ctl" Type="VI" URL="../Helper/TypeDefs/Key.ctl"/>
				<Item Name="Parameter Type Specialization.ctl" Type="VI" URL="../Helper/TypeDefs/Parameter Type Specialization.ctl"/>
				<Item Name="Type Specialization.ctl" Type="VI" URL="../Helper/TypeDefs/Type Specialization.ctl"/>
			</Item>
			<Item Name="Get Configuration Default.vi" Type="VI" URL="../Helper/Get Configuration Default.vi"/>
			<Item Name="Get Configuration Metadata.vi" Type="VI" URL="../Helper/Get Configuration Metadata.vi"/>
			<Item Name="Get Discovery Service Address.vi" Type="VI" URL="../Helper/Get Discovery Service Address.vi"/>
			<Item Name="Get Discovery Service Key File Path.vi" Type="VI" URL="../Helper/Get Discovery Service Key File Path.vi"/>
			<Item Name="Get MetaData from Configurations.vi" Type="VI" URL="../Helper/Get MetaData from Configurations.vi"/>
			<Item Name="Get MetaData from Results.vi" Type="VI" URL="../Helper/Get MetaData from Results.vi"/>
			<Item Name="LabVIEW datatype to Measurement datatype.vi" Type="VI" URL="../Helper/LabVIEW datatype to Measurement datatype.vi"/>
			<Item Name="Read Discovery Service Key File.vi" Type="VI" URL="../Helper/Read Discovery Service Key File.vi"/>
			<Item Name="Register Configuration and Results.vi" Type="VI" URL="../Helper/Register Configuration and Results.vi"/>
			<Item Name="Register to Discovery Service.vi" Type="VI" URL="../Helper/Register to Discovery Service.vi"/>
			<Item Name="Register UI Stop Event.vi" Type="VI" URL="../Helper/Register UI Stop Event.vi"/>
			<Item Name="Validate Configuration Metadata.vi" Type="VI" URL="../Helper/Validate Configuration Metadata.vi"/>
		</Item>
		<Item Name="Internal" Type="Folder">
			<Item Name="google_protobuf_Field_Kind.ctl" Type="VI" URL="../RPC Service/MeasurementService/Internal/google_protobuf_Field_Kind.ctl"/>
			<Item Name="RPC Method MeasurementService Measure Logic.vi" Type="VI" URL="../RPC Service/MeasurementService/Internal/RPC Method MeasurementService Measure Logic.vi"/>
		</Item>
		<Item Name="MeasurementContext.lvclass" Type="LVClass" URL="../RPC Service/MeasurementContext/MeasurementContext.lvclass"/>
		<Item Name="MeasurementService.lvclass" Type="LVClass" URL="../RPC Service/MeasurementService/MeasurementService.lvclass"/>
	</Item>
	<Item Name="Run Service.vi" Type="VI" URL="../Run Service.vi"/>
</Library>
