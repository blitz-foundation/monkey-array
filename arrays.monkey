Strict

Class Arrays

	Function Copy:Int[](intArray:Int[], length:Int = 0)
		Local newArray:Int[]
		
		if (length = 0) Then
			newArray = intArray.Resize(intArray.Length())
		Else
			newArray = intArray.Resize(length)
		End If

		Return newArray				
	End Function
	
	Function Merge:Int[](intArray1:Int[], intArray2:Int[])
		Local newArray:Int[] = Arrays.Copy(intArray1, intArray1.Length() + intArray2.Length())
		
		Local i:Int = intArray1.Length()
		For Local item:Int = EachIn intArray2
			newArray[i] = item
			i+=1
		Next
		
		Return newArray
	End Function
	
	Function Add:Int[](intArray:Int[], value:Int)
		Local newArray:Int[] = Arrays.Copy(intArray, intArray.Length() + 1)
		
		newArray[intArray.Length()] = value
		Return newArray	
	End Function
	
	Function Insert:Int[](intArray:Int[], index:Int, value:Int)
		if (index = -1) Then
			Return Arrays.Add(intArray, value)
		ElseIf (index = 0)
			Return Arrays.Merge([value], intArray)
		Else
			Local newArray:Int[] = Arrays.Copy(intArray[0..index+1], intArray.Length() + 1)
			newArray[index] = value
			
			Local i:Int = index+1
			For Local item:Int = EachIn intArray[index..]
				newArray[i] = item
				i+=1
			Next
			Return newArray
		End If
	End Function
	
	Function Remove:Int[](intArray:Int[], index:Int)		
		If (index = 0) Then
			Return intArray[index+1..intArray.Length()]
		ElseIf (index = intArray.Length() - 1)
			Return intArray[0..intArray.Length() - 1]
		Else
			Return Arrays.Merge(intArray[..index], intArray[index+1..])
		End If		
	End Function
	
	Function Reverse:Int[](intArray:Int[])
		Local newArray:Int[] = New Int[intArray.Length()]
		
		Local i:Int = 0
		For Local j:Int = intArray.Length()-1 To 0 Step -1
			newArray[i] = intArray[j]
			i+= 1
		Next
		
		Return newArray		
	End Function
	
	Function Swap:Int[](intArray:Int[], index1:Int, index2:Int)
		Local newArray:Int[] = Arrays.Copy(intArray)
		
		newArray[index1] = intArray[index2]
		newArray[index2] = intArray[index1]	
		
		Return newArray
	End Function
	
	Function Fill:Void(intArray:Int[], value:Int)
		For Local i:Int = intArray.Length() - 1 To 0 Step -1
			intArray[i]	= value
		Next	
	End Function
	
	Function Clear:Void(intArray:Int[])
		Arrays.Fill(intArray, 0)	
	End Function
	
	Function Max:Int(intArray:Int[])
		Local max:Int = 0
		
		For Local item:Int = EachIn intArray
			if (max < item) max = item			
		Next
		
		Return max
	End Function
	
	Function Min:Int(intArray:Int[])
		Local min:Int = 0
		
		For Local item:Int = EachIn intArray
			if (min > item) min = item			
		Next
		
		Return min
	End Function	
	
	Function Implode:String(intArray:Int[], separator:String)
		Local result:String = ""
	
		For Local item:String = EachIn intArray
			result+= item + separator		
		Next
		
		Return result[..result.Length()-separator.Length()]
	End Function

End Class