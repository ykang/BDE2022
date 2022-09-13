#! /usr/bin/env python3

from traitlets.config.manager import BaseJSONConfigManager
from pathlib import Path
path = Path.home() / ".jupyter" / "nbconfig"
print("RISE config file is updated to: " + str(path / "rise.json"))
cm = BaseJSONConfigManager(config_dir=str(path))
cm.update(
"rise",
    {
        "footer": "<h3>Big Data Essentials, 2021 Autumn</h3>",
        "scroll": True,
        "theme": "solarized",
        "transition": "fade",        
        "auto_select": "first",
        "transition": "slide",
        "autolaunch": True,
        "chalkboard": {
            "chalkEffect": 1,
            "chalkWidth": 4,
            "theme": "whiteboard",
            "transition": 800
    },
        "enable_chalkboard": True,
        "reveal_shortcuts": {
            "chalkboard": {
                "clear": "ctrl-k"
            }
        },
        "start_slideshow_at": "selected",
  }
)

