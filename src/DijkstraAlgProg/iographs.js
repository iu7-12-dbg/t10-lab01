.import "graphs.js" as Graphs

function loadGraphFromJson(jsonStr) {
    var obj = JSON.parse(jsonStr);
    var graph = new Graphs.EdgeWeightedDigraph();
    var i, len = obj.verticies.length;
    for (i=0; i<len; ++i) {
        var inpVert = obj.verticies[i];
        graph.addVertex(new Graphs.Vertex(inpVert.id, inpVert.data));
    }
    for (i=0;i<len;++i) {
        var vert = graph.vertices()[i];
        var edges = obj.edges[vert.id()];
        var edgesCount = edges.length;
        for (var j = 0; j < edgesCount; ++j) {
            var edge = edges[j];
            graph.addEdge(new Graphs.DirectedWeightedEdge(edge.from, edge.to, edge.weight));
        }
    }
    return graph;
}

