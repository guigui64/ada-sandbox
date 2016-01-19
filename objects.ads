package Objects is

   type Mother is tagged record
      X : Integer;
   end record;

   type Daughter is new Mother with record
      Y : Integer;
   end record;

end Objects;
