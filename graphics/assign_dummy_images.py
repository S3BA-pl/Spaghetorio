from generate_dummy_images import *

GENERATE_IMAGES = True

def replace_default_images(path, object_type):
    # Get all item names
    with open(path) as f:
        objects_lua = f.read()

    # This glorious regex contains:
    #   group 1: type
    #   group 2: name
    #   group 3: icon
    regex = fr"type = \"(.*?)\",\n(.*?)name = \"(.*?)\",([\s\S]*?)icon = \"__Spaghenutti__/graphics/dummy/dummy-{object_type}-default\.png\""
    # this glorious replacement replaces entire matched string with the correct dummy image path
    replacement = f"type = \"\g<1>\",\n\g<2>name = \"\g<3>\",\g<4>icon = \"__Spaghenutti__/graphics/dummy/dummy-{object_type}-\g<3>.png\""

    objects_lua = re.sub(regex, replacement, objects_lua)

    # Get all item names
    with open(path,"w") as f:
        objects_lua = f.write(objects_lua)


if __name__ == "__main__":
    if GENERATE_IMAGES:
        generate_images()

    replace_default_images(ITEMS_PATH, "item")
    replace_default_images(FLUIDS_PATH, "fluid")
    # replace_default_images(RECEPIES_PATH, "recepie")
    replace_default_images(TECHNOLOGIES_PATH, "technology")