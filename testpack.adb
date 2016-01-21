package TestPack is
   type My_Type is new Integer;
   procedure EmptyProc(MT : My_Type);
end TestPack;

package body TestPack is
   procedure EmptyProc(MT : MyType) is
   begin
      Mt := 1;
   end EmptyProc;
end TestPack;
