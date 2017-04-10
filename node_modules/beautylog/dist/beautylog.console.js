"use strict";
require("typings-global");
const beautylog_classes_ora_1 = require("./beautylog.classes.ora");
let nativeLog = console.log;
let nativeError = console.error;
/**
 * routes the console to got through beautylog, so beautylog can take action before things are logged to console.
 */
let route = function (statusArg) {
    if (statusArg == true) {
        console.log = exports.beautyConsole.log;
        console.error = exports.beautyConsole.error;
    }
    else {
        console.log = nativeLog;
    }
};
exports.beautyConsole = {
    log: function (logArg) {
        if (beautylog_classes_ora_1.oraActive) {
            beautylog_classes_ora_1.activeOra.pause();
            nativeLog.apply(nativeLog, arguments);
            beautylog_classes_ora_1.activeOra.start();
        }
        else {
            nativeLog.apply(nativeLog, arguments);
        }
    },
    error: function () {
        if (beautylog_classes_ora_1.oraActive) {
            beautylog_classes_ora_1.activeOra.pause();
            nativeLog.apply(nativeError, arguments);
            beautylog_classes_ora_1.activeOra.start();
        }
        else {
            nativeLog.apply(nativeError, arguments);
        }
    }
};
route(true);
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYmVhdXR5bG9nLmNvbnNvbGUuanMiLCJzb3VyY2VSb290IjoiIiwic291cmNlcyI6WyIuLi90cy9iZWF1dHlsb2cuY29uc29sZS50cyJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiO0FBQUEsUUFBTyxnQkFBZ0IsQ0FBQyxDQUFBO0FBRXhCLHdDQUFrQyx5QkFBeUIsQ0FBQyxDQUFBO0FBQzVELElBQUksU0FBUyxHQUFHLE9BQU8sQ0FBQyxHQUFHLENBQUM7QUFDNUIsSUFBSSxXQUFXLEdBQUcsT0FBTyxDQUFDLEtBQUssQ0FBQztBQUVoQzs7R0FFRztBQUNILElBQUksS0FBSyxHQUFHLFVBQVMsU0FBaUI7SUFDbEMsRUFBRSxDQUFBLENBQUMsU0FBUyxJQUFJLElBQUksQ0FBQyxDQUFBLENBQUM7UUFDbEIsT0FBTyxDQUFDLEdBQUcsR0FBRyxxQkFBYSxDQUFDLEdBQUcsQ0FBQztRQUNoQyxPQUFPLENBQUMsS0FBSyxHQUFHLHFCQUFhLENBQUMsS0FBSyxDQUFDO0lBQ3hDLENBQUM7SUFBQyxJQUFJLENBQUMsQ0FBQztRQUNKLE9BQU8sQ0FBQyxHQUFHLEdBQUcsU0FBUyxDQUFDO0lBQzVCLENBQUM7QUFFTCxDQUFDLENBQUM7QUFFUyxxQkFBYSxHQUFHO0lBQ3ZCLEdBQUcsRUFBRSxVQUFTLE1BQVU7UUFDcEIsRUFBRSxDQUFBLENBQUMsaUNBQVMsQ0FBQyxDQUFBLENBQUM7WUFDVixpQ0FBUyxDQUFDLEtBQUssRUFBRSxDQUFDO1lBQ2xCLFNBQVMsQ0FBQyxLQUFLLENBQUMsU0FBUyxFQUFFLFNBQVMsQ0FBQyxDQUFDO1lBQ3RDLGlDQUFTLENBQUMsS0FBSyxFQUFFLENBQUM7UUFDdEIsQ0FBQztRQUFDLElBQUksQ0FBQyxDQUFDO1lBQ0osU0FBUyxDQUFDLEtBQUssQ0FBQyxTQUFTLEVBQUUsU0FBUyxDQUFDLENBQUM7UUFDMUMsQ0FBQztJQUNMLENBQUM7SUFDRCxLQUFLLEVBQUU7UUFDSCxFQUFFLENBQUEsQ0FBQyxpQ0FBUyxDQUFDLENBQUEsQ0FBQztZQUNWLGlDQUFTLENBQUMsS0FBSyxFQUFFLENBQUM7WUFDbEIsU0FBUyxDQUFDLEtBQUssQ0FBQyxXQUFXLEVBQUUsU0FBUyxDQUFDLENBQUM7WUFDeEMsaUNBQVMsQ0FBQyxLQUFLLEVBQUUsQ0FBQztRQUN0QixDQUFDO1FBQUMsSUFBSSxDQUFDLENBQUM7WUFDSixTQUFTLENBQUMsS0FBSyxDQUFDLFdBQVcsRUFBRSxTQUFTLENBQUMsQ0FBQztRQUM1QyxDQUFDO0lBQ0wsQ0FBQztDQUNKLENBQUE7QUFFRCxLQUFLLENBQUMsSUFBSSxDQUFDLENBQUMifQ==