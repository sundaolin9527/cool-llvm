
(*
 * methodless-primes.cl
 *
 * Designed by Jesse H. Willett, jhw@cory, 11103234, with 
 *             Istvan Siposs, isiposs@cory, 12342921.
 *
 * This program generates primes in order without using any methods.
 * Actually, it does use three methods: those of IO to print out each prime, and
 * abort() to halt the program.  These methods are incidental, however,
 * to the information-processing functionality of the program.  We
 * could regard the attribute 'out's sequential values as our output,
 * and the string "halt" as our terminate signal.
 *
 * Naturally, using Cool this way is a real waste, basically reducing it 
 * to assembly without the benefit of compilation.  
 *
 * There could even be a subroutine-like construction, in that different
 * code could be in the assign fields of attributes of other classes,
 * and it could be executed by calling 'new Sub', but no parameters
 * could be passed to the subroutine, and it could only return itself.
 * but returning itself would be useless since we couldn't call methods
 * and the only operators we have are for Int and Bool, which do nothing
 * interesting when we initialize them!
 *)

class Main inherits IO {
  main() : Object {
    {
      out_string("2 is trivially prime.\n");
      out_string("3 is prime.\n");
      out_string("5 is prime.\n");
      out_string("7 is prime.\n");
      out_string("11 is prime.\n");
      out_string("13 is prime.\n");
      out_string("17 is prime.\n");
      out_string("19 is prime.\n");
      out_string("23 is prime.\n");
      out_string("29 is prime.\n");
    }
  };
};

