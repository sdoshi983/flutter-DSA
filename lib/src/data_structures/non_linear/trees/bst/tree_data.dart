class NodePosition {
  double x, y;
  int value;
  NodePosition({this.x, this.y, this.value});
}

class Child {
  NodePosition left, right;
  Child({this.right, this.left});
}

class Tree {
  Map<NodePosition, Child> tree = {};
  NodePosition node6 = NodePosition(x: 0.44, y: 0, value: 6),
      node3 = NodePosition(x: 0.25, y: 0.1, value: 3),
      node10 = NodePosition(x: 0.64, y: 0.1, value: 10),
      node1 = NodePosition(y: 0.2, x: 0.15, value: 1),
      node4 = NodePosition(y: 0.2, x: 0.35, value: 4),
      node7 = NodePosition(y: 0.2, x: 0.54, value: 7),
      node15 = NodePosition(y: 0.2, x: 0.74, value: 15);
  // ignore: non_constant_identifier_names
  void makeTree() {
    tree = {
      node6: Child(left: node3, right: node10),
      node3: Child(left: node1, right: node4),
      node10: Child(left: node7, right: node15),
      node1: null,
      node4: null,
      node7: null,
      node15: null,
    };
    return;
  }
}
