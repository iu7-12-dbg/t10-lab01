#include <QApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "customtypesregistrar.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    CustomTypesRegistrar registrar;
    registrar.registerTypes();

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
