import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
	id: dataButton

	hoverEnabled: false
	font {
		pointSize: style.button.textSize
	}

	text: "DataButton"
	clip: true

	property bool showIcon: true
	property string iconSource: "qrc:/images/copy.svg"

	background: Rectangle {
		color: dataButton.down ? style.button.colorBackgroundDown : style.button.colorBackground
		radius: style.radius
		Behavior on color {ColorAnimation { duration: style.animation } }
	}

	contentItem: Item {
		implicitWidth: contentRow.width + contentRow.spacing * 2
		implicitHeight: style.button.size
		anchors.verticalCenter: dataButton.verticalCenter

		RowLayout {
			id: contentRow
			spacing: style.button.iconSpacing
			Image { visible: dataButton.showIcon; source: iconSource }
			Text {
				color: dataButton.down ? main.style.button.colorDown : main.style.button.color
				Behavior on color {ColorAnimation { duration: style.animation } }
				text: dataButton.text
				font: dataButton.font
				horizontalAlignment: Text.AlignLeft
				verticalAlignment: Text.AlignVCenter
			}
		}
	}
	opacity: enabled ? 1 : 0.5
	Behavior on opacity {NumberAnimation { duration: style.animation } }
}
