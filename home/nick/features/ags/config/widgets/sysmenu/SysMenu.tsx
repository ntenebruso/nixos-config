import { GLib, Variable } from "astal";
import { App, Astal, Gdk, Gtk } from "astal/gtk3";
import Notifications from "./Notifications";
import Media from "./Media";

export default function SysMenu() {
    const width = Variable(1000);

    const time = Variable("").poll(
        1000,
        () => GLib.DateTime.new_now_local().format("%I:%M")!
    );

    const date = Variable("").poll(
        1000,
        () => GLib.DateTime.new_now_local().format("%A, %B %e %Y")!
    );

    return (
        <window
            name="SysMenu"
            className="SysMenu"
            anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT}
            layer={Astal.Layer.OVERLAY}
            visible={false}
            application={App}
            margin={5}
            onShow={(self) => {
                width.set(self.get_current_monitor().workarea.width);
            }}
        >
            <box className="container" vertical>
                <box className="Time" vertical>
                    <label className="time">{time()}</label>
                    <label className="date">{date()}</label>
                </box>
                <Notifications />
                <Media />
            </box>
        </window>
    );
}
