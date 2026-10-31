
#include "FileUtils.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QVariant>

int main(int argc, char *argv[]) {

    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("FluentWinUI3");
    QQuickStyle::setFallbackStyle("Fusion");

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperties({
        /*
        {
            "fileUtils",
            QVariant::fromValue(&fileUtils)
        }
        */
    });

    engine.loadFromModule("BetterNodepad", "Main");

    return app.exec();

};
