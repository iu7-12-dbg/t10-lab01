#include "FileOperator.h"

FileOperator::FileOperator(QObject *parent) : QObject(parent)
{}

QString FileOperator::read(const QString &fileUrl)
{
    QFile file(QUrl(fileUrl).toLocalFile());
    if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
        return QString("");
    QTextStream textStream(&file);
    return textStream.readAll();
}

void FileOperator::write(const QString &fileUrl, const QString &data)
{

}

