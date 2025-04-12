import {
    GObject,
    interval,
    property,
    register,
    readFileAsync,
    readFile,
} from "astal";

@register()
export default class Indicators extends GObject.Object {
    private static instance: Indicators;
    static get_default() {
        if (!this.instance) this.instance = new Indicators();

        return this.instance;
    }

    #cpu_temp = 0;

    @property(Number)
    get cpu_temp() {
        return this.#cpu_temp;
    }

    #mem_usage = 0;

    @property(Number)
    get mem_usage() {
        return this.#mem_usage;
    }

    private read_mem_info(): Record<string, number> {
        const memInfo: Record<string, number> = {};
        const v = readFile("/proc/meminfo");
        const lines = v.split("\n");
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            const posDelim = line.indexOf(":");

            if (posDelim == -1) continue;

            const key = line.substring(0, posDelim);
            const val = Number(
                line.substring(posDelim).replace(/\D/g, "").trim()
            );
            memInfo[key] = val;
        }

        return memInfo;
    }

    constructor() {
        super();

        interval(30000, () => {
            const v = readFile("/sys/class/thermal/thermal_zone0/temp");
            this.#cpu_temp = Number(v) / 1000;
            this.notify("cpu_temp");
        });

        interval(25000, () => {
            const memInfo = this.read_mem_info();
            this.#mem_usage = Math.round(
                100 *
                    ((memInfo["MemTotal"] - memInfo["MemAvailable"]) /
                        memInfo["MemTotal"])
            );
            this.notify("mem_usage");
        });
    }
}
