function Vertex(__id, __data) {
    this.id = function () { return __id; }
    this.data = function () { return __data; }
}

function DirectedWeightedEdge(__from, __to, __weight) {
    this.from = function () { return __from; }
    this.to = function () { return __to; }
    this.weight = function () { return __weight; }
}

function VertexInArrayError(vertex) {
    this.message = "";
}

function EdgeWeightedDigraph() {
    var __vertices = [];
    var __edges = {};

    this.vertices = function () { return __vertices; }
    this.edges = function () { return __edges; }

    this.addVertex = function (vertex) {
        if (__vertices.indexOf(vertex.id) !== -1)
            throw "Vertex is in array";
        __vertices.push(vertex);
        __edges[vertex.id] = [];
    }

    this.addEdge = function (edge) {
        __edges[edge.from()].push(edge);
    }

    this.removeVertex = function (id) {
        var i = 0, len = __vertices.length;
        while (i < len)
            if (__vertices[i].id === id) {
                __vertices.splice(i, 1);
                len = __vertices.length;
            } else
                ++i;
        delete __edges[id];
    }

    this.removeEdge = function (edge) {
        throw "Not implemented";
    }
}
