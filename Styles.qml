import QtQuick 2.0

//property alias style: style
QtObject {
	id: style
	property int margin: 10
	property int radius: 5
	property QtObject text: QtObject {
		property string newline: "<br>"
	}
	property QtObject button: QtObject {
		property int textSize: 14
		property int roundSize: 40
		property int borderWidth: 3
		property color color: "#333333"
		property color colorDown: "black"
		property color colorBorder: "DimGrey"
		property color colorBackground: "SlateGrey"
		property color colorBackgroundDown: "LightSlateGrey"
	}
	property QtObject source: QtObject {
		property string background: "CornflowerBlue"
		property color color: "black"
	}
	property QtObject debug: QtObject {
		property color background: "light grey"
		property color color: "black"
		property int textSize: 9
	}
}
