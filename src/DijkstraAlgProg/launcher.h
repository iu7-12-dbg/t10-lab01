#ifndef LAUNCHER_H
#define LAUNCHER_H

#include <QObject>
#include <QProcess>

class Launcher : public QObject
{
    Q_OBJECT
public:
    explicit Launcher(QObject *parent = 0);
    Q_INVOKABLE QString launch(const QString &program);
    Q_INVOKABLE QString launchProgWithInput(const QString &program, const QString &input);


private:
    QProcess *process;
};


#endif // LAUNCHER_H
