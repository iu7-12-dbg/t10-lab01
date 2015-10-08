import QtQuick 2.0
import QtTest 1.0

TestCase {
    name: "math"

    function test_math() {
        var n = 5 + 5;
        compare(100, n);
    }
}
