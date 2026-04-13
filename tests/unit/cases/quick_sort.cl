class IntList inherits IO {
    isNil() : Bool { true };

    head() : Int { { abort(); 0; } };

    tail() : IntList { { abort(); self; } };

    cons(value : Int) : IntList {
        (new IntCons).init(value, self)
    };

    append(other : IntList) : IntList { other };

    filter_lt(pivot : Int) : IntList { self };

    filter_eq(pivot : Int) : IntList { self };

    filter_gt(pivot : Int) : IntList { self };

    qsort() : IntList { self };

    print_inline() : Object { out_string("\n") };
};

class IntCons inherits IntList {
    xcar : Int;
    xcdr : IntList;

    isNil() : Bool { false };

    init(hd : Int, tl : IntList) : IntCons {
        {
            xcar <- hd;
            xcdr <- tl;
            self;
        }
    };

    head() : Int { xcar };

    tail() : IntList { xcdr };

    append(other : IntList) : IntList {
        (new IntCons).init(xcar, xcdr.append(other))
    };

    filter_lt(pivot : Int) : IntList {
        if xcar < pivot then
            (new IntCons).init(xcar, xcdr.filter_lt(pivot))
        else
            xcdr.filter_lt(pivot)
        fi
    };

    filter_eq(pivot : Int) : IntList {
        if xcar = pivot then
            (new IntCons).init(xcar, xcdr.filter_eq(pivot))
        else
            xcdr.filter_eq(pivot)
        fi
    };

    filter_gt(pivot : Int) : IntList {
        if pivot < xcar then
            (new IntCons).init(xcar, xcdr.filter_gt(pivot))
        else
            xcdr.filter_gt(pivot)
        fi
    };

    qsort() : IntList {
        let pivot : Int <- xcar,
            rest : IntList <- xcdr,
            smaller : IntList <- rest.filter_lt(pivot).qsort(),
            equal : IntList <- rest.filter_eq(pivot),
            larger : IntList <- rest.filter_gt(pivot).qsort()
        in
            smaller.append((new IntCons).init(pivot, equal)).append(larger)
    };

    print_inline() : Object {
        {
            out_int(xcar);
            if xcdr.isNil() then
                out_string("\n")
            else {
                out_string(" ");
                xcdr.print_inline();
            }
            fi;
        }
    };
};

class Main inherits IO {
    main() : Object {
        let empty : IntList <- new IntList,
            n6 : IntList <- (new IntCons).init(6, empty),
            n4 : IntList <- (new IntCons).init(4, n6),
            n2 : IntList <- (new IntCons).init(2, n4),
            n3 : IntList <- (new IntCons).init(3, n2),
            n5 : IntList <- (new IntCons).init(5, n3),
            n1 : IntList <- (new IntCons).init(1, n5),
            n9 : IntList <- (new IntCons).init(9, n1),
            n8 : IntList <- (new IntCons).init(8, n9),
            n7 : IntList <- (new IntCons).init(7, n8),
            values : IntList <- (new IntCons).init(10, n7),
            sorted : IntList <- values.qsort()
        in {
            out_string("before: ");
            values.print_inline();
            out_string("after: ");
            sorted.print_inline();
        }
    };
};
