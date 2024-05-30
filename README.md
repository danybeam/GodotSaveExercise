# GodotSaveExercise

Exercise to practice saving files in godot in JSON vs binary/plain text

saving as pure text is more efficient as it doesn't need to save the whole dictionary but either I'd need to add some metadata to garantee that everything goes to the right place or I need to write my own dictionary effectively reinventing JSON.

Godot has a method var_to_bytes and bytes_to_var which makes saving binary data almost trivial, however the padding makes it less space efficient than JSON.

This exercise was originally intended to compare saving data as JSON vs raw binary vs protobuf or some other similar solution. Honestly unless I'm saving thousands of objects the difference is not noticeable compared to what the game as a whole would wight anyway.

The repo does not include the var_to_bytes version of the save file but I did include the "text with metadata" version of the save file (metadata being a very generous word for "I put the name of the node so I know what is where")

I'm sure there's a more space efficient solution, but like I said, unless I'm writting thousands of variables I highly doubt it matters.