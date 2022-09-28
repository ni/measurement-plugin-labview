<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Property Name="NI.Project.Description" Type="Str"></Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Discovery_client" Type="Folder">
			<Item Name="Discovery_client.lvlib" Type="Library" URL="../Discovery_client/Discovery_client.lvlib"/>
		</Item>
		<Item Name="Unit Test" Type="Folder">
			<Property Name="NI.SortType" Type="Int">3</Property>
			<Item Name="Test_Register Service.vi" Type="VI" URL="../Unit Test/Test_Register Service.vi"/>
			<Item Name="Test_Enumerate Service.vi" Type="VI" URL="../Unit Test/Test_Enumerate Service.vi"/>
			<Item Name="Test_Resolve Service.vi" Type="VI" URL="../Unit Test/Test_Resolve Service.vi"/>
			<Item Name="Test_Unregister Service.vi" Type="VI" URL="../Unit Test/Test_Unregister Service.vi"/>
			<Item Name="test_results.txt" Type="Document" URL="../Unit Test/test_results.txt"/>
			<Item Name="Pre-Build_Test_Stub.vi" Type="VI" URL="../Unit Test/Pre-Build_Test_Stub.vi"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Any.ctl" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Server API/typeDefs/Any.ctl"/>
				<Item Name="Client Unary Call.vim" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Client API/Client Unary Call.vim"/>
				<Item Name="Close Client.vi" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Client API/Close Client.vi"/>
				<Item Name="CompleteMetadataRegistration.vi" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Server API/CompleteMetadataRegistration.vi"/>
				<Item Name="Create Client.vi" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Client API/Create Client.vi"/>
				<Item Name="Get Server DLL Path.vi" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Server API/Server/Get Server DLL Path.vi"/>
				<Item Name="grpcId.ctl" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Server API/typeDefs/grpcId.ctl"/>
				<Item Name="Message Element Metadata.ctl" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Server API/typeDefs/Message Element Metadata.ctl"/>
				<Item Name="Message Element Type.ctl" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Server API/typeDefs/Message Element Type.ctl"/>
				<Item Name="Message Metadata.ctl" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Server API/typeDefs/Message Metadata.ctl"/>
				<Item Name="Register Message Metadata.vi" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Server API/Server/Register Message Metadata.vi"/>
				<Item Name="TranslateGrpcError.vi" Type="VI" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Server API/TranslateGrpcError.vi"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="TestDiscoveryClient" Type="Source Distribution">
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{65626EEE-D28E-4641-9BFF-E5EAC3056F46}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">TestDiscoveryClient</Property>
				<Property Name="Bld_excludedDirectory[0]" Type="Path">vi.lib</Property>
				<Property Name="Bld_excludedDirectory[0].pathType" Type="Str">relativeToAppDir</Property>
				<Property Name="Bld_excludedDirectory[1]" Type="Path">instr.lib</Property>
				<Property Name="Bld_excludedDirectory[1].pathType" Type="Str">relativeToAppDir</Property>
				<Property Name="Bld_excludedDirectory[2]" Type="Path">user.lib</Property>
				<Property Name="Bld_excludedDirectory[2].pathType" Type="Str">relativeToAppDir</Property>
				<Property Name="Bld_excludedDirectory[3]" Type="Path">resource/objmgr</Property>
				<Property Name="Bld_excludedDirectory[3].pathType" Type="Str">relativeToAppDir</Property>
				<Property Name="Bld_excludedDirectory[4]" Type="Path">/C/ProgramData/National Instruments/InstCache/20.0</Property>
				<Property Name="Bld_excludedDirectory[5]" Type="Path">/C/Users/apeterso/Documents/LabVIEW Data/2020(64-bit)/ExtraVILib</Property>
				<Property Name="Bld_excludedDirectoryCount" Type="Int">6</Property>
				<Property Name="Bld_localDestDir" Type="Path">/C/github/measurement-services-labview/build_output</Property>
				<Property Name="Bld_preActionVIID" Type="Ref">/My Computer/Unit Test/Pre-Build_Test_Stub.vi</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{25EC9178-5238-465B-B983-7A3A0FEC1276}</Property>
				<Property Name="Bld_version.build" Type="Int">4</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">Destination Directory</Property>
				<Property Name="Destination[0].path" Type="Path">/C/github/measurement-services-labview/build_output</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/C/github/measurement-services-labview/build_output/data</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{71EF42C2-9F15-4204-8B8E-B0A619E8D5DA}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/Unit Test/Test_Register Service.vi</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Unit Test/test_results.txt</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="SourceCount" Type="Int">3</Property>
			</Item>
		</Item>
	</Item>
</Project>
