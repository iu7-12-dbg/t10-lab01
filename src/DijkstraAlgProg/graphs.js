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
        if (__vertices.indexOf(vertex) !== -1)
            throw "Vertex is in array";
        __vertices.push(vertex);
        __edges[vertex.id] = [];
    }

    this.addEdge = function (edge) {
        __edges[edge.from()].push(edge);
    }
/*
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

    var map = new Map();
*/
}

function keyOfMin(dict) {
    var minVal = Number.POSITIVE_INFINITY;
    var minKey = -1;
    for (var key in dict) {
        var curVal = dict[key];
        if (curVal < minVal) {
            minVal = curVal;
            minKey = key;
        }
    }
    return minKey;
}

function dijkstra(vertexId, graph) {
    var vertexSet = {}, countOfVertexInSet = 0,
        graphVertices = graph.vertices(),
        vertCount = graph.vertices().length,
        dist = {}, prev = {};
    for (var id in graphVertices) {
        dist[id] = Number.POSITIVE_INFINITY;
        prev[id] = undefined;
        vertexSet[id] = graphVertices[id];
        ++countOfVertexInSet;
    }
    dist[vertexId] = 0;
    while (countOfVertexInSet > 0) {
        var idVertWithMinDist = vertexSet[keyOfMin(dist)].id();

        delete vertexSet[idVertWithMinDist];
        --countOfVertexInSet;

        var neighborEdges = graph.edges()[idVertWithMinDist];
        for (var i=0; i<neighborEdges.length; ++i) {
            var edge = neighborEdges[i];
            var alt = dist[idVertWithMinDist] + edge.weight();
            var toVertId = edge.to();
            if (alt < dist[toVertId]) {
                dist[toVertId] = alt;
                prev[toVertId] = idVertWithMinDist;
            }
        }
    }
    return dist;
}
