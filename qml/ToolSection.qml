import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts
import "components"
import "./test.js" as TEST

RowLayout {
	id: toolRow
	spacing: style.margin

	ToolbarButton {
		id: testButton

		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.preferredWidth: 50
		Layout.maximumWidth: 100

		text: qsTr("test")

		onClicked: {
			resetDebug()
			updateSource("")
			updateSource(TEST.testData)

			log("Screen.height: " + Screen.height)
			log("Screen.desktopAvailableHeight: " + Screen.desktopAvailableHeight)
			log("Screen.devicePixelRatio: " + Screen.devicePixelRatio)
			log("Screen.pixelDensity: " + Screen.pixelDensity )
			log("Check2: " + Screen.desktopAvailableHeight / Screen.devicePixelRatio)
			log("Screen.manufacturer: " + Screen.manufacturer )
			log("Screen.model: " + Screen.model )
			log("Screen.name: " + Screen.name  )
			log("Screen.serialNumber: " + Screen.serialNumber  )
		}
	}

	CheckBox {
		id: checkVerbose
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.preferredWidth: 120
		Layout.maximumWidth: 120
		height: 50

		hoverEnabled: false

		indicator: Rectangle {
			width: checkVerbose.height * 0.8
			height: checkVerbose.height * 0.8
			anchors.top: checkVerbose.top
			anchors.left: checkVerbose.left
			anchors.margins: checkVerbose.height * 0.1
			radius: 3
			border.color: style.toolButton.colorBorder
			border.width: 1
			color: style.toolButton.colorBackground
			Rectangle {
				visible: checkVerbose.checked
				color: style.toolButton.colorBorder
				border.color: style.toolButton.color
				radius: 1
				anchors.margins: 2
				anchors.fill: parent
			}
		}

		background: Rectangle {
			border.color: style.toolButton.colorBorder
			border.width: style.toolButton.borderWidth
			radius: style.radius
			color: style.toolButton.colorBackgroundDown
		}

		font {
			pointSize: style.toolButton.textSize
			capitalization: Font.Capitalize
		}

		contentItem: Text {
			anchors.left: parent.indicator.right
			anchors.leftMargin: main.style.button.iconSpacing
			anchors.right: parent.right
			clip: true
			maximumLineCount: 1
			text: checkVerbose.text
			font: checkVerbose.font
			color: checkVerbose.down ? main.style.toolButton.colorDown : main.style.toolButton.color
			verticalAlignment: Text.AlignVCenter
//			elide: Text.ElideRight
			fontSizeMode: Text.HorizontalFit
			minimumPointSize: 6
		}

		text: "Verbose"
		checkState: verbose ? Qt.Checked : Qt.Unchecked
		onCheckStateChanged: verbose = checkState === Qt.Checked
	}

	ToolbarButton {
		id: copyButton
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.preferredWidth: 50
		Layout.maximumWidth: 100

		text: "copy"
		onClicked: debugText.copy()
	}


	ToolbarButton {
		id: pasteButton
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.preferredWidth: 50
		Layout.maximumWidth: 100

		text: "paste"
		onClicked: {
			reset()
			pasteSource()
		}
	}

	ToolbarButton {
		id: quitButton
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.preferredWidth: 50
		Layout.maximumWidth: 100

		text: "quit"
		onClicked: Qt.quit()
	}
}
