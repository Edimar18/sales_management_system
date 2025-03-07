with open("models.py", "rb") as f:
    content = f.read()

if b"\x00" in content:
    print("Null bytes detected!")
else:
    print("No null bytes found.")
