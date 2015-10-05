function Vertex(__id, __data) {
    this.id = function () { return __id; }
    this.data = function () { return __data; }
}

function DirectedWeightedEdge(__from, __to, __weight) {
    this.from = function () { return __from; }
    this.to = function () { return __to; }
    this.weight = function () { return __weight; }
}
