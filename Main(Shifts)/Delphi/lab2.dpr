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
