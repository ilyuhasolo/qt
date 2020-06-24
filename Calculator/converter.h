#ifndef CONVERTER_H
#define CONVERTER_H

#include <QObject>

class converter : public QObject
{
    Q_OBJECT
public:
    explicit converter(QObject *parent = nullptr);
    Q_INVOKABLE void convertDistance(QString type, QObject *disWindow);
    Q_INVOKABLE void convertTime(QString type, QObject *timeWindow);
    Q_INVOKABLE void convertMass(QString type, QObject *massWindow);
    Q_INVOKABLE void convertEnergy(QString type, QObject *energyWindow);

signals:

public slots:
};

#endif // CONVERTER_H
