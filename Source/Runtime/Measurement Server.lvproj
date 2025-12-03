<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="21008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">Editor version</Property>
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
			<Item Name="Clients" Type="Folder">
				<Item Name="NI Discovery V1 Client.lvlib" Type="Library" URL="../Clients/Discovery V1/NI Discovery V1 Client.lvlib"/>
				<Item Name="NI Pin Map V1 Client.lvlib" Type="Library" URL="../Clients/Pin Map V1/NI Pin Map V1 Client.lvlib"/>
				<Item Name="NI Session Management V1 Client.lvlib" Type="Library" URL="../Clients/Session Management V1/NI Session Management V1 Client.lvlib"/>
			</Item>
			<Item Name="Measurements" Type="Folder">
				<Item Name="NI Measurement Plug-In SDK.lvlib" Type="Library" URL="../Measurements/NI Measurement Plug-In SDK.lvlib"/>
			</Item>
			<Item Name="Sessions" Type="Folder">
				<Property Name="NI.SortType" Type="Int">0</Property>
				<Item Name="NI Session Management Instrument.lvlib" Type="Library" URL="../Sessions/Instrument/NI Session Management Instrument.lvlib"/>
				<Item Name="NI Session Management niDCPower.lvlib" Type="Library" URL="../Sessions/niDCPower/NI Session Management niDCPower.lvlib"/>
				<Item Name="NI Session Management niDigital.lvlib" Type="Library" URL="../Sessions/niDigital/NI Session Management niDigital.lvlib"/>
				<Item Name="NI Session Management niDMM.lvlib" Type="Library" URL="../Sessions/niDMM/NI Session Management niDMM.lvlib"/>
				<Item Name="NI Session Management niFGEN.lvlib" Type="Library" URL="../Sessions/niFGEN/NI Session Management niFGEN.lvlib"/>
				<Item Name="NI Session Management niScope.lvlib" Type="Library" URL="../Sessions/niScope/NI Session Management niScope.lvlib"/>
				<Item Name="NI Session Management VISA.lvlib" Type="Library" URL="../Sessions/VISA/NI Session Management VISA.lvlib"/>
			</Item>
			<Item Name="TestStand" Type="Folder">
				<Item Name="NI Pin Map TestStand.lvlib" Type="Library" URL="../TestStand/NI Pin Map TestStand.lvlib"/>
			</Item>
		</Item>
		<Item Name="Tests" Type="Folder">
			<Item Name="MeasurementServerTests.lvlib" Type="Library" URL="../../Tests/Tests.Runtime/Measurement Server/MeasurementServerTests.lvlib"/>
		</Item>
		<Item Name="TestUtilities" Type="Folder">
			<Item Name="Session Reservation Test Utilities.lvlib" Type="Library" URL="../../TestUtilities/TestUtilities.Runtime/Session Reservation Test Utilities/Session Reservation Test Utilities.lvlib"/>
		</Item>
		<Item Name="Global VIs" Type="Folder">
			<Item Name="Error Strings Global Internal.vi" Type="VI" URL="../Measurements/Helpers/Error Strings Global Internal.vi"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
