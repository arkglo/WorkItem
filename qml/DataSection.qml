import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts
import "components"

ColumnLayout {
	spacing: style.margin

	RowLayout {
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.preferredWidth: 50
		Layout.maximumWidth: 100

		spacing: style.margin

		DataButton {
			id: crButton
			Layout.fillWidth: true
			Layout.minimumWidth: contentItem.implicitWidth + (style.margin * 2)

			text: "<b>CR ID</b><br>" + dataCRID
			showIcon: false

			enabled: dataCRID
			onClicked: textEdit.doCopy(dataCRID)
		}

		RoundButton {
			id: crLinkButton

			icon {
				source: "qrc:/images/link.svg"
				width: style.iconSize
				height: style.iconSize
			}
			enabled: dataCRID
			opacity: enabled ? 1 : 0.5

			background: Rectangle {
				implicitWidth: style.toolButton.size
				implicitHeight: style.toolButton.size
				color: parent.down ? style.button.colorBackgroundDown : style.button.colorBackground
				Behavior on color {ColorAnimation { duration: style.animation } }
				radius: width / 2
			}

			onClicked: {
				if(dataCRID.indexOf('#')===-1) return
				doLink("CR", dataCRID)
			}
		}

		DataButton {
			id: parentCrButton
			Layout.fillWidth: true
			Layout.minimumWidth: contentItem.implicitWidth + (style.margin * 2)

			text: "<b>parent CR ID</b><br>" + dataParentCRID
			showIcon: false

			enabled: dataParentCRID
			onClicked: textEdit.doCopy(dataParentCRID)
		}

		DataButton {
			id: customerButton
			Layout.fillWidth: true
			Layout.minimumWidth: contentItem.implicitWidth + (style.margin * 2)

			text: "<b>Customer</b><br>" + dataCustomer + " / <small>" + dataSystemType + "</small>"
			iconSource: "qrc:/images/link.svg"

			enabled: dataCustomer
			onClicked: doLink("Dashboard", dataCustomer)
		}


		DataButton {
			id: priorityButton
			Layout.fillWidth: true
			Layout.minimumWidth: contentItem.implicitWidth + (style.margin * 2)
//			Layout.preferredWidth: 100
//			Layout.maximumWidth: 100

			text: "<b>Priority</b><br>" + dataPriority

			enabled: dataCustomer
			onClicked: textEdit.doCopy(dataPriority)
		}
	}// Row


	DataButton {
		id: titleButton
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.maximumWidth: parent.width

		text: "<b>Title</b><br>" + dataTitle
		onClicked: textEdit.doCopy(dataTitle)
		enabled: dataTitle
	}

	DataButton {
		id: descriptionButton
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.maximumWidth: parent.width

		text: "<b>Description</b><br>" + dataDescription
		onClicked: textEdit.doCopy(dataDescription)
		enabled: dataDescription
	}

	DataButton {
		id: changeSummaryButton
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.maximumWidth: parent.width

		text: "<b>Change Summary</b><br>" + dataChangeSummary
		onClicked: textEdit.doCopy(dataChangeSummary)
		enabled: dataChangeSummary
	}

	//	Text { text: "color"; color: main.style.toolButton.color }
	//	Text { text: "colorDown"; color: main.style.toolButton.colorDown }
	//	Text { text: "colorBorder"; color: main.style.toolButton.colorBorder }
	//	Text { text: "colorBackground"; color: main.style.toolButton.colorBackground }
	//	Text { text: "colorBackgroundDown"; color: main.style.toolButton.colorBackgroundDown }
}
