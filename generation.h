#ifndef GENERATION_H
#define GENERATION_H

#include <QObject>
#include <QString>
#include <QDateTime>
#include <QByteArray>
#include <QCryptographicHash>

class Generation : public QObject
{
    Q_OBJECT
public:
    explicit Generation(QObject *parent = 0);

public:
    Q_INVOKABLE QString transformation(const QString & gamma);

private:
    QByteArray toQByteArray(const QString & binary);
    QByteArray toQByteArray(const qint64 &value);
    QByteArray toQByteArray(const QDateTime & value);
    QByteArray transformation(const QByteArray & gamma);
};

#endif // GENERATION_H
