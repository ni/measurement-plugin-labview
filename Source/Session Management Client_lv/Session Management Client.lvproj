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
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
