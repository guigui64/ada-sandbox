package body GenericStack is

   ------------
   -- Create --
   ------------

   function Create (E : in Elt) return Stack is
   begin
      return new Node'(Value => E, Next => null);
   end Create;

   ---------
   -- Put --
   ---------

   procedure Put (S : in out Stack; E : in Elt) is
      Previous : Stack;
   begin
      if S = null then
         S := Create (E);
      else
         Previous := S;
         S := Create (E);
         S.Next := Previous;
      end if;
   end Put;

   ---------
   -- Pop --
   ---------

   function Pop (S : in out Stack) return Elt is
      Pop : ELt;
   begin
      if S = null then
         raise Empty_Stack;
      end if;
      Pop := S.Value;
      S := S.Next;
      return Pop;
   end Pop;

end GenericStack;
