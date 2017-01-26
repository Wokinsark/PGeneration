#include "generation.h"

Generation::Generation(QObject *parent) : QObject(parent)
{

}

QString Generation::transformation(const QString &gamma)
{
    return transformation(toQByteArray(gamma)).toBase64();
}

QByteArray Generation::toQByteArray(const QString &binary)
{
    int length = binary.length();
    if(length == 0 || length % 32 != 0){
        return QByteArray();
    }

    QByteArray res;
    for(qint32 i = 0; i < length / 32; i++){
        qint32 value = (binary.mid(i * 32, 32)).toInt(0, 2);
        for(qint32 j = 0; j < 4; j++){
            res.append((char)(value >> (j * 8)));
        }
    }

    return res;
}

QByteArray Generation::toQByteArray(const qint64 &value)
{
    QByteArray res;
    for(qint8 i = 0; i < 8; i++){
        res.append(value >> (i * 8));
    }
    return res;
}

QByteArray Generation::toQByteArray(const QDateTime &value)
{
    return toQByteArray(value.toMSecsSinceEpoch());
}

QByteArray Generation::transformation(const QByteArray &gamma)
{
    if(gamma.length() == 0){
        return QByteArray();
    }

    QByteArray tmp = gamma;
    for(qint64 i = 0; i < 2017; i++){
        tmp.append(toQByteArray(i));
        tmp.append(toQByteArray(QDateTime::currentDateTime()));
        tmp = QCryptographicHash::hash(tmp, QCryptographicHash::Sha512);
    }

    return tmp;
}
