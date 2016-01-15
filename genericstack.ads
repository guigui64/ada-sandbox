generic

   type Elt is private;

package GenericStack is

   procedure Put (E : in Elt);
   function Pop return Elt;

end GenericStack;
