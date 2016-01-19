with Text_IO;
with GenericStack;
with Singleton;
with Objects;

procedure Sandbox is

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

begin

--     C := C_STACK;
--     C := C_SINGLETON;
   C := C_OBJECTS;

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
         Text_IO.Put_Line (Interm'IMG);
         Interm := Pop (The_Stack);
         Text_IO.Put_Line (Interm'IMG);
         Interm := Pop (The_Stack);
         Text_IO.Put_Line (Interm'IMG);
         Text_IO.Put_Line ("Unreachable ?");

      when C_SINGLETON =>

         Fs.Print;
         Text_IO.Put_Line ("");

      when C_OBJECTS =>

         M   := (X => 8);
         D   := (M with 12);
         M.X := 25;
         Text_IO.Put_Line ("M.X = " & M.X'IMG);
         Text_IO.Put_Line ("D.X = " & D.X'IMG & " , D.Y = " & D.Y'IMG);

   end case;

exception

   when others =>
      Text_IO.Put_Line ("Exception !!!");

end Sandbox;
