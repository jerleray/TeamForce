#tag Class
Protected Class AppleURLSessionConfiguration
Inherits AppleObject
	#tag Method, Flags = &h1021
		Private Sub constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(identifier as CFStringRef)
		  Declare Function backgroundSessionConfigurationWithIdentifier lib FoundationLibName  selector _
		  "backgroundSessionConfigurationWithIdentifier:" (id as ptr, identifier as CFStringRef) as ptr
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Super.Constructor (backgroundSessionConfigurationWithIdentifier(ClassPtr, identifier))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DefaultConfiguration() As AppleURLSessionConfiguration
		  Declare Function defaultSessionConfiguration lib FoundationLibName  selector "defaultSessionConfiguration" (id as ptr) as ptr
		  dim result as new AppleURLSessionConfiguration (defaultSessionConfiguration(ClassPtr))
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function EphemeralConfiguration() As AppleURLSessionConfiguration
		  Declare Function ephemeralSessionConfiguration lib FoundationLibName  selector "ephemeralSessionConfiguration" (id as ptr) as ptr
		  dim result as new AppleURLSessionConfiguration (ephemeralSessionConfiguration(ClassPtr))
		  result.RetainClassObject
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MakefromPtr(aPtr as Ptr) As AppleURLSessionConfiguration
		  Return if (aptr = nil, nil, new AppleURLSessionConfiguration (aptr))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function allowsCellularAccess lib FoundationLibName  selector "allowsCellularAccess" (id as ptr) as Boolean
			  return allowsCellularAccess (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setAllowsCellularAccess lib FoundationLibName  selector "setAllowsCellularAccess:" (id as ptr, value as Boolean)
			  setAllowsCellularAccess id, value
			End Set
		#tag EndSetter
		AllowsCellularAccess As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("NSURLSessionConfiguration")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function connectionProxyDictionary lib FoundationLibName  selector "connectionProxyDictionary" (id as ptr) as Ptr
			  return AppleDictionary.MakeFromPtr (connectionProxyDictionary(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setConnectionProxyDictionary lib FoundationLibName  selector "setConnectionProxyDictionary:" (id as ptr, value as ptr)
			  setConnectionProxyDictionary id, if (value = nil, nil, value.id)
			End Set
		#tag EndSetter
		ConnectionProxyDictionary As AppleDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function discretionary lib FoundationLibName  selector "isDiscretionary" (id as ptr) as Boolean
			  return discretionary (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setDiscretionary lib FoundationLibName  selector "setDiscretionary:" (id as ptr, value as Boolean)
			  setDiscretionary id, value
			End Set
		#tag EndSetter
		Discretionary As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function HTTPAdditionalHeaders lib FoundationLibName  selector "HTTPAdditionalHeaders" (id as ptr) as Ptr
			  return AppleDictionary.MakeFromPtr (HTTPAdditionalHeaders(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setHTTPAdditionalHeaders lib FoundationLibName  selector "setHTTPAdditionalHeaders:" (id as ptr, value as ptr)
			  setHTTPAdditionalHeaders id, value.id
			End Set
		#tag EndSetter
		HTTPAdditionalHeaders As AppleDictionary
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function HTTPCookieAcceptPolicy lib FoundationLibName  selector "HTTPCookieAcceptPolicy" (id as ptr) as AppleHTTPCookieStorage.NSHTTPCookieAcceptPolicy
			  return HTTPCookieAcceptPolicy (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setHTTPCookieAcceptPolicy lib FoundationLibName  selector "setHTTPCookieAcceptPolicy:" (id as ptr, value as AppleHTTPCookieStorage.NSHTTPCookieAcceptPolicy)
			  setHTTPCookieAcceptPolicy id, value
			End Set
		#tag EndSetter
		HTTPCookieAcceptPolicy As AppleHTTPCookieStorage.NSHTTPCookieAcceptPolicy
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function HTTPCookieStorage lib FoundationLibName  selector "HTTPCookieStorage" (id as ptr) as Ptr
			  return AppleHTTPCookieStorage.MakeFromPtr (HTTPCookieStorage(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setHTTPCookieStorage lib FoundationLibName  selector "setHTTPCookieStorage:" (id as ptr, value as ptr)
			  setHTTPCookieStorage id, if (value = nil, nil, value.Id)
			End Set
		#tag EndSetter
		HTTPCookieStorage As AppleHTTPCookieStorage
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function HTTPMaximumConnectionsPerHost lib FoundationLibName  selector "HTTPMaximumConnectionsPerHost" (id as ptr) as Integer
			  return HTTPMaximumConnectionsPerHost (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setHTTPMaximumConnectionsPerHost lib FoundationLibName  selector "setHTTPMaximumConnectionsPerHost:" (id as ptr, value as Integer)
			  setHTTPMaximumConnectionsPerHost id, value
			End Set
		#tag EndSetter
		HTTPMaximumConnectionsPerHost As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function HTTPShouldSetCookies lib FoundationLibName  selector "HTTPShouldSetCookies" (id as ptr) as Boolean
			  return HTTPShouldSetCookies (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setHTTPShouldSetCookies lib FoundationLibName  selector "setHTTPShouldSetCookies:" (id as ptr, value as Boolean)
			  setHTTPShouldSetCookies id, value
			End Set
		#tag EndSetter
		HTTPShouldSetCookies As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function HTTPShouldUsePipelining lib FoundationLibName  selector "HTTPShouldUsePipelining" (id as ptr) as Boolean
			  return HTTPShouldUsePipelining (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setHTTPShouldUsePipelining lib FoundationLibName  selector "setHTTPShouldUsePipelining:" (id as ptr, value as Boolean)
			  setHTTPShouldUsePipelining id, value
			End Set
		#tag EndSetter
		HTTPShouldUsePipelining As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function identifier lib FoundationLibName  selector "identifier" (id as ptr) as CFStringRef
			  return identifier (id)
			End Get
		#tag EndGetter
		Identifier As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function networkServiceType lib FoundationLibName  selector "networkServiceType" (id as ptr) as AppleURLRequest.NSURLRequestNetworkServiceType
			  return networkServiceType (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setNetworkServiceType lib FoundationLibName  selector "setNetworkServiceType:" (id as ptr, value as AppleURLRequest.NSURLRequestNetworkServiceType)
			  setNetworkServiceType id, value
			End Set
		#tag EndSetter
		NetworkServiceType As AppleURLRequest.NSURLRequestNetworkServiceType
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function protocolClasses lib FoundationLibName  selector "protocolClasses" (id as ptr) as Ptr
			  return AppleArray.MakeFromPtr (protocolClasses(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setProtocolClasses lib FoundationLibName  selector "setProtocolClasses:" (id as ptr, value as ptr)
			  setProtocolClasses id, if (value = nil, nil, value.id)
			End Set
		#tag EndSetter
		ProtocolClasses As AppleArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function requestCachePolicy lib FoundationLibName  selector "requestCachePolicy" (id as ptr) as AppleURLRequest.NSURLRequestCachePolicy
			  return requestCachePolicy (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setRequestCachePolicy lib FoundationLibName  selector "setRequestCachePolicy:" (id as ptr, value as AppleURLRequest.NSURLRequestCachePolicy)
			  setRequestCachePolicy id, value
			End Set
		#tag EndSetter
		RequestCachePolicy As AppleURLRequest.NSURLRequestCachePolicy
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function sessionSendsLaunchEvents lib FoundationLibName  selector "sessionSendsLaunchEvents" (id as ptr) as Boolean
			  return sessionSendsLaunchEvents (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setSessionSendsLaunchEvents lib FoundationLibName  selector "setSessionSendsLaunchEvents:" (id as ptr, value as Boolean)
			  setSessionSendsLaunchEvents id, value
			End Set
		#tag EndSetter
		SessionSendsLaunchEvents As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function sharedContainerIdentifier lib FoundationLibName  selector "sharedContainerIdentifier" (id as ptr) as CFStringRef
			  return sharedContainerIdentifier (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setSharedContainerIdentifier lib FoundationLibName  selector "setSharedContainerIdentifier:" (id as ptr, value as CFStringRef)
			  setSharedContainerIdentifier id, value
			End Set
		#tag EndSetter
		SharedContainerIdentifier As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function timeoutIntervalForRequest lib FoundationLibName  selector "timeoutIntervalForRequest" (id as ptr) as Double
			  return timeoutIntervalForRequest (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setTimeoutIntervalForRequest lib FoundationLibName  selector "setTimeoutIntervalForRequest:" (id as ptr, value as Double)
			  setTimeoutIntervalForRequest id, value
			End Set
		#tag EndSetter
		TimeoutIntervalForRequest As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function timeoutIntervalForResource lib FoundationLibName  selector "timeoutIntervalForResource" (id as ptr) as Double
			  return timeoutIntervalForResource (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setTimeoutIntervalForResource lib FoundationLibName  selector "setTimeoutIntervalForResource:" (id as ptr, value as Double)
			  setTimeoutIntervalForResource id, value
			End Set
		#tag EndSetter
		TimeoutIntervalForResource As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function TLSMaximumSupportedProtocol lib FoundationLibName  selector "TLSMaximumSupportedProtocol" (id as ptr) as SSLProtocol
			  return TLSMaximumSupportedProtocol (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setTLSMaximumSupportedProtocol lib FoundationLibName  selector "setTLSMaximumSupportedProtocol:" (id as ptr, value as SSLProtocol)
			  setTLSMaximumSupportedProtocol id, value
			End Set
		#tag EndSetter
		TLSMaximumSupportedProtocol As SSLProtocol
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function TLSMinimumSupportedProtocol lib FoundationLibName  selector "TLSMinimumSupportedProtocol" (id as ptr) as SSLProtocol
			  return TLSMinimumSupportedProtocol (id)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setTLSMinimumSupportedProtocol lib FoundationLibName  selector "setTLSMinimumSupportedProtocol:" (id as ptr, value as SSLProtocol)
			  setTLSMinimumSupportedProtocol id, value
			End Set
		#tag EndSetter
		TLSMinimumSupportedProtocol As SSLProtocol
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function URLCache lib FoundationLibName  selector "URLCache" (id as ptr) as Ptr
			  return AppleURLCache.MakeFromPtr (URLCache(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setURLCache lib FoundationLibName  selector "setURLCache:" (id as ptr, value as ptr)
			  setURLCache id, if (value = nil, nil, value.id)
			End Set
		#tag EndSetter
		URLCache As AppleURLCache
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function URLCredentialStorage lib FoundationLibName  selector "URLCredentialStorage" (id as ptr) as Ptr
			  return AppleURLCredentialStorage.MakeFromPtr (URLCredentialStorage(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setURLCredentialStorage lib FoundationLibName  selector "setURLCredentialStorage:" (id as ptr, value as ptr)
			  setURLCredentialStorage id, if (value = nil, nil, value.Id)
			End Set
		#tag EndSetter
		URLCredentialStorage As AppleURLCredentialStorage
	#tag EndComputedProperty


	#tag Enum, Name = SSLProtocol, Type = Integer, Flags = &h0
		Unknown
		  SSL2
		  SSL3
		  SSL3Only
		  TLS1
		  TLS1Only
		  SSLAll
		  TLS11
		  TLS12
		DTLS1
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowsCellularAccess"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugDescription"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Discretionary"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hash"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPCookieAcceptPolicy"
			Group="Behavior"
			Type="AppleHTTPCookieStorage.NSHTTPCookieAcceptPolicy"
			EditorType="Enum"
			#tag EnumValues
				"0 - Always"
				"1 - Never"
				"2 - OnlyFromMainDocument"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPMaximumConnectionsPerHost"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPShouldSetCookies"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPShouldUsePipelining"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Identifier"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsNIL"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isProxy"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mHasOwnership"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="NetworkServiceType"
			Group="Behavior"
			Type="AppleURLRequest.NSURLRequestNetworkServiceType"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - VoIP"
				"2 - Video"
				"3 - Background"
				"4 - Voice"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequestCachePolicy"
			Group="Behavior"
			Type="AppleURLRequest.NSURLRequestCachePolicy"
			EditorType="Enum"
			#tag EnumValues
				"0 - UseProtocolCachePolicy"
				"1 - ReloadIgnoringLocalCacheData"
				"2 - ReloadIgnoringLocalAndRemoteCacheData"
				"3 - ReturnCacheDataElseLoad"
				"4 - ReturnCacheDataDontLoad"
				"5 - ReloadRevalidatingCacheData"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetainCount"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SessionSendsLaunchEvents"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SharedContainerIdentifier"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeoutIntervalForRequest"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeoutIntervalForResource"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TLSMaximumSupportedProtocol"
			Group="Behavior"
			Type="SSLProtocol"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - SSL2"
				"2 - SSL3"
				"3 - SSL3Only"
				"4 - TLS1"
				"5 - TLS1Only"
				"6 - SSLAll"
				"7 - TLS11"
				"8 - TLS12"
				"9 - DTLS1"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="TLSMinimumSupportedProtocol"
			Group="Behavior"
			Type="SSLProtocol"
			EditorType="Enum"
			#tag EnumValues
				"0 - Unknown"
				"1 - SSL2"
				"2 - SSL3"
				"3 - SSL3Only"
				"4 - TLS1"
				"5 - TLS1Only"
				"6 - SSLAll"
				"7 - TLS11"
				"8 - TLS12"
				"9 - DTLS1"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
