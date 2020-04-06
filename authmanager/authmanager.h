#ifndef AUTHMANAGER_H
#define AUTHMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class AuthManager : public QObject
{
    Q_OBJECT
public:

    explicit AuthManager(QObject *parent = nullptr);

    void authentificate(const QString &login,
                        const QString &password);

    void registering(const QString &login,
                   const QString &password);

private:
    QNetworkAccessManager _net;

signals:
    void registerRequestCompleted(QString errorText);
    void authentificateRequestCompleted(QString errorText, QString token);

public slots:
};

#endif // AUTHMANAGER_H
