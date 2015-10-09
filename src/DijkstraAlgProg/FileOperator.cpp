#include "FileOperator.h"

FileOperator::FileOperator(QObject *parent) : QObject(parent)
{}

QString FileOperator::read(const QUrl &fileUrl)
{
    QFile file(fileUrl.toLocalFile());
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return QString("");
    QTextStream textStream(&file);
    return textStream.readAll();
}

bool FileOperator::write(const QUrl &fileUrl, const QString &data)
{
    QFile file(fileUrl.toLocalFile());
    auto wrote = false;
    if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        QTextStream stream(&file);
        stream << data << endl;
        wrote = true;
    }
    return wrote;
}

