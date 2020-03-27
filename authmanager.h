#ifndef AUTHMANAGER_H
#define AUTHMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class AuthManager : public QObject
{
    Q_OBJECT
public:
    QString authentificateError;
    QString registerError;
    QString getToken();

    explicit AuthManager(QObject *parent = nullptr);

    void authentificate(const QString &login,
                        const QString &password);

    void registering(const QString &login,
                   const QString &password);

private slots:
    void onRegisterFinished();
    void onAuthentificateFinished();

private:
    QNetworkAccessManager _net;
    QString token;

signals:
    void registerRequestCompleted(QString);
    void authentificateRequestCompleted(QString);

public slots:
};

#endif // AUTHMANAGER_H
