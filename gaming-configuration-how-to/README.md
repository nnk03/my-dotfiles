# How to enable linux gaming



[Youtube video](https://youtu.be/BYIDoD8VdAw?si=AFlIZvz0Htqrcx2J)

## How to disable mouse acceleration

[https://wiki.archlinux.org/title/Mouse_acceleration](https://wiki.archlinux.org/title/Mouse_acceleration)
Refer this to know to do it via command line, but this is for xorg

For wayland compositor, specifically `niri`
edit the below in niri `config.kdl`
```
input {
    mouse {
        // This sets the acceleration profile to "flat", 
        // effectively disabling mouse acceleration.
        accel-profile "flat"
        
        // Optional: Set your preferred sensitivity (-1.0 to 1.0)
        accel-speed 0.0
    }
}
```

| Genre | Sensitivity Preference | Logic |
| :--- | :--- | :--- |
| **Tactical Shooters** (CS2, Valorant) | Low | Precision is king. You want to be able to make tiny adjustments at long range. |
| **Arena/Fast Shooters** (Apex, Quake) | Medium/High | You need to track fast-moving targets and perform 180° turns constantly. |
| **RPGs/RTS** (Dota 2, LoL) | Personal Preference | Consistency matters more than raw pixel precision. |
