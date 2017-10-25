#tag Class
Protected Class MyHTTPSocket
Inherits xojo.net.HTTPSocket
	#tag Event
		Function AuthenticationRequired(Realm as Text, ByRef Name as Text, ByRef Password as Text) As Boolean
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Error(err as RuntimeException)
		  
		  Dim buffer As Text = err.Reason
		  
		  ' Here we display the error reason in a convenient place
		  Select Case currentView
		  Case IsA HomeView
		    HomeView(currentView).ProgressWheel1.Visible=false
		    
		    dim EMessage as New iOSMessageBox
		    EMessage.Title = "Erreur"
		    EMessage.Message = buffer
		    EMessage.Show // Not modal, so code does not pause here
		    
		    
		  End Select
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub FileReceived(URL as Text, HTTPStatus as Integer, File as xojo.IO.FolderItem)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub HeadersReceived(URL as Text, HTTPStatus as Integer)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub PageReceived(URL as Text, HTTPStatus as Integer, Content as xojo.Core.MemoryBlock)
		  ' We convert the returned content (MemoryBlock) to a Text
		  Dim buffer As Text = TextEncoding.UTF8.ConvertDataToText(Content)
		  
		  Select Case currentView
		  Case IsA HomeView
		    ' We just set the buffer to the View1.taResponseArea TextArea
		    
		    Try
		      Dim dictionaries() As Auto
		      dictionaries = Xojo.Data.ParseJSON(decodeBase64(buffer))
		      dim db As New IOSSQLiteDatabase
		      db.DatabaseFile = SpecialFolder.Documents.Child("busi3.sqlite")
		      
		      if db.Connect then
		        Dim sql As Text
		        sql = "DELETE FROM Stats_T1"
		        ' Pass in values after sql instead of doing string replacement
		        Try
		          DB.SQLExecute(sql) ' Previously connected database
		        Catch e As IOSSQLiteException
		          Dim err As Text = e.Reason
		        End Try
		        
		        //Now loop through the array
		        Dim dict As Xojo.Core.Dictionary
		        For Each d As Xojo.Core.Dictionary In dictionaries
		          
		          sql = "INSERT INTO Stats_T1 (TYPE_STATS,RG_FOR, Nbre_de_tickets, T1_PEC,Date_Indicateurs,Date_Update,Time_Update) VALUES (?1, ?2, ?3, ?4, ?5, ?6,?7)"
		          ' Pass in values after sql instead of doing string replacement
		          Try
		            ' ID is created automatically because it is a primary key
		            db.SQLExecute(sql, d.Value("TYPE_STATS"), d.Value("RG_FOR"),d.Value("Nbre_de_tickets"),d.Value("T1_PEC"),d.Value("Date_Indicateurs"),d.Value("Date_Update"),d.Value("Time_Update"))
		            
		            
		          Catch e As IOSSQLiteException
		            Dim err As Text = e.Reason
		          End Try
		          
		        Next
		        
		        'HomeView(currentView).loaddata()
		        HomeView(currentView).load_WebPage1()
		        
		      else
		        HomeView(currentView).ProgressWheel1.Visible=False
		        dim EMessage as New iOSMessageBox
		        EMessage.Title = "Erreur"
		        EMessage.Message = "La base de données n'est pas accessible !"
		        EMessage.Show // Not modal, so code does not pause here
		        
		      End
		      
		      HomeView(currentView).ProgressWheel1.Visible=False
		      
		      
		      
		    End Try
		    
		    
		  End Select
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ReceiveProgress(BytesReceived as Int64, TotalBytes as Int64, NewData as xojo.Core.MemoryBlock)
		  Select Case currentView
		  Case IsA HomeView
		    ' We just set the buffer to the View1.taResponseArea TextArea
		  end Select
		End Sub
	#tag EndEvent

	#tag Event
		Sub SendProgress(BytesSent as Int64, BytesLeft as Int64)
		  Select Case currentView
		  Case IsA HomeView
		    ' We just set the buffer to the View1.taResponseArea TextArea
		  end Select
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		currentView As iOSView
	#tag EndProperty


	#tag ViewBehavior
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
		#tag ViewProperty
			Name="ValidateCertificates"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
