.import "graphs.js" as Graphs

function loadGraphFromJson(jsonStr) {
    var obj = JSON.parse(jsonStr);
    var graph = new Graphs.EdgeWeightedDigraph();
    var i, len = obj.verticies.length;
    for (i=0; i<len; ++i) {
        var inpVert = obj.verticies[i];
        graph.addVertex(new Graphs.Vertex(inpVert.id, inpVert.data));
    }
    return graph;
}

