class Bazz inherits IO {
   h : Int <- 1;

   printh() : Int { { out_int(h); 0; } };

   doh() : Int { (let i : Int <- h in { h <- h + 1; i; }) };
};

class Foo inherits Bazz {
   doh() : Int { (let i : Int <- h in { h <- h + 2; i; }) };
};

class Razz inherits Foo { };

class Bar inherits Razz { };

class Main inherits IO {
   main() : Object {
      {
         (new Bazz).printh();
         out_string("\n");
         (new Foo).printh();
         out_string("\n");
      }
   };
};





