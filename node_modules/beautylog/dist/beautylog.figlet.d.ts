/// <reference types="q" />
import "typings-global";
import plugins = require("./beautylog.plugins");
export declare var figlet: (textArg: string, optionsArg?: any) => plugins.q.Promise<{}>;
export declare var figletSync: (textArg: string, optionsArg?: any) => boolean;
