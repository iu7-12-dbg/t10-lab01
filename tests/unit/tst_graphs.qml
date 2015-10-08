import QtQuick 2.3
import QtTest 1.0

import "../../src/DijkstraAlgProg/graphs.js" as Graphs

TestCase {
    name: "GraphsTests"

    function test_constructor_VertexCreation_SuccessfulObjCreaion() {
        var id = 10, data = "string";
        try {
            var vertex = new Graphs.Vertex(id, data);
            throw 10;
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

            var comp = digraph.vertices().indexOf(vertexA) !== -1 &&
                    vertexA.id in digraph.edges();

            compare(comp, true, "digraph contains vertexA");
        } catch(error) {
            fail("\n\t" + error);
        }
    }

    function test_addEdge_AddingEdgeWithExistingVertex_Succes() {
        try {
            var vertexA = new Graphs.Vertex(1, 1),
                    vertexB = new Graphs.Vertex(2, 2);
            var edge = new Graphs.DirectedWeightedEdge(vertexA.id, vertexB.id, 100);
            var digraph = new Graphs.EdgeWeightedDigraph();
            digraph.addVertex(vertexA);
            digraph.addVertex(vertexB);

            digraph.addEdge(edge);

            var index = digraph.edges()[edge.from()].indexOf(edge);
            compare(index !== -1, true, "digraph.edges contain edge");
        } catch(error) {
            fail("\n\t" + error);
        }
    }

    function createTestGraph() {
        var graph = new Graphs.EdgeWeightedDigraph();
        graph.addVertex();
        graph.addVertex();
        graph.addVertex();
        return graph;
    }

    function test_dijkstra_SmallGraphExistingVertex_ArrayOfMinDist() {
        var graph = createTestGraph();
        var idVertex = 1;
        compare(true, true);
    }

}

