import { readFile } from "astal";

const CONFIG_FILE = "./config/config.json";

export function mkOptions<T extends object>(options: T): T {
    const rawOptions = readFile(CONFIG_FILE);

    let newOptions = {};
    if (rawOptions && rawOptions.trim() != "") {
        newOptions = JSON.parse(rawOptions);
    }

    const combinedOptions = Object.assign(options, newOptions);
    return combinedOptions;
}
