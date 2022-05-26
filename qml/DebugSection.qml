import QtQuick 2.0
import QtQuick.Controls

Rectangle {
	id: debugSection

	ScrollView {
		id: viewDebug
		anchors.fill: parent

		TextArea {
			id: debugTextArea
			implicitWidth: parent.width
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
		width: style.toolButton.size
		height: style.toolButton.size
		anchors {
			bottom: viewDebug.bottom
			right: viewDebug.left
			rightMargin: style.margin
		}
		icon {
			source: "qrc:/images/reset.svg"
			width: style.iconSize
			height: style.iconSize
			color: style.button.color
		}

		background: Rectangle {
			color: style.debug.background
			radius: width / 2
			border.color: style.toolButton.colorBorder
			border.width: style.toolButton.borderWidth
		}

		onClicked: reset(true)//resetDebug()
	}
}
