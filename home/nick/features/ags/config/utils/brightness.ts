import {
    exec,
    execAsync,
    GObject,
    monitorFile,
    property,
    readFileAsync,
    register,
} from "astal";

const get = (args: string) => Number(exec(`brightnessctl ${args}`));
const screen = exec(`bash -c "ls -w1 /sys/class/backlight | head -1"`);

@register({ GTypeName: "Brightness" })
export default class Brightness extends GObject.Object {
    static instance: Brightness;
    static get_default() {
        if (!this.instance) this.instance = new Brightness();

        return this.instance;
    }

    #screenMax = get("max");
    #screen = get("get") / this.#screenMax;

    @property(Number)
    get screen() {
        return this.#screen;
    }

    set screen(percent: number) {
        if (percent < 0) percent = 0;
        else if (percent > 1) percent = 1;

        execAsync(`brightnessctl set ${Math.floor(percent * 100)}%`).then(
            () => {
                this.#screen = percent;
                this.notify("screen");
            }
        );
    }

    constructor() {
        super();

        monitorFile(`/sys/class/backlight/${screen}/brightness`, async (f) => {
            const v = await readFileAsync(f);
            this.#screen = Number(v) / this.#screenMax;
            this.notify("screen");
        });
    }
}
