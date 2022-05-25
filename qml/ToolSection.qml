import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts
import "./test.js" as TEST

RowLayout {
	id: toolRow
	spacing: style.margin

	TestButton {
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
		Layout.preferredWidth: 50
		Layout.maximumWidth: 100
		height: 50

		hoverEnabled: false

		indicator: Rectangle {
			width: checkVerbose.height * 0.8
			height: checkVerbose.height * 0.8
			anchors.top: checkVerbose.top
			anchors.left: checkVerbose.left
			anchors.margins: checkVerbose.height * 0.1
			radius: 3
			border.color: style.button.colorBorder
			border.width: 1
			color: style.button.colorBackground
			Rectangle {
				visible: checkVerbose.checked
				color: style.button.colorBorder
				border.color: style.button.color
				radius: 1
				anchors.margins: 2
				anchors.fill: parent
			}
		}

		background: Rectangle {
			border.color: style.button.colorBorder
			border.width: style.button.borderWidth
			radius: style.radius
			color: style.button.colorBackgroundDown
		}

		font {
			pointSize: style.button.textSize
			capitalization: Font.Capitalize
		}

		text: "Verbose"
		checkState: verbose ? Qt.Checked : Qt.Unchecked
		onCheckStateChanged: verbose = checkState === Qt.Checked
	}

	TestButton {
		id: copyButton
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.preferredWidth: 50
		Layout.maximumWidth: 100

		text: "copy"
		onClicked: debugText.copy()
	}


	TestButton {
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

	TestButton {
		id: quitButton
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.preferredWidth: 50
		Layout.maximumWidth: 100

		text: "quit"
		onClicked: Qt.quit()
	}
}
