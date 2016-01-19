with Text_IO; use Text_IO;

package body Singleton is

   -----------
   -- Print --
   -----------

   procedure Print is
   begin
      Put_Line (SType'Image(S));
   end Print;

   procedure SayYourName (Times : Positive) is
   begin
      for I in 1..Times loop
         --Put_Line(SType'Class);
         null;
      end loop;
   end SayYourName;

end Singleton;
