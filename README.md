# Lab №2. Numbers
---
### Task:
![The task](https://i.imgur.com/mTCiIg1.png)

#### Language: Delphi

## There are 2 variants: using shifts and string

---
### (Main)
### Algorithm scheme using shifts: 

![Algorithm scheme using shifts Part1](https://i.imgur.com/wRVtxM7.png)

![Algorithm scheme using shifts Part2](https://i.imgur.com/Kjk4nQ4.png)

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

![Algorithm scheme using string Part1](https://i.imgur.com/gw87mnK.png)

![Algorithm scheme using string Part2](https://i.imgur.com/6iciuMm.png)

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

    //Сheck if palindrome calls
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
```