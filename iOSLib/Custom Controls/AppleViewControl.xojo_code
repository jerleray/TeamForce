#tag Class
Protected Class AppleViewControl
Inherits iosusercontrol
Implements AppleNSEventReceiver
	#tag Method, Flags = &h0
		Sub ReceivedEvent(Details as AppleArray)
		  // Part of the AppleNSEventReceiver interface.
		  if not Details.IsNIL then
		    if Details.Count > 0 then
		      dim compare as text = Details.TextAtIndex(0)
		      Select case  compare
		      case appleview.WillMoveToSuperview
		        dim newview as AppleView
		        if Details.Count > 1 then newview  = AppleView.MakeFromPtr (Details.PtrAtIndex(1))
		        RaiseEvent WillMoveToSuperview (newview)
		      case AppleView.kWillMoveToWindow
		        dim windowptr as ptr
		        if Details.Count > 1 then WindowPtr = Details.PtrAtIndex(1)
		        RaiseEvent WillMoveToWindow (windowptr)
		      case AppleView.DidAddSubview
		        dim newview as AppleView  = AppleView.MakeFromPtr (Details.PtrAtIndex(1))
		        RaiseEvent DidAddSubview (newview)
		      case AppleView.DidMoveToSuperview
		        RaiseEvent DidMoveToSuperview
		      case AppleView.DidMoveToWindow
		        RaiseEvent DidMoveToWindow
		      case AppleView.WillRemoveSubview
		        dim newview as AppleView  = AppleView.MakeFromPtr (Details.PtrAtIndex(1))
		        RaiseEvent WillRemoveSubview (newview)
		      case AppleView.TouchesBegan
		        raiseEvent TouchesBegan (AppleSet.makefromptr (Details.PtrAtIndex(1)), AppleNSEvent.makefromptr  (Details.PtrAtIndex(2)))
		      case AppleView.TouchesEnded
		        raiseEvent TouchesEnded (AppleSet.makefromptr (Details.PtrAtIndex(1)), AppleNSEvent.makefromptr  (Details.PtrAtIndex(2)))
		      case AppleView.TouchesMoved
		        raiseEvent TouchesMoved (AppleSet.makefromptr (Details.PtrAtIndex(1)), AppleNSEvent.makefromptr  (Details.PtrAtIndex(2)))
		      case AppleView.TouchesCancelled
		        raiseEvent TouchesCancelled (AppleSet.makefromptr (Details.PtrAtIndex(1)), AppleNSEvent.makefromptr  (Details.PtrAtIndex(2)))
		      case AppleView.MotionBegan
		        dim mynumber as AppleNumber = AppleNumber.MakefromPtr(Details.PtrAtIndex(1))
		        dim myType as AppleNSEvent.UIEventSubtype = AppleNSEvent.UIEventSubtype (mynumber.IntegerValue)
		        RaiseEvent MotionBegan (mytype, AppleNSEvent.makefromptr  (Details.PtrAtIndex(2)))
		      case AppleView.MotionEnded
		        dim mynumber as AppleNumber = AppleNumber.MakefromPtr(Details.PtrAtIndex(1))
		        dim myType as AppleNSEvent.UIEventSubtype = AppleNSEvent.UIEventSubtype (mynumber.IntegerValue)
		        RaiseEvent MotionEnded (mytype, AppleNSEvent.makefromptr  (Details.PtrAtIndex(2)))
		      case AppleView.MotionCancelled
		        dim mynumber as AppleNumber = AppleNumber.MakefromPtr(Details.PtrAtIndex(1))
		        dim myType as AppleNSEvent.UIEventSubtype = AppleNSEvent.UIEventSubtype (mynumber.IntegerValue)
		        RaiseEvent MotionCancelled (mytype, AppleNSEvent.makefromptr  (Details.PtrAtIndex(2)))
		        
		      case AppleView.LayoutSubviews
		        raiseevent LayoutSubviews
		      case AppleView.DrawRect
		        dim myvalue as applevalue = AppleValue.MakefromPtr(Details.PtrAtIndex(1))
		        RaiseEvent DrawRect( myvalue.nsrectvalue)
		        
		        
		      else
		        break
		      End Select
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReceivedReturnEvent(Details as AppleArray) As Boolean
		  #pragma unused details
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AnimationFinished(animationCompleted as boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidAddSubview(view as AppleView)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidMoveToSuperview()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DidMoveToWindow()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DrawRect(Rect  as FoundationFramework.NSRect)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LayoutSubviews()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MotionBegan(type as AppleNSEvent.UIEventSubtype, anEvent as AppleNSEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MotionCancelled(type as AppleNSEvent.UIEventSubtype, anEvent as AppleNSEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MotionEnded(type as AppleNSEvent.UIEventSubtype, anEvent as AppleNSEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TouchesBegan(Touchset as AppleSet, anEvent as AppleNSEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TouchesCancelled(Touchset as AppleSet, anEvent as AppleNSEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TouchesEnded(Touchset as AppleSet, anEvent as AppleNSEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TouchesMoved(Touchset as AppleSet, anEvent as AppleNSEvent)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillMoveToSuperview(view as AppleView)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillMoveToWindow(window as ptr)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event WillRemoveSubview(view as AppleView)
	#tag EndHook


	#tag Note, Name = ReadMe
		
		AppleViewControl is the basic class for custom controls implementing the events of a UIView and a property holding the view alive for the livetime of the control itself.
		AppleViewControl uses the AppleNSEventForwarder interface to get the events from the view. 
		
		AppleView itself uses a shared dictionary to connect the view to the weakref of the viewcontroller. As long as the value is valid, the events are forwarded. 
		During view destruction, the dictionary is cleaned from the entry.
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ViewObject
			End Get
		#tag EndGetter
		AppleView As AppleView
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private ViewObject As AppleView
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AccessibilityHint"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AccessibilityLabel"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			Type="Double"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
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
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
