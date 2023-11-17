<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Libraries" Type="Folder">
			<Property Name="NI.SortType" Type="Int">0</Property>
			<Item Name="Instruments" Type="Folder">
				<Property Name="NI.SortType" Type="Int">0</Property>
				<Item Name="MeasurementLink Instrument.lvlib" Type="Library" URL="../MeasurementLink Instrument/MeasurementLink Instrument.lvlib"/>
				<Item Name="MeasurementLink niDCPower.lvlib" Type="Library" URL="../MeasurementLink niDCPower/MeasurementLink niDCPower.lvlib"/>
				<Item Name="MeasurementLink niDigital.lvlib" Type="Library" URL="../MeasurementLink niDigital/MeasurementLink niDigital.lvlib"/>
				<Item Name="MeasurementLink niDMM.lvlib" Type="Library" URL="../MeasurementLink niDMM/MeasurementLink niDMM.lvlib"/>
				<Item Name="MeasurementLink niFGEN.lvlib" Type="Library" URL="../MeasurementLink niFGEN/MeasurementLink niFGEN.lvlib"/>
				<Item Name="MeasurementLink niScope.lvlib" Type="Library" URL="../MeasurementLink niScope/MeasurementLink niScope.lvlib"/>
				<Item Name="MeasurementLink VISA.lvlib" Type="Library" URL="../MeasurementLink VISA/MeasurementLink VISA.lvlib"/>
			</Item>
			<Item Name="MeasurementLink Discovery.lvlib" Type="Library" URL="../MeasurementLink Discovery/MeasurementLink Discovery.lvlib"/>
			<Item Name="MeasurementLink Measurement Server.lvlib" Type="Library" URL="../MeasurementLink Measurement Server/MeasurementLink Measurement Server.lvlib"/>
			<Item Name="MeasurementLink Session Management.lvlib" Type="Library" URL="../MeasurementLink Session Management/MeasurementLink Session Management.lvlib"/>
			<Item Name="MeasurementLink TestStand Integration.lvlib" Type="Library" URL="../MeasurementLink TestStand Integration/MeasurementLink TestStand Integration.lvlib"/>
		</Item>
		<Item Name="Tests" Type="Folder">
			<Item Name="MeasurementServerTests.lvlib" Type="Library" URL="../../Tests/Tests.Runtime/Measurement Server/MeasurementServerTests.lvlib"/>
		</Item>
		<Item Name="TestUtilities" Type="Folder">
			<Item Name="Session Reservation Test Utilities.lvlib" Type="Library" URL="../../TestUtilities/TestUtilities.Runtime/Session Reservation Test Utilities/Session Reservation Test Utilities.lvlib"/>
		</Item>
		<Item Name="Global VIs" Type="Folder">
			<Item Name="Error Strings Global Internal.vi" Type="VI" URL="../MeasurementLink Measurement Server/Helpers/Error Strings Global Internal.vi"/>
		</Item>
		<Item Name="TCP echo.vi" Type="VI" URL="../../../../../Users/Administrator/Desktop/TCP echo.vi"/>
		<Item Name="grpc visa bug.vi" Type="VI" URL="../../../../../Users/Administrator/Desktop/grpc visa bug.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="1D String Array to Delimited String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/1D String Array to Delimited String.vi"/>
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Get File Extension.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Get File Extension.vi"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="grpc-lvsupport-release.lvlib" Type="Library" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/grpc-lvsupport-release.lvlib"/>
				<Item Name="gRPC-servicer-release.lvlib" Type="Library" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Servicer/gRPC-servicer-release.lvlib"/>
				<Item Name="LVMapReplaceAction.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVMapReplaceAction.ctl"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="System Exec.vi" Type="VI" URL="/&lt;vilib&gt;/Platform/system.llb/System Exec.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Delimited String to 1D String Array.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/Delimited String to 1D String Array.vi"/>
				<Item Name="JSONtext LVClass Serializer.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/JDP Science/JSONtext/LVClass Serializer/JSONtext LVClass Serializer.lvclass"/>
				<Item Name="JSONtext.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JSONtext/JSONtext.lvlib"/>
				<Item Name="JDP Utility.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/JDP Utility.lvlib"/>
				<Item Name="LVNumericRepresentation.ctl" Type="VI" URL="/&lt;vilib&gt;/numeric/LVNumericRepresentation.ctl"/>
				<Item Name="JDP Timestamp.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/Timestamp/JDP Timestamp.lvlib"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="Base64 Support.lvlib" Type="Library" URL="/&lt;vilib&gt;/JDP Science/JDP Science Common Utilities/Base64/Base64 Support.lvlib"/>
				<Item Name="Set Difference.vim" Type="VI" URL="/&lt;vilib&gt;/set operations/Set Difference.vim"/>
				<Item Name="Create NI GUID.vi" Type="VI" URL="/&lt;vilib&gt;/string/Create NI GUID.vi"/>
				<Item Name="Assert Array Dimension Count.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/TypeAssert/Assert Array Dimension Count.vim"/>
				<Item Name="Remove Duplicates From 1D Array.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Remove Duplicates From 1D Array.vim"/>
				<Item Name="Equal Comparable.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Comparison/Equal/Equal Comparable/Equal Comparable.lvclass"/>
				<Item Name="Equal Functor.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Comparison/Equal/Equal Functor/Equal Functor.lvclass"/>
				<Item Name="Equals.vim" Type="VI" URL="/&lt;vilib&gt;/Comparison/Equals.vim"/>
				<Item Name="Search Unsorted 1D Array Core.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Helpers/Search Unsorted 1D Array Core.vim"/>
				<Item Name="Search Unsorted 1D Array.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Search Unsorted 1D Array.vim"/>
				<Item Name="FormatTime String.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/FormatTime String.vi"/>
				<Item Name="subElapsedTime.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/subElapsedTime.vi"/>
				<Item Name="VISA gRPC Options.ctl" Type="VI" URL="/&lt;vilib&gt;/NI-VISA/VISA gRPC Options.ctl"/>
				<Item Name="VISA Format gRPC URI.vi" Type="VI" URL="/&lt;vilib&gt;/NI-VISA/VISA Format gRPC URI.vi"/>
				<Item Name="VISA gRPC Open Close Behavior.ctl" Type="VI" URL="/&lt;vilib&gt;/NI-VISA/VISA gRPC Open Close Behavior.ctl"/>
				<Item Name="VISA Format gRPC Resource Name.vi" Type="VI" URL="/&lt;vilib&gt;/NI-VISA/VISA Format gRPC Resource Name.vi"/>
				<Item Name="VISA Open Access Mode.ctl" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Open Access Mode.ctl"/>
				<Item Name="VISA Open for gRPC Session.vi" Type="VI" URL="/&lt;vilib&gt;/NI-VISA/VISA Open for gRPC Session.vi"/>
			</Item>
			<Item Name="instr.lib" Type="Folder">
				<Item Name="niDCPower Initialize With Independent Channels for gRPC session.vi" Type="VI" URL="/&lt;instrlib&gt;/niDCPower/nidcpower.llb/niDCPower Initialize With Independent Channels for gRPC session.vi"/>
				<Item Name="niDCPower Attach gRPC session.vi" Type="VI" URL="/&lt;instrlib&gt;/niDCPower/nidcpower.llb/niDCPower Attach gRPC session.vi"/>
				<Item Name="niDCPower Close.vi" Type="VI" URL="/&lt;instrlib&gt;/niDCPower/nidcpower.llb/niDCPower Close.vi"/>
				<Item Name="niDCPower Detach gRPC session.vi" Type="VI" URL="/&lt;instrlib&gt;/niDCPower/nidcpower.llb/niDCPower Detach gRPC session.vi"/>
				<Item Name="niDigital Close.vi" Type="VI" URL="/&lt;instrlib&gt;/niDigital/niDigital.llb/niDigital Close.vi"/>
				<Item Name="niDigital Detach gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niDigital/niDigital.llb/niDigital Detach gRPC Session.vi"/>
				<Item Name="niDigital Attach gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niDigital/niDigital.llb/niDigital Attach gRPC Session.vi"/>
				<Item Name="niDigital Initialize for gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niDigital/niDigital.llb/niDigital Initialize for gRPC Session.vi"/>
				<Item Name="niFgen Close.vi" Type="VI" URL="/&lt;instrlib&gt;/niFgen/niFgen.llb/niFgen Close.vi"/>
				<Item Name="niFgen Detach gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niFgen/niFgen.llb/niFgen Detach gRPC Session.vi"/>
				<Item Name="niFgen Initialize With Channels for gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niFgen/niFgen.llb/niFgen Initialize With Channels for gRPC Session.vi"/>
				<Item Name="niFgen Attach gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niFgen/niFgen.llb/niFgen Attach gRPC Session.vi"/>
				<Item Name="niScope Close.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/niScope Close.vi"/>
				<Item Name="niScope Detach gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/niScope Detach gRPC Session.vi"/>
				<Item Name="niScope Initialize for gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/niScope Initialize for gRPC Session.vi"/>
				<Item Name="niScope Attach gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/niScope Attach gRPC Session.vi"/>
				<Item Name="niDMM Close.vi" Type="VI" URL="/&lt;instrlib&gt;/niDMM/nidmm.llb/niDMM Close.vi"/>
				<Item Name="niDMM Detach gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niDMM/nidmm.llb/niDMM Detach gRPC Session.vi"/>
				<Item Name="niDMM Initialize for gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niDMM/nidmm.llb/niDMM Initialize for gRPC Session.vi"/>
				<Item Name="niDMM Attach gRPC Session.vi" Type="VI" URL="/&lt;instrlib&gt;/niDMM/nidmm.llb/niDMM Attach gRPC Session.vi"/>
				<Item Name="niScope Self Test.vi" Type="VI" URL="/&lt;instrlib&gt;/niScope/Utility/niScope Self Test.vi"/>
				<Item Name="niFgen Self-Test.vi" Type="VI" URL="/&lt;instrlib&gt;/niFgen/niFgen.llb/niFgen Self-Test.vi"/>
				<Item Name="niDMM Self-Test.vi" Type="VI" URL="/&lt;instrlib&gt;/niDMM/nidmm.llb/niDMM Self-Test.vi"/>
				<Item Name="niDigital Self Test.vi" Type="VI" URL="/&lt;instrlib&gt;/niDigital/niDigital.llb/niDigital Self Test.vi"/>
				<Item Name="niDCPower Self Test.vi" Type="VI" URL="/&lt;instrlib&gt;/niDCPower/nidcpower.llb/niDCPower Self Test.vi"/>
			</Item>
			<Item Name="kernel32.dll" Type="Document" URL="kernel32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="MeasurementLink Discovery Client.lvlib" Type="Library" URL="../MeasurementLink Discovery Client/MeasurementLink Discovery Client.lvlib"/>
			<Item Name="MeasurementLink Measurement Server Internal.lvlib" Type="Library" URL="../MeasurementLink Measurement Server Internal/MeasurementLink Measurement Server Internal.lvlib"/>
			<Item Name="MeasurementLink Measurement Service Base V2.lvlib" Type="Library" URL="../MeasurementLink Measurement Service Base V2/MeasurementLink Measurement Service Base V2.lvlib"/>
			<Item Name="MeasurementLink Pin Map Client.lvlib" Type="Library" URL="../MeasurementLink Pin Map Client/MeasurementLink Pin Map Client.lvlib"/>
			<Item Name="MeasurementLink Session Management Client.lvlib" Type="Library" URL="../MeasurementLink Session Management Client/MeasurementLink Session Management Client.lvlib"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
