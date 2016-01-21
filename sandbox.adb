with Text_IO;
with GenericStack;
with Singleton;
with Objects;

with TestProc;

with Ada.Numerics; use Ada.Numerics;

procedure Sandbox is

   G     : constant := 981;
   TwoPi : constant := 2.0 * Pi;

   type Choice is (C_STACK, C_SINGLETON, C_OBJECTS);
   C : Choice;

   package IntegerStack is new GenericStack (Elt => Integer);
   use IntegerStack;
   The_Stack : Stack;
   Interm    : Integer;

   package FloatSingleton is new Singleton (Float, 3.3);
   package Fs renames FloatSingleton;

   M : Objects.Mother;
   D : Objects.Daughter;

   type NewType is new Objects.AbstractType with record
      I : Integer;
   end record;

   function ToString (N : NewType) return String is
   begin
      return "NewType with I = " & N.I'Img;
   end ToString;

   type Cell;
   type Cell_Ptr is access Cell;
   type Cell is record
      Next  : Cell_Ptr;
      Value : Integer;
   end record;

--     L : Cell_Ptr;

begin

   Text_IO.Put("A");
   Text_IO.Skip_Line(3);
   Text_IO.Put_Line("B");

--     C := C_STACK;
   C := C_SINGLETON;
--     C := C_OBJECTS;

   case C is
      when C_STACK =>

         declare
            Toto : Integer;
         begin
            Toto := Pop (The_Stack);
         exception
            when Empty_Stack =>
               Text_IO.Put_Line ("Empty stack !");
            when others =>
               Text_IO.Put_Line ("Unexpected error !");
         end;
         Put (The_Stack, 6);
         Put (The_Stack, 4);
         Interm := Pop (The_Stack);
         Text_IO.Put_Line (Interm'Img);
         Interm := Pop (The_Stack);
         Text_IO.Put_Line (Interm'Img);
         Interm := Pop (The_Stack);
         Text_IO.Put_Line (Interm'Img);
         Text_IO.Put_Line ("Unreachable ?");

      when C_SINGLETON =>

         Fs.Print;
         Text_IO.New_Line;

      when C_OBJECTS =>

         M   := (X => 8);
         D   := (M with 12);
         M.X := 25;
         Text_IO.Put_Line ("M.X = " & M.X'Img);
         Text_IO.Put_Line ("D.X = " & D.X'Img & " , D.Y = " & D.Y'Img);

   end case;

--     declare
--        I : Integer := 7;
--        J,K : Integer ;
--     begin
--        J := I+K;
--        declare
--           P : Integer := I;
--           I : Integer := 8;
--        begin
--           K := P+I;
--        end;
--        Text_IO.Put(K'Img);
--     end;

--     L.Value := 1;

   declare
      I, J, K : Integer := 0;
      B       : Boolean;
   begin
      B := J /= 0 and then I / J > K;
   end;

exception

   when Empty_Stack =>
      Text_IO.Put_Line ("Empty stack !");

end Sandbox;
