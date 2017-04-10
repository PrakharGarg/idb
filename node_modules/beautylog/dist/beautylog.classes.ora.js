"use strict";
require("typings-global");
const plugins = require("./beautylog.plugins");
const beautylog_log_helpers_1 = require("./beautylog.log.helpers");
exports.oraActive = false; // when an Ora is active (e.g. start()) this is true;
class Ora {
    constructor(textArg, colorArg, startArg = false) {
        this._oraObject = plugins.ora({
            spinner: "dots",
            text: textArg,
            color: colorArg
        });
        startArg ? this._oraObject.start() : void (0);
    }
    text(textArg) {
        this._oraObject.text = textArg;
    }
    ;
    start(textArg, colorArg) {
        if (textArg)
            this._oraObject.text = textArg;
        if (colorArg)
            this._oraObject.color = colorArg;
        exports.activeOra = this;
        exports.oraActive = true;
        this._oraObject.start();
    }
    ;
    end() {
        this._oraObject.stop();
        this._oraObject.clear();
        exports.activeOra = undefined;
        exports.oraActive = false;
    }
    endOk(textArg) {
        this.end();
        beautylog_log_helpers_1.logNode("ok", textArg);
    }
    ;
    endError(textArg) {
        this.end();
        beautylog_log_helpers_1.logNode("error", textArg);
    }
    ;
    pause() {
        this._oraObject.stop();
    }
    stop() {
        this.end();
    }
    ;
}
exports.Ora = Ora;
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiYmVhdXR5bG9nLmNsYXNzZXMub3JhLmpzIiwic291cmNlUm9vdCI6IiIsInNvdXJjZXMiOlsiLi4vdHMvYmVhdXR5bG9nLmNsYXNzZXMub3JhLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiI7QUFBQSxRQUFPLGdCQUFnQixDQUFDLENBQUE7QUFDeEIsTUFBWSxPQUFPLFdBQU0scUJBQXFCLENBQUMsQ0FBQTtBQUMvQyx3Q0FBc0IseUJBQXlCLENBQUMsQ0FBQTtBQUVyQyxpQkFBUyxHQUFXLEtBQUssQ0FBQyxDQUFDLHFEQUFxRDtBQUczRjtJQUdJLFlBQVksT0FBYyxFQUFDLFFBQWUsRUFBQyxRQUFRLEdBQVcsS0FBSztRQUMvRCxJQUFJLENBQUMsVUFBVSxHQUFHLE9BQU8sQ0FBQyxHQUFHLENBQUM7WUFDMUIsT0FBTyxFQUFDLE1BQU07WUFDZCxJQUFJLEVBQUMsT0FBTztZQUNaLEtBQUssRUFBQyxRQUFRO1NBQ2pCLENBQUMsQ0FBQztRQUVILFFBQVEsR0FBRyxJQUFJLENBQUMsVUFBVSxDQUFDLEtBQUssRUFBRSxHQUFHLEtBQUksQ0FBQyxDQUFDLENBQUMsQ0FBQztJQUNqRCxDQUFDO0lBQ0QsSUFBSSxDQUFDLE9BQU87UUFDUixJQUFJLENBQUMsVUFBVSxDQUFDLElBQUksR0FBRyxPQUFPLENBQUM7SUFDbkMsQ0FBQzs7SUFFRCxLQUFLLENBQUMsT0FBZSxFQUFDLFFBQWdCO1FBQ2xDLEVBQUUsQ0FBQSxDQUFDLE9BQU8sQ0FBQztZQUFDLElBQUksQ0FBQyxVQUFVLENBQUMsSUFBSSxHQUFHLE9BQU8sQ0FBQztRQUMzQyxFQUFFLENBQUEsQ0FBQyxRQUFRLENBQUM7WUFBQyxJQUFJLENBQUMsVUFBVSxDQUFDLEtBQUssR0FBRyxRQUFRLENBQUM7UUFDOUMsaUJBQVMsR0FBRyxJQUFJLENBQUM7UUFDakIsaUJBQVMsR0FBRyxJQUFJLENBQUM7UUFDakIsSUFBSSxDQUFDLFVBQVUsQ0FBQyxLQUFLLEVBQUUsQ0FBQztJQUM1QixDQUFDOztJQUNELEdBQUc7UUFDQyxJQUFJLENBQUMsVUFBVSxDQUFDLElBQUksRUFBRSxDQUFDO1FBQ3ZCLElBQUksQ0FBQyxVQUFVLENBQUMsS0FBSyxFQUFFLENBQUM7UUFDeEIsaUJBQVMsR0FBRyxTQUFTLENBQUM7UUFDdEIsaUJBQVMsR0FBRyxLQUFLLENBQUM7SUFDdEIsQ0FBQztJQUNELEtBQUssQ0FBQyxPQUFPO1FBQ1QsSUFBSSxDQUFDLEdBQUcsRUFBRSxDQUFDO1FBQ1gsK0JBQU8sQ0FBQyxJQUFJLEVBQUMsT0FBTyxDQUFDLENBQUM7SUFDMUIsQ0FBQzs7SUFDRCxRQUFRLENBQUMsT0FBTztRQUNaLElBQUksQ0FBQyxHQUFHLEVBQUUsQ0FBQztRQUNYLCtCQUFPLENBQUMsT0FBTyxFQUFDLE9BQU8sQ0FBQyxDQUFDO0lBQzdCLENBQUM7O0lBQ0QsS0FBSztRQUNELElBQUksQ0FBQyxVQUFVLENBQUMsSUFBSSxFQUFFLENBQUM7SUFDM0IsQ0FBQztJQUNELElBQUk7UUFDQSxJQUFJLENBQUMsR0FBRyxFQUFFLENBQUM7SUFDZixDQUFDOztBQUNMLENBQUM7QUEzQ1ksV0FBRyxNQTJDZixDQUFBIn0=