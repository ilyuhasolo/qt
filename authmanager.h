#ifndef AUTHMANAGER_H
#define AUTHMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class AuthManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool isProcessing_l READ isProcessing_l WRITE setIsProcessing_l NOTIFY processingChanged)
    Q_PROPERTY(bool isProcessing_r READ isProcessing_r WRITE setIsProcessing_r NOTIFY processingChanged)

public:

    explicit AuthManager(QObject *parent = nullptr);

    Q_INVOKABLE void authentificate(const QString &login,
                        const QString &password);

    Q_INVOKABLE void registering(const QString &login,
                   const QString &password);
    bool isProcessing_l();
    void setIsProcessing_l(bool value);
    bool isProcessing_r();
    void setIsProcessing_r(bool value);

private:
    QNetworkAccessManager _net;
    bool m_isProcessing_l;
    bool m_isProcessing_r;

signals:
    void registerRequestCompleted(QString errorText);
    void authentificateRequestCompleted(QString errorText, QString token);
    void processingChanged(bool value);

public slots:
};

#endif // AUTHMANAGER_H
