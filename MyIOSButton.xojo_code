#tag Class
Protected Class MyIOSButton
Inherits iOSCanvas
	#tag Event
		Sub Paint(g As iOSGraphics)
		  Const kBorder = 2
		  Const kSize As Integer = 6
		  
		  if Clique=False then
		    // Draw selection
		    'g.FillColor=&cFF000000
		    'g.LineColor=&c5da4d7
		    'g.LineWidth=kBorder
		    'g.DrawRoundRect(0,0,g.Width, g.Height,kSize,kSize)
		    g.FillColor = &c5da4d7
		    g.FillRoundRect(0,0,g.Width, g.Height,kSize,kSize)
		    g.TextFont= new iOSFont("HelveticaNeue-Medium", 14)
		    g.FillColor = &cFFFFFF
		    Dim t As Text
		    t = me.Caption
		    g.DrawTextBlock(t, 0, 20, g.Width, g.Height, iOSTextAlignment.Center, False)
		    'g.DrawTextLine(t, 0, 0, -1, iOSTextAlignment.Left, False)
		    
		  else
		    // Draw selection
		    'g.FillColor=&cFF000000
		    'g.LineColor=&c5da4d7
		    'g.LineWidth=kBorder
		    'g.DrawRoundRect(0,0,g.Width, g.Height,kSize,kSize)
		    'g.FillColor = &c6CC0FF00
		    g.FillColor = &cA5A5A500
		    g.FillRoundRect(0,0,g.Width, g.Height,kSize,kSize)
		    g.TextFont= new iOSFont("HelveticaNeue-Medium", 14)
		    g.FillColor = &cFFFFFF
		    Dim t As Text
		    t = me.Caption
		    g.DrawTextBlock(t, 0, 20, g.Width, g.Height, iOSTextAlignment.Center, False)
		    'g.DrawTextLine(t, 0, 0, -1, iOSTextAlignment.Left, False)
		  end if
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		Caption As Text
	#tag EndProperty

	#tag Property, Flags = &h0
		Clique As Boolean = false
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
			Name="Caption"
			Group="Behavior"
			Type="Text"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Clique"
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
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
