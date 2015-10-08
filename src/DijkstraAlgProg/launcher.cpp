#include "launcher.h"

Launcher::Launcher(QObject *parent) :
    QObject(parent), process(new QProcess(this))
{}

QString Launcher::launch(const QString &program)
{
    process->start(program);
    process->waitForFinished(-1);
    auto bytes = process->readAllStandardOutput();
    auto output = QString::fromLocal8Bit(bytes);
    return output;
}

QString Launcher::launchProgWithInput(const QString &program, const QString &input)
{
    process->startDetached(program, QStringList() << input);
    process->waitForFinished(-1);
    auto bytes = process->readAllStandardOutput();
    auto output = QString::fromLocal8Bit(bytes);
    return output;
}

