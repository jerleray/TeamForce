#tag IOSView
Begin iosView InfoView
   BackButtonTitle =   "Return"
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   False
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "Information"
   Top             =   0
   Begin iostextarea TextArea1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TextArea1, 4, <Parent>, 4, False, +1.00, 2, 1, -72, , True
      AutoLayout      =   TextArea1, 3, <Parent>, 3, False, +1.00, 2, 1, 128, , True
      AutoLayout      =   TextArea1, 2, <Parent>, 2, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   TextArea1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      Editable        =   False
      Height          =   280.0
      KeyboardType    =   "0"
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   ""
      TextAlignment   =   "0"
      TextColor       =   &c00000000
      TextFont        =   ""
      TextSize        =   0
      Top             =   128
      Visible         =   True
      Width           =   320.0
   End
   Begin iOSButton Button1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Button1, 7, , 0, False, +1.00, 1, 1, 79, , True
      AutoLayout      =   Button1, 8, , 0, False, +1.00, 1, 1, 30, , True
      AutoLayout      =   Button1, 9, <Parent>, 9, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   Button1, 4, <Parent>, 4, False, +1.00, 2, 1, -38, , True
      Caption         =   "Fermer"
      Enabled         =   True
      Height          =   30.0
      Left            =   120
      LockedInPosition=   False
      Scope           =   0
      TextColor       =   &c007AFF00
      TextFont        =   "System Bold		"
      TextSize        =   0
      Top             =   412
      Visible         =   True
      Width           =   79.0
   End
   Begin iOSImageView ImageView2
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ImageView2, 9, <Parent>, 9, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   ImageView2, 8, , 0, False, +1.00, 1, 1, 40, , True
      AutoLayout      =   ImageView2, 3, <Parent>, 3, False, +1.00, 1, 1, 65, , True
      AutoLayout      =   ImageView2, 7, , 0, False, +1.00, 1, 1, 142, , True
      ContentMode     =   "0"
      Height          =   40.0
      Image           =   "682461183"
      Image           =   "682461183"
      Left            =   89
      LockedInPosition=   False
      Scope           =   0
      Top             =   65
      Visible         =   True
      Width           =   142.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Close()
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(prompt as text)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  TextArea1.text = prompt
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events TextArea1
	#tag Event
		Sub Open()
		  
		  me.ScrollEnabled = true
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button1
	#tag Event
		Sub Action()
		  self.Dismiss (true)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackButtonTitle"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="NavigationBarVisible"
		Group="Behavior"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIcon"
		Group="Behavior"
		Type="iOSImage"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabTitle"
		Group="Behavior"
		Type="Text"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Group="Behavior"
		Type="Text"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
