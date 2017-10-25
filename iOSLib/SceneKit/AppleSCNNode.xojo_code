#tag Class
Protected Class AppleSCNNode
Inherits AppleSCNObject
	#tag Method, Flags = &h0
		Sub AddChildNode(Child as AppleSCNNode)
		  Declare sub addChildNode lib SceneKitLib selector "addChildNode:" (id as ptr, child as ptr)
		  addChildNode id, Child.id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChildNode(name as cfstringRef, optional Recursively as Boolean) As AppleSCNNode
		  declare function childNodeWithName lib SceneKitLib selector "childNodeWithName:recursively:" (id as ptr, name as CFStringRef, recursively As Boolean) as ptr
		  return AppleSCNNode.MakefromPtr (childNodeWithName(id, name, Recursively))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  Declare function node lib SceneKitLib selector "node" (id as ptr) as ptr
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Super.Constructor (node(classptr))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(Geometry as AppleSCNGeometry)
		  Declare function nodeWithGeometry lib SceneKitLib selector "nodeWithGeometry:" (id as ptr, Geometry as Ptr) as ptr
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Super.Constructor (nodeWithGeometry(classptr, Geometry.id))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MakefromPtr(aPtr as Ptr) As AppleSCNNode
		  return if (aptr = nil, nil, new AppleSCNNode (aPtr))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function camera lib SceneKitLib selector "camera" (id as ptr) as ptr
			  return AppleSCNCamera.MakeFromPtr (camera(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setCamera lib SceneKitLib selector "setCamera:" (id as ptr, value as Ptr)
			  setCamera id, if (value = nil, nil, value.id)
			End Set
		#tag EndSetter
		Camera As AppleSCNCamera
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("SCNNode")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function constraints lib SceneKitLib selector "constraints" (id as ptr) as ptr
			  return AppleArray.MakeFromPtr (constraints(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setConstraints lib SceneKitLib selector "setConstraints:" (id as ptr, value as ptr)
			  setConstraints id, if (value = nil, nil, value.id)
			End Set
		#tag EndSetter
		Constraints As AppleArray
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    Declare function eulerAngles lib SceneKitLib selector "eulerAngles" (id as ptr) as SCNVector3
			    return eulerAngles (id)
			  #elseif Target32Bit
			    Declare function eulerAngles lib SceneKitLib selector "eulerAngles" (id as ptr) as SCNVector3_32Bit
			    return eulerAngles (id).tovector3
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    Declare sub setEulerAngles lib SceneKitLib selector "setEulerAngles:" (id as ptr, value as SCNVector3)
			    setEulerAngles (id, value)
			  #elseif Target32Bit
			    Declare sub setEulerAngles lib SceneKitLib selector "setEulerAngles:" (id as ptr, value as SCNVector3_32Bit)
			    setEulerAngles (id, value.toVector3_32)
			  #endif
			  
			End Set
		#tag EndSetter
		EulerAngles As SCNVector3
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function light lib SceneKitLib selector "light" (id as ptr) as ptr
			  return AppleSCNLight.MakeFromPtr (light(id))
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Declare Sub setLight lib SceneKitLib selector "setLight:" (id as ptr, value as Ptr)
			  setLight id, if (value = nil, nil, value.id)
			End Set
		#tag EndSetter
		Light As AppleSCNLight
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return getName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  setName value
			End Set
		#tag EndSetter
		Name As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if Target64Bit
			    Declare function position lib SceneKitLib selector "position" (id as ptr) as SCNVector3
			    return position (id)
			  #elseif Target32Bit
			    Declare function position lib SceneKitLib selector "position" (id as ptr) as SCNVector3_32Bit
			    return position (id).tovector3
			  #endif
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #if Target64Bit
			    Declare sub setPosition lib SceneKitLib selector "setPosition:" (id as ptr, value as SCNVector3)
			    setposition (id, value)
			  #elseif Target32Bit
			    Declare sub setPosition lib SceneKitLib selector "setPosition:" (id as ptr, value as SCNVector3_32Bit)
			    setposition (id, value.toVector3_32)
			  #endif
			  
			End Set
		#tag EndSetter
		Position As SCNVector3
	#tag EndComputedProperty


	#tag ViewBehavior
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
			Name="RetainCount"
			Group="Behavior"
			Type="UInteger"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
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
