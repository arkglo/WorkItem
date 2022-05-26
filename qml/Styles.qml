import QtQuick 2.0

//property alias style: style
QtObject {
	id: style
	property int margin: 10
	property int radius: 5
	property int animation: 100
	property int iconSize: 25
	property QtObject text: QtObject {
		property string newline: "<br>"
	}
	property QtObject toolButton: QtObject {
		property int textSize: 14
		property int size: 50
		property int borderWidth: 3
		property color color: "#333333"
		property color colorDown: "black"
		property color colorBorder: "DimGrey"
		property color colorBackground: "SlateGrey"
		property color colorBackgroundDown: "LightSlateGrey"
	}
	property QtObject button: QtObject {
		property int textSize: 10
		property int size: 40
		property int iconSpacing: 5
		property color color: "#333333"
		property color colorDown: "black"
		property color colorBackground: "whitesmoke"
		property color colorBackgroundDown: "LightGrey"
	}
	property QtObject source: QtObject {
		property string background: "CornflowerBlue"
		property color color: "black"
	}
	property QtObject debug: QtObject {
		property color background: "lightgrey"
		property color color: "black"
		property int textSize: 9
	}
}
