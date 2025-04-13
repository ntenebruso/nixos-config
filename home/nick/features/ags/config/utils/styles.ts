import { exec, readFile, writeFile } from "astal";
import options from "../options";

const COLORS_FILE = "./scss/variables.scss";
const SCSS_FILE = "./scss/style.scss";
export const CSS_OUTPUT = "./config/style.css";

function getSavedColors() {
    const v = readFile(COLORS_FILE);

    if (!v || v.trim() == "") return {};

    const cols: Record<string, string> = {};
    for (const line of v.split("\n")) {
        if (line.charAt(0) == "$") {
            const posDelim = line.indexOf(":");

            if (posDelim == -1) continue;

            const key = line.substring(1, posDelim);
            const val = line.substring(posDelim + 1, line.length - 1).trim();

            cols[key] = val;
        }
    }

    return cols;
}

function colorsToSASS(colors: Record<string, string>) {
    let str = "";

    for (const [key, value] of Object.entries(colors)) {
        str += `\$${key}: ${value};\n`;
    }

    return str;
}

export function generateColorScheme() {
    const currColors = options.colors;
    const savedColors = getSavedColors();

    if (JSON.stringify(currColors) == JSON.stringify(savedColors)) return;

    console.log("Color scheme not synced, syncing now...");

    const sass = colorsToSASS(currColors);
    writeFile(COLORS_FILE, sass);

    console.log("Successfully updated colors");
}

export function generateCSS() {
    exec(`sass ${SCSS_FILE} ${CSS_OUTPUT}`);
}
