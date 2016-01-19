generic

   type SType is digits <>;
   Value : SType;

package Singleton is

   procedure Print;
   procedure SayYourName (Times : Positive);

private

   S : SType := Value;

end Singleton;
