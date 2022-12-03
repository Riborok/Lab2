# Lab №2. Numbers
---
### Task:
![The task](https://i.imgur.com/QulTFXq.png)

#### Language: Delphi

## There are 2 variants: using shifts and string

---
### (Main)
### Algorithm scheme using shifts: 

![Algorithm scheme using shifts Part1](https://i.imgur.com/KR6VeXv.png)

![Algorithm scheme using shifts Part2](https://i.imgur.com/Alf12rm.png)

### Code using shifts:
``` pascal
Program lab2;
{Find numbers-palindrome (up to LastNum), that also cause a palindrome when squaring}

{$APPTYPE CONSOLE}

Const
  LastNum = 1000;
  //LastNum - last number to check

Var
  i, Inverted, Rem, Square : integer;
  {i - cycle counter (current number)
  Inverted - current inverted number
  Rem - the remainder for calculating the inverted number
  Square - square current number}

Begin

  //Iterate numbers
  for i:=1 to LastNum do
  begin

    //Find the remainder to be added to Inverted
    Rem:=i;

    //Initialize the current inverted number
    Inverted:=0;

    //Start inverting. Go until the remainder > 0
    while Rem>0 do
    begin

      //Find inverted number
      Inverted:=Inverted*10 + Rem mod 10;

      //Find the remainder
      Rem:=Rem div 10;
    end;

    //If the number is equal to the inverted square, then this gives a palindrome
    if i=Inverted then
    begin

      //Find the square current number
      Square:=i*i;

      //Find the remainder to be added to Inverted
      Rem:=Square;

      //Initialize the current inverted number
      Inverted:=0;

      //Start inverting. Go until the remainder > 0
      while Rem>0 do
      begin

        //Find inverted number
        Inverted:=Inverted*10 + Rem mod 10;

        //Find the remainder
        Rem:=Rem div 10;
      end;

      //If the square of the number is equal to the inverted square, then this gives a palindrome
      if Square=Inverted then
        Writeln('Number-palindrome ', i,' also causes a palindrome when squaring: ', Square);

    end;
  end;

  Readln;
End.
```
---

### Algorithm scheme using string: 

![Algorithm scheme using string Part1](https://i.imgur.com/krOR2cT.png)

![Algorithm scheme using string Part2](https://i.imgur.com/ziBaQze.png)

![Algorithm scheme using string Part3](https://i.imgur.com/kfSnoCC.png)

### Code using string:
``` pascal
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
  flag, FindPalindrome :boolean;
  {i - cycle counter (current number)
  j - cycle counter (current element)
  Square - square current number
  len - array (string) length
  half - half the length of a number
  flag - the flag will be true if found inconsistencies for a palindrome
  FindPalindrome - true if the number causes a palindrome}

Begin

  //Iterate numbers
  for i:=1 to LastNum do
  begin

    //initialize for the current cycle
    FindPalindrome:= False;

    //Find the array (string) length
    len:=length(IntToStr(i));

    //Reset the flag for the current iteration
    flag:=False;

    //If length=1 then the number gives a palindrome
    if len = 1 then
      FindPalindrome:= True

    //Else looking for numbers that cause a palindrome
    //Split the string in half and compare the elements
    else
    begin
      j:=1;
      half:= len div 2;
      while (j<=half) and (flag=False) do
      begin

        //If some element is not equal, exit the loop
        if (IntToStr(i)[j] <> IntToStr(i)[len - j + 1]) then
          flag:=True

        //If compared all the elements, then found the number that gives the palidrome
        else if j = half then
          FindPalindrome:= True;

        //Modernize j
        j:= j+1;
      end;
    end;

    //Сheck if palindrome calls
    if FindPalindrome then
    begin

      //Find the square current number
      Square:= i*i;

      //Find the array (string) length
      len:=length(IntToStr(Square));

      //Reset the flag for the current iteration
      flag:=False;

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
            flag:=True

          //If compared all the elements, then found the number that gives the palidrome
          else if j = half then
            Writeln('Number-palindrome ', i,' also causes a palindrome when squaring: ', Square);

          //Modernize j
          j:= j+1;
        end;
      end;

    end;

  end;

  Readln;
End.
```