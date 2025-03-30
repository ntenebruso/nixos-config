import { App } from "astal/gtk3";
import style from "./scss/style.scss";
import Bar from "./widgets/bar/Bar";
import Calendar from "./widgets/bar/Calendar";
import Launcher from "./widgets/launcher/Launcher";
import NotificationPopups from "./widgets/notifications/NotificationPopups";
import OSD from "./widgets/osd/OSD";
import PowerMenu from "./widgets/powermenu/PowerMenu";
import SysMenu from "./widgets/sysmenu/SysMenu";

App.start({
    css: style,
    gtkTheme: "Adwaita",
    main() {
        App.get_monitors().map(Bar);
        Calendar();
        Launcher();
        App.get_monitors().map(NotificationPopups);
        OSD();
        PowerMenu();
        SysMenu();
    },
});
