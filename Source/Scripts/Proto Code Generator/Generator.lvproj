<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="20008000">
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
		<Item Name="subVIs" Type="Folder">
			<Item Name="Convert to Absolute Path.vim" Type="VI" URL="../Convert to Absolute Path.vim"/>
			<Item Name="Delete Old Library from Disk.vi" Type="VI" URL="../Delete Old Library from Disk.vi"/>
			<Item Name="Delete Old Library from Project.vi" Type="VI" URL="../Delete Old Library from Project.vi"/>
			<Item Name="Generate.vi" Type="VI" URL="../Generate.vi"/>
			<Item Name="Get Absolute Source Dir Path.vi" Type="VI" URL="../Get Absolute Source Dir Path.vi"/>
			<Item Name="grpc-labview Template Options.ctl" Type="VI" URL="../grpc-labview Template Options.ctl"/>
			<Item Name="Rename gRPC Server Class.vi" Type="VI" URL="../Rename gRPC Server Class.vi"/>
		</Item>
		<Item Name="Generate Discovery.vi" Type="VI" URL="../Generate Discovery.vi"/>
		<Item Name="Generate Pinmap.vi" Type="VI" URL="../Generate Pinmap.vi"/>
		<Item Name="Generate Session Manager.vi" Type="VI" URL="../Generate Session Manager.vi"/>
		<Item Name="Generate V1 Measurement.vi" Type="VI" URL="../Generate V1 Measurement.vi"/>
		<Item Name="Generate V2 Measurement.vi" Type="VI" URL="../Generate V2 Measurement.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Assert Array Dimension Count.vim" Type="VI" URL="/&lt;vilib&gt;/Utility/TypeAssert/Assert Array Dimension Count.vim"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
