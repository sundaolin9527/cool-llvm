(* 
 * A verbose single-source shortest-path example in plain COOL.
 * The graph has 10 vertices and uses repeated edge relaxation.
 *)

class EdgeList {
    relax_all(solver : ShortestPath) : Object { 0 };
};

class EdgeCons inherits EdgeList {
    from_v : Int;
    to_v : Int;
    weight_v : Int;
    rest_v : EdgeList;

    init(from : Int, to : Int, weight : Int, rest : EdgeList) : EdgeCons {
        {
            from_v <- from;
            to_v <- to;
            weight_v <- weight;
            rest_v <- rest;
            self;
        }
    };

    relax_all(solver : ShortestPath) : Object {
        {
            solver.relax(from_v, to_v, weight_v);
            rest_v.relax_all(solver);
        }
    };
};

class ShortestPath inherits IO {
    inf : Int <- 9999;

    d1 : Int <- 9999;
    d2 : Int <- 9999;
    d3 : Int <- 9999;
    d4 : Int <- 9999;
    d5 : Int <- 9999;
    d6 : Int <- 9999;
    d7 : Int <- 9999;
    d8 : Int <- 9999;
    d9 : Int <- 9999;
    d10 : Int <- 9999;

    init_source() : SELF_TYPE {
        {
            d1 <- 0;
            d2 <- inf;
            d3 <- inf;
            d4 <- inf;
            d5 <- inf;
            d6 <- inf;
            d7 <- inf;
            d8 <- inf;
            d9 <- inf;
            d10 <- inf;
            self;
        }
    };

    build_edges() : EdgeList {
        (new EdgeCons).init(1, 2, 4,
            (new EdgeCons).init(1, 3, 2,
                (new EdgeCons).init(2, 3, 1,
                    (new EdgeCons).init(2, 4, 5,
                        (new EdgeCons).init(2, 5, 12,
                            (new EdgeCons).init(3, 5, 3,
                                (new EdgeCons).init(3, 6, 9,
                                    (new EdgeCons).init(5, 4, 1,
                                        (new EdgeCons).init(5, 6, 4,
                                            (new EdgeCons).init(4, 7, 3,
                                                (new EdgeCons).init(6, 7, 1,
                                                    (new EdgeCons).init(6, 8, 7,
                                                        (new EdgeCons).init(7, 8, 2,
                                                            (new EdgeCons).init(7, 9, 5,
                                                                (new EdgeCons).init(5, 9, 8,
                                                                    (new EdgeCons).init(8, 10, 3,
                                                                        (new EdgeCons).init(9, 10, 1,
                                                                            new EdgeList)))))))))))))))))
    };

    distance_of(node : Int) : Int {
        if node = 1 then d1 else
        if node = 2 then d2 else
        if node = 3 then d3 else
        if node = 4 then d4 else
        if node = 5 then d5 else
        if node = 6 then d6 else
        if node = 7 then d7 else
        if node = 8 then d8 else
        if node = 9 then d9 else
            d10
        fi fi fi fi fi fi fi fi fi
    };

    set_distance(node : Int, value : Int) : Object {
        if node = 1 then d1 <- value else
        if node = 2 then d2 <- value else
        if node = 3 then d3 <- value else
        if node = 4 then d4 <- value else
        if node = 5 then d5 <- value else
        if node = 6 then d6 <- value else
        if node = 7 then d7 <- value else
        if node = 8 then d8 <- value else
        if node = 9 then d9 <- value else
            d10 <- value
        fi fi fi fi fi fi fi fi fi
    };

    print_value(value : Int) : Object {
        if value = inf then
            out_string("INF")
        else
            out_int(value)
        fi
    };

    print_one(node : Int) : Object {
        {
            out_string("d[");
            out_int(node);
            out_string("] = ");
            print_value(distance_of(node));
            out_string("\n");
        }
    };

    print_all_distances() : Object {
        {
            print_one(1);
            print_one(2);
            print_one(3);
            print_one(4);
            print_one(5);
            print_one(6);
            print_one(7);
            print_one(8);
            print_one(9);
            print_one(10);
        }
    };

    relax(from : Int, to : Int, weight : Int) : Object {
        let from_dist : Int <- distance_of(from),
            to_dist : Int <- distance_of(to),
            candidate : Int <- if from_dist < inf then from_dist + weight else inf fi
        in {
            out_string("relax ");
            out_int(from);
            out_string(" -> ");
            out_int(to);
            out_string(" (w=");
            out_int(weight);
            out_string("): old=");
            print_value(to_dist);
            out_string(", candidate=");
            print_value(candidate);
            out_string(", ");
            if candidate < to_dist then {
                out_string("update");
                out_string("\n");
                set_distance(to, candidate);
            } else {
                out_string("keep");
                out_string("\n");
                0;
            }
            fi;
        }
    };

    run_rounds(edges : EdgeList, round : Int, total : Int) : Object {
        if total < round then
            0
        else {
            out_string("round ");
            out_int(round);
            out_string("\n");
            edges.relax_all(self);
            out_string("after round ");
            out_int(round);
            out_string("\n");
            print_all_distances();
            run_rounds(edges, round + 1, total);
        }
        fi
    };

    run() : Object {
        let edges : EdgeList <- build_edges() in {
            out_string("graph: 10 vertices, source = 1\n");
            out_string("initial distances\n");
            print_all_distances();
            run_rounds(edges, 1, 9);
            out_string("final answer\n");
            out_string("shortest(1, 10) = ");
            print_value(distance_of(10));
            out_string("\n");
        }
    };
};

class Main inherits IO {
    main() : Object {
        (new ShortestPath).init_source().run()
    };
};
