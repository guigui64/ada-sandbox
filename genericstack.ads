generic
   Max : Integer;
   type Elt;
package GenericStack is
   procedure Put(E : in Elt);
   function Pop return Elt;
end GenericStack;
