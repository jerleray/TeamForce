#tag Class
Protected Class AppleObject
Implements AppleGeneralObject
	#tag Method, Flags = &h0
		Shared Function Alloc(aClass as Ptr) As ptr
		  declare function alloc lib FoundationLibName  selector "alloc" (id as ptr) as ptr
		  return alloc (aclass)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0, CompatibilityFlags = (TargetIOS)
		Attributes( "deprecated in iOS 9" )  Shared Function AppearanceWhenContainedIn(paramarray classes() as ptr) As AppleObject
		  if ObjectiveCRuntime.class_respondsToSelector (classptr, FoundationFramework.NSSelectorFromString( "appearanceWhenContainedIn:")) then
		    dim mb as MemoryBlock = classes.toNilTerminatedMemoryBlock
		    Declare function appearanceWhenContainedIn lib UIKitLibname selector "appearanceWhenContainedIn:" (id as ptr, classes as ptr) as ptr
		    return new AppleObject(appearanceWhenContainedIn (classptr, mb.Data))
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AutoRelease()
		  mid = AutoRelease(mid)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function AutoRelease(id as ptr) As Ptr
		  declare function autorelease lib FoundationLibName  selector "autorelease" (id as ptr) as ptr
		  return autorelease (id)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CancelPreviousPerformRequests()
		  #if targetmacos
		    Declare Sub cancelPreviousPerformRequestsWithTarget lib FoundationLibName  selector "cancelPreviousPerformRequestsWithTarget:" (id as ptr, target as ptr)
		    
		    cancelPreviousPerformRequestsWithTarget classptr, id
		  #endif
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CGAffineTransformValueForKey(Key as CFStringRef) As CGAffineTransform
		  #if Target64Bit
		    Declare Function ValueForKey lib FoundationLibName  selector "valueForKey:" (id as ptr, KeyPath as CFStringRef) as CGAffineTransform
		    return ValueForKey (id, Key)
		  #elseif Target32Bit
		    Declare Function ValueForKey lib FoundationLibName  selector "valueForKey:" (id as ptr, KeyPath as CFStringRef) as CGAffineTransform32Bit
		    return ValueForKey(id, Key).toCGAffineTransform
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ClassMethodImplementation(aSelector as cfstringref) As Ptr
		  return ClassMethodImplementation (FoundationFramework.NSSelectorFromString(aSelector))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ClassMethodImplementation(aSelector as Ptr) As Ptr
		  declare function methodForSelector lib FoundationLibName  selector "methodForSelector:" (id as Ptr, aselector as Ptr) as Ptr
		  return methodForSelector (class_, aSelector)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConformsToProtocol(aProtocol as AppleProtocol) As Boolean
		  return conformsToProtocol (aProtocol.Id)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConformsToProtocol(aProtocol as Ptr) As Boolean
		  Declare function conformsToProtocol lib FoundationLibName  selector "conformsToProtocol:" (id as ptr, aProtocol as Ptr) as Boolean
		  return conformsToProtocol (id, aProtocol)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mid = CreateInstance (ClassPtr)
		  RetainClassObject
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(AnId as Ptr)
		  mid = anid
		  if not IsNIL then
		    // system.DebugLog "Created "+me.DebugDescription
		  else
		    system.DebugLog "Error creating Object – method returned NIL"
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Copy() As AppleObject
		  return new AppleObject (getCopy(id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function CreateInstance(aClass as Ptr) As ptr
		  declare function new_ lib FoundationLibName  selector "new" (id as ptr) as ptr
		  return new_ (aclass)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DeAlloc()
		  declare sub dealloc lib FoundationLibName  selector "dealloc" (id as ptr)
		  dealloc (mid)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub DeAlloc(id as ptr)
		  declare sub dealloc lib FoundationLibName  selector "dealloc" (id as ptr)
		  dealloc (id)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Destructor()
		  
		  if mHasOwnership then
		    if LibDebug then system.DebugLog "Releasing "+DebugDescription+" AR: "+RetainCount.totext
		    autoRelease
		  else
		    // system.DebugLog "Losing Handle on "+DebugDescription+" AR: "+RetainCount.totext
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(anotherObject as AppleObject) As boolean
		  return Equals (anotherObject.id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Equals(anotherid as ptr) As boolean
		  declare function isEqual lib FoundationLibName  selector "isEqual:" (id as Ptr, anotherId as ptr) as Boolean
		  return isEqual (ID, anotherid)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GeneralID() As Ptr
		  // Part of the AppleGeneralObject interface.
		  
		  return mid
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1, CompatibilityFlags = (TargetIOS)
		Protected Shared Function GetAppearance(classptr as ptr) As Ptr
		  declare function appearance lib UIKitLibname selector "appearance" (id as ptr) as ptr
		  return appearance (classptr)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getAttributes() As Ptr
		  #if targetmacos
		    declare function attributes_ lib FoundationLibName  selector "attributes" (id as ptr) as ptr
		    return attributes_ (id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getCopy(anInstance as Ptr) As Ptr
		  declare function copy lib FoundationLibName  selector "copy" (id as ptr) as ptr
		  return copy (anInstance)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getCount() As UInteger
		  Declare Function count lib FoundationLibName  selector "count" (id as ptr) as UInteger
		  Return count (id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getDelegate() As Ptr
		  Declare Function getDelegate lib FoundationLibName  selector "delegate" (id as ptr) as Ptr
		  dim result as new AppleObject (  getDelegate (id))
		  if not result.IsNIL then
		    result.Retain
		    call AutoRelease result.id
		  end if
		  return result.id
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getFlipped() As boolean
		  #if targetmacos
		    declare function isFlipped lib FoundationLibName  selector "isFlipped" (id as ptr) as Boolean
		    return isFlipped (id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getMutableCopy(anInstance as Ptr) As Ptr
		  declare function mutableCopy lib FoundationLibName  selector "mutableCopy" (id as ptr) as ptr
		  return mutableCopy (anInstance)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getName() As Text
		  Declare function name lib FoundationLibName  selector "name" (id as ptr) as CFStringRef
		  return name (id)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getOpaque() As Boolean
		  #if targetmacos
		    declare function opaque lib FoundationLibName  selector "opaque" (id as ptr) as Boolean
		    return opaque (id)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getSize() As FoundationFramework.NSSize
		  #if Target64Bit
		    Declare function size lib FoundationLibName  selector "size" (id as ptr) as FoundationFramework.NSSize
		    return size (id)
		  #elseif Target32Bit
		    Declare function size lib FoundationLibName  selector "size" (id as ptr) as FoundationFramework.NSSize32Bit
		    return size(id).toNSSize
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSuperObject(id as ptr, instanceclass as ptr) As objc_super
		  dim result as ObjectiveCRuntime.objc_super
		  result.Instance = id
		  result.SuperClass = ObjectiveCRuntime.class_getSuperclass (instanceClass)
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function getTitle() As Text
		  Declare Function title lib FoundationLibName  selector "title" (id as ptr) as CFStringRef
		  Return title (id)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Shared Function Init(anId as ptr) As Ptr
		  declare function init lib FoundationLibName  selector "init" (id as ptr) as ptr
		  return init (anId)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstanceMethodImplementation(aSelector as cfstringref) As Ptr
		  return InstanceMethodImplementation (FoundationFramework.NSSelectorFromString(aSelector))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstanceMethodImplementation(aSelector as Ptr) As Ptr
		  declare function methodForSelector lib FoundationLibName  selector "methodForSelector:" (id as Ptr, aselector as Ptr) as Ptr
		  return methodForSelector (id, aSelector)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsKindOfClass(aClass as Ptr) As Boolean
		  declare function isKindOfClass lib FoundationLibName  selector "isKindOfClass:" (id as Ptr, aClass as Ptr) as Boolean
		  return isKindOfClass (id, aClass)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsMemberOfClass(aClass as Ptr) As Boolean
		  declare function isMemberOfClass lib FoundationLibName  selector "isMemberOfClass:" (id as Ptr, aClass as Ptr) as Boolean
		  return isMemberOfClass (id, aClass)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsSubclassOfClass(aClass as Ptr) As Boolean
		  declare function isSubclassOfClass lib FoundationLibName  selector "isSubclassOfClass:" (id as Ptr, aClass as Ptr) as Boolean
		  return isSubclassOfClass (id, aClass)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MakeFromPtr(aPtr as Ptr) As AppleObject
		  return if (aptr <> NIL, new AppleObject (aptr), NIL)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MethodSignature(aSelector as cfstringref) As AppleMethodSignature
		  return MethodSignature (FoundationFramework.NSSelectorFromString(aSelector))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MethodSignature(aSelector as Ptr) As AppleMethodSignature
		  declare function methodSignatureForSelector lib FoundationLibName  selector "methodSignatureForSelector:" (id as Ptr, aselector as Ptr) as Ptr
		  return  AppleMethodSignature.MakefromPtr ( methodSignatureForSelector (id, aSelector))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MethodSignatureForSelector(aSelector as cfstringref) As AppleMethodSignature
		  return MethodSignatureForSelector (FoundationFramework.NSSelectorFromString(aSelector))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function MethodSignatureForSelector(aSelector as Ptr) As AppleMethodSignature
		  declare function instanceMethodSignatureForSelector lib FoundationLibName  selector "instanceMethodSignatureForSelector:" (id as Ptr, aselector as Ptr) as Ptr
		  return  AppleMethodSignature.MakeFromPtr( instanceMethodSignatureForSelector (classptr, aSelector))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MutableArrayForKey(Key as cfstringref) As AppleMutableArray
		  Declare Function mutableArrayValueForKey lib FoundationLibName  selector "mutableArrayValueForKey:" (id as ptr, key as CFStringRef) as ptr
		  return new AppleMutableArray (mutableArrayValueForKey (id, key))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MutableArrayForKeyPath(KeyPath as cfstringref) As AppleMutableArray
		  Declare Function mutableArrayValueForKeyPath lib FoundationLibName  selector "mutableArrayValueForKeyPath:" (id as ptr, key as CFStringRef) as ptr
		  return new AppleMutableArray (mutableArrayValueForKeyPath (id, KeyPath))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MutableCopy() As AppleObject
		  return new AppleObject (getMutableCopy(id))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PerformSelector(aSelector as cfstringref, anObject as AppleObject = NIL, anotherObject as AppleObject = NIL) As Ptr
		  return PerformSelector (FoundationFramework.NSSelectorFromString(aSelector), anobject, anotherObject)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformSelector(aSelector as cfstringref, delay as double, anObject as AppleObject = Nil)
		  PerformSelector FoundationFramework.NSSelectorFromString (aSelector), delay, anObject
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PerformSelector(aSelector as Ptr, anObject as AppleObject = NIL, anotherObject as AppleObject = NIL) As Ptr
		  Declare function performSelector lib FoundationLibName  selector "performSelector:"(id as ptr, aselector as Ptr) as Ptr
		  Declare function performSelectorwithObject lib FoundationLibName  selector "performSelector:withObject:"(id as ptr, aselector as Ptr, withObject as Ptr) as Ptr
		  Declare function performSelectorwithObjectwithObject lib FoundationLibName  selector "performSelector:withObject:withObject:"(id as ptr, aselector as Ptr, withObject as Ptr, anotherobject as Ptr) as Ptr
		  
		  if anotherObject <> NIL then
		    return performSelectorwithObjectwithObject (id, aSelector, anObject.id, anotherObject.id)
		  elseif anObject <> NIL then
		    return performSelectorwithObject (id, aSelector, anObject.id)
		  else
		    return performSelector (id, aSelector)
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformSelector(aSelector as Ptr, delay as double, anObject as AppleObject = Nil)
		  Declare Sub performSelectorwithObjectafterDelay lib FoundationLibName  selector "performSelector:withObject:afterDelay:" (id as ptr, aselector as Ptr, withObject as Ptr, delay as Double)
		  
		  performSelectorwithObjectafterDelay id, aSelector, if (anObject = nil, nil, anObject.id), delay
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformSelectorInBackground(aSelector as cfstringref, anObject as AppleObject = NIL)
		  
		  performSelectorInBackground FoundationFramework.NSSelectorFromString (aSelector), anObject
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformSelectorInBackground(aSelector as Ptr, anObject as AppleObject = NIL)
		  Declare sub performSelectorInBackground lib FoundationLibName  selector "performSelectorInBackground:withObject:" (id as ptr, aselector as Ptr, withObject as Ptr)
		  
		  performSelectorInBackground id, aSelector, if (anObject = nil, nil, anObject.id)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformSelectorOnMainThread(aSelector as cfstringRef, anObject as AppleObject, waitUntilDone as Boolean = False)
		  performSelectorOnMainThread FoundationFramework.NSSelectorFromString (Aselector), anObject, waitUntilDone
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PerformSelectorOnMainThread(aSelector as Ptr, anObject as AppleObject, waitUntilDone as Boolean = False)
		  Declare sub performSelectorOnMainThread lib FoundationLibName  selector "performSelectorOnMainThread:withObject:waitUntilDone:" _
		  (id as ptr, aselector as Ptr, withObject as Ptr, waituntildone as boolean)
		  
		  performSelectorOnMainThread id, aSelector, if (anObject = nil, nil, anObject.id), waituntildone
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Release()
		  declare Sub release lib FoundationLibName  selector "release" (id as ptr)
		  release (mid)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RespondsToSelector(aSelector as cfstringref) As Boolean
		  return RespondsToSelector (FoundationFramework.NSSelectorFromString(aSelector))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RespondsToSelector(aSelector as ptr) As Boolean
		  return ObjectiveCRuntime.class_respondsToSelector (ClassPtr, aSelector)
		  // Probably faster this way
		  // Declare function respondsToSelector lib FoundationLibName  selector "respondsToSelector:" (id as ptr, aselector as Ptr) as Boolean
		  // return respondsToSelector (id, aSelector)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Retain()
		  declare function retain lib FoundationLibName  selector "retain" (id as ptr) as ptr
		  call retain (mid)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub RetainClassObject()
		  Retain
		  mhasownership = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCGAffineTransformForKey(Key as CFStringRef, value as CGAffineTransform)
		  #if Target64Bit
		    Declare Sub setValueForKey lib FoundationLibName  selector "setValue:forKey:" (id as ptr, KeyPath as CFStringRef, value as CGAffineTransform)
		    setValueForKey (id, Key, value)
		  #elseif Target32Bit
		    Declare Sub setValueForKey lib FoundationLibName  selector "setValue:forKey:" (id as ptr, KeyPath as CFStringRef, value as CGAffineTransform32Bit)
		    setValueForKey(id, Key, value.toCGAffineTransform32Bit)
		  #endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub setDelegate(value as Ptr)
		  Declare Sub setDelegate lib FoundationLibName  selector "setDelegate:" (id as ptr, value as Ptr)
		  setDelegate (id, value)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub setName(Name as cfstringref)
		  Declare Sub setName lib FoundationLibName  selector "setName:" (id as ptr, value as CFStringRef)
		  setName (id, Name)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetNilValueForKey(key as cfstringref)
		  declare sub setNilValueForKey lib FoundationLibName  selector "setNilValueForKey:" (id as Ptr, key as CFStringRef)
		  setNilValueForKey (id, key)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub setOpaque(value as boolean)
		  declare sub setOpaque lib FoundationLibName  selector "setOpaque:" (id as ptr, value as Boolean)
		  setOpaque id, value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub setSize(value as FoundationFramework.NSSize)
		  #if Target64Bit
		    Declare sub setSize lib FoundationLibName  selector "setSize:" (id as ptr, value as FoundationFramework.NSSize)
		    setSize id, value
		  #elseif Target32Bit
		    Declare sub setSize lib FoundationLibName  selector "setSize:" (id as ptr, value as FoundationFramework.NSSize32Bit)
		    setSize id, value.toNSSize32
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub setTitle(Title as cfstringref)
		  Declare Sub setTitle lib FoundationLibName  selector "setTitle:" (id as ptr, value as CFStringRef)
		  settitle (id, title)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValueForKey(Key as CFStringRef, value as AppleGeneralObject)
		  Declare sub setValueForKey lib FoundationLibName  selector "setValue:forKey:" (id as ptr, value as ptr, Key as CFStringRef)
		  setValueForKey (id, value.GeneralID, Key)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValueForKeyPath(KeyPath as CFStringRef, value as AppleGeneralObject)
		  Declare sub setValueForKeyPath lib FoundationLibName  selector "setValue:forKeyPath:" (id as ptr, value as ptr, KeyPath as CFStringRef)
		  setValueForKeyPath (id, value.GeneralID, KeyPath)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SuperClassMethodImplementation(aSelector as CFStringRef) As Ptr
		  return SuperClassMethodImplementation (FoundationFramework.NSSelectorFromString (aSelector))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SuperClassMethodImplementation(aSelector as Ptr) As Ptr
		  #if Target32Bit
		    return ObjectiveCRuntime.class_getMethodImplementation_stret (me.SuperClass, aSelector)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueForKey(Key as CFStringRef) As ptr
		  Declare Function ValueForKey lib FoundationLibName  selector "valueForKey:" (id as ptr, KeyPath as CFStringRef) as ptr
		  return ValueForKey (id, Key)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueForKeyPath(KeyPath as CFStringRef) As Ptr
		  Declare Function ValueForKeyPath lib FoundationLibName  selector "valueForKeyPath:" (id as ptr, KeyPath as CFStringRef) as ptr
		  return ValueForKeyPath (id, KeyPath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueKeyDictionary(Keys as AppleArray) As AppleDictionary
		  Declare Function dictionaryWithValuesForKeys lib FoundationLibName  selector "dictionaryWithValuesForKeys:" (id as ptr, keys as ptr) as ptr
		  return  AppleDictionary.MakeFromPtr (dictionaryWithValuesForKeys (id, keys.id))
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return (ClassPtr <> nil)
			End Get
		#tag EndGetter
		Shared ClassAvailable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ObjectiveCRuntime.class_getName (class_)
			  
			End Get
		#tag EndGetter
		ClassName As CString
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  static mClassPtr as Ptr = FoundationFramework.NSClassFromString ("NSObject")
			  return mClassPtr
			End Get
		#tag EndGetter
		Shared ClassPtr As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ObjectiveCRuntime.object_getClass (id)
			  
			End Get
		#tag EndGetter
		Class_ As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  declare function debugDescription lib FoundationLibName  selector "debugDescription" (id as Ptr) as cfstringref
			  return debugDescription (id)
			  
			End Get
		#tag EndGetter
		DebugDescription As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetmacos
			    declare function getdescription lib FoundationLibName  selector "description" (id as Ptr) as cfstringref
			    return getdescription (ClassPtr)
			  #endif
			End Get
		#tag EndGetter
		Description As Text
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetmacos
			    declare function hash lib FoundationLibName  selector "hash" (id as Ptr) as UInteger
			    return hash (id)
			  #endif
			  
			End Get
		#tag EndGetter
		Hash As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mHasOwnership
			End Get
		#tag EndGetter
		HasOwnership As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mId
			End Get
		#tag EndGetter
		Id As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mid = nil
			End Get
		#tag EndGetter
		IsNIL As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetmacos
			    declare function isProxy lib FoundationLibName  selector "isProxy" (id as Ptr) as Boolean
			    return isProxy (id)
			  #endif
			  
			End Get
		#tag EndGetter
		isProxy As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ObjectiveCRuntime.objc_getMetaClass (ClassName)
			  
			End Get
		#tag EndGetter
		MetaClass As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetmacos
			    return ObjectiveCRuntime.class_getName (MetaClass)
			  #endif
			End Get
		#tag EndGetter
		MetaClassName As CString
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Attributes( hidden ) mHasOwnership As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mId As Ptr
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Declare function retainCount  lib FoundationLibName  selector "retainCount" (id as ptr) as uinteger
			  return retainCount (id)
			  
			End Get
		#tag EndGetter
		RetainCount As UInteger
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ObjectiveCRuntime.class_getSuperclass (class_)
			  
			End Get
		#tag EndGetter
		SuperClass As Ptr
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return ObjectiveCRuntime.class_getName (SuperClass)
			  
			End Get
		#tag EndGetter
		SuperClassName As CString
	#tag EndComputedProperty


	#tag Enum, Name = NSImageAlignment, Type = UInteger, Flags = &h0
		Center
		  Top
		  TopLeft
		  TopRight
		  Left
		  Bottom
		  BottomLeft
		  BottomRight
		Right
	#tag EndEnum

	#tag Enum, Name = NSImageFrameStyle, Type = UInteger, Flags = &h0
		None
		  Photo
		  GrayBezel
		  Groove
		Button
	#tag EndEnum

	#tag Enum, Name = NSImageScaling, Type = UInteger, Flags = &h0
		ProportionallyDown
		  AxesIndependently
		  None
		ProportionallyUpOrDown
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
