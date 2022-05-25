#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDir>
#include <QDebug>
#include <QScreen>
//#include <QWidget>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
	QGuiApplication app(argc, argv);

	qDebug() << "primaryScreen: " << app.primaryScreen()->geometry();
	qDebug() << "screens: " << app.screens();

	QQmlApplicationEngine engine;
	const QUrl url(QStringLiteral("qrc:/main.qml"));
	QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
									 &app, [url](QObject *obj, const QUrl &objUrl) {
		if (!obj && url == objUrl)
			QCoreApplication::exit(-1);
	}, Qt::QueuedConnection);

	engine.load(url);

	QScreen *screen = app.screens().at(0);
	qDebug() << "screen->geometry(): " << screen->geometry();
//	QWidget widget;

//	widget.setGeometry(screen->geometry());

//	QWidget::setGeometry(screen->geometry());

//	QWindowList windows = app.allWindows();
//	qDebug() << "windows: " << app.allWindows();
//	qDebug() << "windows.count: " << windows.count();
//	QWindow *window = windows.at(0);

//	window->setGeometry(app.screens().at(0));

//	QDesktopWidget *desktopWidget = qApp->desktop();
//	setGeometry(QApplication::desktop()->screenGeometry(0));
	return app.exec();
}
