#include <QQmlApplicationEngine>
#include <QtGui/QGuiApplication>

int main(int argc, char *argv[]) {
  // QCoreApplication::setAttribute(Qt::AA_UseSoftwareOpenGL);
  QGuiApplication app(argc, argv);
  QQmlApplicationEngine engine;
  const QUrl url(u"qrc:/Main/ui/main.qml"_qs);
  QObject::connect(
      &engine, &QQmlApplicationEngine::objectCreated, &app,
      [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
          QCoreApplication::exit(-1);
      },
      Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
