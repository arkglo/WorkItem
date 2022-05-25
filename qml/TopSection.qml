import QtQuick 2.0
import QtQuick.Controls

Rectangle {
	id: topArea

	property alias sourceText: source.text

	Connections {
		target: main
		function onUpdateSource(newText) { source.text = newText }
		function onPasteSource() { source.pasteNewText() }
	}

	ScrollView {
		id: viewSource
		anchors.fill: parent

		TextArea {
			id: source
			implicitWidth: parent.width
			implicitHeight: parent.height

			property var pasteNewText: (newText) => {
				paste()
				cursorPosition = 0
			}

			wrapMode: TextEdit.WordWrap
			selectByMouse: true
			//textFormat: TextEdit.AutoText
			onTextChanged: {
				progressBar.value = 0
				dataTimer.restart()
			}

			color: style.source.color
			background: Rectangle { color: style.source.background }
		}
	}
}
