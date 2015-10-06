import QtQuick 2.3
import QtTest 1.0

import "../../src/DijkstraAlgProg/graphs.js" as Graphs

TestCase {
    name: "GraphsTests"

    function test_constructor_VertexCreation_SuccessfulObjCreaion() {
        var id = 10, data = "string";

        var vertex = new Graphs.Vertex(id, data);

        compare(vertex.id(), id, "vertex.id() = id");
        compare(vertex.data(), data, "vertex.data() = data");
    }

    function test_constructor_DirectedWeightedEdgeCreation_SuccessfulObjCreation() {
        var from = 10, to = 20, weight = 100;

        var edge = new Graphs.DirectedWeightedEdge(from, to, weight);

        compare(edge.from(), from, "edge.from() = from");
        compare(edge.to(), to, "edge.to() = to");
        compare(edge.weight(), weight, "edge.weight() = weight");
    }

    // EdgeWeightedDigraph class methods

    function test_constructor_EdgeWeightedDigraphCreation_EmptyGraph() {
        var vertices = [], edges = {};

        var graph = new Graphs.EdgeWeightedDigraph();

        compare(graph.vertices(), vertices, "graph.vertices() = []");
        compare(graph.edges(), edges, "graph.edges() = {]");
    }

    function test_addVertex_AddingVertices_Success() {
        var vertexA = new Graphs.Vertex(1, 1);
//            vertexB = new Graphs.Vertex(5, 10);

        var digraph = new Graphs.EdgeWeightedDigraph();

        digraph.addVertex(vertexA);
//        digraph.addVertex(vertexB);

        var comp = digraph.vertices().indexOf(vertexA) !== -1 &&
               vertexA.id in digraph.edges();

        compare(comp, true, "digraph contains vertexA");
    }

    function test_addEdge_AddingEdgeWithExistingVertex_Succes() {
        var vertexA = new Graphs.Vertex(1, 1),
            vertexB = new Graphs.Vertex(2, 2);
        var edge = new Graphs.DirectedWeightedEdge(vertexA.id, vertexB.id, 100);
        var digraph = new Graphs.EdgeWeightedDigraph();
        digraph.addVertex(vertexA);
        digraph.addVertex(vertexB);

        digraph.addEdge(edge);

        var index = digraph.edges()[edge.from()].indexOf(edge);
        compare(index !== -1, true, "digraph.edges contain edge");
    }

}

