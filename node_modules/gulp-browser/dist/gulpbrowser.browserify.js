"use strict";
require("typings-global");
var plugins = require("./gulpbrowser.plugins");
var browserify = function (transforms) {
    if (transforms === void 0) { transforms = []; }
    if (!Array.isArray(transforms)) {
        transforms = [transforms];
    }
    var forEach = function (file, enc, cb) {
        var bundleCallback = function (err, bufferedContent) {
            if (Buffer.isBuffer(bufferedContent)) {
                file.contents = bufferedContent;
            }
            else {
                plugins.beautylog.error("gulp-browser: .browserify() " + err.message);
                cb(new Error(err.message), file);
                return;
            }
            cb(null, file);
        };
        if (file.contents.length > 0) {
            var browserified_1 = plugins.browserify(file, { basedir: file.base });
            transforms.forEach(function (transform) {
                if (typeof transform === 'function') {
                    browserified_1.transform(transform);
                }
                else {
                    browserified_1.transform(transform.transform, transform.options);
                }
            });
            browserified_1.bundle(bundleCallback);
        }
        else {
            plugins.beautylog.warn("gulp-browser: .browserify() file.contents appears to be empty");
            cb(null, file);
        }
        ;
    };
    var atEnd = function (cb) {
        cb();
    }; // no need to clean up after ourselves
    return plugins.through.obj(forEach, atEnd); // this is the through object that gets returned by gulpBrowser.browserify();
};
module.exports = browserify;

//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImd1bHBicm93c2VyLmJyb3dzZXJpZnkudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IjtBQUFBLFFBQU8sZ0JBQWdCLENBQUMsQ0FBQTtBQUN4QixJQUFPLE9BQU8sV0FBVyx1QkFBdUIsQ0FBQyxDQUFDO0FBR2xELElBQUksVUFBVSxHQUFJLFVBQVMsVUFBZTtJQUFmLDBCQUFlLEdBQWYsZUFBZTtJQUV0QyxFQUFFLENBQUMsQ0FBQyxDQUFDLEtBQUssQ0FBQyxPQUFPLENBQUMsVUFBVSxDQUFDLENBQUMsQ0FBQyxDQUFDO1FBQzdCLFVBQVUsR0FBRyxDQUFDLFVBQVUsQ0FBQyxDQUFDO0lBQzlCLENBQUM7SUFFRCxJQUFJLE9BQU8sR0FBRyxVQUFTLElBQUksRUFBRSxHQUFHLEVBQUUsRUFBRTtRQUVoQyxJQUFJLGNBQWMsR0FBRyxVQUFTLEdBQUcsRUFBRSxlQUFlO1lBQzlDLEVBQUUsQ0FBQyxDQUFDLE1BQU0sQ0FBQyxRQUFRLENBQUMsZUFBZSxDQUFDLENBQUMsQ0FBQSxDQUFDO2dCQUNsQyxJQUFJLENBQUMsUUFBUSxHQUFHLGVBQWUsQ0FBQztZQUNwQyxDQUFDO1lBQUMsSUFBSSxDQUFDLENBQUM7Z0JBQ0osT0FBTyxDQUFDLFNBQVMsQ0FBQyxLQUFLLENBQUMsOEJBQThCLEdBQUcsR0FBRyxDQUFDLE9BQU8sQ0FBQyxDQUFDO2dCQUN0RSxFQUFFLENBQUMsSUFBSSxLQUFLLENBQUMsR0FBRyxDQUFDLE9BQU8sQ0FBQyxFQUFDLElBQUksQ0FBQyxDQUFDO2dCQUNoQyxNQUFNLENBQUM7WUFDWCxDQUFDO1lBQ0QsRUFBRSxDQUFDLElBQUksRUFBQyxJQUFJLENBQUMsQ0FBQztRQUNsQixDQUFDLENBQUM7UUFFRixFQUFFLENBQUEsQ0FBQyxJQUFJLENBQUMsUUFBUSxDQUFDLE1BQU0sR0FBRyxDQUFDLENBQUMsQ0FBQSxDQUFDO1lBQ3pCLElBQUksY0FBWSxHQUFHLE9BQU8sQ0FBQyxVQUFVLENBQUMsSUFBSSxFQUFFLEVBQUUsT0FBTyxFQUFFLElBQUksQ0FBQyxJQUFJLEVBQUUsQ0FBQyxDQUFDO1lBRXBFLFVBQVUsQ0FBQyxPQUFPLENBQUMsVUFBVSxTQUFTO2dCQUNsQyxFQUFFLENBQUMsQ0FBQyxPQUFPLFNBQVMsS0FBSyxVQUFVLENBQUMsQ0FBQyxDQUFDO29CQUNsQyxjQUFZLENBQUMsU0FBUyxDQUFDLFNBQVMsQ0FBQyxDQUFDO2dCQUN0QyxDQUFDO2dCQUFDLElBQUksQ0FBQyxDQUFDO29CQUNKLGNBQVksQ0FBQyxTQUFTLENBQUMsU0FBUyxDQUFDLFNBQVMsRUFBRSxTQUFTLENBQUMsT0FBTyxDQUFDLENBQUM7Z0JBQ25FLENBQUM7WUFDTCxDQUFDLENBQUMsQ0FBQztZQUVILGNBQVksQ0FBQyxNQUFNLENBQUMsY0FBYyxDQUFDLENBQUM7UUFDeEMsQ0FBQztRQUFDLElBQUksQ0FBQyxDQUFDO1lBQ0osT0FBTyxDQUFDLFNBQVMsQ0FBQyxJQUFJLENBQUMsK0RBQStELENBQUMsQ0FBQztZQUN4RixFQUFFLENBQUMsSUFBSSxFQUFDLElBQUksQ0FBQyxDQUFDO1FBQ2xCLENBQUM7UUFBQSxDQUFDO0lBQ04sQ0FBQyxDQUFBO0lBRUQsSUFBSSxLQUFLLEdBQUcsVUFBUyxFQUFFO1FBQ25CLEVBQUUsRUFBRSxDQUFDO0lBQ1QsQ0FBQyxDQUFBLENBQUMsc0NBQXNDO0lBRXhDLE1BQU0sQ0FBQyxPQUFPLENBQUMsT0FBTyxDQUFDLEdBQUcsQ0FBQyxPQUFPLEVBQUMsS0FBSyxDQUFDLENBQUMsQ0FBQyw2RUFBNkU7QUFDM0gsQ0FBQyxDQUFDO0FBRUgsaUJBQVMsVUFBVSxDQUFDIiwiZmlsZSI6Imd1bHBicm93c2VyLmJyb3dzZXJpZnkuanMiLCJzb3VyY2VzQ29udGVudCI6WyJpbXBvcnQgXCJ0eXBpbmdzLWdsb2JhbFwiO1xyXG5pbXBvcnQgcGx1Z2lucyA9IHJlcXVpcmUoXCIuL2d1bHBicm93c2VyLnBsdWdpbnNcIik7XHJcblxyXG5cclxubGV0IGJyb3dzZXJpZnkgPSAgZnVuY3Rpb24odHJhbnNmb3JtcyA9IFtdKSB7XHJcblxyXG4gICAgaWYgKCFBcnJheS5pc0FycmF5KHRyYW5zZm9ybXMpKSB7XHJcbiAgICAgICAgdHJhbnNmb3JtcyA9IFt0cmFuc2Zvcm1zXTtcclxuICAgIH1cclxuXHJcbiAgICBsZXQgZm9yRWFjaCA9IGZ1bmN0aW9uKGZpbGUsIGVuYywgY2IpeyAvLyBkbyB0aGlzIHdpdGggZXZlcnkgY2h1bmsgKGZpbGUgaW4gZ3VscCB0ZXJtcylcclxuXHJcbiAgICAgICAgbGV0IGJ1bmRsZUNhbGxiYWNrID0gZnVuY3Rpb24oZXJyLCBidWZmZXJlZENvbnRlbnQpIHsgLy8gb3VyIGJ1bmRsZSBjYWxsYmFjayBmb3Igd2hlbiBicm93c2VyaWZ5IGlzIGZpbmlzaGVkXHJcbiAgICAgICAgICAgIGlmIChCdWZmZXIuaXNCdWZmZXIoYnVmZmVyZWRDb250ZW50KSl7XHJcbiAgICAgICAgICAgICAgICBmaWxlLmNvbnRlbnRzID0gYnVmZmVyZWRDb250ZW50O1xyXG4gICAgICAgICAgICB9IGVsc2Uge1xyXG4gICAgICAgICAgICAgICAgcGx1Z2lucy5iZWF1dHlsb2cuZXJyb3IoXCJndWxwLWJyb3dzZXI6IC5icm93c2VyaWZ5KCkgXCIgKyBlcnIubWVzc2FnZSk7XHJcbiAgICAgICAgICAgICAgICBjYihuZXcgRXJyb3IoZXJyLm1lc3NhZ2UpLGZpbGUpO1xyXG4gICAgICAgICAgICAgICAgcmV0dXJuO1xyXG4gICAgICAgICAgICB9XHJcbiAgICAgICAgICAgIGNiKG51bGwsZmlsZSk7XHJcbiAgICAgICAgfTtcclxuXHJcbiAgICAgICAgaWYoZmlsZS5jb250ZW50cy5sZW5ndGggPiAwKXtcclxuICAgICAgICAgICAgbGV0IGJyb3dzZXJpZmllZCA9IHBsdWdpbnMuYnJvd3NlcmlmeShmaWxlLCB7IGJhc2VkaXI6IGZpbGUuYmFzZSB9KTtcclxuXHJcbiAgICAgICAgICAgIHRyYW5zZm9ybXMuZm9yRWFjaChmdW5jdGlvbiAodHJhbnNmb3JtKSB7XHJcbiAgICAgICAgICAgICAgICBpZiAodHlwZW9mIHRyYW5zZm9ybSA9PT0gJ2Z1bmN0aW9uJykge1xyXG4gICAgICAgICAgICAgICAgICAgIGJyb3dzZXJpZmllZC50cmFuc2Zvcm0odHJhbnNmb3JtKTtcclxuICAgICAgICAgICAgICAgIH0gZWxzZSB7XHJcbiAgICAgICAgICAgICAgICAgICAgYnJvd3NlcmlmaWVkLnRyYW5zZm9ybSh0cmFuc2Zvcm0udHJhbnNmb3JtLCB0cmFuc2Zvcm0ub3B0aW9ucyk7XHJcbiAgICAgICAgICAgICAgICB9XHJcbiAgICAgICAgICAgIH0pO1xyXG5cclxuICAgICAgICAgICAgYnJvd3NlcmlmaWVkLmJ1bmRsZShidW5kbGVDYWxsYmFjayk7XHJcbiAgICAgICAgfSBlbHNlIHtcclxuICAgICAgICAgICAgcGx1Z2lucy5iZWF1dHlsb2cud2FybihcImd1bHAtYnJvd3NlcjogLmJyb3dzZXJpZnkoKSBmaWxlLmNvbnRlbnRzIGFwcGVhcnMgdG8gYmUgZW1wdHlcIik7XHJcbiAgICAgICAgICAgIGNiKG51bGwsZmlsZSk7XHJcbiAgICAgICAgfTtcclxuICAgIH1cclxuXHJcbiAgICBsZXQgYXRFbmQgPSBmdW5jdGlvbihjYil7XHJcbiAgICAgICAgY2IoKTtcclxuICAgIH0gLy8gbm8gbmVlZCB0byBjbGVhbiB1cCBhZnRlciBvdXJzZWx2ZXNcclxuXHJcbiAgICByZXR1cm4gcGx1Z2lucy50aHJvdWdoLm9iaihmb3JFYWNoLGF0RW5kKTsgLy8gdGhpcyBpcyB0aGUgdGhyb3VnaCBvYmplY3QgdGhhdCBnZXRzIHJldHVybmVkIGJ5IGd1bHBCcm93c2VyLmJyb3dzZXJpZnkoKTtcclxuIH07XHJcblxyXG5leHBvcnQgPSBicm93c2VyaWZ5O1xyXG4iXX0=
