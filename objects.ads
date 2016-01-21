package Objects is

   type Mother is tagged record
      X : Integer;
   end record;

   type Daughter is new Mother with record
      Y : Integer;
   end record;

   type AbstractType is abstract tagged null record;
   function ToString (A : in AbstractType) return String is abstract;

end Objects;
