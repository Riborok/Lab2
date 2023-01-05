Program Lab2Var2;
{Find numbers-palindrome (up to LastNum), that also cause a palindrome when squaring}

{$APPTYPE CONSOLE}
uses
  System.SysUtils;

Const
  LastNum = 1000;
  //LastNum - last number to check

Var
  i, j, Square, len, half : integer;
  flag :boolean;
  {i - cycle counter (current number)
  j - cycle counter (current element)
  Square - square current number
  len - array (string) length
  half - half the length of a number
  flag - the flag will be true if found inconsistencies for a palindrome}

Begin

  //Iterate numbers
  for i:=1 to LastNum do
  begin

    //Find the array (string) length
    len:=length(IntToStr(i));

    //Reset the flag for the current iteration
    flag:=False;

    //If the length is 1, then the number is a palindrome. If greater than 1, then check
    if len > 1 then
    begin

      j:=1;
      half:= len div 2;
      while (j<=half) and (flag=False) do
      begin

        //If some element is not equal, exit the loop
        if (IntToStr(i)[j] <> IntToStr(i)[len - j + 1]) then
          flag:=True;

        //Modernize j
        j:= j+1;
      end;

    end;

    //Ñheck if palindrome calls
    if flag = False then
    begin

      //Find the square current number
      Square:= i*i;

      //Find the array (string) length
      len:=length(IntToStr(Square));

      //If length=1 then the number gives a palindrome
      if len = 1 then
        Writeln('Number-palindrome ', i,' also causes a palindrome when squaring: ', Square)

      //Else looking for numbers that cause a palindrome
      //Split the string in half and compare the elements
      else
      begin

        j:=1;
        half:= len div 2;
        while (j<=half) and (flag=False) do
        begin

          //If some element is not equal, exit the loop
          if (IntToStr(Square)[j] <> IntToStr(Square)[len - j + 1]) then
            flag:= True;

          //Modernize j
          j:= j+1;
        end;

        if flag = False then
          Writeln('Number-palindrome ', i,' also causes a palindrome when squaring: ', Square);

      end;

    end;

  end;

  Readln;
End.
