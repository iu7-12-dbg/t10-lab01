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
    
    function test_constructor_EdgeWeightedDigraphCreation_EmptyGraph() {
        var vertices = [], edges = {};

        var graph = new Graphs.EdgeWeightedDigraph();

        compare(graph.vertices(), vertices, "graph.vertices() = []");
        compare(graph.edges(), edges, "graph.edges() = {]");
    }

}

