#tag IOSView
Begin iosView View4
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "TeamForce"
   Top             =   0
   Begin xojo.Core.Timer Timer1
      Left            =   0
      LockedInPosition=   False
      Mode            =   "1"
      PanelIndex      =   -1
      Parent          =   ""
      Period          =   100
      Scope           =   0
      Tolerance       =   0
      Top             =   0
   End
End
#tag EndIOSView

#tag WindowCode
#tag EndWindowCode

#tag Events Timer1
	#tag Event
		Sub Action()
		  // Pour teinter la barre de navigation, ici en blue
		  declare function NSClassFromString      lib "Foundation" (classname as CFStringRef) as ptr
		  declare function keyWindow              lib "UIKit" selector "keyWindow"  (obj_ref as ptr) as ptr
		  declare function sharedApplication      lib "UIKit" selector "sharedApplication"  (obj_ref as ptr) as ptr
		  declare function rootViewController      lib "UIKit" selector "rootViewController"  (obj_ref as ptr) as ptr
		  declare function navigationBar          lib "UIKit" selector "navigationBar"  (obj_ref as ptr) as ptr
		  declare function navigationController lib "UIKit" selector "navigationController" (viewController as ptr) as ptr
		  dim navigationControllerRef as ptr = navigationController(self.ViewControllerHandle) //self is the iOSView
		  dim navigationBarRef as ptr = navigationBar(navigationControllerRef)
		  dim sApp as ptr=sharedApplication(NSClassFromString("UIApplication"))
		  dim currentWindow as ptr=keyWindow(sApp)
		  dim navController as ptr=rootViewController(currentWindow)
		  dim navBar as ptr= navigationBar(navigationControllerRef)
		  Declare Sub setBarTintColor lib UIKit selector "setBarTintColor:" (id as ptr, UIColor as Ptr)
		  setBarTintColor navBar, new UIColor(&c2F9BFA)
		  declare Sub setTintColor lib UIKit selector "setTintColor:" (id as ptr, UIColor as Ptr)
		  setTintColor navBar, new UIColor(&cFFFFFF)
		  declare sub setTranslucent lib UIKit selector "setTranslucent:" (id as ptr)
		  setTranslucent navBar
		  
		  
		  const NSForegroundColorAttributeName = "NSColor"
		  dim dictionaryRef as ptr = NSClassFromString("NSDictionary")
		  declare function dictionaryWithObjectForKey lib Foundationlib selector "dictionaryWithObject:forKey:" (dictRef as ptr, obj as ptr, key as cfstringref) as ptr
		  dim titleDict as ptr = dictionaryWithObjectForKey(dictionaryRef,new UIColor(&cFFFFFF),NSForegroundColorAttributeName)
		  declare sub setTitleTextAttributes lib UIKit selector "setTitleTextAttributes:" (id as ptr, attribute as ptr)
		  setTitleTextAttributes(navigationBarRef,titleDict)
		  
		  
		  
		  
		  
		  
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
