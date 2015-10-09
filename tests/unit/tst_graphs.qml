import QtQuick 2.3
import QtTest 1.0

import "../../src/DijkstraAlgProg/graphs.js" as Graphs

TestCase {
    name: "GraphsTests"

    function test_constructor_VertexCreation_SuccessfulObjCreaion() {
        var id = 10, data = "string";
        try {
            var vertex = new Graphs.Vertex(id, data);
            compare(vertex.id(), id, "vertex.id() = id");
            compare(vertex.data(), data, "vertex.data() = data");
        } catch(error) {
            fail("\n\t" + error);
        }
    }

    function test_constructor_DirectedWeightedEdgeCreation_SuccessfulObjCreation() {
        var from = 10, to = 20, weight = 100;
        try {
            var edge = new Graphs.DirectedWeightedEdge(from, to, weight);
            compare(edge.from(), from, "edge.from() = from");
            compare(edge.to(), to, "edge.to() = to");
            compare(edge.weight(), weight, "edge.weight() = weight");
        } catch(error) {
            fail("\n\t" + error);
        }
    }

    function test_constructor_EdgeWeightedDigraphCreation_EmptyGraph() {
        var vertices = [], edges = {};
        try {
            var graph = new Graphs.EdgeWeightedDigraph();
            compare(graph.vertices(), vertices, "graph.vertices() = []");
            compare(graph.edges(), edges, "graph.edges() = {]");
        } catch(error) {
            fail("\n\t" + error);
        }
    }
    function test_addVertex_AddingVertices_Success() {
        try {
            var vertexA = new Graphs.Vertex(1, 1);

            var digraph = new Graphs.EdgeWeightedDigraph();

            digraph.addVertex(vertexA);
            var copyVertexA = new Graphs.Vertex(1, 1);
            var comp = digraph.containsVertex(copyVertexA);

            compare(comp, true, "added vertexA in digraph");
        } catch(error) {
            fail("\n\t" + error);
        }
    }

    function test_addEdge_AddingEdgeWithExistingVertex_Succes() {
        try {
            var vertexA = new Graphs.Vertex("1", 1),
                    vertexB = new Graphs.Vertex("2", 2);
            var edge = new Graphs.DirectedWeightedEdge(vertexA.id(), vertexB.id(), 100);
            var digraph = new Graphs.EdgeWeightedDigraph();
            digraph.addVertex(vertexA);
            digraph.addVertex(vertexB);

            digraph.addEdge(edge);

            var index = digraph.edges()[edge.from()].indexOf(edge);
            compare(index !== -1, true, "digraph.edges contain edge " + index);
        } catch(error) {
            fail("\n\t" + error);
        }
    }

    function createTestGraph() {
        var graph = new Graphs.EdgeWeightedDigraph();
        var vertA = new Graphs.Vertex(1, 1),
            vertB = new Graphs.Vertex(2, 2),
            vertC = new Graphs.Vertex(3, 3);
        graph.addVertex(vertA);
        graph.addVertex(vertB);
        graph.addVertex(vertC);
        graph.addEdge(new Graphs.DirectedWeightedEdge(vertA.id(), vertB.id(), 5));
        graph.addEdge(new Graphs.DirectedWeightedEdge(vertB.id(), vertC.id(), 6));

        graph.addEdge(new Graphs.DirectedWeightedEdge(vertA.id(), vertC.id(), 7));

//        graph.addVertex();
        return graph;
    }

    function getTestAnswer() {
        var answer = {
            "1": 0,
            "2": 5,
            "3": 7
        };
        return answer;
    }

    function test_dijkstra_SmallGraphExistingVertex_ArrayOfMinDist() {
        try {
            var graph = createTestGraph();
            var answer = getTestAnswer();
            var idVertex = 1;
            var result = Graphs.dijkstra(idVertex, graph);
            compare(JSON.stringify(result), JSON.stringify(answer));
        } catch(error) {
            fail("\n\t" + error);
        }
    }

}

