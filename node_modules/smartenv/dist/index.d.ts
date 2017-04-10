import * as classes from "./smartenv.classes";
declare var smartenv: {
    getEnv: () => classes.Environment;
    printEnv: () => void;
    obs: any;
};
export = smartenv;
