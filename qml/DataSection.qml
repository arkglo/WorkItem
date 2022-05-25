import QtQuick 2.0
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
	spacing: style.margin

	RowLayout {
		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.preferredWidth: 50
		Layout.maximumWidth: 100

		spacing: style.margin

		Button {
			id: crButton
			text: "<b>CR ID</b><br>" + dataCRID

			enabled: dataCRID
			opacity: enabled ? 1 : 0.5
			onClicked: textEdit.doCopy(dataCRID)
		}

		RoundButton {
			id: crLinkButton
			width: style.button.roundSize
			height: style.button.roundSize

			icon.name: "edit-cut"
			icon.source: "qrc:/images/link.svg"
			//			text: "\u1F517"
			//			font.family: "Segoe UI Symbol"
			enabled: dataCRID
			opacity: enabled ? 1 : 0.5
			background: Rectangle {
				color: style.debug.background
				radius: width / 2
				border.color: style.button.colorBorder
				border.width: style.button.borderWidth
			}

			onClicked: {
				if(dataCRID.indexOf('#')===-1) return
				doLink("CR", dataCRID)
			}
		}

		Button {
			id: parentCrButton
			text: "<b>parent CR ID</b><br>" + dataParentCRID

			onClicked: textEdit.doCopy(dataParentCRID)
			enabled: dataParentCRID
			opacity: enabled ? 1 : 0.5
		}

		Button {
			id: customerButton
			text: "<b>Customer</b><br>" + dataCustomer

			enabled: dataCustomer
			opacity: enabled ? 1 : 0.5
			onClicked: doLink("Dashboard", dataCustomer)
		}
	}// Row


	Button {
		id: titleButton

		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.maximumWidth: parent.width

		text: "<b>Title</b><br>" + dataTitle
		clip: true
		onClicked: textEdit.doCopy(dataTitle)

		contentItem: Text {
			text: parent.text
			horizontalAlignment: Text.AlignLeft
			verticalAlignment: Text.AlignVCenter
		}
		enabled: dataTitle
		opacity: enabled ? 1 : 0.5
	}

	Button {
		id: priorityButton

		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.maximumWidth: parent.width

		text: "<b>Priority</b><br>" + dataPriority
		clip: true

		onClicked: textEdit.doCopy(dataPriority)

		contentItem: Text {
			text: parent.text
			horizontalAlignment: Text.AlignLeft
			verticalAlignment: Text.AlignVCenter
		}

		enabled: dataPriority
		opacity: enabled ? 1 : 0.5
	}

	Button {
		id: descriptionButton

		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.maximumWidth: parent.width

		text: "<b>Description</b><br>" + dataDescription
		clip: true

		onClicked: textEdit.doCopy(dataDescription)

		contentItem: Text {
			text: parent.text
			horizontalAlignment: Text.AlignLeft
			verticalAlignment: Text.AlignVCenter
		}

		enabled: dataDescription
		opacity: enabled ? 1 : 0.5
	}


	Button {
		id: changeSummaryButton

		Layout.fillWidth: true
		Layout.minimumWidth: 30
		Layout.maximumWidth: parent.width
		text: "<b>Change Summary</b><br>" + dataChangeSummary
		clip: true

		onClicked: textEdit.doCopy(dataChangeSummary)

		contentItem: Text {
			text: parent.text
			horizontalAlignment: Text.AlignLeft
			verticalAlignment: Text.AlignVCenter
		}

		enabled: dataChangeSummary
		opacity: enabled ? 1 : 0.5
	}
}
