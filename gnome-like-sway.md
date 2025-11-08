Watch the [typecraft](https://youtu.be/O1kZd1f724U?si=48PuqWZhWu-Kua9y)

To disable the super key from bringing up the activities overview, use the below command

✅ To Disable Super Key Opening the Activities Overview:
🔧 Use gsettings to unbind the overlay key:
Run this in the terminal:

```bash
gsettings set org.gnome.mutter overlay-key ''
```

✅ This disables the Super key from opening the Activities Overview.

🔄 To Revert (if needed later):

```bash
gsettings reset org.gnome.mutter overlay-key
```

🔍 Optional: Verify the Setting

```bash
gsettings get org.gnome.mutter overlay-key
```

If it's '', then it's disabled.

If it's 'Super_L', then it's active.
