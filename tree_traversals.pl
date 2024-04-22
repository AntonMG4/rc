/*
	Trust in the induction.
	
*/

tree_traversals(nil, [], []).
tree_traversals( node(LeftTree, Root, RightTree), [Root|Tail], Inorden):- 
	append(InLeft, [Root|InRight], Inorden), length(InLeft, L), 
	length(PreLeft, L), append(PreLeft, PreRight, Tail),
	tree_traversals(LeftTree, PreLeft, InLeft),
	tree_traversals(RightTree, PreRight, InRight).