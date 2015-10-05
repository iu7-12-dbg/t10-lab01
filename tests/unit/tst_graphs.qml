import QtQuick 2.3
import QtTest 1.0

import "../../src/DijkstraAlgProg/graphs.js" as Graphs

TestCase {
    name: "GraphsTests"

    function test_constructor_VertexCreation_Success() {
        var id = 10, data = "string";
        var vertex = new Graphs.Vertex(id, data);

        compare(vertex.id(), id, "vertex.id() = id");
        compare(vertex.data(), data, "vertex.data() = data");
    }

}

