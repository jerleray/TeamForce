#tag Class
Protected Class AppleURLSession
Inherits AppleObject
	#tag Method, Flags = &h0
		Function AddDataTask(URL as AppleURL) As AppleURLSessionTask
		  Declare Function dataTaskWithURL lib FoundationLibName  selector "dataTaskWithURL:" (id as ptr, url as ptr) as ptr
		  Return AppleURLSessionTask.MakefromPtr (dataTaskWithURL(id, url.Id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddDataTask(URL as AppleURL, completionHandler as ptr) As AppleURLSessionTask
		  Declare Function dataTaskWithURLCompletion lib FoundationLibName  selector "dataTaskWithURL:completionHandler:" (id as ptr, url as ptr, completionHandler as ptr) as ptr
		  Return AppleURLSessionTask.MakefromPtr (dataTaskWithURLCompletion(id, url.Id, completionHandler))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddDataTask(Request as AppleURLRequest) As AppleURLSessionTask
		  Declare Function dataTaskWithRequest lib FoundationLibName  selector "dataTaskWithRequest:" (id as ptr, request as ptr) as ptr
		  Return AppleURLSessionTask.MakefromPtr (dataTaskWithRequest(id, Request.Id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddDataTask(Request as AppleURLRequest, completionHandler as ptr) As AppleURLSessionTask
		  Declare Function dataTaskWithRequestCompletion lib FoundationLibName  selector "dataTaskWithRequest:completionHandler:" (id as ptr, request as ptr, completionHandler as ptr) as ptr
		  Return AppleURLSessionTask.MakefromPtr (dataTaskWithRequestCompletion(id, Request.Id, completionHandler))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddDownloadTask(ResumeData as Appledata) As AppleURLSessionDownloadTask
		  Declare Function downloadTaskWithResumeData lib FoundationLibName  selector "downloadTaskWithResumeData:" (id as ptr, url as ptr) as ptr
		  Return AppleURLSessionDownloadTask.MakefromPtr (downloadTaskWithResumeData(id, ResumeData.Id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddDownloadTask(ResumeData as Appledata, completionHandler as ptr) As AppleURLSessionDownloadTask
		  Declare Function downloadTaskWithResumeDataCompletion lib FoundationLibName  selector "downloadTaskWithResumeData:completionHandler:" (id as ptr, url as ptr, completionHandler as ptr) as ptr
		  Return AppleURLSessionDownloadTask.MakefromPtr (downloadTaskWithResumeDataCompletion(id, ResumeData.Id, completionHandler))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddDownloadTask(URL as AppleURL) As AppleURLSessionDownloadTask
		  Declare Function downloadTaskWithURL lib FoundationLibName  selector "downloadTaskWithURL:" (id as ptr, url as ptr) as ptr
		  Return AppleURLSessionDownloadTask.MakefromPtr (downloadTaskWithURL(id, url.Id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddDownloadTask(URL as AppleURL, completionHandler as ptr) As AppleURLSessionDownloadTask
		  Declare Function downloadTaskWithURLCompletion lib FoundationLibName  selector "downloadTaskWithURL:completionHandler:" (id as ptr, url as ptr, completionHandler as ptr) as ptr
		  Return AppleURLSessionDownloadTask.MakefromPtr (downloadTaskWithURLCompletion(id, url.Id, completionHandler))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddDownloadTask(Request as AppleURLRequest) As AppleURLSessionDownloadTask
		  Declare Function downloadTaskWithRequest lib FoundationLibName  selector "downloadTaskWithRequest:" (id as ptr, url as ptr) as ptr
		  Return AppleURLSessionDownloadTask.MakefromPtr (downloadTaskWithRequest(id, Request.Id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddDownloadTask(Request as AppleURLRequest, completionHandler as ptr) As AppleURLSessionDownloadTask
		  Declare Function downloadTaskWithRequestCompletion lib FoundationLibName  selector "downloadTaskWithRequest:completionHandler:" (id as ptr, url as ptr, completionHandler as ptr) as ptr
		  Return AppleURLSessionDownloadTask.MakefromPtr (downloadTaskWithRequestCompletion(id, Request.Id, completionHandler))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddUploadTask(Request as AppleURLRequest) As AppleURLSessionTask
		  Declare Function uploadTaskWithStreamedRequest lib FoundationLibName  selector "uploadTaskWithStreamedRequest:" _
		  (id as ptr, Request as ptr) as ptr
		  Return AppleURLSessionTask.MakefromPtr (uploadTaskWithStreamedRequest(id, Request.Id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddUploadTask(Request as AppleURLRequest, data as AppleData) As AppleURLSessionTask
		  Declare Function uploadTaskWithRequest lib FoundationLibName  selector "uploadTaskWithRequest:fromData:" _
		  (id as ptr, Request as ptr, data as ptr) as ptr
		  Return AppleURLSessionTask.MakefromPtr (uploadTaskWithRequest(id, Request.Id, data.id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddUploadTask(Request as AppleURLRequest, data as AppleData, completionHandler as ptr) As AppleURLSessionTask
		  Declare Function uploadTaskWithRequestCompletion lib FoundationLibName  selector "uploadTaskWithRequest:fromData:completionHandler:" _
		  (id as ptr, Request as ptr, data as ptr, completionHandler as ptr) as ptr
		  Return AppleURLSessionTask.MakefromPtr (uploadTaskWithRequestCompletion(id, Request.Id, data.id, completionHandler))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddUploadTask(Request as AppleURLRequest, file as AppleURL) As AppleURLSessionTask
		  Declare Function uploadTaskWithRequestFile lib FoundationLibName  selector "uploadTaskWithRequest:fromFile:" _
		  (id as ptr, Request as ptr, file as ptr) as ptr
		  Return AppleURLSessionTask.MakefromPtr (uploadTaskWithRequestFile(id, Request.Id, file.id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AddUploadTask(Request as AppleURLRequest, file as AppleURL, completionHandler as ptr) As AppleURLSessionTask
		  Declare Function uploadTaskWithRequestFileCompletion lib FoundationLibName  selector "uploadTaskWithRequest:fromFile:completionHandler:" _
		  (id as ptr, Request as ptr, file as ptr, completionHandler as ptr) as ptr
		  Return AppleURLSessionTask.MakefromPtr (uploadTaskWithRequestFileCompletion(id, Request.Id, file.id, completionHandler))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub constructor()
		  Declare Function sharedSession lib FoundationLibName  selector "sharedSession" (id as ptr) as ptr
		  
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Super.Constructor (sharedSession(ClassPtr))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub constructor(Configuration as AppleURLSessionConfiguration)
		  Declare Function sessionWithConfiguration lib FoundationLibName  selector "sessionWithConfiguration:" (id as ptr, configuration as ptr) as ptr
		  
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Super.Constructor (sessionWithConfiguration(ClassPtr, Configuration.id))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub constructor(Configuration as AppleURLSessionConfiguration, Sessiondelegate as AppleURLSessionDelegate, delegatequeue as AppleOperationQueue)
		  Declare Function sessionWithConfigurationDelegate lib FoundationLibName  selector "sessionWithConfiguration:delegate:delegateQueue:" _
		  (id as ptr, configuration as ptr, Sessiondelegate as ptr, DelegateQueue as Ptr) as ptr
		  
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From AppleObject
		  // Constructor(AnId as Ptr) -- From AppleObject
		  Super.Constructor (sessionWithConfigurationDelegate(ClassPtr, Configuration.id, Sessiondelegate.Id, delegatequeue.id))
		  RetainClassObject
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FinishTasksAndInvalidate()
		  Declare sub finishTasksAndInvalidate lib FoundationLibName  selector "finishTasksAndInvalidate" (id as ptr)
		  finishTasksAndInvalidate id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Flush()
		  Declare sub flushWithCompletionHandler lib FoundationLibName  selector "flushWithCompletionHandler:" (id as ptr, completionHandler as ptr)
		  dim flushblock as new iOSBlock (AddressOf FlushCompletionBlock)
		  flushWithCompletionHandler id, flushblock.Handle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FlushCompletionBlock()
		  if self <> NIL then RaiseEvent FlushCompleted
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetTasks()
		  Declare sub getTasksWithCompletionHandler lib FoundationLibName  selector "getTasksWithCompletionHandler:" (id as ptr, completionHandler as ptr)
		  dim TaskBlock as new iOSBlock (AddressOf GetTasksBlock)
		  getTasksWithCompletionHandler id, TaskBlock.Handle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub GetTasksBlock(DataTasks as AppleArray, uploadtasks as applearray, DownloadTasks as AppleArray)
		  // You should do something with the received values in your own implementation here
		  // and remove the pragmas for the properrties yuo use
		  
		  #Pragma Unused DataTasks
		  #Pragma Unused uploadtasks
		  #Pragma Unused DownloadTasks
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiondataTaskdidBecomeDownloadTask(task as ptr, downloadtask as ptr)
		  RaiseEvent DataTaskdidBecomeDownloadTask (new AppleURLSessionTask(task),new AppleURLSessionDownloadTask(downloadtask))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiondataTaskdidReceiveData(task as ptr, data as ptr)
		  RaiseEvent DataTaskdidReceiveData (new AppleURLSessionTask(task), new appledata(data))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiondataTaskdidReceiveResponse(task as ptr, response as ptr, completion as ptr)
		  RaiseEvent DataTaskdidReceiveResponse _
		  (new AppleURLSessionTask(task),new AppleHTTPURLResponse(response),  appleobject.MakeFromPtr (completion))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiondataTaskwillCacheResponse(task as ptr, response as ptr, completion as ptr)
		  RaiseEvent DataTaskwillCacheResponse _
		  (new AppleURLSessionTask(task),new AppleHTTPURLResponse(response),  appleobject.MakeFromPtr (completion))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiondidBecomeInvalidWithError(Error as Ptr)
		  RaiseEvent SessiondidBecomeInvalidWithError (new AppleError(error))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessionDidFinishEventsForBackgroundURLSession()
		  RaiseEvent SessionDidFinishEventsForBackgroundURLSession
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informOnURLSessiondidReceiveChallengecompletionHandler(challenge as ptr)
		  RaiseEvent SessiondidReceiveChallenge (new AppleURLAuthenticationChallenge(challenge))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiondownloadTaskdidFinishDownloadingToURL(task as ptr, location as ptr)
		  RaiseEvent downloadTaskdidFinishDownload (new AppleURLSessionTask(task),new AppleURL(location))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiondownloadTaskdidResumeAtOffsetexpectedTotalBytes(task as ptr, Offset as int64, bytes as int64)
		  RaiseEvent downloadTaskdidResume (new AppleURLSessionTask(task),offset, bytes)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informOnURLSessiondownloadTaskdidWriteDatatotalBytesWrittentotalBytesExpectedToWrite(task as ptr, DataWritten as int64, TotalBytesWritten as int64, TotalBytesExpectedToWrite As Int64)
		  RaiseEvent DownloadTaskdidWriteData (new AppleURLSessionTask(task), DataWritten, TotalBytesWritten, TotalBytesExpectedToWrite)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informOnURLSessiontaskdidCompleteWithError(task as ptr, error as ptr)
		  RaiseEvent TaskdidCompleteWithError (new AppleURLSessionTask(task), new AppleError(error))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiontaskdidReceiveChallenge(task as ptr, challenge as ptr, completion as ptr)
		  RaiseEvent TaskdidReceiveChallenge (new AppleURLSessionTask(task), new AppleURLAuthenticationChallenge(challenge), appleobject.makefromptr(completion))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiontaskdidSendBodyDatatotalBytesSenttotalBytesExpectedToSend(task as ptr, BytesSent as Int64, TotalBytesSent as Int64, TotalExpectedBytesToSend as Int64)
		  RaiseEvent taskdidSendBodyData (new AppleURLSessionTask(task), bytesSent, TotalBytesSent, TotalExpectedBytesToSend)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiontaskneedNewBodyStream(task as ptr, Bodystream as ptr)
		  RaiseEvent taskneedNewBodyStream (new AppleURLSessionTask(task),appleobject.makefromptr(bodystream))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Attributes( hidden )  Sub informonURLSessiontaskwillPerformHTTPRedirectionnewRequest(task as ptr, response as ptr, request as ptr, completion as ptr)
		  RaiseEvent taskwillPerformHTTPRedirection _
		  (new AppleURLSessionTask(task),new AppleHTTPURLResponse(response), new AppleURLRequest(request), appleobject.MakeFromPtr (completion))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InvalidateAndCancel()
		  Declare sub invalidateAndCancel lib FoundationLibName  selector "invalidateAndCancel" (id as ptr)
		  invalidateAndCancel id
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  Declare sub resetWithCompletionHandler lib FoundationLibName  selector "resetWithCompletionHandler:" (id as ptr, completionHandler as ptr)
		  dim flushblock as new iOSBlock (AddressOf ResetCompletionBlock)
		  resetWithCompletionHandler id, flushblock.Handle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetCompletionBlock()
		  if self <> NIL then RaiseEvent ResetCompleted
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DataTaskdidBecomeDownloadTask(task as appleurlsessiontask, downloadtask as AppleURLSessiondownloadtask)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DataTaskdidReceiveData(task as appleurlsessiontask, data as AppleData)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DataTaskdidReceiveResponse(task as appleurlsessiontask, response as appleHTTPURLResponse, completion as appleobject)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DataTaskwillCacheResponse(task as appleurlsessiontask, response as appleHTTPURLResponse,completion as appleobject)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadTaskdidFinishDownload(task as appleurlsessiontask, atLocation as AppleURL)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadTaskdidResume(task as appleurlsessiontask, didResumeAtOffset as Int64, ExpectedTotalBytes as Int64)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadTaskdidWriteData(task as appleurlsessiontask, DataWritten as int64, TotalBytesWritten as int64, TotalBytesExpectedToWrite As Int64)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event FlushCompleted()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ResetCompleted()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SessiondidBecomeInvalidWithError(Error as AppleError)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SessionDidFinishEventsForBackgroundURLSession()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SessiondidReceiveChallenge(Challenge as AppleURLAuthenticationChallenge)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TaskdidCompleteWithError(Task as AppleURLSessionTask, Error as AppleError)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TaskdidReceiveChallenge(Task as AppleURLSessionTask, Challenge as AppleURLAuthenticationChallenge, completion as AppleObject)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TaskdidSendBodyData(task as appleurlsessiontask, BytesSent as Int64, TotalBytesSent as Int64, TotalExpetcedBytesToSend as Int64)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TaskneedNewBodyStream(task as appleurlsessiontask, bodystream as AppleObject)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TaskwillPerformHTTPRedirection(task as appleurlsessiontask, response as appleHTTPURLResponse, request as AppleURLREquest, completion as appleobject)
	#tag EndHook


	#tag ComputedProperty, Flags = &h1
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("NSURLSession")
			  return mClassPtr
			End Get
		#tag EndGetter
		Protected Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function configuration lib FoundationLibName  selector "configuration" (id as ptr) as ptr
			  return AppleURLSessionConfiguration.MakeFromPtr (configuration (id))
			End Get
		#tag EndGetter
		Configuration As AppleURLSessionConfiguration
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function delegateQueue lib FoundationLibName  selector "delegateQueue" (id as ptr) as ptr
			  return AppleOperationQueue.MakeFromPtr (delegateQueue (id))
			End Get
		#tag EndGetter
		DelegateQueue As AppleOperationQueue
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function delegate_ lib FoundationLibName  selector "delegate" (id as ptr) as Ptr
			  return AppleURLSessionDelegate.MakeFromPtr (delegate_ (id))
			End Get
		#tag EndGetter
		SessionDelegate As AppleURLSessionDelegate
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare Function sessionDescription lib FoundationLibName  selector "sessionDescription" (id as ptr) as CFStringRef
			  return sessionDescription (id)
			End Get
		#tag EndGetter
		SessionDescription As Text
	#tag EndComputedProperty


	#tag Enum, Name = NSURLSessionResponseDisposition, Type = Integer, Flags = &h0
		Cancel
		  Allow
		BecomeDownload
	#tag EndEnum


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
			Name="SessionDescription"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
