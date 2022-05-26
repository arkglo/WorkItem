import QtQuick
import QtQuick.Controls

Button {
	id: toolButton

	font {
		pointSize: style.toolButton.textSize
		capitalization: Font.Capitalize
	}

	hoverEnabled: false

//	onDownChanged: main.log("down: " + down)
//	onHighlightedChanged:  main.log("highlighted: " + highlighted)
//	onHoveredChanged: main.log("hovered: " + hovered)

	background: Rectangle {
		implicitWidth: 100
		implicitHeight: 40
		opacity: enabled ? 1 : 0.5
		border.color: style.toolButton.colorBorder
		border.width: style.toolButton.borderWidth
		radius: style.radius
		color: toolButton.down ? style.toolButton.colorBackground : style.toolButton.colorBackgroundDown
	}

	contentItem: Text {
		text: toolButton.text
		font: toolButton.font
		opacity: enabled ? 1.0 : 0.5
		color: toolButton.down ? main.style.toolButton.colorDown : main.style.toolButton.color
		horizontalAlignment: Text.AlignHCenter
		verticalAlignment: Text.AlignVCenter
		elide: Text.ElideRight
		fontSizeMode: Text.HorizontalFit
		minimumPointSize: 6
	}
}
