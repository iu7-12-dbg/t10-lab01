#ifndef FILEOPERATOR_H
#define FILEOPERATOR_H

#include <QObject>
#include <QtCore>

class FileOperator : public QObject
{
    Q_OBJECT
public:
    explicit FileOperator(QObject *parent = 0);
    Q_INVOKABLE QString read(const QString &fileUrl);
    Q_INVOKABLE void write(const QString &fileUrl, const QString &data);

signals:

public slots:
};

#endif // FILEOPERATOR_H
