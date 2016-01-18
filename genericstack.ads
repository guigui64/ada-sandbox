generic

   type Elt is private;

package GenericStack is

   type Stack is private;

   procedure Put (S : in out Stack; E : in Elt);
   function Pop (S : in out Stack) return Elt;

   Empty_Stack : exception;

private

   type Node;
   type Stack is access Node;
   type Node is record
      Value : Elt;
      Next  : Stack;
   end record;

end GenericStack;
