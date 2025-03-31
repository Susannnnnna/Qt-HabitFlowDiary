#include "OAuthManager.h"

OAuthManager::OAuthManager(QObject *parent) : QObject(parent) {
    // After successful login emit signal with token
    connect(&oauth, &QOAuth2AuthorizationCodeFlow::granted, this, [this]() {
        emit loginSuccess(oauth.token());
    });

    // Error handler
    connect(&oauth, &QOAuth2AuthorizationCodeFlow::error, this, [this](const QString &error) {
        emit loginFailed(error);
    });

    connect(&oauth, &QOAuth2AuthorizationCodeFlow::authorizeWithBrowser, &QDesktopServices::openUrl);
}

void OAuthManager::setupProvider(const QString &provider) {
    if (provider == "google") {
        configureOAuth("https://accounts.google.com/o/oauth2/auth",
                       "https://oauth2.googleapis.com/token",
                       "<GOOGLE_CLIENT_ID>",
                       "GOOGLE_SECRET>",
                       "email profile",
                       "https://localhost:8080");
    } else if (provider == "github") {
        configureOAuth("https://github.com/login/oauth/authorize",
                       "https://github.com/login/access_token",
                       "<GITHUB_CLIENT_ID",
                       "<GITHUB_SECRET>",
                       "read:user user.email",
                       "https://localhost:8080");
    } else if (provider == "facebook") {
        configureOAuth("https://www.facebook.com/v12.0/dialog/oauth",
                       "https://graph.facebook.com/v12.0/oauth/access_token",
                       "<FACEBOOK_CLIENT_ID>",
                       "<FACEBOOK_SECRET>",
                       "email public_profile",
                       "https://www.facebook.com/connect/login_success.html");
    } else {
        qWarning() << "[" << typeid(*this).name() << "::" << __FUNCTION__ << "] Unknown provider OAuth: " << provider;
    }
}

void OAuthManager::configureOAuth(const QString &authUrl, const QString &tokenUrl, const QString &clientId, const QString &clientSecret, const QString &scope, const QString &redirectUri) {
    oauth.setAuthorizationUrl(QUrl(authUrl));
    oauth.setAccessTokenUrl(QUrl(tokenUrl));
    oauth.setClientIdentifier(clientId);
    oauth.setClientIdentifierSharedKey(clientSecret);
    oauth.setScope(scope);
    //oauth.setRedirectUri(redirectUri);

    oauth.grant();
}
