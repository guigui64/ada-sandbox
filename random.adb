with Text_IO; use Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Random is

   package Random is

      procedure Init(Seed : in Integer);
      function Next return Integer;

   end Random;

   package body Random is

      Xn : Integer;

      procedure Init(Seed : in Integer) is
      begin
         Xn := 2 * Seed + 1;
      end Init;

      function Next return Integer is
      begin
         Xn := (Xn * 5**5) mod 2**13;
         return Xn;
      end Next;

   end Random;

   use Random;

   Seed : Integer;
   C : Character;

begin

   Put("Enter a seed : ");
   Get(Seed);
   Init(Seed);
   loop
      Put("Enter n for the next random value and anything else to quit : ");
      Get(C);
      exit when C /= 'n';
      Put(Next);
      New_Line;
   end loop;

end Random;
