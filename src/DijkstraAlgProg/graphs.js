var ACCURACY = 1e-5;

function Vertex(__id, __data) {
    this.id = function () { return __id; }
    this.data = function () { return __data; }
}

function DirectedWeightedEdge(__from, __to, __weight) {
    this.from = function () { return __from; }
    this.to = function () { return __to; }
    this.weight = function () { return __weight; }
}

function AppError() {
    this.message = "";
    this.name = "AppError"
    this.toString = function() {
        return this.name + ": " + this.message;
    }
}

function GraphContainsVertexError(vertex) {
    this.message = "Graph contains vertex";
    this.name = "GraphContainsVertexError";
}

GraphContainsVertexError.prototype = new AppError();
GraphContainsVertexError.prototype.constructor = GraphContainsVertexError;

function NoSuchVertexInGraphError(vertex) {
    this.message = "There is no such vertex in graph";
    this.name = "NoSuchVertexInGraphError";
}

NoSuchVertexInGraphError.prototype = new AppError();
NoSuchVertexInGraphError.prototype.constructor = NoSuchVertexInGraphError;

function GraphContainsEdgeError(edge) {
    this.message = "Graph contains edge";
    this.name = "GraphContainsEdgeError";
}

GraphContainsEdgeError.prototype = new AppError();
GraphContainsEdgeError.prototype.constructor = GraphContainsEdgeError;

function EdgeWeightedDigraph() {
    var __vertices = [];
    var __edges = {};

    this.vertices = function () { return __vertices; }
    this.edges = function () { return __edges; }

    this.containsVertex = function (vertex) {
        return this.containsVertexId(vertex.id());
    }

    this.containsVertexId = function (vertexId) {
        var index = false,
            len = __vertices.length;
        for (var i=0; i < len && !index; ++i) {
            var curVertex = __vertices[i];
            if (curVertex.id() === vertexId && vertexId in __edges)
                index = true;
        }
        return index;

    }

    this.containsEdge = function (edge) {
        var contains = false;
        if (this.containsVertexId(edge.from()) && this.containsVertexId(edge.to())) {
            var row = __edges[edge.from()];
            var len = row.length;
            for (var i=0; i<len && !contains; ++i) {
                var curEdge = row[i];
                if (curEdge.to() === edge.to() && Math.abs(curEdge.weight()-edge.weight()) < ACCURACY)
                    contains = true;
            }
        }
        return contains;
    }

    this.addVertex = function (vertex) {
        if (this.containsVertex(vertex))
            throw new GraphContainsVertexError();
        __vertices.push(vertex);
        __edges[vertex.id()] = [];
    }

    this.addEdge = function(edge) {
        if (!(this.containsVertexId(edge.from()) && this.containsVertexId(edge.to())))
            throw new NoSuchVertexInGraphError();
        if (this.containsEdge(edge))
            throw new GraphContainsEdgeError();
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
    var i;
    for (i=0; i<vertCount; ++i) {
        var vert = graphVertices[i];
        var id = vert.id();
        dist[id] = Number.POSITIVE_INFINITY;
        prev[id] = undefined;
        vertexSet[id] = vert;
        ++countOfVertexInSet;
    }
    dist[vertexId] = 0;
    while (countOfVertexInSet > 0) {
        var idVertWithMinDist = keyOfMin(dist);

        delete vertexSet[idVertWithMinDist];
        --countOfVertexInSet;

        var neighborEdges = graph.edges()[idVertWithMinDist];
        for (i=0; i<neighborEdges.length; ++i) {
            var edge = neighborEdges[i];
//            return dist[idVertWithMinDist];
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
