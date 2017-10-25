#tag IOSView
Begin iosView HomeView
   BackButtonTitle =   ""
   Compatibility   =   ""
   Left            =   0
   NavigationBarVisible=   True
   TabIcon         =   ""
   TabTitle        =   ""
   Title           =   "TeamForce"
   Top             =   0
   Begin iOSTable OutputTable
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   OutputTable, 1, <Parent>, 1, False, +1.00, 1, 1, 501, , True
      AutoLayout      =   OutputTable, 2, <Parent>, 2, False, +1.00, 1, 1, 501, , True
      AutoLayout      =   OutputTable, 3, <Parent>, 3, False, +1.00, 1, 1, 574, , True
      AutoLayout      =   OutputTable, 4, <Parent>, 4, False, +1.00, 2, 1, -58, , True
      EditingEnabled  =   False
      EditingEnabled  =   False
      EstimatedRowHeight=   -1
      Format          =   "1"
      Height          =   136.0
      Left            =   501
      LockedInPosition=   False
      Scope           =   0
      SectionCount    =   0
      Top             =   574
      Visible         =   False
      Width           =   432.0
   End
   Begin iOSProgressWheel ProgressWheel1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   ProgressWheel1, 8, , 0, True, +1.00, 1, 1, 20, , True
      AutoLayout      =   ProgressWheel1, 3, <Parent>, 3, False, +1.00, 1, 1, 617, , True
      AutoLayout      =   ProgressWheel1, 7, , 0, True, +1.00, 1, 1, 20, , True
      AutoLayout      =   ProgressWheel1, 9, <Parent>, 9, False, +1.00, 1, 1, 551, , True
      Height          =   20.0
      Left            =   757
      LockedInPosition=   False
      Scope           =   0
      Shade           =   "0"
      Top             =   617
      Visible         =   False
      Width           =   20.0
   End
   Begin MyIOSButton Btn_demarrer
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   Btn_demarrer, 4, BottomLayoutGuide, 4, False, +1.00, 1, 1, -*kStdControlGapV, , True
      AutoLayout      =   Btn_demarrer, 8, , 0, False, +1.00, 1, 1, 29, , True
      AutoLayout      =   Btn_demarrer, 7, , 0, False, +1.00, 1, 1, 260, , True
      AutoLayout      =   Btn_demarrer, 1, <Parent>, 1, False, +1.00, 1, 1, 501, , True
      Caption         =   ""
      Clique          =   False
      Height          =   29.0
      Left            =   501
      LockedInPosition=   False
      Scope           =   0
      Top             =   731
      Visible         =   True
      Width           =   260.0
   End
   Begin iOSTextArea TextArea1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   TextArea1, 8, , 0, False, +1.00, 1, 1, 65, , True
      AutoLayout      =   TextArea1, 3, <Parent>, 3, False, +1.00, 1, 1, 65, , True
      AutoLayout      =   TextArea1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   TextArea1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      Editable        =   False
      Height          =   65.0
      KeyboardType    =   "0"
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Text            =   "Résultats T1 PEC :"
      TextAlignment   =   "1"
      TextColor       =   &c233D5200
      TextFont        =   "System Bold		"
      TextSize        =   0
      Top             =   65
      Visible         =   True
      Width           =   432.0
      Begin iOSLabel infoupdate
         AccessibilityHint=   ""
         AccessibilityLabel=   ""
         AutoLayout      =   infoupdate, 8, , 0, False, +1.00, 1, 1, 20, , True
         AutoLayout      =   infoupdate, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
         AutoLayout      =   infoupdate, 2, <Parent>, 2, False, +1.00, 2, 1, 0, , True
         AutoLayout      =   infoupdate, 3, TextArea1, 3, False, +1.00, 1, 1, 45, , True
         Enabled         =   True
         Height          =   20.0
         Left            =   0
         LineBreakMode   =   "0"
         LockedInPosition=   False
         PanelIndex      =   0
         Parent          =   "TextArea1"
         Scope           =   0
         Text            =   "..."
         TextAlignment   =   "1"
         TextColor       =   &c1C314100
         TextFont        =   "System Italic		"
         TextSize        =   12
         Top             =   110
         Visible         =   True
         Width           =   432.0
      End
   End
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
   Begin iOSHTMLViewer WebViewer1
      AccessibilityHint=   ""
      AccessibilityLabel=   ""
      AutoLayout      =   WebViewer1, 4, <Parent>, 4, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   WebViewer1, 1, <Parent>, 1, False, +1.00, 1, 1, 0, , True
      AutoLayout      =   WebViewer1, 2, <Parent>, 2, False, +1.00, 2, 1, 0, , True
      AutoLayout      =   WebViewer1, 3, <Parent>, 3, False, +1.00, 1, 1, 130, , True
      Height          =   638.0
      Left            =   0
      LockedInPosition=   False
      Scope           =   0
      Top             =   130
      Visible         =   True
      Width           =   432.0
   End
End
#tag EndIOSView

#tag WindowCode
	#tag Event
		Sub Open()
		  Dim button As iOSToolButton
		  Dim IButton as iOSToolButton
		  
		  // Set up the Navigation Bar
		  ibutton = iOSToolButton.NewPlain(Tool_information)
		  LeftNavigationToolbar.Add(iButton)
		  
		  button = iOSToolButton.NewSystemItem(iOSToolButton.Types.SystemRefresh)
		  
		  RightNavigationToolbar.Add(button)
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ToolbarPressed(button As iOSToolButton)
		  
		  
		  
		  If button.Caption ="info" Then
		  Else
		    Select Case button.Type
		    Case iOSToolButton.Types.SystemRefresh
		      
		      dim r as new Reachability
		      
		      if r.isReachable then
		        OutputTable.RemoveAll
		        ' We instantiate a MyHTTPSocket object
		        http = New MyHTTPSocket
		        ' Saying from which View we do it
		        http.CurrentView = Self
		        ' Then perform an HTTP GET Request
		        http.Send("GET", AddressWS)
		      else
		        dim EMessage as New iOSMessageBox
		        Dim buttons() As Text
		        buttons.Append("Ok")
		        EMessage.Title = "Erreur"
		        EMessage.Message = "Aucune connexion disponible !"+EndOfline+"Les données ne seront pas actualisées."
		        EMessage.Buttons=buttons
		      end
		      
		    Case iOSToolButton.Types.Plain
		      dim v2 as new InfoView ( "")
		      
		      v2.AppleViewController.ModalPresentationStyle = UIKitFramework.UIViewModalPresentationStyle.PopOver
		      self.PushToCover v2
		      
		      
		    End Select
		    
		    
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub loaddata()
		  load_WebPage1()
		  
		  dim db As New iOSSQLiteDatabase
		  db.DatabaseFile = SpecialFolder.Documents.Child("busi3.sqlite")
		  
		  if db.Connect then
		    ///RESULTAT TOTAL GENERAL
		    Dim sqlG As Text = "SELECT RG_FOR, Nbre_de_tickets, T1_PEC, Date_Indicateurs, Date_Update, Time_Update FROM Stats_T1 WHERE TYPE_STATS ='SYNTH_T1' and RG_FOR  Like 'Total Général' ORDER BY RG_FOR"
		    Dim Stats_T1G As iOSSQLiteRecordSet
		    Try
		      Stats_T1G = db.SQLSelect(sqlG)
		    Catch e As iOSSQLiteException
		    End Try
		    
		    If Stats_T1G <> Nil Then
		      Try
		        While Not Stats_T1G.EOF
		          dim mois as Text
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="01" then
		            mois ="Janvier"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="02" then
		            mois ="Février"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="03" then
		            mois ="Mars"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="04" then
		            mois ="Avril"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="05" then
		            mois ="Mai"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="06" then
		            mois ="Juin"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="07" then
		            mois ="Juillet"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="08" then
		            mois ="Août"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="09" then
		            mois ="Septembre"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="10" then
		            mois ="Octobre"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="11" then
		            mois ="Novembre"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="12" then
		            mois ="Décembre"
		          end if
		          TextArea1.Text="Résultat : "+mois +" "+Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(0,4) +EndOfline
		          TextArea1.Text=TextArea1.Text+"T1 PEC : "+Stats_T1G.Field("T1_PEC").TextValue + " - " + Stats_T1G.Field("Nbre_de_tickets").TextValue + " incidents"
		          infoupdate.Text="Données du "+ Stats_T1G.Field("Date_Update").TextValue.Right(2)+"/"+Stats_T1G.Field("Date_Update").TextValue.Mid(4,2)+"/"+Stats_T1G.Field("Date_Update").TextValue.Mid(0,4)
		          infoupdate.Text=infoupdate.Text+" à " +Stats_T1G.Field("Time_Update").TextValue
		           Stats_T1G.MoveNext
		        Wend
		      Catch e As iOSSQLiteException
		        Break
		      End Try
		    End if
		    //////////////////////////////////////////////////
		    
		    ///RESULTAT PAR FILE D'ATTENTE
		    OutputTable.RemoveAll
		    OutputTable.AddSection("")
		    Dim sql As Text = "SELECT RG_FOR, Nbre_de_tickets, T1_PEC, Date_Indicateurs, Date_Update, Time_Update FROM Stats_T1 WHERE TYPE_STATS ='SYNTH_T1' and RG_FOR not Like 'Total Général' ORDER BY RG_FOR"
		    Dim Stats_T1 As iOSSQLiteRecordSet
		    Try
		      Stats_T1 = db.SQLSelect(sql)
		    Catch e As iOSSQLiteException
		    End Try
		    'Stats_T1.recordcount
		    If Stats_T1 <> Nil Then
		      Dim cellData As iOSTableCellData = OutputTable.CreateCell
		      Try
		        While Not Stats_T1.EOF
		          Dim s As Integer = OutputTable.AddSection(Stats_T1.Field("RG_FOR").TextValue)
		          'cellData = New iOSTableCellData
		          cellData.Text = Stats_T1.Field("T1_PEC").TextValue + " - " + Stats_T1.Field("Nbre_de_tickets").TextValue + " incidents"
		          OutputTable.AddRow(s, cellData)
		          Stats_T1.MoveNext
		        Wend
		      Catch e As iOSSQLiteException
		        Break
		      End Try
		      //////////////////////////////////////////////////
		    End If
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub load_WebPage1()
		  //CREATION DE LA PAGE WEB VIA LES CONSTANTES
		  Dim G1 As FolderItem
		  Dim htmlcode as Text
		  Dim output As TextOutputStream
		  
		  htmlcode=App.page1TopHeader
		  htmlcode=htmlcode+App.Page1Body
		  htmlcode=htmlcode+App.page1Bottom
		  
		  
		  
		  // RECUPERATION DES DONNEES VA LA BASE SQLITE
		  dim db As New IOSSQLiteDatabase
		  db.DatabaseFile = SpecialFolder.Documents.Child("busi3.sqlite")
		  
		  if db.Connect then
		    ///RESULTAT TOTAL GENERAL
		    Dim sqlG As Text = "SELECT RG_FOR, Nbre_de_tickets, T1_PEC, Date_Indicateurs, Date_Update, Time_Update FROM Stats_T1 WHERE TYPE_STATS ='SYNTH_T1' and RG_FOR  Like 'Total Général' ORDER BY RG_FOR"
		    Dim Stats_T1G As IOSSQLiteRecordSet
		    Try
		      Stats_T1G = db.SQLSelect(sqlG)
		    Catch e As IOSSQLiteException
		    End Try
		    
		    If Stats_T1G <> Nil Then
		      Try
		        While Not Stats_T1G.EOF
		          dim mois as Text
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="01" then
		            mois ="Janvier"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="02" then
		            mois ="Février"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="03" then
		            mois ="Mars"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="04" then
		            mois ="Avril"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="05" then
		            mois ="Mai"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="06" then
		            mois ="Juin"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="07" then
		            mois ="Juillet"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="08" then
		            mois ="Août"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="09" then
		            mois ="Septembre"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="10" then
		            mois ="Octobre"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="11" then
		            mois ="Novembre"
		          end if
		          if Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(4,2) ="12" then
		            mois ="Décembre"
		          end if
		          TextArea1.Text="Résultat : "+mois +" "+Stats_T1G.Field("Date_Indicateurs").TextValue.Mid(0,4) +EndOfline
		          TextArea1.Text=TextArea1.Text+"T1 PEC : "+Stats_T1G.Field("T1_PEC").TextValue + " - " + Stats_T1G.Field("Nbre_de_tickets").TextValue + " incidents"
		          infoupdate.Text="Données du "+ Stats_T1G.Field("Date_Update").TextValue.Right(2)+"/"+Stats_T1G.Field("Date_Update").TextValue.Mid(4,2)+"/"+Stats_T1G.Field("Date_Update").TextValue.Mid(0,4)
		          infoupdate.Text=infoupdate.Text+" à " +Stats_T1G.Field("Time_Update").TextValue
		           Stats_T1G.MoveNext
		        Wend
		      Catch e As IOSSQLiteException
		        Break
		      End Try
		    End if
		    //////////////////////////////////////////////////
		    
		    ///RESULTAT PAR FILE D'ATTENTE
		    OutputTable.RemoveAll
		    OutputTable.AddSection("")
		    Dim sql As Text = "SELECT RG_FOR, Nbre_de_tickets, T1_PEC, Date_Indicateurs, Date_Update, Time_Update FROM Stats_T1 WHERE TYPE_STATS ='SYNTH_T1' and RG_FOR not Like 'Total Général' ORDER BY Nbre_de_tickets DESC"
		    Dim Stats_T1 As IOSSQLiteRecordSet
		    Try
		      Stats_T1 = db.SQLSelect(sql)
		    Catch e As IOSSQLiteException
		    End Try
		    'Stats_T1.recordcount
		    dim i As Integer
		    If Stats_T1 <> Nil Then
		      i=1
		      'Dim cellData As iOSTableCellData
		      Try
		        While Not Stats_T1.EOF
		          'Dim s As Integer = OutputTable.AddSection(Stats_T1.Field("RG_FOR").TextValue)
		          'cellData = New iOSTableCellData
		          'cellData.Text = Stats_T1.Field("T1_PEC").TextValue + " - " + Stats_T1.Field("Nbre_de_tickets").TextValue + " incidents"
		          'OutputTable.AddRow(s, cellData)
		          
		          htmlcode=htmlcode.ReplaceAll("@@RG"+i.ToText+"_NAME@@",Stats_T1.Field("RG_FOR").TextValue)
		          htmlcode=htmlcode.ReplaceAll("@@RG"+i.ToText+"_T1TIME@@",Stats_T1.Field("T1_PEC").TextValue.Replace(":","h"))
		          htmlcode=htmlcode.ReplaceAll("@@RG"+i.ToText+"_T1NBRE@@",Stats_T1.Field("Nbre_de_tickets").TextValue)
		          
		          Stats_T1.MoveNext
		          i=i+1
		        Wend
		      Catch e As IOSSQLiteException
		        Break
		      End Try
		      //////////////////////////////////////////////////
		    End If
		    
		  end if
		  
		  
		  
		  //ECRITURE EN FICHIER TEXTE DE LA PAGE WEB
		  G1 = SpecialFolder.Documents.Child("page1.html")
		  output = TextOutputStream.Create(G1, TextEncoding.UTF8)
		  output.Write(htmlcode)
		  output.Close
		  
		  
		  // CHARGEMENT DE LA PAGE WEB LOCALE
		  Dim f As FolderItem
		  f = SpecialFolder.Documents.Child("page1.html")
		  
		  WebViewer1.LoadURL(f.URLPath)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		http As MyHTTPSocket
	#tag EndProperty


#tag EndWindowCode

#tag Events Btn_demarrer
	#tag Event
		Sub Open()
		  me.Caption="Mise à jour des données"
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointerUp(pos As Xojo.Core.Point, eventInfo As iOSEventInfo)
		  dim r as new Reachability
		  if r.isReachable then
		    ProgressWheel1.Visible=True
		    OutputTable.RemoveAll
		    ' We instantiate a MyHTTPSocket object
		    http = New MyHTTPSocket
		    
		    ' Saying from which View we do it
		    http.CurrentView = Self
		    
		    ' Then perform an HTTP GET Request
		    http.Send("GET", AddressWS)
		    
		    me.Clique=False
		    me.Invalidate
		    
		  else
		    me.Clique=False
		    me.Invalidate
		    ProgressWheel1.Visible=false
		    
		    dim EMessage as New iOSMessageBox
		    EMessage.Title = "Erreur"
		    EMessage.Message = "Aucune connexion disponible !"
		    EMessage.Show // Not modal, so code does not pause here
		  end
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub PointerDown(pos As Xojo.Core.Point, eventInfo As iOSEventInfo)
		  me.Clique=true
		  me.Invalidate
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextArea1
	#tag Event
		Sub Open()
		  Dim myfont As New iOSFont("TamilSangamMN",18)
		  me.TextFont=myfont
		  
		End Sub
	#tag EndEvent
#tag EndEvents
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
		  
		  // Pour teinter le titre en blanc
		  const NSForegroundColorAttributeName = "NSColor"
		  dim dictionaryRef as ptr = NSClassFromString("NSDictionary")
		  declare function dictionaryWithObjectForKey lib Foundationlib selector "dictionaryWithObject:forKey:" (dictRef as ptr, obj as ptr, key as cfstringref) as ptr
		  dim titleDict as ptr = dictionaryWithObjectForKey(dictionaryRef,new UIColor(&cFFFFFF),NSForegroundColorAttributeName)
		  declare sub setTitleTextAttributes lib UIKit selector "setTitleTextAttributes:" (id as ptr, attribute as ptr)
		  setTitleTextAttributes(navigationBarRef,titleDict)
		  
		  
		  // Récupération des données externe
		  dim r as new Reachability
		  if r.isReachable then
		    OutputTable.RemoveAll
		    ' We instantiate a MyHTTPSocket object
		    http = New MyHTTPSocket
		    ' Saying from which View we do it
		    http.CurrentView = Self
		    ' Then perform an HTTP GET Request
		    http.Send("GET", AddressWS)
		  else// si pas de réseau affiche une alerte
		    dim EMessage as New iOSMessageBox
		    Dim buttons() As Text
		    buttons.Append("Ok")
		    EMessage.Title = "Erreur"
		    EMessage.Message = "Aucune connexion disponible !"+EndOfline+"Les données ne seront pas actualisées."
		    EMessage.Buttons=buttons
		    EMessage.Show // Not modal, so code does not pause here
		    //Charge les données déja présente dans la base
		    'loaddata()
		    load_WebPage1()
		  end
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WebViewer1
	#tag Event
		Sub Open()
		  'Dim f As FolderItem
		  'f = SpecialFolder.Documents.Child("page1.html")
		  
		  'WebViewer1.LoadURL(f.URLPath)
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
