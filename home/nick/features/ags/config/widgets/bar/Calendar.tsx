import { GLib, Variable } from "astal";
import { App, Astal, astalify, Gdk, Gtk } from "astal/gtk3";

const CalendarWidget = astalify(Gtk.Calendar);

function hide() {
    App.get_window("Calendar")!.hide();
}

function getCurrentDate() {
    return GLib.DateTime.new_now_local();
}

export default function Calendar() {
    <window
        name="Calendar"
        className="Calendar"
        anchor={Astal.WindowAnchor.TOP}
        layer={Astal.Layer.OVERLAY}
        margin={5}
        application={App}
        visible={false}
    >
        <box vertical={true}>
            <label css="font-weight:bold;">Calendar</label>
            <CalendarWidget />
        </box>
    </window>;
}
