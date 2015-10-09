TEMPLATE = app

QMAKE_CXXFLAGS += -std=c++11

TARGET = dijkstra

QT += qml quick widgets core svg

SOURCES += main.cpp \
    customtypesregistrar.cpp \
    FileOperator.cpp \
    launcher.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    customtypesregistrar.h \
    FileOperator.h \
    launcher.h

DISTFILES += \
    graph.json
