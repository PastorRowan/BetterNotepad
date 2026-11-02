
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QDebug>
#include <QVariant>

int main(int argc, char *argv[]) {

    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("FluentWinUI3");
    QQuickStyle::setFallbackStyle("Fusion");

    qDebug() << "Qt Quick Controls style:" << QQuickStyle::name();

    QQmlApplicationEngine engine;

    engine.loadFromModule("BetterNotepad", "Main");

    return app.exec();

};
