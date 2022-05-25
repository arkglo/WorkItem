import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import qt.directory

Window {
	id: main

	width:  1980 / Screen.devicePixelRatio // Screen.desktopAvailableWidth / Screen.devicePixelRatio
	height: 1080 / Screen.devicePixelRatio // Screen.desktopAvailableHeight / Screen.devicePixelRatio
	minimumWidth: 600

	minimumHeight: 300
	//	onHeightChanged: log("New Window details: " + width + " x " + height)
	//	onWidthChanged: log("New Window details: " + width + " x " + height)

	visible: true
	title: qsTr("Work Item")
	flags: Qt.Window//Qt.ToolTip

	property real viewHeight: 0.25
	property bool debug: true
	property bool verbose: false

	property string dataCRID: ""
	property string dataCustomer: ""
	property string dataParentCRID: ""
	property string dataTitle: ""
	property string dataDescription: ""
	property string dataChangeSummary: ""
	property string dataPriority: ""

	property string debugText: ""

	property string link: "https://tlchange.panasonic.aero/change/PTweb?ACTION_FLAG=frameset_form&TEMPLATE_FLAG=ProblemReportView&database=/data/ccmdb/panasonic&role=ThirdParty&problem_number=LF%23"
	property string linkDashboard: "https://aspros.airborne.aero/dashboard/index.php?section=aspros-list&classification_id=4&product_id="
	property string linkDashboardReport: "https://aspros.airborne.aero/dashboard/index.php?section=products&classification_id=4"

	property var dashboards: [
		{ "name" : "AIR CANADA", "productID": 615 },
		{ "name" : "LUFTHANSA TECHNIK AG", "productID": 701 }
	]


	//------------------------------------------------------------
	signal updateSource(string newText)
	signal pasteSource
	signal resetDebug
	signal updateDebug(string newText)
	onResetDebug: debugText = ""
	onUpdateDebug: (newText) => debugText += newText

	//------------------------------------------------------------
	property alias style: style
	Styles { id: style }

	//------------------------------------------------------------
	Directory {
		id: directory
		Component.onCompleted: {
			main.log("absolutePath: " + absolutePath)
			main.log("dirName: " + dirName)
		}
	}

	//------ MAIN WINDOW ------------------------------------------------------
	Rectangle {
		id: mainWindow
		anchors.fill: parent
		color: "grey"
		//------------------------------------------------------------
		Keys.onPressed: (event) => {
											if (event.key === Qt.Key_Q || event.key === Qt.Key_Escape) {
												Qt.quit();
											}
											event.accepted = true;
										}

		//----- TOP --------------------------------
		TopSection {
			id: topSection
			anchors {
				top: parent.top
				topMargin: style.margin
				left: parent.left
				leftMargin: style.margin
			}
			width: parent.width - (style.margin * 2)
			height: parent.height * viewHeight //viewHeight === -1 ? (parent.height /2 ) - (style.margin * 1.5) : viewHeight
		}


		//----- BOTTOM --------------------------------
		ToolSection {
			id: toolSection
			anchors {
				top: topSection.bottom
				topMargin: style.margin
				left: topSection.left
				leftMargin: style.margin
				right: debugSection.left
				rightMargin: style.margin
			}
		}

		TextEdit{ // Invisible TextEdit item, used for copying to clipboard
			id: textEdit
			visible: false
			//function doCopy(copyThis) {   //Qt6 can now use function or lambda :)
			property var doCopy: (copyThis) => {
														 textEdit.text = copyThis
														 textEdit.selectAll()
														 textEdit.copy()
													 }
		}

		//----- BOTTOM LEFT -----------------------------------------------------------------------
		DataSection {
			id: dataSection

			anchors {
				top: toolSection.bottom
				topMargin: style.margin
				left: toolSection.left
				right: debugSection.left
				rightMargin: style.margin
			}
		}

		RoundButton {
			id: exeButton
			width: style.button.roundSize
			height: style.button.roundSize
			anchors {
				bottom: progressBar.top
				left: progressBar.left
				bottomMargin: style.margin
			}
			icon.name: "edit-cut"
			icon.source: "qrc:/images/link.svg"

			background: Rectangle {
				color: style.debug.background
				radius: width / 2
				border.color: style.button.colorBorder
				border.width: style.button.borderWidth
			}

			onClicked: doLink("EXE", directory.absolutePath)
		}

		//----- Bottom Right --------------------------------
		DebugSection {
			id: debugSection
			anchors {
				top: topSection.bottom
				topMargin: style.margin
				right: parent.right
				rightMargin: style.margin
				bottom: progressBar.top
				bottomMargin: style.margin
			}
			width: (parent.width / 2) - (style.margin * 1.5)
		}


		//------------------------------------------------------------
		ProgressBar {
			id: progressBar
			anchors {
				left: parent.left
				right: parent.right
				bottom: parent.bottom
				margins: style.margin
			}
			value: 0
		}
	}


	//------------------------------------------------------------

	Timer {
		id: dataTimer
		interval: 250
		onTriggered: {
			extractData(topSection.sourceText)
		}
	}


	//============================================================
	//------------------------------------------------------------
	function log(message, newline) {
		if(debug) {
			newline = newline === undefined ? true : newline
			console.log(message)
			updateDebug((message + (newline?style.text.newline:"")))
		}
	}

	//------------------------------------------------------------
	function log2(message, newline) {
		if(verbose) log(message, newline)
	}
	//------------------------------------------------------------
	function reset(andDebug) {
		andDebug = andDebug === undefined ? true : andDebug
		if(andDebug) resetDebug()

		updateSource("")

		dataCRID = ""
		dataCustomer = ""
		dataParentCRID = ""
		dataTitle = ""
		dataDescription = ""
		dataChangeSummary = ""
		dataPriority = ""

		progressBar.value = 0
	}
	//------------------------------------------------------------
	function doLink(type, value){
		log2("doLink(type: "+type+", value: "+value+")")
		if(type === "CR") {
			let test = value.substring(value.indexOf('#')+1)
			const fullLink = link + test
			log2(fullLink)
			Qt.openUrlExternally(fullLink)
		}
		else if(type === "Dashboard") {
			let productID = -1
			for (let x in dashboards) {
				if(value.search(dashboards[x].name) !== -1) {
					productID = dashboards[x].productID
					break
				}
			}
			log2(" productID: " + productID)

			let fullLink = linkDashboardReport
			if(productID !== -1) {
				fullLink = linkDashboard + productID
			}
			Qt.openUrlExternally(fullLink)
		}
		else if(type === "EXE") {
			console.log(value)
			console.log(typeof(value))
			Qt.openUrlExternally(value)
		}
	}

	//------------------------------------------------------------
	function find(needle, haystack, caseSensitive){
		caseSensitive = caseSensitive === undefined ? false : caseSensitive
		const re = new RegExp(`${needle}`, caseSensitive?undefined:'i')
		let pos = caseSensitive ? haystack.search(re) : haystack.search(re)
		log2("&nbsp;&nbsp;Found '" + needle + "' at " + pos)
		return pos
	}

	//------------------------------------------------------------
	function getFieldQuick(name, data, posStart, posEnd){
		log2("&nbsp;&nbsp;Found start at : " + posStart)
		let thisData = data.substring(posStart, posEnd).trim()
		log("<b>"+name+"</b>: ["+thisData+"]")
		return thisData
	}

	//------------------------------------------------------------
	function getField(name, data, posStart, posEnd){
		let fieldSeperator = ":"
		let foundStart = false
		const length = data.length
		posEnd = posEnd === undefined ? length : posEnd
		log2("&nbsp;&nbsp;<b><i>getField</i></b>("+name+", posStart: " + posStart + ", posEnd: " + posEnd + ") - length: " + length)
		for(let index = posStart; index < posEnd; index++) {
			if(data[index] === fieldSeperator) {
				if(!foundStart) {
					foundStart = true
					return getFieldQuick(name, data, index+1, posEnd)
				}
			}
		}
		return null
	}

	function setProgressBar(toThis) {
		let total = 7
		progressBar.value = toThis / total
	}

	//------------------------------------------------------------
	function extractData(data) {
		if(data === null || data === undefined || !data.length) return

		let temp = -1
		let index = 1
		setProgressBar(0)

		log("------------------------")
		let posCR = find("CR ID:", data)
		let posStatus = find("status:", data)
		dataCRID = getField("CR ID", data, posCR, posStatus)
		setProgressBar(index++)
		data = data.substring(posStatus)
		//		log2("########\nData1: ["+data.substring(0,15)+"]")

		let posCustomer = find("Customer:", data)
		let posAssignee = find("Assignee:", data)
		dataCustomer = getField("Customer", data, posCustomer, posAssignee)
		if(dataCustomer[dataCustomer.length-1] === "*") dataCustomer = dataCustomer.slice(0,dataCustomer.length-1)
		log("<b>Customer2</b>:["+dataCustomer+"]")
		data = data.substring(posAssignee)
		setProgressBar(index++)

		let posTitle = find("Title:", data)
		let posDescription = find("Description:", data)
		dataTitle = getField("Title", data, posTitle, posDescription)
		setProgressBar(index++)
		data = data.substring(posDescription)
		//		log2("########\nData2: ["+data.substring(0,15)+"]")

		posDescription = find("Description:", data)
		let posReproduce = find("Reproduce the Problem:", data)
		dataDescription = getField("Description", data, posDescription, posReproduce)
		setProgressBar(index++)
		data = data.substring(posReproduce)
		log2("########\nData3: ["+data.substring(0,15)+"]")

		let posChange = find("Change Summary:", data)
		data = data.substring(posChange)
		let posExpand = find("Expand the textbox", data)
		if (posExpand !== -1){ // no Change Summary included
			log2("########\nData4: ["+data.substring(0,200)+"]")
			dataChangeSummary = getField("Change Summary", data, 0, posExpand)
			data = data.substring(posExpand)
		}
		else {
			log2("No Change Summary")
			dataChangeSummary = "n/a"
		}
		setProgressBar(index++)

		temp = find("Master Issue Schedule", data)
		data = data.substring(temp)
		temp = find("LF#", data)
		data = data.substring(temp)
		temp = find("\t", data)
		dataParentCRID = getFieldQuick("ParentCRID", data, 0, temp)
		setProgressBar(index++)
		data = data.substring(temp)

		let tempData = data.substring(temp, 100)
		if(find("Critical", tempData) !== -1) dataPriority = "Critical"
		else if(find("High", tempData) !== -1) dataPriority = "High"
		else if(find("Medium", tempData) !== -1) dataPriority = "Medium"
		else if(find("Low", tempData) !== -1) dataPriority = "Low"
		setProgressBar(index++)

		log2("########\nData5: ["+data.substring(0,15)+"]")
		log2("########\nEND")
		//		let posParent = find("Parent Issue:", data)
	}
}
