#ifndef CALCULATOR_H
#define CALCULATOR_H

#include <QObject>

class calculator : public QObject
{
    Q_OBJECT

public:
    explicit calculator(QObject *parent = nullptr);

signals:

public slots:

private slots:
   void digits(QObject *display);
   void operations(QObject *display);
   void math_operations(QObject *display);
   void equal(QObject *window, QObject *display);
};

#endif // CALCULATOR_H
