(* 
 * Binary tree order traversal in plain COOL.
 * Given a root node, return its order traversal as an IntList.
 *)

class IntList inherits IO {
    isNil() : Bool { true };

    head() : Int { { abort(); 0; } };

    tail() : IntList { { abort(); self; } };

    cons(value : Int) : IntList {
        (new IntCons).init(value, self)
    };

    append(other : IntList) : IntList { other };

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

class Tree {
    inorder() : IntList { new IntList };

    preorder() : IntList { new IntList };

    postorder() : IntList { new IntList };
};

class EmptyTree inherits Tree {
    inorder() : IntList { new IntList };

    preorder() : IntList { new IntList };

    postorder() : IntList { new IntList };
};

class TreeNode inherits Tree {
    value_v : Int;
    left_v : Tree;
    right_v : Tree;

    init(value : Int, left : Tree, right : Tree) : TreeNode {
        {
            value_v <- value;
            left_v <- left;
            right_v <- right;
            self;
        }
    };

    inorder() : IntList {
        left_v.inorder().append(
            (new IntCons).init(value_v, new IntList).append(
                right_v.inorder()
            )
        )
    };

    preorder() : IntList {
        (new IntCons).init(value_v, new IntList).append(
            left_v.preorder().append(
                right_v.preorder()
            )
        )
    };

    postorder() : IntList {
        left_v.postorder().append(
            right_v.postorder().append(
                (new IntCons).init(value_v, new IntList)
            )
        )
    };
};

class Main inherits IO {
    main() : Object {
        let root : Tree <-
                (new TreeNode).init(4,
                    (new TreeNode).init(2,
                        (new TreeNode).init(1, new EmptyTree, new EmptyTree),
                        (new TreeNode).init(3, new EmptyTree, new EmptyTree)
                    ),
                    (new TreeNode).init(6,
                        (new TreeNode).init(5, new EmptyTree, new EmptyTree),
                        (new TreeNode).init(7, new EmptyTree, new EmptyTree)
                    )
                )
        in {
            out_string("inorder: ");
            root.inorder().print_inline();
            out_string("preorder: ");
            root.preorder().print_inline();
            out_string("postorder: ");
            root.postorder().print_inline();
        }
    };
};
