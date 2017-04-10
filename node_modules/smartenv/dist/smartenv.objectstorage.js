"use strict";
/// <reference path="typings/main.d.ts" />
var plugins = require("./smartenv.plugins");
exports.obs = {
    add: function (paramNameArg, objectArg) {
        if (paramNameArg === void 0) { paramNameArg = "undefined"; }
        if (objectArg === void 0) { objectArg = "undefined"; }
        if (paramNameArg == "undefined") {
            console.log("paramName is undefined");
            return;
        }
        if (objectArg == "undefined") {
            console.log("objectArg is undefined");
        }
        if (typeof exports.obsItems[paramNameArg] === "undefined") {
            exports.obsItems[paramNameArg] = objectArg;
        }
        else {
            console.log("object is already present, so add operation has failed.");
        }
        return exports.obsItems[paramNameArg];
    },
    replace: function (paramNameArg, objectArg) {
        exports.obsItems[paramNameArg] = objectArg;
    },
    merge: function (paramNameArg, objectArg) {
        if (!(typeof exports.obsItems[paramNameArg] === "undefined")) {
            exports.obsItems[paramNameArg] = plugins._.assign(exports.obsItems[paramNameArg], objectArg);
        }
        else {
            console.log("object is not present, so there is nothing to merge");
        }
    },
    get: function (keyName) {
        return exports.obsItems[keyName];
    },
    getAll: function () {
        return exports.obsItems;
    },
    addComplete: function (itemsArg) {
        exports.obsItems = plugins._.assign(exports.obsItems, itemsArg);
        return exports.obsItems;
    }
};
exports.obsItems = {};

//# sourceMappingURL=data:application/json;charset=utf8;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbInNtYXJ0ZW52Lm9iamVjdHN0b3JhZ2UudHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IjtBQUFBLDBDQUEwQztBQUMxQyxJQUFPLE9BQU8sV0FBVyxvQkFBb0IsQ0FBQyxDQUFDO0FBQ3BDLFdBQUcsR0FBTztJQUNqQixHQUFHLEVBQUUsVUFBUyxZQUEwQixFQUFDLFNBQXVCO1FBQWxELDRCQUEwQixHQUExQiwwQkFBMEI7UUFBQyx5QkFBdUIsR0FBdkIsdUJBQXVCO1FBQzVELEVBQUUsQ0FBQyxDQUFDLFlBQVksSUFBSSxXQUFXLENBQUMsQ0FBQSxDQUFDO1lBQzdCLE9BQU8sQ0FBQyxHQUFHLENBQUMsd0JBQXdCLENBQUMsQ0FBQztZQUN0QyxNQUFNLENBQUM7UUFDWCxDQUFDO1FBQ0QsRUFBRSxDQUFDLENBQUMsU0FBUyxJQUFJLFdBQVcsQ0FBQyxDQUFBLENBQUM7WUFDMUIsT0FBTyxDQUFDLEdBQUcsQ0FBQyx3QkFBd0IsQ0FBQyxDQUFDO1FBQzFDLENBQUM7UUFDRCxFQUFFLENBQUMsQ0FBQyxPQUFPLGdCQUFRLENBQUMsWUFBWSxDQUFDLEtBQUssV0FBVyxDQUFDLENBQUEsQ0FBQztZQUMvQyxnQkFBUSxDQUFDLFlBQVksQ0FBQyxHQUFHLFNBQVMsQ0FBQztRQUN2QyxDQUFDO1FBQUMsSUFBSSxDQUFDLENBQUM7WUFDSixPQUFPLENBQUMsR0FBRyxDQUFDLHlEQUF5RCxDQUFDLENBQUM7UUFDM0UsQ0FBQztRQUNELE1BQU0sQ0FBQyxnQkFBUSxDQUFDLFlBQVksQ0FBQyxDQUFDO0lBQ2xDLENBQUM7SUFDRCxPQUFPLEVBQUUsVUFBUyxZQUFZLEVBQUMsU0FBUztRQUNwQyxnQkFBUSxDQUFDLFlBQVksQ0FBQyxHQUFHLFNBQVMsQ0FBQztJQUN2QyxDQUFDO0lBQ0QsS0FBSyxFQUFFLFVBQVMsWUFBWSxFQUFDLFNBQVM7UUFDbEMsRUFBRSxDQUFBLENBQUMsQ0FBQyxDQUFDLE9BQU8sZ0JBQVEsQ0FBQyxZQUFZLENBQUMsS0FBSyxXQUFXLENBQUMsQ0FBQyxDQUFBLENBQUM7WUFDakQsZ0JBQVEsQ0FBQyxZQUFZLENBQUMsR0FBRyxPQUFPLENBQUMsQ0FBQyxDQUFDLE1BQU0sQ0FBQyxnQkFBUSxDQUFDLFlBQVksQ0FBQyxFQUFDLFNBQVMsQ0FBQyxDQUFDO1FBQ2hGLENBQUM7UUFBQyxJQUFJLENBQUMsQ0FBQztZQUNKLE9BQU8sQ0FBQyxHQUFHLENBQUMscURBQXFELENBQUMsQ0FBQztRQUN2RSxDQUFDO0lBQ0wsQ0FBQztJQUNELEdBQUcsRUFBRSxVQUFTLE9BQU87UUFDakIsTUFBTSxDQUFDLGdCQUFRLENBQUMsT0FBTyxDQUFDLENBQUM7SUFDN0IsQ0FBQztJQUNELE1BQU0sRUFBRTtRQUNKLE1BQU0sQ0FBQyxnQkFBUSxDQUFDO0lBQ3BCLENBQUM7SUFDRCxXQUFXLEVBQUUsVUFBUyxRQUFRO1FBQzFCLGdCQUFRLEdBQUcsT0FBTyxDQUFDLENBQUMsQ0FBQyxNQUFNLENBQUMsZ0JBQVEsRUFBQyxRQUFRLENBQUMsQ0FBQztRQUMvQyxNQUFNLENBQUMsZ0JBQVEsQ0FBQztJQUNwQixDQUFDO0NBQ0osQ0FBQztBQUNTLGdCQUFRLEdBQU8sRUFBRSxDQUFDIiwiZmlsZSI6InNtYXJ0ZW52Lm9iamVjdHN0b3JhZ2UuanMiLCJzb3VyY2VzQ29udGVudCI6WyIvLy8gPHJlZmVyZW5jZSBwYXRoPVwidHlwaW5ncy9tYWluLmQudHNcIiAvPlxuaW1wb3J0IHBsdWdpbnMgPSByZXF1aXJlKFwiLi9zbWFydGVudi5wbHVnaW5zXCIpO1xuZXhwb3J0IHZhciBvYnM6YW55ID0ge1xuICAgIGFkZDogZnVuY3Rpb24ocGFyYW1OYW1lQXJnID0gXCJ1bmRlZmluZWRcIixvYmplY3RBcmcgPSBcInVuZGVmaW5lZFwiKSB7XG4gICAgICAgIGlmIChwYXJhbU5hbWVBcmcgPT0gXCJ1bmRlZmluZWRcIil7XG4gICAgICAgICAgICBjb25zb2xlLmxvZyhcInBhcmFtTmFtZSBpcyB1bmRlZmluZWRcIik7XG4gICAgICAgICAgICByZXR1cm47XG4gICAgICAgIH1cbiAgICAgICAgaWYgKG9iamVjdEFyZyA9PSBcInVuZGVmaW5lZFwiKXtcbiAgICAgICAgICAgIGNvbnNvbGUubG9nKFwib2JqZWN0QXJnIGlzIHVuZGVmaW5lZFwiKTtcbiAgICAgICAgfVxuICAgICAgICBpZiAodHlwZW9mIG9ic0l0ZW1zW3BhcmFtTmFtZUFyZ10gPT09IFwidW5kZWZpbmVkXCIpe1xuICAgICAgICAgICAgb2JzSXRlbXNbcGFyYW1OYW1lQXJnXSA9IG9iamVjdEFyZztcbiAgICAgICAgfSBlbHNlIHtcbiAgICAgICAgICAgIGNvbnNvbGUubG9nKFwib2JqZWN0IGlzIGFscmVhZHkgcHJlc2VudCwgc28gYWRkIG9wZXJhdGlvbiBoYXMgZmFpbGVkLlwiKTtcbiAgICAgICAgfVxuICAgICAgICByZXR1cm4gb2JzSXRlbXNbcGFyYW1OYW1lQXJnXTtcbiAgICB9LFxuICAgIHJlcGxhY2U6IGZ1bmN0aW9uKHBhcmFtTmFtZUFyZyxvYmplY3RBcmcpe1xuICAgICAgICBvYnNJdGVtc1twYXJhbU5hbWVBcmddID0gb2JqZWN0QXJnO1xuICAgIH0sXG4gICAgbWVyZ2U6IGZ1bmN0aW9uKHBhcmFtTmFtZUFyZyxvYmplY3RBcmcpe1xuICAgICAgICBpZighKHR5cGVvZiBvYnNJdGVtc1twYXJhbU5hbWVBcmddID09PSBcInVuZGVmaW5lZFwiKSl7XG4gICAgICAgICAgICBvYnNJdGVtc1twYXJhbU5hbWVBcmddID0gcGx1Z2lucy5fLmFzc2lnbihvYnNJdGVtc1twYXJhbU5hbWVBcmddLG9iamVjdEFyZyk7XG4gICAgICAgIH0gZWxzZSB7XG4gICAgICAgICAgICBjb25zb2xlLmxvZyhcIm9iamVjdCBpcyBub3QgcHJlc2VudCwgc28gdGhlcmUgaXMgbm90aGluZyB0byBtZXJnZVwiKTtcbiAgICAgICAgfVxuICAgIH0sXG4gICAgZ2V0OiBmdW5jdGlvbihrZXlOYW1lKSB7XG4gICAgICAgIHJldHVybiBvYnNJdGVtc1trZXlOYW1lXTtcbiAgICB9LFxuICAgIGdldEFsbDogZnVuY3Rpb24gKCkge1xuICAgICAgICByZXR1cm4gb2JzSXRlbXM7XG4gICAgfSxcbiAgICBhZGRDb21wbGV0ZTogZnVuY3Rpb24oaXRlbXNBcmcpIHtcbiAgICAgICAgb2JzSXRlbXMgPSBwbHVnaW5zLl8uYXNzaWduKG9ic0l0ZW1zLGl0ZW1zQXJnKTtcbiAgICAgICAgcmV0dXJuIG9ic0l0ZW1zO1xuICAgIH1cbn07XG5leHBvcnQgdmFyIG9ic0l0ZW1zOmFueSA9IHt9OyJdfQ==
