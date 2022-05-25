#ifndef DIRECTORY_H
#define DIRECTORY_H

#include <QObject>
#include <QString>
#include <qqml.h>

class Directory : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QString absolutePath READ absolutePath WRITE setAbsolutePath NOTIFY absolutePathChanged)
	Q_PROPERTY(QString dirName READ dirName WRITE setDirName NOTIFY dirNameChanged)
	QML_ELEMENT

public:
	explicit Directory(QObject *parent = nullptr);

	QString absolutePath();
	void setAbsolutePath(const QString &absolutePath);

	QString dirName();
	void setDirName(const QString &dirName);

signals:
	void absolutePathChanged();
	void dirNameChanged();

private:
	QString m_absolutePath;
	QString m_dirName;
};

#endif // DIRECTORY_H
