import { App, Gdk, Gtk } from "astal/gtk3";
import style from "./scss/style.scss";
import Bar from "./widgets/bar/Bar";
import Calendar from "./widgets/bar/Calendar";
import Launcher from "./widgets/launcher/Launcher";
import NotificationPopups from "./widgets/notifications/NotificationPopups";
import OSD from "./widgets/osd/OSD";
import PowerMenu from "./widgets/powermenu/PowerMenu";
import SysMenu from "./widgets/sysmenu/SysMenu";

function mapMonitors(widget: (monitor: Gdk.Monitor) => Gtk.Widget) {
    const widgets = new Map<Gdk.Monitor, Gtk.Widget>();

    for (const gdkmonitor of App.get_monitors()) {
        widgets.set(gdkmonitor, widget(gdkmonitor));
    }

    App.connect("monitor-added", (_, gdkmonitor) => {
        widgets.set(gdkmonitor, widget(gdkmonitor));
    });

    App.connect("monitor-removed", (_, gdkmonitor) => {
        widgets.get(gdkmonitor)?.destroy();
        widgets.delete(gdkmonitor);
    });
}

App.start({
    css: style,
    // gtkTheme: "Adwaita-dark",
    main() {
        mapMonitors(Bar);
        mapMonitors(NotificationPopups);
        mapMonitors(OSD);

        Calendar();
        Launcher();
        OSD();
        PowerMenu();
        SysMenu();
    },
});
