with GenericStack;
with Text_IO;

procedure Sandbox is

   package IntegerStack is new GenericStack (Elt => Integer);
   use IntegerStack;
   The_Stack : Stack;
   Interm    : Integer;

begin

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

exception

   when others =>
      Text_IO.Put_Line ("Exception !!!");

end Sandbox;
