#ifndef OAUTHMANAGER_H
#define OAUTHMANAGER_H

#include <QObject>
#include <QOAuth2AuthorizationCodeFlow>
#include <QDesktopServices>
#include <QDebug>

class OAuthManager : public QObject {
    Q_OBJECT
public:
    explicit OAuthManager(QObject *parent = nullptr);

    // Function to configure OAuth provider
    void setupProvider(const QString &provider);

signals:
    void loginSuccess(const QString &token);
    void loginFailed(const QString &error);

private:
    QOAuth2AuthorizationCodeFlow oauth;

    void configureOAuth(const QString &authUrl,
                        const QString &tokenUrl,
                        const QString &clientId,
                        const QString &clientSecret,
                        const QString &scope,
                        const QString &redirectUri);
};

#endif // OAUTHMANAGER_H
