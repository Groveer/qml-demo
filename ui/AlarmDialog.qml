import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Dialog {
    contentItem: RowLayout {
       RowLayout {
           id: rowTumbler

           Tumbler {
               id: hoursTumbler
               model: 24
               delegate: TumblerDelegate {
                   text: formatNumber(modelData)
               }
           }
           Tumbler {
               id: minutesTumbler
               model: 60
               delegate: TumblerDelegate {
                   text: formatNumber(modelData)
               }
           }
       }

       RowLayout {
           id: datePicker

           Layout.leftMargin: 20

           property alias dayTumbler: dayTumbler
           property alias monthTumbler: monthTumbler
           property alias yearTumbler: yearTumbler

           readonly property var days: [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

           Tumbler {
               id: dayTumbler

               function updateModel() {
                   // Populate the model with days of the month. For example: [0, ..., 30]
                   var previousIndex = dayTumbler.currentIndex
                   var array = []
                   var newDays = datePicker.days[monthTumbler.currentIndex]
                   for (var i = 1; i <= newDays; ++i)
                       array.push(i)
                   dayTumbler.model = array
                   dayTumbler.currentIndex = Math.min(newDays - 1, previousIndex)
               }

               Component.onCompleted: updateModel()

               delegate: TumblerDelegate {
                   text: formatNumber(modelData)
               }
           }
           Tumbler {
               id: monthTumbler

               onCurrentIndexChanged: dayTumbler.updateModel()

               model: 12
               delegate: TumblerDelegate {
                   text: window.locale.standaloneMonthName(modelData, Locale.ShortFormat)
               }
           }
           Tumbler {
               id: yearTumbler

               // This array is populated with the next three years. For example: [2018, 2019, 2020]
               readonly property var years: (function() {
                   var currentYear = new Date().getFullYear()
                   return [0, 1, 2].map(function(value) { return value + currentYear; })
               })()

               model: years
               delegate: TumblerDelegate {
                   text: formatNumber(modelData)
               }
           }
       }
   }
}
