import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Iter "mo:base/Iter";
import Debug "mo:base/Debug";
import Text "mo:base/Text";
import Char "mo:base/Char";
actor {
  public func nat_to_nat8(n : Nat) : async Nat8 {
    if(n < 256){
      return (Nat8.fromNat(n));
    };
    return Nat8.fromNat(1);
  };
  public func max_number_with_n_bits_reverse(n : Nat) : async Nat {
    var m: Nat = n;
    var x: Nat = 0;
    var result : Nat = 0;
    for(x in Iter.range(0, n/2)){
        if(m!=0){
            m/=2;
            result+=1;
        };
        
    };
    return result;
  };
  public func max_number_with_n_bits(n : Nat) : async Nat {
    var result : Nat = 1;
    for(x in Iter.range(1, n)){
        result*=2;
        
    };
    return result-1;
  };
  public func decimal_to_bits(n : Nat) : async Text {
      var resultText : Text = "";
      var m : Nat = n;
      while(m>=1)
      {
          resultText := Nat.toText(m%2)#resultText;
          m/=2;
      };
      return resultText;
  };
  public func capitalize_character(c : Char) : async Char{
    var nat32 : Nat32 = Char.toNat32(c);
    if(nat32>=97 and nat32<=122)
    {
        nat32-=32;
    };
    var result : Char = Char.fromNat32(nat32);
    return result;
  };
  public func capitalize_text(t : Text) : async Text{
      var result : Text = "";
      for(char in t.chars()){
          if(Char.isLowercase(char)){
              var nat32 : Nat32 = Char.toNat32(char);
              nat32-=32;
              var newChar : Char = Char.fromNat32(nat32);
              result := result # Char.toText(newChar);
          }
          else{
              result := result#Char.toText(char);
          };
      };
      return result;
  };
  public func is_inside(t: Text, c:Char) : async Bool{
      for(char in t.chars()){
          if(Char.equal(c,char))
          {
              return true;
          };
      };
      return false;
  };
};
 