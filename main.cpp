#include <QCoreApplication>
#include <authmanager.h>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    AuthManager auth;

    auth.registering("login", "password");
    auth.authentificate("login", "password");

    return a.exec();
}
