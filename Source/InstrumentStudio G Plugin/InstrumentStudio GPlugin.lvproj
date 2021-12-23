<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
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
		<Item Name="Measurement Client Wrapper" Type="Folder">
			<Item Name="Measurement Client Wrapper.lvclass" Type="LVClass" URL="../Measurement Client Wrapper/Measurement Client Wrapper.lvclass"/>
		</Item>
		<Item Name="IS LabVIEW service host" Type="Folder">
			<Item Name="controls" Type="Folder"/>
			<Item Name="subVIs" Type="Folder">
				<Item Name="Message Queue" Type="Folder">
					<Item Name="Message Queue.lvlib" Type="Library" URL="../IS LabVIEW service host/subVIs/Message Queue/Message Queue.lvlib"/>
				</Item>
				<Item Name="User Event - Stop" Type="Folder">
					<Item Name="User Event - Stop.lvlib" Type="Library" URL="../IS LabVIEW service host/subVIs/User Event - Stop/User Event - Stop.lvlib"/>
				</Item>
				<Item Name="Check Loop Error.vi" Type="VI" URL="../IS LabVIEW service host/subVIs/Check Loop Error.vi"/>
				<Item Name="Error Handler - Event Handling Loop.vi" Type="VI" URL="../IS LabVIEW service host/subVIs/Error Handler - Event Handling Loop.vi"/>
				<Item Name="Error Handler - Message Handling Loop.vi" Type="VI" URL="../IS LabVIEW service host/subVIs/Error Handler - Message Handling Loop.vi"/>
			</Item>
			<Item Name="InstrumentStudioPlugin_RenameMe.lvlib" Type="Library" URL="../IS LabVIEW service host/InstrumentStudioPlugin_RenameMe.lvlib"/>
			<Item Name="readme.txt" Type="Document" URL="../IS LabVIEW service host/readme.txt"/>
		</Item>
		<Item Name="Dependency" Type="Folder">
			<Item Name="gRPC" Type="Folder">
				<Item Name="Libraries" Type="Folder">
					<Item Name="Linux" Type="Folder">
						<Item Name="liblabview_grpc_server.so" Type="Document" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Libraries/Linux/liblabview_grpc_server.so"/>
					</Item>
					<Item Name="LinuxRT" Type="Folder">
						<Item Name="liblabview_grpc_server.so" Type="Document" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Libraries/LinuxRT/liblabview_grpc_server.so"/>
					</Item>
					<Item Name="Win32" Type="Folder">
						<Item Name="labview_grpc_server.dll" Type="Document" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Libraries/Win32/labview_grpc_server.dll"/>
					</Item>
					<Item Name="Win64" Type="Folder">
						<Item Name="labview_grpc_server.dll" Type="Document" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/Libraries/Win64/labview_grpc_server.dll"/>
					</Item>
				</Item>
				<Item Name="gprc-lvsupport-release.lvlib" Type="Library" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/gprc-lvsupport-release.lvlib"/>
			</Item>
			<Item Name="Discovery Client" Type="Folder">
				<Item Name="Discovery_client.lvlib" Type="Library" URL="/&lt;vilib&gt;/TAF/Discovery Client/Discovery_client.lvlib"/>
			</Item>
			<Item Name="Measurement Client" Type="Folder">
				<Item Name="Measurement_client-release.lvlib" Type="Library" URL="/&lt;vilib&gt;/TAF/LabVIEW Measurement Client/Measurement_client-release.lvlib"/>
			</Item>
			<Item Name="InstrumentStudioPluginSDK.lvlibp" Type="LVLibp" URL="../IS LabVIEW service host/InstrumentStudioPluginSDK.lvlibp">
				<Item Name="Panel Size.ctl" Type="VI" URL="../IS LabVIEW service host/InstrumentStudioPluginSDK.lvlibp/Panel Size.ctl"/>
				<Item Name="Setup Session Id.vi" Type="VI" URL="../IS LabVIEW service host/InstrumentStudioPluginSDK.lvlibp/Setup Session Id.vi"/>
				<Item Name="Plugin Session.lvclass" Type="LVClass" URL="../IS LabVIEW service host/InstrumentStudioPluginSDK.lvlibp/Plugin Session.lvclass"/>
				<Item Name="Event Registration Refnum.ctl" Type="VI" URL="../IS LabVIEW service host/InstrumentStudioPluginSDK.lvlibp/Event Registration Refnum.ctl"/>
				<Item Name="Plugin Events Enum.ctl" Type="VI" URL="../IS LabVIEW service host/InstrumentStudioPluginSDK.lvlibp/Plugin Events Enum.ctl"/>
				<Item Name="Plugin Events.ctl" Type="VI" URL="../IS LabVIEW service host/InstrumentStudioPluginSDK.lvlibp/Plugin Events.ctl"/>
			</Item>
		</Item>
		<Item Name="LabVIEW MF.gplugindata" Type="Document" URL="../IS LabVIEW service host/LabVIEW MF.gplugindata"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="Equal Comparable.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Comparison/Equal/Equal Comparable/Equal Comparable.lvclass"/>
				<Item Name="Equal Functor.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Comparison/Equal/Equal Functor/Equal Functor.lvclass"/>
				<Item Name="Equals.vim" Type="VI" URL="/&lt;vilib&gt;/Comparison/Equals.vim"/>
				<Item Name="Search Unsorted 1D Array Core.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Helpers/Search Unsorted 1D Array Core.vim"/>
				<Item Name="Search Unsorted 1D Array.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Search Unsorted 1D Array.vim"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
			</Item>
			<Item Name="NationalInstruments.VIHost.Interop.dll" Type="Document" URL="NationalInstruments.VIHost.Interop.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="lvmfsd" Type="Source Distribution">
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{E729A19F-EE78-4390-AD84-FE4C4FCF8CD4}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">lvmfsd</Property>
				<Property Name="Bld_excludedDirectory[0]" Type="Path">instr.lib</Property>
				<Property Name="Bld_excludedDirectory[0].pathType" Type="Str">relativeToAppDir</Property>
				<Property Name="Bld_excludedDirectory[1]" Type="Path">user.lib</Property>
				<Property Name="Bld_excludedDirectory[1].pathType" Type="Str">relativeToAppDir</Property>
				<Property Name="Bld_excludedDirectoryCount" Type="Int">2</Property>
				<Property Name="Bld_localDestDir" Type="Path">/D/build/lvmfsd/LabVIEW MF</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{0FDBE926-AB10-4A30-85F1-EEF188EE368D}</Property>
				<Property Name="Bld_version.build" Type="Int">22</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">Destination Directory</Property>
				<Property Name="Destination[0].path" Type="Path">/D/build/lvmfsd/LabVIEW MF</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/D/build/lvmfsd/LabVIEW MF/data</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[2].destName" Type="Str">Data_Client Wrapper</Property>
				<Property Name="Destination[2].path" Type="Path">/D/build/lvmfsd/LabVIEW MF/Data_CW</Property>
				<Property Name="Destination[2].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[3].destName" Type="Str">Data_Measurement Client</Property>
				<Property Name="Destination[3].path" Type="Path">/D/build/lvmfsd/LabVIEW MF/Data_MC</Property>
				<Property Name="Destination[3].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[4].destName" Type="Str">Data_gRPC</Property>
				<Property Name="Destination[4].path" Type="Path">/D/build/lvmfsd/LabVIEW MF/Data_gRPC</Property>
				<Property Name="Destination[4].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[4].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[5].destName" Type="Str">Data_Discovery</Property>
				<Property Name="Destination[5].path" Type="Path">/D/build/lvmfsd/LabVIEW MF/Data_DSC</Property>
				<Property Name="Destination[5].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">6</Property>
				<Property Name="Source[0].Container.applyDestination" Type="Bool">true</Property>
				<Property Name="Source[0].destinationIndex" Type="Int">1</Property>
				<Property Name="Source[0].itemID" Type="Str">{3F8902A7-1575-488C-852E-F13ED572B8A4}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].Container.applyDestination" Type="Bool">true</Property>
				<Property Name="Source[1].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[1].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/IS LabVIEW service host</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[1].type" Type="Str">Container</Property>
				<Property Name="Source[10].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[10].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Client API/Create Client.vi</Property>
				<Property Name="Source[10].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[10].type" Type="Str">VI</Property>
				<Property Name="Source[11].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[11].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/CompleteMetadataRegistration.vi</Property>
				<Property Name="Source[11].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[11].type" Type="Str">VI</Property>
				<Property Name="Source[12].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[12].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/CreateSerializationSession.vi</Property>
				<Property Name="Source[12].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[12].type" Type="Str">VI</Property>
				<Property Name="Source[13].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[13].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/FreeSerializationSession.vi</Property>
				<Property Name="Source[13].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[13].type" Type="Str">VI</Property>
				<Property Name="Source[14].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[14].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/PackToBuffer.vim</Property>
				<Property Name="Source[14].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[14].type" Type="Str">VI</Property>
				<Property Name="Source[15].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[15].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/UnpackFromBuffer.vim</Property>
				<Property Name="Source[15].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[15].type" Type="Str">VI</Property>
				<Property Name="Source[16].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[16].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[16].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[16].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Server API/Cluster to gRPC message</Property>
				<Property Name="Source[16].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[16].type" Type="Str">Container</Property>
				<Property Name="Source[17].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[17].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[17].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[17].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Server API/Message Requests</Property>
				<Property Name="Source[17].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[17].type" Type="Str">Container</Property>
				<Property Name="Source[18].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[18].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[18].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[18].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Server API/Server</Property>
				<Property Name="Source[18].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[18].type" Type="Str">Container</Property>
				<Property Name="Source[19].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[19].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/AnyBuilderAddValue.vim</Property>
				<Property Name="Source[19].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[19].type" Type="Str">VI</Property>
				<Property Name="Source[2].Container.applyDestination" Type="Bool">true</Property>
				<Property Name="Source[2].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[2].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">2</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/Measurement Client Wrapper</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">Container</Property>
				<Property Name="Source[20].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[20].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/AnyBuilderBegin.vi</Property>
				<Property Name="Source[20].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[20].type" Type="Str">VI</Property>
				<Property Name="Source[21].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[21].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/AnyBuilderBeginNestedMessage.vi</Property>
				<Property Name="Source[21].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[21].type" Type="Str">VI</Property>
				<Property Name="Source[22].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[22].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/AnyBuilderBeginRepeatedNestedMessage.vi</Property>
				<Property Name="Source[22].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[22].type" Type="Str">VI</Property>
				<Property Name="Source[23].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[23].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/AnyBuilderBeginRepeatedNestedMessageElement.vi</Property>
				<Property Name="Source[23].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[23].type" Type="Str">VI</Property>
				<Property Name="Source[24].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[24].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/AnyBuilderBuild.vi</Property>
				<Property Name="Source[24].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[24].type" Type="Str">VI</Property>
				<Property Name="Source[25].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[25].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/AnyBuilderBuildToBuffer.vi</Property>
				<Property Name="Source[25].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[25].type" Type="Str">VI</Property>
				<Property Name="Source[26].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[26].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/IsAnyOfType.vi</Property>
				<Property Name="Source[26].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[26].type" Type="Str">VI</Property>
				<Property Name="Source[27].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[27].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/PackToAny.vim</Property>
				<Property Name="Source[27].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[27].type" Type="Str">VI</Property>
				<Property Name="Source[28].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[28].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/TryUnpackFromAny.vim</Property>
				<Property Name="Source[28].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[28].type" Type="Str">VI</Property>
				<Property Name="Source[29].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[29].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Protobuf/Any Support/UnpackFromAny.vim</Property>
				<Property Name="Source[29].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[29].type" Type="Str">VI</Property>
				<Property Name="Source[3].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/IS LabVIEW service host/InstrumentStudioPlugin_RenameMe.lvlib/Main.vi</Property>
				<Property Name="Source[3].type" Type="Str">VI</Property>
				<Property Name="Source[30].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[30].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Server API/Cluster to gRPC message/Register Cluster.vi</Property>
				<Property Name="Source[30].type" Type="Str">VI</Property>
				<Property Name="Source[31].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[31].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Server API/Cluster to gRPC message/Cluster to gRPC LabVIEW Message.vi</Property>
				<Property Name="Source[31].type" Type="Str">VI</Property>
				<Property Name="Source[32].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[32].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Server API/Cluster to gRPC message/Apply Package Name.vi</Property>
				<Property Name="Source[32].type" Type="Str">VI</Property>
				<Property Name="Source[33].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[33].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Server API/Cluster to gRPC message/Cluster to Element Details.vi</Property>
				<Property Name="Source[33].type" Type="Str">VI</Property>
				<Property Name="Source[34].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[34].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Server API/Cluster to gRPC message/LabVIEW DataType to Message Element DataType.vi</Property>
				<Property Name="Source[34].type" Type="Str">VI</Property>
				<Property Name="Source[35].Container.applyDestination" Type="Bool">true</Property>
				<Property Name="Source[35].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[35].destinationIndex" Type="Int">4</Property>
				<Property Name="Source[35].itemID" Type="Ref">/My Computer/Dependency/gRPC</Property>
				<Property Name="Source[35].type" Type="Str">Container</Property>
				<Property Name="Source[36].Container.applyDestination" Type="Bool">true</Property>
				<Property Name="Source[36].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[36].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[36].destinationIndex" Type="Int">5</Property>
				<Property Name="Source[36].itemID" Type="Ref">/My Computer/Dependency/Discovery Client</Property>
				<Property Name="Source[36].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[36].type" Type="Str">Container</Property>
				<Property Name="Source[37].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[37].itemID" Type="Ref">/My Computer/LabVIEW MF.gplugindata</Property>
				<Property Name="Source[38].Container.applyDestination" Type="Bool">true</Property>
				<Property Name="Source[38].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[38].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[38].destinationIndex" Type="Int">3</Property>
				<Property Name="Source[38].itemID" Type="Ref">/My Computer/Dependency/Measurement Client</Property>
				<Property Name="Source[38].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[38].type" Type="Str">Container</Property>
				<Property Name="Source[39].destinationIndex" Type="Int">1</Property>
				<Property Name="Source[39].itemID" Type="Ref">/My Computer/Dependency/InstrumentStudioPluginSDK.lvlibp</Property>
				<Property Name="Source[39].preventRename" Type="Bool">true</Property>
				<Property Name="Source[39].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[4].destinationIndex" Type="Int">4</Property>
				<Property Name="Source[4].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib</Property>
				<Property Name="Source[4].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[4].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[4].type" Type="Str">Library</Property>
				<Property Name="Source[5].Container.applyDestination" Type="Bool">true</Property>
				<Property Name="Source[5].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[5].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[5].destinationIndex" Type="Int">4</Property>
				<Property Name="Source[5].itemID" Type="Ref">/My Computer/Dependency/gRPC/Libraries</Property>
				<Property Name="Source[5].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[5].type" Type="Str">Container</Property>
				<Property Name="Source[6].Container.applyDestination" Type="Bool">true</Property>
				<Property Name="Source[6].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[6].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Client API</Property>
				<Property Name="Source[6].type" Type="Str">Container</Property>
				<Property Name="Source[7].Container.applyInclusion" Type="Bool">true</Property>
				<Property Name="Source[7].Container.depDestIndex" Type="Int">0</Property>
				<Property Name="Source[7].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[7].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/typeDefs</Property>
				<Property Name="Source[7].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[7].type" Type="Str">Container</Property>
				<Property Name="Source[8].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[8].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Client API/Client Unary Call.vim</Property>
				<Property Name="Source[8].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[8].type" Type="Str">VI</Property>
				<Property Name="Source[9].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[9].itemID" Type="Ref">/My Computer/Dependency/gRPC/gprc-lvsupport-release.lvlib/Client API/Close Client.vi</Property>
				<Property Name="Source[9].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[9].type" Type="Str">VI</Property>
				<Property Name="SourceCount" Type="Int">40</Property>
			</Item>
			<Item Name="lv-mf-support-for-is-2021" Type="{E661DAE2-7517-431F-AC41-30807A3BDA38}">
				<Property Name="NIPKG_addToFeed" Type="Bool">false</Property>
				<Property Name="NIPKG_allDependenciesToFeed" Type="Bool">false</Property>
				<Property Name="NIPKG_allDependenciesToSystemLink" Type="Bool">false</Property>
				<Property Name="NIPKG_certificates" Type="Bool">true</Property>
				<Property Name="NIPKG_createInstaller" Type="Bool">false</Property>
				<Property Name="NIPKG_feedLocation" Type="Path">../builds/NI_AB_PROJECTNAME/lv-mf-support-for-is-2021/Feed</Property>
				<Property Name="NIPKG_feedLocation.Type" Type="Str">relativeToCommon</Property>
				<Property Name="NIPKG_installerArtifacts" Type="Str"></Property>
				<Property Name="NIPKG_installerBuiltBefore" Type="Bool">false</Property>
				<Property Name="NIPKG_installerDestination" Type="Path">../builds/NI_AB_PROJECTNAME/lv-mf-support-for-is-2021/Package Installer</Property>
				<Property Name="NIPKG_installerDestination.Type" Type="Str">relativeToCommon</Property>
				<Property Name="NIPKG_lastBuiltPackage" Type="Str">labview-measurement-framework-support-for-instrumentstudio-2021_0.1.1-6_windows_x64.nipkg</Property>
				<Property Name="NIPKG_license" Type="Ref"></Property>
				<Property Name="NIPKG_packageVersion" Type="Bool">false</Property>
				<Property Name="NIPKG_releaseNotes" Type="Str"></Property>
				<Property Name="NIPKG_storeProduct" Type="Bool">false</Property>
				<Property Name="NIPKG_VisibleForRuntimeDeployment" Type="Bool">true</Property>
				<Property Name="PKG_actions.Count" Type="Int">0</Property>
				<Property Name="PKG_autoIncrementBuild" Type="Bool">true</Property>
				<Property Name="PKG_autoSelectDeps" Type="Bool">true</Property>
				<Property Name="PKG_buildNumber" Type="Int">7</Property>
				<Property Name="PKG_buildSpecName" Type="Str">lv-mf-support-for-is-2021</Property>
				<Property Name="PKG_dependencies.Count" Type="Int">1</Property>
				<Property Name="PKG_dependencies[0].Enhanced" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[0].MaxVersion" Type="Str"></Property>
				<Property Name="PKG_dependencies[0].MaxVersionInclusive" Type="Bool">false</Property>
				<Property Name="PKG_dependencies[0].MinVersion" Type="Str">20.1.0.49152-0+f0</Property>
				<Property Name="PKG_dependencies[0].MinVersionType" Type="Str">Inclusive</Property>
				<Property Name="PKG_dependencies[0].NIPKG.DisplayName" Type="Str">LabVIEW Runtime (64-bit)</Property>
				<Property Name="PKG_dependencies[0].Package.Name" Type="Str">ni-labview-2020-runtime-engine</Property>
				<Property Name="PKG_dependencies[0].Package.Section" Type="Str">Programming Environments</Property>
				<Property Name="PKG_dependencies[0].Package.Synopsis" Type="Str">The LabVIEW Runtime is a software add-on that enables engineers to run executables on a nondevelopment machine.</Property>
				<Property Name="PKG_dependencies[0].Relationship" Type="Str">Required Dependency</Property>
				<Property Name="PKG_dependencies[0].Type" Type="Str">NIPKG</Property>
				<Property Name="PKG_description" Type="Str">LabVIEW Measurement Framework Support For InstrumentStudio 2021</Property>
				<Property Name="PKG_destinations.Count" Type="Int">4</Property>
				<Property Name="PKG_destinations[0].ID" Type="Str">{16FBD783-2594-40F3-A735-74FEEB7DD785}</Property>
				<Property Name="PKG_destinations[0].Subdir.Directory" Type="Str">Addons</Property>
				<Property Name="PKG_destinations[0].Subdir.Parent" Type="Str">{312900B2-AA05-4D39-8169-C065175FCBCB}</Property>
				<Property Name="PKG_destinations[0].Type" Type="Str">Subdir</Property>
				<Property Name="PKG_destinations[1].ID" Type="Str">{312900B2-AA05-4D39-8169-C065175FCBCB}</Property>
				<Property Name="PKG_destinations[1].Subdir.Directory" Type="Str">InstrumentStudio 2021</Property>
				<Property Name="PKG_destinations[1].Subdir.Parent" Type="Str">{C90F962F-609B-4271-BE89-5C979FA62DAA}</Property>
				<Property Name="PKG_destinations[1].Type" Type="Str">Subdir</Property>
				<Property Name="PKG_destinations[2].ID" Type="Str">{A0A06DA5-2AC3-436B-8C62-AC8EDBFE21B9}</Property>
				<Property Name="PKG_destinations[2].Subdir.Directory" Type="Str">LabVIEW MF</Property>
				<Property Name="PKG_destinations[2].Subdir.Parent" Type="Str">{16FBD783-2594-40F3-A735-74FEEB7DD785}</Property>
				<Property Name="PKG_destinations[2].Type" Type="Str">Subdir</Property>
				<Property Name="PKG_destinations[3].ID" Type="Str">{C90F962F-609B-4271-BE89-5C979FA62DAA}</Property>
				<Property Name="PKG_destinations[3].Subdir.Directory" Type="Str">National Instruments</Property>
				<Property Name="PKG_destinations[3].Subdir.Parent" Type="Str">root_5</Property>
				<Property Name="PKG_destinations[3].Type" Type="Str">Subdir</Property>
				<Property Name="PKG_displayName" Type="Str">LabVIEW Measurement Framework Support For InstrumentStudio 2021</Property>
				<Property Name="PKG_displayVersion" Type="Str"></Property>
				<Property Name="PKG_feedDescription" Type="Str"></Property>
				<Property Name="PKG_feedName" Type="Str"></Property>
				<Property Name="PKG_homepage" Type="Str"></Property>
				<Property Name="PKG_hostname" Type="Str"></Property>
				<Property Name="PKG_maintainer" Type="Str">NI &lt;&gt;</Property>
				<Property Name="PKG_output" Type="Path">/D/build/lvmfpkg</Property>
				<Property Name="PKG_packageName" Type="Str">labview-measurement-framework-support-for-instrumentstudio-2021</Property>
				<Property Name="PKG_publishToSystemLink" Type="Bool">false</Property>
				<Property Name="PKG_section" Type="Str">Add-Ons</Property>
				<Property Name="PKG_shortcuts.Count" Type="Int">0</Property>
				<Property Name="PKG_sources.Count" Type="Int">2</Property>
				<Property Name="PKG_sources[0].Destination" Type="Str">{A0A06DA5-2AC3-436B-8C62-AC8EDBFE21B9}</Property>
				<Property Name="PKG_sources[0].ID" Type="Ref">/My Computer/Build Specifications/lvmfsd</Property>
				<Property Name="PKG_sources[0].Type" Type="Str">Build</Property>
				<Property Name="PKG_sources[1].Destination" Type="Str">{16FBD783-2594-40F3-A735-74FEEB7DD785}</Property>
				<Property Name="PKG_sources[1].ID" Type="Ref">/My Computer/LabVIEW MF.gplugindata</Property>
				<Property Name="PKG_sources[1].Type" Type="Str">File</Property>
				<Property Name="PKG_synopsis" Type="Str">LabVIEW Measurement Framework Support For InstrumentStudio 2021</Property>
				<Property Name="PKG_version" Type="Str">0.1.1</Property>
			</Item>
		</Item>
	</Item>
</Project>
