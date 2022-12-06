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
		<Item Name="Tests.Session Management Client_lv" Type="Folder" URL="../../Tests/Tests.Session Management Client_lv">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="TestUtilities.Session Management Client_lv" Type="Folder" URL="../../TestUtilities/TestUtilities.Session Management Client_lv">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="Session Management Client_v1" Type="Folder">
			<Item Name="Session Management Client_v1.lvlib" Type="Library" URL="../Session Management Client_v1/Session Management Client_v1.lvlib"/>
		</Item>
		<Item Name="Session Management Client Prototype Library.lvlib" Type="Library" URL="../Session Management Client Prototype Library.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="grpc-lvsupport-release.lvlib" Type="Library" URL="/&lt;vilib&gt;/gRPC/LabVIEW gRPC Library/grpc-lvsupport-release.lvlib"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="1D String Array to Delimited String.vi" Type="VI" URL="/&lt;vilib&gt;/AdvancedString/1D String Array to Delimited String.vi"/>
				<Item Name="Sort 1D Array.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Sort 1D Array.vim"/>
				<Item Name="Less Functor.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Comparison/Less/Less Functor/Less Functor.lvclass"/>
				<Item Name="Less Comparable.lvclass" Type="LVClass" URL="/&lt;vilib&gt;/Comparison/Less/Less Comparable/Less Comparable.lvclass"/>
				<Item Name="Sort 1D Array Core.vim" Type="VI" URL="/&lt;vilib&gt;/Array/Helpers/Sort 1D Array Core.vim"/>
				<Item Name="Less.vim" Type="VI" URL="/&lt;vilib&gt;/Comparison/Less.vim"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="Pin Map Client_v1.lvlib" Type="Library" URL="../../Pin Map Client_lv/Pin Map Client_v1/Pin Map Client_v1.lvlib"/>
			<Item Name="Pin Map Server Get Pin Map Service Address.vi" Type="VI" URL="../../TestUtilities/TestUtilities.Pin Map Client_lv/Pin Map Server Get Pin Map Service Address.vi"/>
			<Item Name="Discovery_client.lvlib" Type="Library" URL="../../Discovery Client_lv/Discovery_client/Discovery_client.lvlib"/>
			<Item Name="Discovery Client Resolve Service.vi" Type="VI" URL="../../TestUtilities/TestUtilities.Discovery Client_lv/Discovery Client Resolve Service.vi"/>
			<Item Name="Discovery Server Get Discovery Service Address.vi" Type="VI" URL="../../TestUtilities/TestUtilities.Discovery Client_lv/Discovery Server Get Discovery Service Address.vi"/>
			<Item Name="Pin Map Client Create or Update Pin Map.vi" Type="VI" URL="../../TestUtilities/TestUtilities.Pin Map Client_lv/Pin Map Client Create or Update Pin Map.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
