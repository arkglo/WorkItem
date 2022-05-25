import QtQuick 2.0
import QtQuick.Controls

Rectangle {
	id: debugSection

	ScrollView {
		id: viewDebug
		anchors.fill: parent

		TextArea {
			id: debugTextArea
			property var scrollToBottom: () => {
																		 var i = text.lastIndexOf('\n');
																		 cursorPosition = i+1
																	 }
			wrapMode: TextEdit.WordWrap
			selectByMouse: true
			persistentSelection: true
			font.pointSize: style.debug.textSize
			textFormat: Text.RichText
			font.family: "consolas"
			onTextChanged: scrollToBottom()
			text: debugText
			color: style.debug.color
			background: Rectangle { color: style.debug.background }
		}
	}

	RoundButton {
		id: crLinkButton
		width: style.button.roundSize
		height: style.button.roundSize
		anchors {
			bottom: viewDebug.bottom
			right: viewDebug.left
			rightMargin: style.margin
		}
		icon.name: "reset"
		icon.source: "qrc:/images/reset.svg"
		background: Rectangle {
			color: style.debug.background
			radius: width / 2
			border.color: style.button.colorBorder
			border.width: style.button.borderWidth
		}

		onClicked: resetDebug()
	}
}
